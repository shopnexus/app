import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Màn Đơn hàng gộp: một segment cho vai, hai nhóm cho trạng thái.
///
/// Chín vị trí tab trước đây gọi năm provider để lọc trung bình năm dòng dữ
/// liệu — và tab "Tất cả" gọi bốn provider cùng lúc để ghép một danh sách trộn,
/// rồi bốn tab bên cạnh tách lại đúng thứ vừa ghép.
void main() {
  Map<String, dynamic> Function(RequestOptions) serves(
    List<Map<String, dynamic>> orders, {
    String? nextCursor,
    List<Map<String, dynamic>> listings = const [],
  }) =>
      (request) => switch (request.path) {
        '/orders' => {
          'data': orders,
          'meta': {'next_cursor': nextCursor},
        },
        '/items' => {
          'data': const [],
          'meta': const {'next_cursor': null},
        },
        '/listings' => {
          'data': listings,
          'meta': {'page': 1, 'limit': 20, 'total_count': listings.length},
        },
        _ => const {'data': <String, dynamic>{}},
      };

  Map<String, dynamic> orderIn(String state, {String id = 'ord_1'}) => {
    ...orderJson,
    'id': id,
    'state': state,
  };

  ProviderContainer containerOn(RecordingBackend backend) {
    final container = ProviderContainer(
      overrides: [
        accountRepositoryProvider.overrideWithValue(backend.repository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  /// Giữ provider sống qua nhiều lần đọc. Không có ai lắng nghe thì một provider
  /// autoDispose bị bỏ đi ngay sau mỗi `read`, nên trang đã nạp biến mất trước
  /// khi câu hỏi tiếp theo kịp hỏi — đúng thứ mà `loadMore` phải nối vào.
  void keepAlive(ProviderContainer container, OrderRole role) {
    final subscription = container.listen(
      ordersProvider(role),
      (_, _) {},
      fireImmediately: true,
    );
    addTearDown(subscription.close);
  }

  group('GET /orders cho một vai', () {
    test('gửi role và không gửi state — chia nhóm là việc của client', () async {
      final backend = RecordingBackend(serves([]));
      final container = containerOn(backend);

      await container.read(ordersProvider(OrderRole.seller).future);

      final call = backend.calls.firstWhere((c) => c.path == '/orders');
      expect(call.queryParameters['role'], 'seller');
      // `state` là optional của route. Năm provider lọc theo tab là năm lượt gọi
      // cho cùng một danh sách.
      expect(call.queryParameters.containsKey('state'), isFalse);
      // Cursor route: `page` bị bỏ qua, nên xin nó là tự giới hạn ở trang đầu.
      expect(call.queryParameters.containsKey('page'), isFalse);
    });

    test('mỗi vai đi vòng qua query và về nguyên vẹn', () {
      for (final role in OrderRole.values) {
        expect(orderRoleFromQuery(role.value), role);
      }
    });

    test('?tab=2 cũ và giá trị lạ rơi về buyer, không ném', () {
      expect(orderRoleFromQuery(null), OrderRole.buyer);
      expect(orderRoleFromQuery(''), OrderRole.buyer);
      expect(orderRoleFromQuery('2'), OrderRole.buyer);
      expect(orderRoleFromQuery('người-bán'), OrderRole.buyer);
    });
  });

  group('hai nhóm', () {
    test('đường chia là kết quả, không phải kiện hàng', () async {
      final backend = RecordingBackend(
        serves([
          orderIn('awaiting-confirmation', id: 'ord_cho_xac_nhan'),
          orderIn('open', id: 'ord_dang_giao'),
          orderIn('completed', id: 'ord_hoan_thanh'),
          orderIn('cancelled', id: 'ord_da_huy'),
        ]),
      );
      final container = containerOn(backend);

      final feed = await container.read(ordersProvider(OrderRole.buyer).future);

      expect(feed.ongoing.map((v) => v.order.id), [
        'ord_cho_xac_nhan',
        'ord_dang_giao',
      ]);
      expect(feed.finished.map((v) => v.order.id), [
        'ord_hoan_thanh',
        'ord_da_huy',
      ]);
      // Bốn trạng thái, không dòng nào rơi ra ngoài hai nhóm.
      expect(feed.ongoing.length + feed.finished.length, feed.orders.length);
    });

    test('một đơn vừa trả tiền nằm ở nhóm đang diễn ra', () async {
      // Lỗi tệ nhất của bản cũ: `open` nghĩa là *người bán đã xác nhận*, nên
      // người mua vừa trả tiền mở tab "Đang xử lý" ra thấy trống.
      final backend = RecordingBackend(
        serves([orderIn('awaiting-confirmation')]),
      );
      final container = containerOn(backend);

      final feed = await container.read(ordersProvider(OrderRole.buyer).future);

      expect(feed.ongoing.single.isAwaitingConfirmation, isTrue);
      expect(feed.finished, isEmpty);
    });
  });

  group('phân trang', () {
    test('nextCursor mở nút "Xem thêm"', () async {
      final backend = RecordingBackend(
        serves([orderIn('completed')], nextCursor: 'p2'),
      );
      final container = containerOn(backend);

      final feed = await container.read(ordersProvider(OrderRole.buyer).future);

      expect(feed.hasMore, isTrue);
    });

    test('hết trang thì không còn gì để xin', () async {
      final backend = RecordingBackend(serves([orderIn('completed')]));
      final container = containerOn(backend);

      final feed = await container.read(ordersProvider(OrderRole.buyer).future);

      expect(feed.hasMore, isFalse);
    });

    test('trang sau nối vào trang trước, không thay nó', () async {
      var served = 0;
      final backend = RecordingBackend((request) {
        if (request.path != '/orders') {
          return switch (request.path) {
            '/items' => {
              'data': const [],
              'meta': const {'next_cursor': null},
            },
            _ => {
              'data': const [],
              'meta': const {'page': 1, 'limit': 20, 'total_count': 0},
            },
          };
        }
        served++;
        return {
          'data': [orderIn('completed', id: 'ord_trang$served')],
          'meta': {'next_cursor': served == 1 ? 'p2' : null},
        };
      });
      final container = containerOn(backend);
      keepAlive(container, OrderRole.buyer);

      await container.read(ordersProvider(OrderRole.buyer).future);
      await container.read(ordersProvider(OrderRole.buyer).notifier).loadMore();

      final feed = container.read(ordersProvider(OrderRole.buyer)).value!;
      // Đơn thứ 21 vô hình là lỗi của một `limit: 20` gọi một lần.
      expect(feed.orders.map((v) => v.order.id), ['ord_trang1', 'ord_trang2']);
      expect(feed.hasMore, isFalse);
      expect(
        backend.calls
            .where((c) => c.path == '/orders')
            .map((c) => c.queryParameters['cursor']),
        [null, 'p2'],
      );
    });

    test('trang sau hỏng thì giữ lại những gì đã nạp', () async {
      var served = 0;
      final backend = RecordingBackend((request) {
        if (request.path == '/listings') {
          return {
            'data': const [],
            'meta': const {'page': 1, 'limit': 20, 'total_count': 0},
          };
        }
        if (request.path == '/orders') {
          served++;
          if (served > 1) throw DioException(requestOptions: request);
          return {
            'data': [orderIn('completed', id: 'ord_trang1')],
            'meta': const {'next_cursor': 'p2'},
          };
        }
        return {
          'data': const [],
          'meta': const {'next_cursor': null},
        };
      });
      final container = containerOn(backend);
      keepAlive(container, OrderRole.buyer);

      await container.read(ordersProvider(OrderRole.buyer).future);
      await container.read(ordersProvider(OrderRole.buyer).notifier).loadMore();

      final feed = container.read(ordersProvider(OrderRole.buyer)).value!;
      expect(feed.orders.map((v) => v.order.id), ['ord_trang1']);
      expect(feed.loadMoreError, isNotNull);
      expect(feed.isLoadingMore, isFalse);
    });
  });

  group('dòng chờ gom tiền', () {
    test('là một endpoint khác, hỏi theo vai đang xem', () async {
      final backend = RecordingBackend(serves([]));
      final container = containerOn(backend);

      await container.read(unsettledItemsProvider(OrderRole.seller).future);

      final call = backend.calls.firstWhere((c) => c.path == '/items');
      expect(call.queryParameters['role'], 'seller');
      expect(call.queryParameters['pending'], true);
    });
  });
}
