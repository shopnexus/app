import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// `/seller` sau khi bảng số liệu bị xoá.
///
/// Nó không mất đi được: là tiền tố của ba route con, là tab 2 của thanh nav
/// (`startsWith('/seller')`), và là một deep link đã phát ra ngoài. Nên nó thành
/// một redirect — và một redirect trên route *cha* là chỗ dễ tạo vòng lặp: nếu nó
/// cũng nổ khi con được match, `/seller/products` sẽ tự chuyển về chính nó mãi.
/// Cái chặn là `matchedLocation == '/seller'`, và đây là chỗ kiểm nó.
void main() {
  Widget app(String at) {
    final router = GoRouter(
      initialLocation: at,
      routes: [
        ShellRoute(
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
              path: '/seller',
              redirect: (context, state) =>
                  state.uri.path == '/seller' ? '/seller/products' : null,
              routes: [
                GoRoute(
                  path: 'products',
                  builder: (_, _) => const Text('tin của tôi'),
                ),
                GoRoute(
                  path: 'earnings',
                  builder: (_, _) => const Text('số dư'),
                ),
                GoRoute(
                  path: 'new-listing',
                  builder: (_, _) => const Text('đăng bán'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('/seller mở "Tin của tôi"', (tester) async {
    await tester.pumpWidget(app('/seller'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('tin của tôi'), findsOneWidget);
  });

  testWidgets('/seller/products không tự chuyển về chính nó', (tester) async {
    await tester.pumpWidget(app('/seller/products'));
    await tester.pumpAndSettle();

    // Redirect của cha không nổ khi con được match; nếu nó nổ, go_router ném
    // "redirection limit reached" và cả tab Đăng bán chết.
    expect(tester.takeException(), isNull);
    expect(find.text('tin của tôi'), findsOneWidget);
  });

  testWidgets('/seller/earnings vẫn mở đúng chỗ', (tester) async {
    await tester.pumpWidget(app('/seller/earnings'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('số dư'), findsOneWidget);
  });

  testWidgets('/seller/new-listing vẫn mở đúng chỗ', (tester) async {
    await tester.pumpWidget(app('/seller/new-listing'));
    await tester.pumpAndSettle();

    // Nút "+" giữa thanh nav đẩy thẳng vào đây, nên đây là route không được vỡ.
    expect(tester.takeException(), isNull);
    expect(find.text('đăng bán'), findsOneWidget);
  });
}
