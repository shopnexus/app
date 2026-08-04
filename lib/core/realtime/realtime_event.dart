import '../../api/generated/model/conversation_read_mark.dart';
import '../../api/generated/model/deleted_message_ref.dart';
import '../../api/generated/model/message.dart';
import '../../api/generated/model/notification.dart' as api;
import '../../api/generated/model/offer.dart';
import '../../api/generated/model/order_ref.dart';

/// The event codes published in the backend's asyncapi document. Nothing else
/// may spell them: a hand-written string that no longer matches is an event the
/// app silently stops reacting to.
class RealtimeEventCode {
  static const String messageCreated = 'chat.message_created';
  static const String messageUpdated = 'chat.message_updated';
  static const String messageDeleted = 'chat.message_deleted';
  static const String conversationRead = 'chat.conversation_read';
  static const String notificationCreated = 'account.notification_created';
  static const String offerUpdated = 'order.offer_updated';
  static const String orderPlaced = 'order.placed';
  static const String orderSettled = 'order.settled';
}

/// One frame off the socket: `{code, at, data}`, with `data` already decoded
/// into the generated model the code binds it to.
sealed class RealtimeEvent {
  const RealtimeEvent({required this.code, required this.at});

  final String code;
  final DateTime at;

  /// Returns null for a code this app does not model — the contract may grow a
  /// message before this client knows what to do with it, and an unknown frame
  /// is not an error.
  static RealtimeEvent? fromJson(Map<String, dynamic> json) {
    final code = json['code'] as String?;
    if (code == null) return null;
    final at = DateTime.tryParse(json['at'] as String? ?? '') ?? DateTime.now();
    final data = json['data'];
    if (data is! Map<String, dynamic>) return null;

    switch (code) {
      case RealtimeEventCode.messageCreated:
        return MessageCreatedEvent(at: at, message: Message.fromJson(data));
      case RealtimeEventCode.messageUpdated:
        return MessageUpdatedEvent(at: at, message: Message.fromJson(data));
      case RealtimeEventCode.messageDeleted:
        return MessageDeletedEvent(at: at, ref: DeletedMessageRef.fromJson(data));
      case RealtimeEventCode.conversationRead:
        return ConversationReadEvent(
          at: at,
          mark: ConversationReadMark.fromJson(data),
        );
      case RealtimeEventCode.notificationCreated:
        return NotificationCreatedEvent(
          at: at,
          notification: api.Notification.fromJson(data),
        );
      case RealtimeEventCode.offerUpdated:
        return OfferUpdatedEvent(at: at, offer: Offer.fromJson(data));
      case RealtimeEventCode.orderPlaced:
        return OrderPlacedEvent(at: at, ref: OrderRef.fromJson(data));
      case RealtimeEventCode.orderSettled:
        return OrderSettledEvent(at: at, ref: OrderRef.fromJson(data));
      default:
        return null;
    }
  }
}

class MessageCreatedEvent extends RealtimeEvent {
  const MessageCreatedEvent({required super.at, required this.message})
    : super(code: RealtimeEventCode.messageCreated);
  final Message message;
}

class MessageUpdatedEvent extends RealtimeEvent {
  const MessageUpdatedEvent({required super.at, required this.message})
    : super(code: RealtimeEventCode.messageUpdated);
  final Message message;
}

class MessageDeletedEvent extends RealtimeEvent {
  const MessageDeletedEvent({required super.at, required this.ref})
    : super(code: RealtimeEventCode.messageDeleted);
  final DeletedMessageRef ref;
}

class ConversationReadEvent extends RealtimeEvent {
  const ConversationReadEvent({required super.at, required this.mark})
    : super(code: RealtimeEventCode.conversationRead);
  final ConversationReadMark mark;
}

class NotificationCreatedEvent extends RealtimeEvent {
  const NotificationCreatedEvent({required super.at, required this.notification})
    : super(code: RealtimeEventCode.notificationCreated);
  final api.Notification notification;
}

class OfferUpdatedEvent extends RealtimeEvent {
  const OfferUpdatedEvent({required super.at, required this.offer})
    : super(code: RealtimeEventCode.offerUpdated);
  final Offer offer;
}

class OrderPlacedEvent extends RealtimeEvent {
  const OrderPlacedEvent({required super.at, required this.ref})
    : super(code: RealtimeEventCode.orderPlaced);
  final OrderRef ref;
}

class OrderSettledEvent extends RealtimeEvent {
  const OrderSettledEvent({required super.at, required this.ref})
    : super(code: RealtimeEventCode.orderSettled);
  final OrderRef ref;
}
