import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/inbox_unread_provider.dart';
import 'package:shopnexus_flutter_app/shared/widgets/main_layout.dart';

/// The button between "Tìm kiếm" and "Hộp thư" is a compose action, not a tab:
/// it is the only way into the posting form from anywhere in the app, and the
/// form ends with `context.pop()`, which needs something under it to pop back
/// to. Sending it to the seller dashboard instead left the "+" opening a
/// dashboard and the posting form reachable only from inside the seller area.
void main() {
  /// [unread] null nghĩa là nguồn chưa trả lời — badge phải vắng, không được làm
  /// thanh nav không vẽ. Tương tự [inbox].
  Widget app({
    String at = '/home',
    int? unread = 0,
    ActionInbox? inbox = const ActionInbox(),
  }) {
    final router = GoRouter(
      initialLocation: at,
      routes: [
        ShellRoute(
          builder: (context, state, child) => MainLayout(child: child),
          routes: [
            GoRoute(path: '/home', builder: (_, _) => const Text('home')),
            GoRoute(path: '/search', builder: (_, _) => const Text('search')),
            GoRoute(
              path: '/seller',
              builder: (_, _) => const Text('seller dashboard'),
              routes: [
                GoRoute(
                  path: 'new-listing',
                  builder: (_, _) => const Text('posting form'),
                ),
              ],
            ),
            GoRoute(path: '/chat', builder: (_, _) => const Text('chat')),
            GoRoute(path: '/account', builder: (_, _) => const Text('account')),
          ],
        ),
      ],
    );
    // Every glyph of the harness font is a square, so a 10px label is nine
    // squares wide and wraps inside a 64px tab, overflowing a bar that Inter
    // fits comfortably. Halving the scale is how the stub is made to stand in
    // for the real metrics; the layout is not what these tests are about.
    return ProviderScope(
      overrides: [
        // Một `Completer` không bao giờ hoàn thành là cách dựng lại đúng cái
        // trạng thái đáng lo: app vừa mở, hai lời gọi mạng còn đang bay.
        inboxUnreadProvider.overrideWith(
          (ref) => unread == null ? Completer<int>().future : unread,
        ),
        actionInboxProvider.overrideWith(
          (ref) => inbox == null ? Completer<ActionInbox>().future : inbox,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(0.5)),
          child: child!,
        ),
      ),
    );
  }

  final sellButton = find.byIcon(Icons.add_circle_outline_rounded);

  testWidgets('the + opens the posting form', (tester) async {
    await tester.pumpWidget(app());

    await tester.tap(sellButton);
    await tester.pumpAndSettle();

    expect(find.text('posting form'), findsOneWidget);
  });

  testWidgets('the form is pushed, so leaving it lands back where it started', (
    tester,
  ) async {
    await tester.pumpWidget(app(at: '/account'));

    await tester.tap(sellButton);
    await tester.pumpAndSettle();
    expect(find.text('posting form'), findsOneWidget);

    // What `_submit` does once the listing is saved.
    final context = tester.element(find.text('posting form'));
    GoRouter.of(context).pop();
    await tester.pumpAndSettle();

    expect(find.text('account'), findsOneWidget);
  });

  testWidgets('the other four tabs still go to their own destination', (
    tester,
  ) async {
    await tester.pumpWidget(app());

    for (final tab in const {
      'Tìm kiếm': 'search',
      'Hộp thư': 'chat',
      'Tài khoản': 'account',
      'Trang chủ': 'home',
    }.entries) {
      await tester.tap(find.text(tab.key));
      await tester.pumpAndSettle();
      expect(find.text(tab.value), findsOneWidget);
    }
  });

  /// "Chưa đọc" và "chưa làm" là hai đại lượng khác nhau, và thanh nav phải nói
  /// đúng cái nó đếm được. Badge có số ở Hộp thư đếm *chưa đọc*; tab Tài khoản
  /// chỉ có chấm, vì con số việc-cần-làm gộp việc ở nhiều nơi khác nhau và không
  /// có trang nào cho người dùng thấy đúng con số ấy khi họ chạm vào tab.
  group('badge chưa đọc trên tab Hộp thư', () {
    testWidgets('0 thì không vẽ badge nào', (tester) async {
      await tester.pumpWidget(app(unread: 0));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNothing);
    });

    testWidgets('có số thì hiện đúng con số đó', (tester) async {
      await tester.pumpWidget(app(unread: 7));
      await tester.pumpAndSettle();

      expect(find.text('7'), findsOneWidget);
    });

    testWidgets('trên 99 thì rút gọn', (tester) async {
      await tester.pumpWidget(app(unread: 128));
      await tester.pumpAndSettle();

      expect(find.text('99+'), findsOneWidget);
      expect(badgeLabel(100), '99+');
      expect(badgeLabel(99), '99');
    });

    /// Cái hỏng phải chặn: badge nạp lúc mở app, nên `loading` không được đi qua
    /// `.when()` — thanh nav trắng thì cả app không đi đâu được nữa.
    testWidgets('nguồn chưa trả lời thì thanh nav vẫn vẽ đủ 5 chỗ', (
      tester,
    ) async {
      await tester.pumpWidget(app(unread: null, inbox: null));
      await tester.pump();

      expect(find.text('Trang chủ'), findsOneWidget);
      expect(find.text('Tìm kiếm'), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline_rounded), findsOneWidget);
      expect(find.text('Hộp thư'), findsOneWidget);
      expect(find.text('Tài khoản'), findsOneWidget);
      expect(find.text('home'), findsOneWidget);
    });

    testWidgets('nguồn chưa trả lời thì không đoán ra một con số', (
      tester,
    ) async {
      await tester.pumpWidget(app(unread: null, inbox: null));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('99+'), findsNothing);
    });
  });

  group('chấm việc-cần-làm trên tab Tài khoản', () {
    /// Chấm, không phải số: nó chỉ nói "vào đây xem", nên nó không thể nói sai.
    testWidgets('có việc thì hiện chấm mà không hiện con số', (tester) async {
      await tester.pumpWidget(
        app(unread: 0, inbox: const ActionInbox(ordersToShip: 3)),
      );
      await tester.pumpAndSettle();

      expect(find.text('3'), findsNothing);
      expect(_dots(tester), 1);
    });

    testWidgets('không việc nào thì không chấm', (tester) async {
      await tester.pumpWidget(app(unread: 0, inbox: const ActionInbox()));
      await tester.pumpAndSettle();

      expect(_dots(tester), 0);
    });

    /// Badge của Hộp thư và chấm của Tài khoản là hai chỗ độc lập: một hộp thư
    /// sạch vẫn phải để lộ việc của người bán, và ngược lại.
    testWidgets('badge và chấm không dùng chung một nguồn', (tester) async {
      await tester.pumpWidget(
        app(unread: 4, inbox: const ActionInbox(refundsAsSeller: 2)),
      );
      await tester.pumpAndSettle();

      expect(find.text('4'), findsOneWidget, reason: 'chưa đọc là 4');
      expect(find.text('2'), findsNothing, reason: 'việc cần làm không có số');
      expect(_dots(tester), 1);
    });
  });
}

/// Chấm là hình tròn 9px duy nhất trên thanh nav — dấu gạch dưới của tab đang mở
/// là 4px, nên hai thứ không lẫn nhau.
int _dots(WidgetTester tester) => tester
    .widgetList<Container>(find.byType(Container))
    .where(
      (container) =>
          container.constraints?.maxWidth == 9.0 &&
          (container.decoration as BoxDecoration?)?.shape == BoxShape.circle,
    )
    .length;
