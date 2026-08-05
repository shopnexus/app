import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/mark_conversation_read_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/send_message_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_conversation_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_message_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_offer_request.dart';

part 'chat_repository.g.dart';

/// One page plus the cursor that follows it. Chat is cursor-only: offset paging
/// would defeat the chunk exclusion the message table is partitioned for.
class ChatPage<T> {
  const ChatPage({required this.items, this.nextCursor});

  final List<T> items;
  final String? nextCursor;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

class ChatRepository {
  const ChatRepository(this._api, this._orderApi);

  final ChatApi _api;

  /// A negotiation card names an offer and nothing else, so rendering a thread
  /// means reading — and answering — that offer. The terms live in order.
  final OrderApi _orderApi;

  Future<ChatPage<Conversation>> conversations({
    String? cursor,
    int? limit,
  }) async {
    final response = await _api.conversationsGet(cursor: cursor, limit: limit);
    final page = response.data;
    return ChatPage(
      items: page?.data ?? const [],
      nextCursor: page?.meta.nextCursor,
    );
  }

  Future<Conversation> conversation(String id) async {
    final response = await _api.conversationsIdGet(id: id);
    final conversation = response.data?.data;
    if (conversation == null) throw StateError('empty conversation response');
    return conversation;
  }

  /// Idempotent: there is exactly one thread per pair, so this answers the
  /// existing one when there is one.
  Future<Conversation> startConversation(String accountId) async {
    final response = await _api.conversationsPost(
      startConversationRequest: StartConversationRequest(accountId: accountId),
    );
    final conversation = response.data?.data;
    if (conversation == null) throw StateError('empty conversation response');
    return conversation;
  }

  /// Newest first, as the route answers it. The thread reverses the page for
  /// rendering — that is a display concern, not the transport's.
  Future<ChatPage<Message>> messages(
    String conversationId, {
    String? cursor,
    int? limit,
  }) async {
    final response = await _api.conversationsIdMessagesGet(
      id: conversationId,
      cursor: cursor,
      limit: limit,
    );
    final page = response.data;
    return ChatPage(
      items: page?.data ?? const [],
      nextCursor: page?.meta.nextCursor,
    );
  }

  /// The only way the app sends a message: the socket is receive-only. `card` is
  /// deliberately absent — a system payload is the backend's to write, and the
  /// route rejects one on a user message.
  Future<Message> send({
    required String conversationId,
    String? body,
    List<String>? attachments,
    Map<String, Object>? refs,
  }) async {
    final response = await _api.conversationsIdMessagesPost(
      id: conversationId,
      sendMessageRequest: SendMessageRequest(
        body: (body?.isEmpty ?? true) ? null : body,
        attachments: (attachments == null || attachments.isEmpty)
            ? null
            : attachments,
        refs: (refs == null || refs.isEmpty) ? null : refs,
      ),
    );
    final message = response.data?.data;
    if (message == null) throw StateError('empty message response');
    return message;
  }

  /// Omitting `before` marks the whole thread read. The answer is the updated
  /// thread, so the inbox row repaints from one response.
  Future<Conversation> markRead(
    String conversationId, {
    DateTime? before,
  }) async {
    final response = await _api.conversationsIdReadPost(
      id: conversationId,
      markConversationReadRequest: before == null
          ? null
          : MarkConversationReadRequest(before: before),
    );
    final conversation = response.data?.data;
    if (conversation == null) throw StateError('empty conversation response');
    return conversation;
  }

  Future<ChatUnreadCount> unreadCount() async {
    final response = await _api.conversationsUnreadCountGet();
    final count = response.data?.data;
    if (count == null) throw StateError('empty unread count response');
    return count;
  }

  /// `createdAt` is the message's own instant, passed straight back: the table is
  /// partitioned on it, so without it the row has to be hunted for.
  Future<Message> edit({
    required String id,
    required DateTime createdAt,
    required String body,
  }) async {
    final response = await _api.messagesIdPatch(
      id: id,
      createdAt: createdAt,
      updateMessageRequest: UpdateMessageRequest(body: body),
    );
    final message = response.data?.data;
    if (message == null) throw StateError('empty message response');
    return message;
  }

  Future<void> redact({required String id, required DateTime createdAt}) {
    return _api.messagesIdDelete(id: id, createdAt: createdAt);
  }

  Future<Offer> offer(String id) async {
    final response = await _orderApi.offersIdGet(id: id);
    final offer = response.data?.data;
    if (offer == null) throw StateError('empty offer response');
    return offer;
  }

  /// Whoever does *not* own the standing proposal. Agreeing charges nothing: it
  /// freezes the price for a short window in which the buyer creates the order.
  Future<Offer> acceptOffer(String id) async {
    final response = await _orderApi.offersIdAcceptancePost(id: id);
    final offer = response.data?.data;
    if (offer == null) throw StateError('empty offer response');
    return offer;
  }

  /// Revises the terms in place and moves authorship to the caller, so the two
  /// sides alternate; only the party without the standing proposal may counter.
  Future<Offer> counterOffer(
    String id, {
    required int total,
    required int quantity,
    String? reason,
  }) async {
    final response = await _orderApi.offersIdPatch(
      id: id,
      updateOfferRequest: UpdateOfferRequest(
        total: total,
        quantity: quantity,
        reason: (reason?.isEmpty ?? true) ? null : reason,
      ),
    );
    final offer = response.data?.data;
    if (offer == null) throw StateError('empty offer response');
    return offer;
  }

  Future<void> cancelOffer(String id) => _orderApi.offersIdDelete(id: id);
}

@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepository(
    ref.watch(chatApiProvider),
    ref.watch(orderApiProvider),
  );
}
