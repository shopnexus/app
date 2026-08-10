import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/core/realtime/realtime_client.dart';
import 'package:shopnexus_flutter_app/core/realtime/realtime_event.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';

part 'chat_notifier.g.dart';

/// The inbox.
///
/// Every change to it arrives on the account's one socket; nothing is polled and
/// nothing is replayed, so a re-handshake means refetching over REST.
@riverpod
class ChatListNotifier extends _$ChatListNotifier {
  @override
  Future<ChatListState> build() async {
    _listen();
    final page = await ref.read(chatRepositoryProvider).conversations();
    return ChatListState(
      conversations: page.items,
      nextCursor: page.nextCursor,
    );
  }

  void _listen() {
    ref.listen<AsyncValue<RealtimeEvent>>(realtimeEventsProvider, (_, next) {
      final event = next.value;
      if (event != null) _apply(event);
    });

    // Delivery is at-most-once with no cursor, so a socket that came back has to
    // be assumed to have missed something.
    final subscription = ref
        .watch(realtimeClientProvider)
        .reconnected
        .listen((_) => fetchConversations());
    ref.onDispose(subscription.cancel);
  }

  void _apply(RealtimeEvent event) {
    switch (event) {
      case MessageCreatedEvent(:final message):
        _applyMessage(message);
      case MessageUpdatedEvent(:final message):
        _applyMessage(message);
      case MessageDeletedEvent(ref: final deleted):
        // The dropped row may have been the one this list shows, and only the
        // server knows what precedes it.
        _reload(deleted.conversationId);
      case ConversationReadEvent(:final mark):
        _applyReadMark(mark);
      case NotificationCreatedEvent():
      case OfferUpdatedEvent():
      case OrderPlacedEvent():
      case OrderSettledEvent():
        break;
    }
  }

  void _applyMessage(Message message) {
    final current = state.value;
    if (current == null) return;

    final index = current.conversations.indexWhere(
      (conversation) => conversation.id == message.conversationId,
    );
    if (index < 0) {
      // A thread this client has never seen — the whole row has to come from the
      // server, counterparty and all.
      _reload(message.conversationId);
      return;
    }

    final existing = current.conversations[index];
    final isTheirs = message.senderId == existing.counterparty.id;
    final isNew =
        existing.lastMessage == null || existing.lastMessage!.id != message.id;
    _replace(
      current,
      index,
      existing.patch(
        lastMessage: message,
        lastMessageAt: message.createdAt,
        unread: isTheirs && isNew ? existing.unread + 1 : existing.unread,
      ),
    );
  }

  /// The read mark on the socket is always the *other* participant's, so it moves
  /// `counterparty_read_at` and never this account's own badge.
  void _applyReadMark(ConversationReadMark mark) {
    final current = state.value;
    if (current == null) return;
    final index = current.conversations.indexWhere(
      (conversation) => conversation.id == mark.conversationId,
    );
    if (index < 0) return;
    _replace(
      current,
      index,
      current.conversations[index].patch(counterpartyReadAt: mark.readAt),
    );
  }

  void _replace(ChatListState current, int index, Conversation updated) {
    final conversations = [...current.conversations]
      ..[index] = updated
      ..sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    state = AsyncValue.data(current.copyWith(conversations: conversations));
  }

  Future<void> _reload(String conversationId) async {
    try {
      applyConversation(
        await ref.read(chatRepositoryProvider).conversation(conversationId),
      );
    } catch (_) {
      // A row that cannot be re-read leaves the list as it was; the next open of
      // the inbox repairs it.
    }
  }

  /// Folds a conversation the app has just read back from the server into the
  /// list, inserting it when it is new.
  void applyConversation(Conversation conversation) {
    final current = state.value;
    if (current == null) return;
    final index = current.conversations.indexWhere(
      (candidate) => candidate.id == conversation.id,
    );
    final conversations = [...current.conversations];
    if (index < 0) {
      conversations.add(conversation);
    } else {
      conversations[index] = conversation;
    }
    conversations.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    state = AsyncValue.data(current.copyWith(conversations: conversations));
  }

  Future<void> fetchConversations() async {
    final searchQuery = state.value?.searchQuery ?? '';
    state = await AsyncValue.guard(() async {
      final page = await ref.read(chatRepositoryProvider).conversations();
      return ChatListState(
        conversations: page.items,
        searchQuery: searchQuery,
        nextCursor: page.nextCursor,
      );
    });
  }

  Future<void> loadMore() async {
    final current = state.value;
    final cursor = current?.nextCursor;
    if (current == null || cursor == null || cursor.isEmpty) return;
    try {
      final page = await ref
          .read(chatRepositoryProvider)
          .conversations(cursor: cursor);
      state = AsyncValue.data(
        current.copyWith(
          conversations: [...current.conversations, ...page.items],
          nextCursor: page.nextCursor,
        ),
      );
    } catch (_) {
      // A failed page is one the user can ask for again by scrolling.
    }
  }

  void search(String query) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(searchQuery: query));
  }

  /// Marks the whole thread read; the route answers the updated row, so the badge
  /// is repainted from the response rather than assumed.
  Future<void> markAsRead(String conversationId) async {
    try {
      applyConversation(
        await ref.read(chatRepositoryProvider).markRead(conversationId),
      );
    } catch (_) {
      // The badge is cosmetic and the next read of the inbox settles it.
    }
  }
}

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.
@riverpod
class ChatDetailNotifier extends _$ChatDetailNotifier {
  @override
  Future<ChatDetailState> build(String conversationId) async {
    _listen();
    return _load();
  }

  void _listen() {
    ref.listen<AsyncValue<RealtimeEvent>>(realtimeEventsProvider, (_, next) {
      final event = next.value;
      if (event != null) _apply(event);
    });

    final subscription = ref
        .watch(realtimeClientProvider)
        .reconnected
        .listen((_) => refresh());
    ref.onDispose(subscription.cancel);
  }

  Future<ChatDetailState> _load() async {
    final repository = ref.read(chatRepositoryProvider);
    final conversation = await repository.conversation(conversationId);
    final page = await repository.messages(conversationId);
    final messages = page.items.reversed
        .map((message) => ChatMessage.inThread(message, conversation))
        .toList();

    final loaded = ChatDetailState(
      conversationId: conversationId,
      conversation: conversation,
      messages: messages,
      nextCursor: page.nextCursor,
      offers: await _resolveOffers(messages, const {}),
    );

    // Opening the thread is reading it.
    unawaited(_markRead());
    return loaded;
  }

  /// A card names an offer; the terms come from the offer itself. Only ids not
  /// held yet are fetched, so a repaint costs nothing.
  Future<Map<String, Offer>> _resolveOffers(
    List<ChatMessage> messages,
    Map<String, Offer> known,
  ) async {
    final wanted = messages
        .map((message) => message.offerId)
        .whereType<String>()
        .where((id) => !known.containsKey(id))
        .toSet();
    if (wanted.isEmpty) return known;

    final repository = ref.read(chatRepositoryProvider);
    final resolved = <String, Offer>{...known};
    for (final id in wanted) {
      try {
        resolved[id] = await repository.offer(id);
      } catch (_) {
        // An offer the caller can no longer read leaves its card a placeholder
        // rather than failing the whole thread.
      }
    }
    return resolved;
  }

  void _apply(RealtimeEvent event) {
    switch (event) {
      case MessageCreatedEvent(:final message):
        if (message.conversationId != conversationId) return;
        _upsertMessage(message, isNew: true);
      case MessageUpdatedEvent(:final message):
        if (message.conversationId != conversationId) return;
        _upsertMessage(message, isNew: false);
      case MessageDeletedEvent(ref: final deleted):
        if (deleted.conversationId != conversationId) return;
        _dropMessage(deleted);
      case ConversationReadEvent(:final mark):
        if (mark.conversationId != conversationId) return;
        _applyReadMark(mark);
      case OfferUpdatedEvent(:final offer):
        _applyOffer(offer);
      case NotificationCreatedEvent():
      case OrderPlacedEvent():
      case OrderSettledEvent():
        break;
    }
  }

  void _upsertMessage(Message message, {required bool isNew}) {
    final current = state.value;
    final conversation = current?.conversation;
    if (current == null || conversation == null) return;

    final incoming = ChatMessage.inThread(message, conversation);
    final index = current.messages.indexWhere(
      (candidate) => candidate.id == message.id,
    );
    final messages = [...current.messages];
    if (index >= 0) {
      messages[index] = incoming;
    } else {
      messages
        ..add(incoming)
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    state = AsyncValue.data(current.copyWith(messages: messages));

    if (isNew && !incoming.isMine) {
      // The thread is on screen, so a message arriving in it has been read.
      unawaited(_markRead());
    }
    if (incoming.offerId != null) unawaited(_resolvePendingOffers());
  }

  /// A deletion carries a ref, not an emptied entity: the body is gone, so the
  /// message leaves the rendered thread instead of appearing as an edit.
  void _dropMessage(DeletedMessageRef deleted) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(
        messages: current.messages
            .where((message) => message.id != deleted.id)
            .toList(),
      ),
    );
  }

  /// The read mark is always the other participant's, which makes it the read
  /// receipt for everything this account sent up to that instant.
  void _applyReadMark(ConversationReadMark mark) {
    final current = state.value;
    final conversation = current?.conversation;
    if (current == null || conversation == null) return;
    final updated = conversation.patch(counterpartyReadAt: mark.readAt);
    state = AsyncValue.data(
      current.copyWith(
        conversation: updated,
        messages: current.messages
            .map(
              (message) => message.isPending
                  ? message
                  : ChatMessage.inThread(message.message, updated),
            )
            .toList(),
      ),
    );
  }

  /// One message per transition, carrying the whole offer: the card renders the
  /// current state and never branches on how it got there.
  void _applyOffer(Offer offer) {
    final current = state.value;
    if (current == null) return;
    final relevant =
        current.offers.containsKey(offer.id) ||
        current.messages.any((message) => message.offerId == offer.id);
    if (!relevant) return;
    state = AsyncValue.data(
      current.copyWith(offers: {...current.offers, offer.id: offer}),
    );
  }

  Future<void> _resolvePendingOffers() async {
    final current = state.value;
    if (current == null) return;
    final offers = await _resolveOffers(current.messages, current.offers);
    final latest = state.value;
    if (latest == null || offers.length == latest.offers.length) return;
    state = AsyncValue.data(latest.copyWith(offers: offers));
  }

  Future<void> _markRead() async {
    try {
      final conversation = await ref
          .read(chatRepositoryProvider)
          .markRead(conversationId);
      final current = state.value;
      if (current != null) {
        state = AsyncValue.data(current.copyWith(conversation: conversation));
      }
      ref.read(chatListProvider.notifier).applyConversation(conversation);
    } catch (_) {
      // The badge is cosmetic; the next open settles it.
    }
  }

  /// What a re-handshake calls: nothing was replayed, so the thread is re-read.
  Future<void> refresh() async {
    state = await AsyncValue.guard(_load);
  }

  Future<void> loadOlder() async {
    final current = state.value;
    final conversation = current?.conversation;
    final cursor = current?.nextCursor;
    if (current == null ||
        conversation == null ||
        cursor == null ||
        cursor.isEmpty) {
      return;
    }
    try {
      final page = await ref
          .read(chatRepositoryProvider)
          .messages(conversationId, cursor: cursor);
      final older = page.items.reversed
          .map((message) => ChatMessage.inThread(message, conversation))
          .toList();
      state = AsyncValue.data(
        current.copyWith(
          messages: [...older, ...current.messages],
          nextCursor: page.nextCursor,
          offers: await _resolveOffers(older, current.offers),
        ),
      );
    } catch (_) {
      // Scrolling up again asks for the same page.
    }
  }

  Future<bool> sendTextMessage(String content) => sendMessage(text: content);

  Future<bool> sendMessage({String? text, List<XFile>? files}) async {
    final body = text?.trim() ?? '';
    final hasFiles = files != null && files.isNotEmpty;
    if (body.isEmpty && !hasFiles) return false;

    final current = state.value;
    final conversation = current?.conversation;
    if (current == null || conversation == null) return false;

    final pending = ChatMessage.pending(
      conversationId: conversationId,
      body: body.isNotEmpty ? body : (hasFiles ? '[Hình ảnh]' : ''),
    );
    state = AsyncValue.data(
      current.copyWith(
        messages: [...current.messages, pending],
        isSending: true,
        errorMessage: null,
      ),
    );

    try {
      final repository = ref.read(chatRepositoryProvider);
      List<String>? attachmentIds;

      if (hasFiles) {
        attachmentIds = [];
        for (final file in files) {
          final bytes = await file.readAsBytes();
          final filename = file.name.isNotEmpty ? file.name : 'image.jpg';
          final mime = _guessMimeType(filename, file.mimeType);

          final resourceId = await repository.uploadAttachment(
            bytes: bytes,
            filename: filename,
            mime: mime,
          );
          attachmentIds.add(resourceId);
        }
      }

      final sent = await repository.send(
        conversationId: conversationId,
        body: body.isEmpty ? null : body,
        attachments: attachmentIds,
      );
      _replacePending(pending.id, ChatMessage.inThread(sent, conversation));
      ref
          .read(chatListProvider.notifier)
          .applyConversation(
            conversation.patch(
              lastMessage: sent,
              lastMessageAt: sent.createdAt,
            ),
          );
      return true;
    } catch (e) {
      _dropPending(pending.id, ErrorHandler.getErrorMessage(e));
      return false;
    }
  }

  String _guessMimeType(String filename, String? declaredMime) {
    if (declaredMime != null &&
        declaredMime.isNotEmpty &&
        declaredMime.contains('/')) {
      return declaredMime;
    }
    final lower = filename.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.gif')) return 'image/gif';
    return 'image/jpeg';
  }

  void _replacePending(String pendingId, ChatMessage sent) {
    final current = state.value;
    if (current == null) return;
    final messages =
        current.messages
            .where(
              (message) => message.id != pendingId && message.id != sent.id,
            )
            .toList()
          ..add(sent)
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    state = AsyncValue.data(
      current.copyWith(messages: messages, isSending: false),
    );
  }

  void _dropPending(String pendingId, String errorMessage) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(
        messages: current.messages
            .where((message) => message.id != pendingId)
            .toList(),
        isSending: false,
        errorMessage: errorMessage,
      ),
    );
  }

  Future<bool> editMessage(ChatMessage message, String body) async {
    try {
      final edited = await ref
          .read(chatRepositoryProvider)
          .edit(
            id: message.id,
            createdAt: message.createdAt,
            body: body.trim(),
          );
      _upsertMessage(edited, isNew: false);
      return true;
    } catch (e) {
      _fail(e);
      return false;
    }
  }

  Future<bool> redactMessage(ChatMessage message) async {
    try {
      await ref
          .read(chatRepositoryProvider)
          .redact(id: message.id, createdAt: message.createdAt);
      // The route keeps the row with an emptied body, so the thread is re-read
      // rather than guessed at.
      await refresh();
      return true;
    } catch (e) {
      _fail(e);
      return false;
    }
  }

  Future<bool> acceptOffer(String offerId) =>
      _offerAction((repository) => repository.acceptOffer(offerId));

  Future<bool> counterOffer(
    String offerId, {
    required int total,
    required int quantity,
    String? reason,
  }) => _offerAction(
    (repository) => repository.counterOffer(
      offerId,
      total: total,
      quantity: quantity,
      reason: reason,
    ),
  );

  /// Cancelling answers 204, so the new state of the negotiation is read back
  /// rather than assumed — an expiry may have got there first.
  Future<bool> cancelOffer(String offerId) async {
    final repository = ref.read(chatRepositoryProvider);
    try {
      await repository.cancelOffer(offerId);
      _applyOffer(await repository.offer(offerId));
      return true;
    } catch (e) {
      _fail(e);
      return false;
    }
  }

  Future<bool> _offerAction(
    Future<Offer> Function(ChatRepository repository) action,
  ) async {
    try {
      _applyOffer(await action(ref.read(chatRepositoryProvider)));
      return true;
    } catch (e) {
      _fail(e);
      return false;
    }
  }

  void _fail(Object error) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(errorMessage: ErrorHandler.getErrorMessage(error)),
    );
  }

  void clearError() {
    final current = state.value;
    if (current == null || current.errorMessage == null) return;
    state = AsyncValue.data(current.copyWith(errorMessage: null));
  }
}
