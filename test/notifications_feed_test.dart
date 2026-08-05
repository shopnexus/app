import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart'
    as wire;
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// The feed is cursor-paged and has no per-row id. The app sent `page` (ignored,
/// so the list was stuck on the first page) and marked read with `before: now`
/// from a `createdAt.hashCode` "id" — so one tap read the whole feed.
void main() {
  Map<String, dynamic> feed(String? nextCursor) => {
    'data': [notificationJson],
    'meta': {'next_cursor': nextCursor},
  };

  test('a row parses, and its deep link comes out of the payload', () {
    final item = wire.Notification.fromJson(notificationJson);

    expect(item.category, NotificationCategory.order);
    expect(item.readAt, isNull);
    expect(item.createdAt, DateTime.parse('2026-08-05T02:47:38.213999Z'));
    expect(item.payload['order_id'], 'ord_2ybcv39246zn7');
  });

  group('GET /notifications', () {
    test('asks by cursor, never by page', () async {
      final backend = RecordingBackend((_) => feed('opaque-cursor'));

      final page = await backend.repository.notifications();

      expect(backend.paths.single, 'notifications');
      expect(backend.only.queryParameters.containsKey('page'), isFalse);
      expect(backend.only.queryParameters['limit'], 20);
      expect(page.meta.nextCursor, 'opaque-cursor');
    });

    test('the next page is that cursor', () async {
      final backend = RecordingBackend((_) => feed(null));

      await backend.repository.notifications(cursor: 'opaque-cursor');

      expect(backend.only.queryParameters['cursor'], 'opaque-cursor');
    });
  });

  group('POST /notifications/read', () {
    test('one row is marked read by its own timestamp', () async {
      final backend = RecordingBackend(
        (_) => const {
          'data': {'unread': 3},
        },
      );
      final row = wire.Notification.fromJson(notificationJson);

      final unread = await backend.repository.markNotificationsRead(
        before: row.createdAt,
      );

      expect(backend.paths.single, 'notifications/read');
      expect(backend.only.method, 'POST');
      expect(backend.bodyOf(0), {
        'before': '2026-08-05T02:47:38.213999Z',
      });
      expect(unread, 3);
    });

    test('marking everything read sends no bound at all', () async {
      final backend = RecordingBackend(
        (_) => const {
          'data': {'unread': 0},
        },
      );

      await backend.repository.markNotificationsRead();

      expect(backend.bodyOf(0), isEmpty);
    });
  });
}
