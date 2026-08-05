import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/chat_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default([]) List<Conversation> conversations,
    @Default('') String searchQuery,
    String? nextCursor,
  }) = _ChatListState;

  const ChatListState._();

  /// Filtering is local to what is already loaded — the inbox route has no search
  /// parameter, so this narrows the page on screen rather than querying.
  List<Conversation> get filteredConversations {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return conversations;
    return conversations.where((conversation) {
      final name = conversation.participantName.toLowerCase();
      final lastMessage = (conversation.lastMessageText ?? '').toLowerCase();
      return name.contains(query) || lastMessage.contains(query);
    }).toList();
  }
}

@freezed
abstract class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState({
    required String conversationId,
    Conversation? conversation,

    /// Oldest first, which is the reading order; the route answers newest first.
    @Default([]) List<ChatMessage> messages,

    /// The negotiations the thread's cards point at, by offer id. A card carries
    /// only the id, so the terms are read from here and a counter-offer can never
    /// leave an old price on screen.
    @Default({}) Map<String, Offer> offers,
    String? nextCursor,
    @Default(false) bool isSending,
    String? errorMessage,
  }) = _ChatDetailState;

  const ChatDetailState._();

  /// A thread has two sides, so an id that is not the counterparty's is the
  /// viewer's. That places them in a negotiation without a second lookup of
  /// their own account.
  bool _isViewer(String accountId) {
    final conversation = this.conversation;
    return conversation != null && accountId != conversation.counterparty.id;
  }

  bool viewerIsBuyer(Offer offer) => _isViewer(offer.buyerId);

  /// Whoever owns the standing proposal cannot accept or counter it — the two
  /// sides alternate.
  bool viewerIsAuthor(Offer offer) => _isViewer(offer.authorId);
}
