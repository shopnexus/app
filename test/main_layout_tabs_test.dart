import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/shared/widgets/main_layout.dart';

/// The button between "Tìm kiếm" and "Hộp thư" is a compose action, not a tab:
/// it is the only way into the posting form from anywhere in the app, and the
/// form ends with `context.pop()`, which needs something under it to pop back
/// to. Sending it to the seller dashboard instead left the "+" opening a
/// dashboard and the posting form reachable only from inside the seller area.
void main() {
  Widget app({String at = '/home'}) {
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
    return MaterialApp.router(
      routerConfig: router,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: const TextScaler.linear(0.5)),
        child: child!,
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
}
