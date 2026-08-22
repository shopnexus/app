import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default([]) List<Conversation> conversations,
    @Default('') String searchQuery,
    String? nextCursor,
  }) = _ChatListState;

  const ChatListState._();

  /// Cuộc trò chuyện mua bán: `ticket_id` trống. Hai tab của hộp thư chia nhau
  /// đúng trên trường đó — không phải hai lượt đọc, cùng một danh sách.
  List<Conversation> get tradeConversations => conversations
      .where((conversation) => !conversation.isTicketThread)
      .toList();

  /// Thread của các yêu cầu hỗ trợ. Chúng đọc *ở đây*, không ở một màn riêng: một
  /// ticket là một cuộc trò chuyện, và đưa người ta đi chỗ khác để trả lời nó là
  /// một chuyến ra khỏi hộp thư rồi lại vào.
  List<Conversation> get supportConversations => conversations
      .where((conversation) => conversation.isTicketThread)
      .toList();

  /// Lọc trong những gì đã nạp — route hộp thư không có tham số tìm kiếm, nên đây
  /// là thu hẹp trang đang trên màn chứ không phải một truy vấn.
  ///
  /// [titles] là chữ *thêm* để khớp cho mỗi cuộc trò chuyện, theo id: hàng hỗ trợ
  /// được đặt tên bằng chủ đề của ticket chứ không bằng tên đối phương (bên kia là
  /// cả sàn), nên tìm theo cái tên đang hiện thì phải tìm được chủ đề đó.
  List<Conversation> filtered({
    required bool support,
    Map<String, String> titles = const {},
  }) {
    final source = support ? supportConversations : tradeConversations;
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return source;
    return source.where((conversation) {
      final name = conversation.participantName.toLowerCase();
      final lastMessage = (conversation.lastMessageText ?? '').toLowerCase();
      final title = (titles[conversation.id] ?? '').toLowerCase();
      return name.contains(query) ||
          lastMessage.contains(query) ||
          title.contains(query);
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
