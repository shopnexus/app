import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/action_inbox_card.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/account_menu_tile.dart';

/// Khối này đứng ngay dưới header, trên mọi thứ khác. Nếu nó vẫn chiếm chỗ khi
/// không có việc, nó đẩy toàn bộ menu xuống dưới màn hình đầu tiên mà không đổi
/// lại được gì.
void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('ActionInboxView', () {
    testWidgets('không vẽ gì khi rỗng', (tester) async {
      await tester.pumpWidget(
        wrap(const ActionInboxView(inbox: ActionInbox(), onTapRoute: _noop)),
      );

      expect(find.text('Việc cần làm'), findsNothing);
      expect(find.textContaining('đơn'), findsNothing);
    });

    testWidgets('hiện một dòng cho mỗi loại có việc', (tester) async {
      await tester.pumpWidget(
        wrap(
          const ActionInboxView(
            inbox: ActionInbox(ordersToShip: 2, unreadMessages: 3),
            onTapRoute: _noop,
          ),
        ),
      );

      expect(find.text('2'), findsOneWidget);
      expect(find.text('đơn chờ giao'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('tin nhắn chưa đọc'), findsOneWidget);
      expect(find.text('yêu cầu hoàn tiền'), findsNothing);
    });

    testWidgets('chạm vào một dòng thì báo đúng route', (tester) async {
      String? tapped;
      await tester.pumpWidget(
        wrap(
          ActionInboxView(
            inbox: const ActionInbox(refundsAsSeller: 1),
            onTapRoute: (route) => tapped = route,
          ),
        ),
      );

      await tester.tap(find.text('yêu cầu hoàn tiền chờ bạn duyệt'));
      await tester.pump();

      // Kèm vai, nếu không RefundListScreen mở tab "Tôi mua" rỗng.
      expect(tapped, '/account/refunds?role=seller');
    });

    testWidgets('số quá 99 rút gọn', (tester) async {
      await tester.pumpWidget(
        wrap(
          const ActionInboxView(
            inbox: ActionInbox(unreadMessages: 250),
            onTapRoute: _noop,
          ),
        ),
      );

      expect(find.text('99+'), findsOneWidget);
    });
  });

  group('AccountMenuTile', () {
    testWidgets('vẽ tiêu đề và chevron', (tester) async {
      await tester.pumpWidget(
        wrap(
          AccountMenuTile(
            icon: Icons.local_mall_outlined,
            title: 'Đơn mua',
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Đơn mua'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
    });

    testWidgets('tint đổi màu chữ cho dòng phá vỡ nhịp', (tester) async {
      await tester.pumpWidget(
        wrap(
          AccountMenuTile(
            icon: Icons.logout_rounded,
            title: 'Đăng xuất',
            tint: const Color(0xFFBA1A1A),
            onTap: () {},
          ),
        ),
      );

      final title = tester.widget<Text>(find.text('Đăng xuất'));
      expect(title.style?.color, const Color(0xFFBA1A1A));
    });

    testWidgets('chạm vào thì gọi onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          AccountMenuTile(
            icon: Icons.settings_outlined,
            title: 'Cài đặt',
            onTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('Cài đặt'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

void _noop(String route) {}
