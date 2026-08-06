import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Segment mở sẵn vai nào, và một link cũ mở ra cái gì.
///
/// Vai mặc định đọc từ khối việc-cần-làm *đã có*, không phải từ một request thứ
/// hai — và tuyệt đối không chờ nó: một màn Đơn hàng trắng xoá vì đang đợi một
/// con số để quyết định mở tab nào là đổi một lần chạm lấy cả màn hình.
void main() {
  /// Một giá trị trả về *đồng bộ* là trạng thái thật khi người dùng vào từ trang
  /// Tài khoản: khối việc-cần-làm ở đó đã nạp xong và Riverpod còn giữ kết quả.
  /// `null` là nguồn chưa trả lời — và sẽ không trả lời trong bài test này.
  FutureOr<ActionInbox> served(ActionInbox? inbox) =>
      inbox ?? Completer<ActionInbox>().future;

  Widget app({
    ActionInbox? inbox = const ActionInbox(),
    required RecordingBackend backend,
    String at = '/orders',
  }) {
    final router = GoRouter(
      initialLocation: at,
      routes: [
        // Cùng hình dạng với router thật ở chỗ đang được kiểm: một GoRoute chỉ có
        // `redirect`, nằm làm con của một route khác trong ShellRoute.
        ShellRoute(
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) {
                final role = state.uri.queryParameters['role'];
                return OrdersScreen(
                  initialRole: role == null ? null : orderRoleFromQuery(role),
                );
              },
            ),
            GoRoute(
              path: '/seller',
              builder: (_, _) => const Text('seller'),
              routes: [
                GoRoute(
                  path: 'orders',
                  redirect: (context, state) => '/orders?role=seller',
                ),
              ],
            ),
          ],
        ),
      ],
    );

    return ProviderScope(
      overrides: [
        accountRepositoryProvider.overrideWithValue(backend.repository),
        actionInboxProvider.overrideWith((ref) => served(inbox)),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }

  RecordingBackend emptyBackend() => RecordingBackend((request) {
    return switch (request.path) {
      '/orders' => {
        'data': const [],
        'meta': const {'next_cursor': null},
      },
      '/items' => {
        'data': const [],
        'meta': const {'next_cursor': null},
      },
      _ => {
        'data': const [],
        'meta': const {'page': 1, 'limit': 20, 'total_count': 0},
      },
    };
  });

  /// Không ảnh: `Image.network` trong test không tải được gì, và những bài dưới
  /// đây nói về nút bấm với câu chữ, không về ảnh bìa.
  final listingNoCover = {...listingJson, 'cover': null};

  List<String?> rolesAsked(RecordingBackend backend) => [
    for (final call in backend.calls)
      if (call.path == '/orders') call.queryParameters['role'] as String?,
  ];

  testWidgets('segment vẽ đúng hai vai', (tester) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend));
    await tester.pumpAndSettle();

    expect(find.text('Tôi mua'), findsOneWidget);
    expect(find.text('Tôi bán'), findsOneWidget);
    // Chín cái tab trạng thái không còn ở đâu cả.
    expect(find.text('Tất cả'), findsNothing);
    expect(find.text('Chờ thanh toán'), findsNothing);
    expect(find.text('Đang xử lý'), findsNothing);
  });

  testWidgets('mở "Tôi bán" khi có đơn chờ chính mình xác nhận', (
    tester,
  ) async {
    final backend = emptyBackend();
    await tester.pumpWidget(
      app(backend: backend, inbox: const ActionInbox(ordersToConfirm: 2)),
    );
    await tester.pumpAndSettle();

    // Việc gấp nhất trên sàn này: tiền của người mua đang bị giữ và đồng hồ 48
    // giờ đang chạy trên chính người đang mở màn hình.
    expect(rolesAsked(backend), ['seller']);
  });

  testWidgets('không có việc chờ thì mở "Tôi mua"', (tester) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend));
    await tester.pumpAndSettle();

    expect(rolesAsked(backend), ['buyer']);
  });

  testWidgets('khối việc-cần-làm chưa nạp thì mở "Tôi mua", không chờ', (
    tester,
  ) async {
    final backend = emptyBackend();
    // `inbox: null` — nguồn này sẽ không bao giờ trả lời.
    await tester.pumpWidget(app(backend: backend, inbox: null));

    // Ngay frame đầu đã có segment để chạm, không phải một màn chờ.
    await tester.pump();
    expect(find.text('Tôi mua'), findsOneWidget);
    expect(find.text('Tôi bán'), findsOneWidget);

    // Và danh sách vẫn nạp: chờ con số kia thì không lượt gọi nào xảy ra cả.
    await tester.pumpAndSettle();
    expect(rolesAsked(backend), ['buyer']);
  });

  testWidgets('?role=seller thắng cả suy đoán', (tester) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend, at: '/orders?role=seller'));
    await tester.pumpAndSettle();

    expect(rolesAsked(backend), ['seller']);
  });

  testWidgets('?role=buyer thắng cả khi đang có đơn chờ xác nhận', (
    tester,
  ) async {
    final backend = emptyBackend();
    await tester.pumpWidget(
      app(
        backend: backend,
        at: '/orders?role=buyer',
        inbox: const ActionInbox(ordersToConfirm: 2),
      ),
    );
    await tester.pumpAndSettle();

    expect(rolesAsked(backend), ['buyer']);
  });

  testWidgets('?tab=2 của bản cũ mở ra một màn dùng được, không crash', (
    tester,
  ) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend, at: '/orders?tab=2'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Tôi mua'), findsOneWidget);
    expect(rolesAsked(backend), ['buyer']);
  });

  testWidgets('/seller/orders vẫn mở được, ở vai người bán', (tester) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend, at: '/seller/orders'));
    await tester.pumpAndSettle();

    // `context.push` là một string: xoá path này đi thì analyze vẫn xanh và chỉ
    // người dùng chạm vào mới biết.
    expect(tester.takeException(), isNull);
    expect(find.text('Tôi bán'), findsOneWidget);
    expect(rolesAsked(backend), ['seller']);
  });

  testWidgets('đổi segment thì hỏi lại theo vai mới', (tester) async {
    final backend = emptyBackend();
    await tester.pumpWidget(app(backend: backend));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tôi bán'));
    await tester.pumpAndSettle();

    expect(rolesAsked(backend), ['buyer', 'seller']);
  });

  testWidgets('một đơn chờ xác nhận nói ai đang giữ tiền, theo từng vai', (
    tester,
  ) async {
    Map<String, dynamic> Function(RequestOptions) serving(String state) =>
        (request) => switch (request.path) {
          '/orders' => {
            'data': [
              {...orderJson, 'state': state},
            ],
            'meta': const {'next_cursor': null},
          },
          '/items' => {
            'data': const [],
            'meta': const {'next_cursor': null},
          },
          _ => {
            'data': [listingNoCover],
            'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
          },
        };

    await tester.pumpWidget(
      app(
        backend: RecordingBackend(serving('awaiting-confirmation')),
        at: '/orders?role=buyer',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('ShopNexus đang giữ'), findsOneWidget);
    expect(find.textContaining('chờ người bán xác nhận'), findsOneWidget);

    await tester.pumpWidget(
      app(
        backend: RecordingBackend(serving('awaiting-confirmation')),
        at: '/orders?role=seller',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('Cần bạn xác nhận'), findsOneWidget);
  });

  group('không mất chức năng nào của màn Đơn bán cũ', () {
    Widget sellerAt(String state, {String? transportStatus = 'pending'}) {
      final order = {...orderJson, 'state': state};
      if (transportStatus == null) {
        order.remove('transport');
      } else {
        order['transport'] = {
          ...(orderJson['transport']! as Map<String, dynamic>),
          'status': transportStatus,
        };
      }
      return app(
        backend: RecordingBackend(
          (request) => switch (request.path) {
            '/orders' => {
              'data': [order],
              'meta': const {'next_cursor': null},
            },
            '/items' => {
              'data': const [],
              'meta': const {'next_cursor': null},
            },
            _ => {
              'data': [listingNoCover],
              'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
            },
          },
        ),
        at: '/orders?role=seller',
      );
    }

    testWidgets('đơn chờ xác nhận có cả Xác nhận và Từ chối', (tester) async {
      await tester.pumpWidget(sellerAt('awaiting-confirmation'));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ElevatedButton, 'Xác nhận'), findsOneWidget);
      expect(find.widgetWithText(TextButton, 'Từ chối'), findsOneWidget);
    });

    testWidgets('đơn đang đi có Báo vấn đề, và câu giải thích vì sao', (
      tester,
    ) async {
      await tester.pumpWidget(sellerAt('open'));
      await tester.pumpAndSettle();

      // Nút "Cập nhật vận chuyển" đã bị bỏ: vị trí kiện hàng là báo cáo của đơn
      // vị giao hàng, và một claim không có gì đằng sau từng cắt mất quyền hủy
      // của người mua.
      expect(find.widgetWithText(OutlinedButton, 'Báo vấn đề'), findsOneWidget);
      expect(
        find.textContaining('do đơn vị giao hàng cập nhật'),
        findsOneWidget,
      );
    });

    testWidgets('hủy được khi kiện hàng chưa rời pending', (tester) async {
      await tester.pumpWidget(sellerAt('open'));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextButton, 'Hủy đơn'), findsOneWidget);
    });

    testWidgets('kiện hàng đã đi rồi thì không mời hủy nữa', (tester) async {
      await tester.pumpWidget(sellerAt('open', transportStatus: 'in-transit'));
      await tester.pumpAndSettle();

      // Route trả 409 sau khi hàng đã được lấy; đường về là một yêu cầu hoàn tiền.
      expect(find.widgetWithText(TextButton, 'Hủy đơn'), findsNothing);
    });

    testWidgets('đơn đã xong không mời làm gì nữa', (tester) async {
      await tester.pumpWidget(sellerAt('completed'));
      await tester.pumpAndSettle();

      expect(find.text('Xác nhận'), findsNothing);
      expect(find.text('Từ chối'), findsNothing);
      expect(find.text('Hủy đơn'), findsNothing);
      expect(find.text('Hoàn thành'), findsOneWidget);
    });
  });
}
