import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Dòng bị hủy trước khi trả tiền phải có chỗ để nhìn lại.
///
/// Đơn chỉ ra đời khi tiền về (webhook viết nó), nên một lượt đặt hàng bị bỏ
/// giữa chừng — đóng trang thanh toán rồi bấm "Hủy" ở khối CHỜ THANH TOÁN —
/// không bao giờ thành `Order`. Nó biến mất khỏi `/items?pending=true` ngay
/// lúc bị hủy (server lọc `cancelled_at IS NULL`), mà tab "Đã hủy" thì chỉ vẽ
/// `/orders`: người mua hủy xong thì không tìm lại được ở đâu cả.
void main() {
  final listingNoCover = {...listingJson, 'cover': null};

  /// Dòng còn sống: đã đặt, chưa trả tiền, chưa hủy.
  final liveLine = {
    ...orderItemJson,
    'id': 'itm_da_huy_khi_cho',
    'order_id': null,
  };

  /// Dòng người mua đã hủy khi chưa thanh toán: không đơn, có `cancelled_at`.
  final cancelledLine = {
    ...orderItemJson,
    'id': 'itm_da_huy_khi_cho',
    'order_id': null,
    'cancelled_at': '2026-08-05T03:00:00Z',
  };

  /// `/items` trả về theo đúng câu hỏi: `pending=true` là danh sách còn sống
  /// (server bỏ dòng đã hủy ra), còn lượt đọc không lọc thì có cả dòng đã hủy.
  RecordingBackend serving({List<Map<String, dynamic>> items = const []}) =>
      RecordingBackend(
        (request) => switch (request.path) {
          '/orders' => {
            'data': const [],
            'meta': const {'next_cursor': null},
          },
          '/items' => {
            'data': request.queryParameters['pending'] == true
                ? const []
                : items,
            'meta': const {'next_cursor': null},
          },
          '/refunds' => {
            'data': const [],
            'meta': const {'next_cursor': null},
          },
          _ => {
            'data': [listingNoCover],
            'meta': {'page': 1, 'limit': 20, 'total_count': 1},
          },
        },
      );

  Widget app(RecordingBackend backend) {
    final router = GoRouter(
      initialLocation: '/orders',
      routes: [GoRoute(path: '/orders', builder: (_, _) => const OrdersScreen())],
    );
    return ProviderScope(
      overrides: [
        accountRepositoryProvider.overrideWithValue(backend.repository),
        profileProvider.overrideWith((ref) => Me.fromJson(meJson)),
        refundListProvider.overrideWith((ref) => const <Refund>[]),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }

  Finder tab(String label) =>
      find.descendant(of: find.byType(TabBar), matching: find.text(label));

  Future<void> openTab(WidgetTester tester, String label) async {
    await tester.ensureVisible(tab(label));
    await tester.tap(tab(label));
    await tester.pumpAndSettle();
  }

  testWidgets('dòng hủy khi chưa thanh toán nằm ở tab "Đã hủy"', (
    tester,
  ) async {
    await tester.pumpWidget(app(serving(items: [cancelledLine])));
    await tester.pumpAndSettle();

    await openTab(tester, 'Đã hủy');
    expect(find.text(listingJson['name']! as String), findsOneWidget);
  });

  testWidgets('hủy xong là tìm lại được ngay, không cần kéo làm mới', (
    tester,
  ) async {
    // Đúng lượt người mua kể lại: đóng trang thanh toán, bấm "Hủy" ở khối chờ,
    // rồi mở "Đã hủy" để tìm cái vừa hủy.
    var cancelled = false;
    final backend = RecordingBackend((request) {
      if (request.path.endsWith('/cancellation')) {
        cancelled = true;
        return {
          'data': {...liveLine, 'cancelled_at': '2026-08-05T03:00:00Z'},
        };
      }
      return switch (request.path) {
        '/orders' => {
          'data': const [],
          'meta': const {'next_cursor': null},
        },
        '/items' => {
          'data': switch ((request.queryParameters['pending'] == true, cancelled)) {
            (true, true) => const <Map<String, dynamic>>[],
            (true, false) => [liveLine],
            (false, true) => [{...liveLine, 'cancelled_at': '2026-08-05T03:00:00Z'}],
            (false, false) => [liveLine],
          },
          'meta': const {'next_cursor': null},
        },
        '/refunds' => {
          'data': const [],
          'meta': const {'next_cursor': null},
        },
        _ => {
          'data': [listingNoCover],
          'meta': {'page': 1, 'limit': 20, 'total_count': 1},
        },
      };
    });

    await tester.pumpWidget(app(backend));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, 'Hủy'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Hủy sản phẩm'));
    await tester.pumpAndSettle();

    await openTab(tester, 'Đã hủy');
    expect(find.text(listingJson['name']! as String), findsOneWidget);
  });

  testWidgets('và không lẫn sang tab "Chờ xác nhận"', (tester) async {
    await tester.pumpWidget(app(serving(items: [cancelledLine])));
    await tester.pumpAndSettle();

    await openTab(tester, 'Chờ xác nhận');
    expect(find.text(listingJson['name']! as String), findsNothing);
  });
}
