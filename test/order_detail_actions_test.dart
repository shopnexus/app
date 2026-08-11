import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/order_detail_screen.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Việc của một đơn ở thanh dưới, không ở sau ba chấm.
///
/// "Yêu cầu hoàn tiền" từng là một dòng menu hiện trên **mọi** đơn, kể cả đơn đã
/// hủy và đơn đã có một vụ đang mở — hai trường hợp `POST /orders/{id}/refunds`
/// trả 409. Một nút chỉ nên có mặt khi nó bấm được, nên điều kiện ở đây là đúng
/// hai điều kiện server đặt ra, đọc từ `order.refund.settled` và `state`.
void main() {
  Map<String, dynamic> order({
    String state = 'open',
    String transportStatus = 'delivered',
    String? receivedAt,
    Map<String, dynamic>? refund,
  }) => {
    ...orderJson,
    'state': state,
    'received_at': receivedAt,
    'refund': refund,
    'transport': {
      ...(orderJson['transport']! as Map<String, dynamic>),
      'status': transportStatus,
    },
  };

  Map<String, dynamic> refundCase({required bool settled}) => {
    'id': 'rfn_7t0k1v4m2q8xd',
    'status': settled ? 'accepted' : 'awaiting-seller-review',
    'settled': settled,
    'created_at': '2026-08-08T02:47:38.20111Z',
  };

  Widget app(RecordingBackend backend) => ProviderScope(
    overrides: [
      accountRepositoryProvider.overrideWithValue(backend.repository),
    ],
    child: MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/orders/ord_2ybcv39246zn7',
        routes: [
          GoRoute(
            path: '/orders/:id',
            builder: (_, state) =>
                OrderDetailScreen(orderId: state.pathParameters['id']!),
          ),
        ],
      ),
    ),
  );

  RecordingBackend serving(Map<String, dynamic> row) => RecordingBackend(
    (request) => switch (request.path) {
      '/listings' => {
        'data': [
          {...listingJson, 'cover': null},
        ],
        'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
      },
      _ => {'data': row},
    },
  );

  testWidgets('đơn đang mở, chưa có vụ nào: mời yêu cầu hoàn tiền', (
    tester,
  ) async {
    await tester.pumpWidget(app(serving(order())));
    await tester.pumpAndSettle();

    expect(find.text('Yêu cầu hoàn tiền'), findsOneWidget);
    // Và không còn nằm sau ba chấm, nơi nó vốn hiện trên mọi đơn.
    await tester.tap(find.byIcon(Icons.more_horiz_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Yêu cầu hoàn tiền'), findsOneWidget);
    expect(find.text('Báo sự cố đơn hàng'), findsOneWidget);
  });

  testWidgets('hàng đã tới mà chưa xác nhận: có nút Đã nhận hàng', (
    tester,
  ) async {
    await tester.pumpWidget(app(serving(order())));
    await tester.pumpAndSettle();

    expect(find.text('Đã nhận hàng'), findsOneWidget);
  });

  testWidgets('đã xác nhận nhận hàng rồi thì không hỏi lại', (tester) async {
    await tester.pumpWidget(
      app(serving(order(receivedAt: '2026-08-09T02:47:38.20111Z'))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Đã nhận hàng'), findsNothing);
    // Escrow vẫn chưa kết, nên hoàn tiền vẫn là một đường đi.
    expect(find.text('Yêu cầu hoàn tiền'), findsOneWidget);
  });

  testWidgets('đang có vụ chưa xong: dẫn tới vụ đó, không mời mở vụ thứ hai', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(serving(order(refund: refundCase(settled: false)))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Xem yêu cầu hoàn tiền'), findsOneWidget);
    expect(find.text('Yêu cầu hoàn tiền'), findsNothing);
  });

  testWidgets('vụ đã khép lại thì mở được vụ mới', (tester) async {
    await tester.pumpWidget(
      app(serving(order(refund: refundCase(settled: true)))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Yêu cầu hoàn tiền'), findsOneWidget);
    expect(find.text('Xem yêu cầu hoàn tiền'), findsNothing);
  });

  testWidgets('đơn đã hủy không còn việc gì, và không có thanh rỗng', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(serving(order(state: 'cancelled', transportStatus: 'cancelled'))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Yêu cầu hoàn tiền'), findsNothing);
    expect(find.text('Đã nhận hàng'), findsNothing);
    expect(find.byType(BottomAppBar), findsNothing);
  });
}
