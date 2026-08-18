import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/order_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_orders_screen.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Câu người mua dặn lúc thanh toán phải tới được tay người bán.
///
/// Nó được ghi lên từng dòng của lượt thanh toán (`item.note`) và trả về sẵn
/// trong `/orders`, nhưng không màn nào vẽ nó: người bán gói hàng mà không đọc
/// được thứ người mua vừa viết cho mình.
void main() {
  const note = 'Giao giờ hành chính, gọi trước 10 phút';
  const sellerID = 'acc_48gmxxfhd8ta3';

  final listingNoCover = {...listingJson, 'cover': null};

  Map<String, dynamic> orderWith({required String itemNote}) => {
    ...orderJson,
    'items': [
      {...orderItemJson, 'note': itemNote},
    ],
  };

  RecordingBackend serving(Map<String, dynamic> row) => RecordingBackend(
    (request) => switch (request.path) {
      '/listings' => {
        'data': [listingNoCover],
        'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
      },
      '/orders' => {
        'data': [row],
        'meta': const {'next_cursor': null},
      },
      '/items' || '/refunds' => {
        'data': const [],
        'meta': const {'next_cursor': null},
      },
      _ => {'data': row},
    },
  );

  Widget detailApp(RecordingBackend backend) => ProviderScope(
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

  Widget sellerApp(RecordingBackend backend) => ProviderScope(
    overrides: [
      accountRepositoryProvider.overrideWithValue(backend.repository),
      sellerRepositoryProvider.overrideWithValue(backend.seller),
      profileProvider.overrideWith(
        (ref) => Me.fromJson({...meJson, 'id': sellerID}),
      ),
      // Danh sách hoàn tiền đi qua repository riêng của nó, không qua [backend]:
      // không chặn thì bài test này đi ra mạng thật.
      refundListProvider.overrideWith((ref) => const <Refund>[]),
    ],
    child: MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/seller/orders',
        routes: [
          GoRoute(
            path: '/seller/orders',
            builder: (_, _) => const SellerOrdersScreen(),
          ),
        ],
      ),
    ),
  );

  testWidgets('màn đơn bán hiện ghi chú của người mua', (tester) async {
    await tester.pumpWidget(sellerApp(serving(orderWith(itemNote: note))));
    await tester.pumpAndSettle();

    expect(find.textContaining(note), findsOneWidget);
  });

  testWidgets('chi tiết đơn hiện ghi chú cạnh địa chỉ', (tester) async {
    await tester.pumpWidget(detailApp(serving(orderWith(itemNote: note))));
    await tester.pumpAndSettle();

    expect(find.textContaining(note), findsOneWidget);
  });

  testWidgets('không có ghi chú thì không có khối rỗng', (tester) async {
    await tester.pumpWidget(detailApp(serving(orderWith(itemNote: '   '))));
    await tester.pumpAndSettle();

    expect(find.text('Ghi chú của người mua'), findsNothing);
  });
}
