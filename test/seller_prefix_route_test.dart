import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// `/seller` sau khi bảng số liệu quay lại.
///
/// Nó từng là một redirect sang `/seller/products`, vì màn hình nó trỏ tới đã bị
/// xoá. Giờ nó lại có màn hình của mình, và đó là cửa *duy nhất*: màn Tài khoản
/// chỉ link tới ba route con, nên `/seller` mà chuyển đi chỗ khác là bảng số liệu
/// không ai mở được.
///
/// Điều còn phải kiểm là ba route con vẫn mở đúng chỗ dưới một route cha nay đã
/// có builder — cái cũ dễ vỡ ở đây, vì redirect của cha từng bắn cả khi con được
/// match và đẩy mọi thứ về "Tin của tôi".
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
              builder: (_, _) => const Text('bảng số liệu'),
              routes: [
                GoRoute(
                  path: 'products',
                  builder: (_, _) => const Text('tin của tôi'),
                ),
                GoRoute(
                  path: 'orders',
                  builder: (_, _) => const Text('đơn bán'),
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

  testWidgets('/seller mở bảng số liệu', (tester) async {
    await tester.pumpWidget(app('/seller'));
    await tester.pumpAndSettle();

    // Nút "+" giữa thanh nav đi thẳng vào đây, nên đây là route không được vỡ.
    expect(tester.takeException(), isNull);
    expect(find.text('bảng số liệu'), findsOneWidget);
  });

  testWidgets('bốn route con vẫn mở đúng chỗ của chúng', (tester) async {
    for (final child in const {
      '/seller/products': 'tin của tôi',
      '/seller/orders': 'đơn bán',
      '/seller/earnings': 'số dư',
      '/seller/new-listing': 'đăng bán',
    }.entries) {
      await tester.pumpWidget(app(child.key));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull, reason: child.key);
      expect(find.text(child.value), findsOneWidget, reason: child.key);
      expect(
        find.text('bảng số liệu'),
        findsNothing,
        reason: '${child.key} không rơi về màn của cha',
      );
    }
  });
}
