import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';

export 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
export 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
export 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
export 'package:shopnexus_flutter_app/api/generated/model/conversation_read_mark.dart';
export 'package:shopnexus_flutter_app/api/generated/model/deleted_message_ref.dart';
export 'package:shopnexus_flutter_app/api/generated/model/message.dart';
export 'package:shopnexus_flutter_app/api/generated/model/message_type.dart';
export 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
export 'package:shopnexus_flutter_app/api/generated/model/offer_status.dart';

/// How far a message the caller sent has got.
///
/// The contract gives a message no delivery state of its own: a sent message is
/// a row, and "seen" is the conversation's `counterparty_read_at` reaching its
/// `created_at`. `sending` is purely local — the optimistic row that exists
/// between the tap and the POST answering.
enum MessageDelivery { sending, sent, seen }

/// A message as the open thread renders it: the published [Message] plus the two
/// facts it cannot carry — which side of this conversation sent it, and whether
/// the other side has read that far. Both are properties of the *conversation*,
/// so they are resolved once here rather than guessed at by every widget.
class ChatMessage {
  const ChatMessage({
    required this.message,
    required this.isMine,
    this.delivery = MessageDelivery.sent,
  });

  /// A thread has exactly two sides, so "not the counterparty" is "mine" — which
  /// is why rendering a thread needs no separate lookup of the viewer's own id.
  /// A system message belongs to neither and is never mine.
  factory ChatMessage.inThread(Message message, Conversation conversation) {
    final isMine =
        message.senderId != null &&
        message.senderId != conversation.counterparty.id;
    final readAt = conversation.counterpartyReadAt;
    final seen =
        isMine && readAt != null && !readAt.isBefore(message.createdAt);
    return ChatMessage(
      message: message,
      isMine: isMine,
      delivery: seen ? MessageDelivery.seen : MessageDelivery.sent,
    );
  }

  /// The row shown between the tap and the POST answering. Its id is local and
  /// never collides with a server one, so the real message replaces it by id.
  factory ChatMessage.pending({
    required String conversationId,
    required String body,
  }) {
    return ChatMessage(
      message: Message(
        id: 'pending-${DateTime.now().microsecondsSinceEpoch}',
        conversationId: conversationId,
        senderId: null,
        fromSupport: false,
        type: MessageType.user,
        body: body,
        attachments: const [],
        refs: const {},
        card: const {},
        createdAt: DateTime.now(),
        editedAt: null,
        deletedAt: null,
      ),
      isMine: true,
      delivery: MessageDelivery.sending,
    );
  }

  final Message message;
  final bool isMine;
  final MessageDelivery delivery;

  String get id => message.id;

  String get conversationId => message.conversationId;

  String get body => message.body;

  DateTime get createdAt => message.createdAt;

  bool get isEdited => message.editedAt != null;

  /// A redacted row is still returned by the REST route with its body emptied,
  /// so a thread a dispute may hinge on has no unexplained gap.
  bool get isRedacted => message.deletedAt != null;

  List<Resource> get attachments => message.attachments;

  bool get isPending => delivery == MessageDelivery.sending;

  bool get isSeen => delivery == MessageDelivery.seen;

  /// The desk answers as the platform, and the contract says so on the row: a
  /// requester's view of a support reply carries the flag instead of a sender.
  bool get isFromSupport => message.fromSupport;

  /// Produced by the backend — an offer accepted, an order shipped — so it
  /// belongs to neither side and is not somebody's writing.
  bool get isSystem => message.type == MessageType.system;

  /// A negotiation card is `{"offer_id": "ofr_…"}` and nothing else — the terms
  /// are read from the offer, so a counter-offer cannot leave an old price on
  /// screen.
  String? get offerId {
    final value = message.card['offer_id'];
    return value is String && value.isNotEmpty ? value : null;
  }

  @override
  bool operator ==(Object other) =>
      other is ChatMessage &&
      other.message == message &&
      other.isMine == isMine &&
      other.delivery == delivery;

  @override
  int get hashCode => Object.hash(message, isMine, delivery);
}

/// What the inbox and the thread header render off a [Conversation]. The
/// contract carries the counterparty rather than both sides, so there is nothing
/// for a widget to pick between.
extension ConversationView on Conversation {
  String get participantName => counterparty.name;

  String? get participantAvatar => counterparty.avatar?.url;

  String? get lastMessageText => lastMessage?.body;

  DateTime get lastMessageTime => lastMessageAt;

  int get unreadCount => unread;

  /// A support ticket's thread. It is read from the help centre, so the inbox
  /// leaves it out rather than showing the desk beside the sellers.
  bool get isTicketThread => ticketId != null;

  /// The generated DTOs carry no `copyWith` — copy_with_extension_gen is
  /// deliberately not wired in — so the handful of fields a realtime event moves
  /// are rebuilt here instead of at every call site.
  Conversation patch({
    Message? lastMessage,
    DateTime? lastMessageAt,
    DateTime? counterpartyReadAt,
    int? unread,
  }) {
    return Conversation(
      counterparty: counterparty,
      counterpartyReadAt: counterpartyReadAt ?? this.counterpartyReadAt,
      createdAt: createdAt,
      id: id,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      readAt: readAt,
      ticketId: ticketId,
      unread: unread ?? this.unread,
    );
  }
}
