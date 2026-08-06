import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/realtime/realtime_event.dart';

/// The socket frames are hand-decoded from the backend's asyncapi document, so a
/// code or a payload key that drifts is an event the app silently stops reacting
/// to. These are the published examples.
void main() {
  group('RealtimeEvent.fromJson', () {
    test('decodes chat.message_created into the message', () {
      final event = RealtimeEvent.fromJson({
        'code': 'chat.message_created',
        'at': '2026-08-03T11:17:04Z',
        'data': {
          'id': 'msg_agnc1pe4pjb4k',
          'conversation_id': 'cnv_6ptz3n8kvq1wd',
          'sender_id': null,
          'from_support': false,
          'type': 'user',
          'body': 'còn hàng không bạn',
          'attachments': <Map<String, dynamic>>[],
          'refs': <String, dynamic>{},
          'card': <String, dynamic>{},
          'created_at': '2026-08-03T11:17:04Z',
          'edited_at': null,
          'deleted_at': null,
        },
      });

      expect(event, isA<MessageCreatedEvent>());
      final created = event! as MessageCreatedEvent;
      expect(created.message.id, 'msg_agnc1pe4pjb4k');
      expect(created.message.body, 'còn hàng không bạn');
      // Null on a system message; a user message names its sender.
      expect(created.message.senderId, isNull);
      expect(created.at.toUtc().hour, 11);
    });

    test('decodes chat.message_deleted as a ref, not an emptied message', () {
      final event = RealtimeEvent.fromJson({
        'code': 'chat.message_deleted',
        'at': '2026-08-03T11:17:04Z',
        'data': {
          'id': 'msg_2h9qk4mfx7bd3',
          'conversation_id': 'cnv_7bd32h9qk4mfx',
          'created_at': '2026-08-03T11:16:02Z',
        },
      });

      expect(event, isA<MessageDeletedEvent>());
      expect((event! as MessageDeletedEvent).ref.id, 'msg_2h9qk4mfx7bd3');
    });

    test('decodes chat.conversation_read as the other side read mark', () {
      final event = RealtimeEvent.fromJson({
        'code': 'chat.conversation_read',
        'at': '2026-08-03T11:17:04Z',
        'data': {
          'conversation_id': 'cnv_7bd32h9qk4mfx',
          'reader_id': 'acc_4mfx7bd32h9qk',
          'read_at': '2026-08-03T11:17:04Z',
        },
      });

      expect(event, isA<ConversationReadEvent>());
      expect(
        (event! as ConversationReadEvent).mark.readerId,
        'acc_4mfx7bd32h9qk',
      );
    });

    test('decodes account.notification_created with its whole payload', () {
      final event = RealtimeEvent.fromJson({
        'code': 'account.notification_created',
        'at': '2026-08-03T11:17:04Z',
        'data': {
          'category': 'order',
          'title': 'Đơn hàng đã được giao',
          'payload': {'order_id': 'ord_fv2cpg50vkrfp'},
          'read_at': null,
          'created_at': '2026-08-03T11:17:04Z',
        },
      });

      expect(event, isA<NotificationCreatedEvent>());
      final notification = (event! as NotificationCreatedEvent).notification;
      expect(notification.title, 'Đơn hàng đã được giao');
      // Unread until it carries a read_at.
      expect(notification.readAt, isNull);
    });

    test('decodes order.offer_updated as the offer current state', () {
      final event = RealtimeEvent.fromJson({
        'code': 'order.offer_updated',
        'at': '2026-08-03T11:17:04Z',
        'data': {
          'id': 'ofr_ptz3n8kvq1wd6',
          'listing_id': 'lst_5y5w68r4918v8',
          'variant_id': 'vrn_vq1wd6ptz3n8k',
          'buyer_id': 'acc_62mxefynht57b',
          'seller_id': 'acc_4mfx7bd32h9qk',
          'author_id': 'acc_62mxefynht57b',
          'status': 'accepted',
          'quantity': 2,
          'total': 598000,
          'currency': 'VND',
          'reason': '',
          'created_at': '2026-08-03T11:00:00Z',
          'expires_at': '2026-08-03T11:30:00Z',
        },
      });

      expect(event, isA<OfferUpdatedEvent>());
      final offer = (event! as OfferUpdatedEvent).offer;
      expect(offer.total, 598000);
      expect(offer.status.value, 'accepted');
    });

    test('decodes order.placed and order.settled as an order id alone', () {
      final placed = RealtimeEvent.fromJson({
        'code': 'order.placed',
        'at': '2026-08-03T11:17:04Z',
        'data': {'id': 'ord_fv2cpg50vkrfp'},
      });
      final settled = RealtimeEvent.fromJson({
        'code': 'order.settled',
        'at': '2026-08-03T11:17:04Z',
        'data': {'id': 'ord_fv2cpg50vkrfp'},
      });

      expect(placed, isA<OrderPlacedEvent>());
      expect(settled, isA<OrderSettledEvent>());
      expect((placed! as OrderPlacedEvent).ref.id, 'ord_fv2cpg50vkrfp');
    });

    test('answers null for a code this client does not model', () {
      // The contract may grow a message before this client knows what to do
      // with it, so an unknown frame is dropped rather than thrown.
      final event = RealtimeEvent.fromJson({
        'code': 'finance.payout_released',
        'at': '2026-08-03T11:17:04Z',
        'data': <String, dynamic>{},
      });

      expect(event, isNull);
    });

    test('answers null for a frame with no code or no object payload', () {
      expect(RealtimeEvent.fromJson({'at': '2026-08-03T11:17:04Z'}), isNull);
      expect(
        RealtimeEvent.fromJson({'code': 'order.placed', 'data': 'ord_x'}),
        isNull,
      );
    });

    test('every code constant matches the published event name', () {
      expect(RealtimeEventCode.messageCreated, 'chat.message_created');
      expect(RealtimeEventCode.messageUpdated, 'chat.message_updated');
      expect(RealtimeEventCode.messageDeleted, 'chat.message_deleted');
      expect(RealtimeEventCode.conversationRead, 'chat.conversation_read');
      expect(
        RealtimeEventCode.notificationCreated,
        'account.notification_created',
      );
      expect(RealtimeEventCode.offerUpdated, 'order.offer_updated');
      expect(RealtimeEventCode.orderPlaced, 'order.placed');
      expect(RealtimeEventCode.orderSettled, 'order.settled');
    });
  });
}
