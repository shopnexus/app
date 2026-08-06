import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/screens/inbox_screen.dart';

/// Tin nhắn và Thông báo về một chỗ. Trước đó chúng là hai màn hình ở hai nhánh
/// route khác nhau, nên "có gì mới cho tôi" có hai nơi phải đi xem — và Thông báo
/// chỉ tới được từ cái chuông trên Trang chủ.
void main() {
  group('inboxTabFromQuery', () {
    test('không có tham số thì mở Tin nhắn', () {
      expect(inboxTabFromQuery(null), InboxTab.messages);
    });

    test('đọc được notifications', () {
      expect(inboxTabFromQuery('notifications'), InboxTab.notifications);
    });

    /// Một link cũ hoặc gõ sai phải mở Hộp thư, không được ném.
    test('giá trị lạ rơi về Tin nhắn', () {
      expect(inboxTabFromQuery('thông-báo'), InboxTab.messages);
      expect(inboxTabFromQuery(''), InboxTab.messages);
    });

    test('mọi tab đi vòng qua query và về nguyên vẹn', () {
      for (final tab in InboxTab.values) {
        expect(inboxTabFromQuery(tab.value), tab);
      }
    });
  });

  group('InboxScreen', () {
    Widget app({InboxTab initialTab = InboxTab.messages}) => ProviderScope(
      overrides: [
        chatListProvider.overrideWith(_EmptyChatList.new),
        notificationsControllerProvider.overrideWith(_EmptyFeed.new),
      ],
      child: MaterialApp(
        home: InboxScreen(initialTab: initialTab),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(0.5)),
          child: child!,
        ),
      ),
    );

    testWidgets('mở ở tab Tin nhắn và có cả hai tab', (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      expect(find.text('Hộp thư'), findsOneWidget);
      expect(find.text('Tin nhắn'), findsOneWidget);
      expect(find.text('Thông báo'), findsOneWidget);
      expect(find.text('Chưa có tin nhắn nào'), findsOneWidget);
    });

    testWidgets('?tab=notifications mở thẳng vào Thông báo', (tester) async {
      await tester.pumpWidget(app(initialTab: InboxTab.notifications));
      await tester.pumpAndSettle();

      expect(find.text('Không có thông báo mới'), findsOneWidget);
    });

    testWidgets('chạm Thông báo thì đổi tab, chạm Tin nhắn thì đổi lại', (
      tester,
    ) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Thông báo'));
      await tester.pumpAndSettle();
      expect(find.text('Không có thông báo mới'), findsOneWidget);

      await tester.tap(find.text('Tin nhắn'));
      await tester.pumpAndSettle();
      expect(find.text('Chưa có tin nhắn nào'), findsOneWidget);
    });

    /// "Đọc tất cả" chỉ có nghĩa với feed thông báo — tin nhắn được đọc theo từng
    /// cuộc trò chuyện — nên nó không được ngồi trên `AppBar` khi đang ở Tin nhắn.
    testWidgets('"Đọc tất cả" chỉ hiện ở tab Thông báo', (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      expect(find.text('Đọc tất cả'), findsNothing);

      await tester.tap(find.text('Thông báo'));
      await tester.pumpAndSettle();
      expect(find.text('Đọc tất cả'), findsOneWidget);
    });

    /// `IndexedStack` giữ cả hai tab sống, nên ô tìm kiếm đã gõ và vị trí cuộn
    /// không mất khi người dùng qua lại giữa hai tab.
    testWidgets('đổi tab không dựng lại tab kia từ đầu', (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'bút chì');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Thông báo'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tin nhắn'));
      await tester.pumpAndSettle();

      expect(find.text('bút chì'), findsOneWidget);
    });
  });
}

/// `build` được ghi đè hoàn toàn, nên không có repository nào bị gọi và không có
/// socket nào được mở.
class _EmptyChatList extends ChatListNotifier {
  @override
  Future<ChatListState> build() async => const ChatListState();
}

class _EmptyFeed extends NotificationsController {
  @override
  Future<NotificationFeed> build() async =>
      const NotificationFeed(items: [], nextCursor: null);
}
