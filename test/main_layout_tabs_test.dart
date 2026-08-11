import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/inbox_unread_provider.dart';
import 'package:shopnexus_flutter_app/shared/widgets/main_layout.dart';

/// Nút giữa "Tìm kiếm" và "Tin nhắn" là tab thứ ba, không phải một hành động: nó
/// đi tới khu bán hàng bằng `go` như bốn tab kia, và nó sáng lên cho mọi route
/// `/seller`. Đây cũng là cửa duy nhất vào bảng số liệu — màn Tài khoản chỉ link
/// tới `/seller/products`, `/seller/orders` và `/seller/earnings`.
void main() {
  /// [unread] null nghĩa là nguồn chưa trả lời — badge phải vắng, không được làm
  /// thanh nav không vẽ. Tương tự [inbox].
  Widget app({
    String at = '/home',
    int? unread = 0,
    ActionInbox? inbox = const ActionInbox(),
    bool signedIn = true,
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
        authProvider.overrideWith(() => _FixedAuth(signedIn: signedIn)),
        inboxUnreadProvider.overrideWith((ref) => _pending(unread)),
        actionInboxProvider.overrideWith((ref) => _pending(inbox)),
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

  testWidgets('nút + mở thẳng biểu mẫu đăng bán', (tester) async {
    await tester.pumpWidget(app());

    await tester.tap(sellButton);
    await tester.pumpAndSettle();

    // Không phải bảng số liệu của người bán: cái + hỏi "đăng bán cái gì", và
    // bắt người ta đi qua một trang thống kê để tới đó là một lần chạm thừa.
    expect(find.text('posting form'), findsOneWidget);
    expect(find.text('seller dashboard'), findsNothing);
  });

  /// `push`, không `go` — và đây là chỗ duy nhất trong thanh nav được phép thế.
  /// Bốn tab kia là *điểm đến*; cái + là một việc đang làm dở, nên nó chồng lên
  /// chỗ đang đứng và nút back trả người ta về đúng chỗ đó thay vì về Trang chủ.
  testWidgets('+ chồng lên màn đang đứng, và quay lại được', (tester) async {
    await tester.pumpWidget(app(at: '/account'));

    await tester.tap(sellButton);
    await tester.pumpAndSettle();
    expect(find.text('posting form'), findsOneWidget);

    final context = tester.element(find.text('posting form'));
    expect(
      GoRouter.of(context).canPop(),
      isTrue,
      reason: 'bỏ dở việc đăng bán phải quay về chỗ vừa rời',
    );
  });

  testWidgets('the other four tabs still go to their own destination', (
    tester,
  ) async {
    await tester.pumpWidget(app());

    for (final tab in const {
      'Tìm kiếm': 'search',
      'Tin nhắn': 'chat',
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
      expect(find.text('Tin nhắn'), findsOneWidget);
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

  group('việc-cần-làm không leo lên thanh nav', () {
    /// Thanh nav chỉ còn báo **chưa đọc**. Việc cần làm sống trong khối
    /// `ActionInboxView` ở trang Tài khoản, nơi mỗi dòng nói ra nó là việc gì và
    /// mở đúng chỗ để làm — một cái chấm ngoài này chỉ nói "vào đây xem".
    ///
    /// Bài này giữ điều đó cố định: có việc cũng không được vẽ thêm gì lên tab
    /// Tài khoản, và tuyệt đối không phải một con số.
    testWidgets('có việc cũng không vẽ gì lên tab Tài khoản', (tester) async {
      await tester.pumpWidget(
        app(unread: 0, inbox: const ActionInbox(ordersToShip: 3)),
      );
      await tester.pumpAndSettle();

      expect(find.text('3'), findsNothing);
      expect(_dots(tester), 0);
    });

    /// Và badge Tin nhắn vẫn là của riêng nó: một hộp thư có tin chưa đọc phải
    /// hiện số đó dù người bán có việc hay không, và việc của người bán không
    /// được biến thành một con số ở đây.
    testWidgets('badge Tin nhắn không dính gì tới việc cần làm', (tester) async {
      await tester.pumpWidget(
        app(unread: 4, inbox: const ActionInbox(refundsAsSeller: 2)),
      );
      await tester.pumpAndSettle();

      expect(find.text('4'), findsOneWidget, reason: 'chưa đọc là 4');
      expect(find.text('2'), findsNothing, reason: 'việc cần làm không có số');
      expect(_dots(tester), 0);
    });
  });

  /// Thanh nav sống trên cả những trang công khai. Cả hai nguồn của badge đều là
  /// route cần token, nên khách chưa đăng nhập không được hỏi: một loạt 401 chỉ
  /// để lấy hai số 0 đã biết trước.
  testWidgets('khách chưa đăng nhập không có badge, không có chấm', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(
        signedIn: false,
        unread: 9,
        inbox: const ActionInbox(ordersToShip: 5),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('9'), findsNothing);
    expect(_dots(tester), 0);
    // Và thanh nav vẫn đủ 5 chỗ — khách vẫn phải đi lại được trong app.
    expect(find.text('Tin nhắn'), findsOneWidget);
    expect(find.text('Tài khoản'), findsOneWidget);
  });
}

/// `build` ghi đè hoàn toàn, nên không cần Hive.
class _FixedAuth extends AuthNotifier {
  _FixedAuth({required this.signedIn});

  final bool signedIn;

  @override
  AuthState build() => signedIn
      ? const AuthState.authenticated(
          accessToken: 'access',
          refreshToken: 'refresh',
        )
      : const AuthState.unauthenticated();
}

/// Null nghĩa là nguồn chưa trả lời: một `Completer` không bao giờ hoàn thành là
/// cách dựng lại đúng cái trạng thái đáng lo — app vừa mở, lời gọi mạng còn đang
/// bay, và thanh nav vẫn phải vẽ.
FutureOr<T> _pending<T>(T? value) {
  if (value == null) return Completer<T>().future;
  return value;
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
