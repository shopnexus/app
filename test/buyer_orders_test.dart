import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// A buyer could see none of their own orders: the hand-written model described
/// `buyer_id`, `date_created`, `total_amount` and an `address` string, none of
/// which the contract sends — so every tab rendered its error state. And all
/// three order tabs asked `GET /orders` with no `role` (400) and no `state`, so
/// even answered they would have been the same list three times.
void main() {
  Map<String, dynamic> Function(RequestOptions) pages({
    List<Map<String, dynamic>> orders = const [],
    List<Map<String, dynamic>> items = const [],
    List<Map<String, dynamic>> listings = const [],
  }) =>
      (request) => switch (request.path) {
        '/orders' => {
          'data': orders,
          'meta': const {'next_cursor': null},
        },
        '/items' => {
          'data': items,
          'meta': const {'next_cursor': null},
        },
        '/listings' => {
          'data': listings,
          'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
        },
        _ => {'data': orders.isEmpty ? null : orders.first},
      };

  group('an order parses as the contract sends it', () {
    test('the whole payload round-trips', () {
      final order = Order.fromJson(orderJson);

      expect(order.id, 'ord_2ybcv39246zn7');
      // Objects, not ids: the tab draws the shop's name without a second read.
      expect(order.buyer.name, "Alice's Corner");
      expect(order.seller.id, 'acc_48gmxxfhd8ta3');
      expect(order.address.fullName, "Alice's Corner");
      expect(order.address.phone, '+84900000001');
      expect(order.total, 98000);
      expect(order.currency, 'VND');
      expect(order.state, OrderState.open);
      expect(order.createdAt, DateTime.parse('2026-08-05T02:47:38.20111Z'));
      expect(order.transport?.status, TransportStatus.pending);
      expect(order.transport?.fee, 15000);

      final item = order.items.single;
      // Opaque ids, not ints, and a variant rather than a sku.
      expect(item.id, 'itm_fa1kdfqze7egn');
      expect(item.variantId, 'vrn_8vw1sy73ddpkc');
      expect(item.listingId, 'lst_a60p5qh3t6ry4');
      expect(item.paymentSessionId, 'pay_01bp1w1e0bg97');
      expect(item.totalAmount, 98000);
    });
  });

  group('GET /orders', () {
    test('every tab sends its own state, and always a role', () async {
      final backend = RecordingBackend(pages());

      await backend.repository.buyerOrders(state: OrderState.open);
      await backend.repository.buyerOrders(state: OrderState.completed);
      await backend.repository.buyerOrders(state: OrderState.cancelled);

      expect(backend.paths, everyElement('orders'));
      expect(
        backend.calls.map((c) => c.queryParameters['role']),
        everyElement('buyer'),
      );
      expect(backend.calls.map((c) => c.queryParameters['state']), [
        OrderState.open,
        OrderState.completed,
        OrderState.cancelled,
      ]);
      // A cursor route ignores `page`, so asking for one is a list capped at the
      // first page while pretending otherwise.
      expect(
        backend.calls.map((c) => c.queryParameters.containsKey('page')),
        everyElement(isFalse),
      );
    });

    test('a line resolves its name and cover in one listings lookup', () async {
      final backend = RecordingBackend(
        pages(orders: [orderJson], listings: [listingJson]),
      );

      final views = await backend.repository.buyerOrders(
        state: OrderState.open,
      );

      final listingCall = backend.calls.firstWhere(
        (c) => c.path == '/listings',
      );
      expect(listingCall.queryParameters['ids'], ['lst_a60p5qh3t6ry4']);
      expect(views.single.lines.single.name, 'Kệ ống đựng đũa muỗng');
      expect(
        views.single.lines.single.imageUrl,
        'https://cdn.example/cover.jpg',
      );
      expect(views.single.quantity, 2);
    });

    test('a deleted listing leaves the line readable', () async {
      final backend = RecordingBackend(pages(orders: [orderJson]));

      final views = await backend.repository.buyerOrders(
        state: OrderState.open,
      );

      expect(views.single.lines.single.name, isNull);
      expect(views.single.goodsTotal, 98000);
    });
  });

  /// The worst thing an escrow marketplace can do: a buyer who has just paid
  /// found 'Đang xử lý' empty, because `open` means *the seller has confirmed*.
  /// Cả hai trạng thái đang bay giờ về trong một lượt đọc và nằm cùng một nhóm,
  /// nên không còn một cái tab nào có thể bỏ sót một trong hai.
  group('the buyer sees an order they just paid for', () {
    test('một lượt đọc, không lọc trạng thái nào cả', () async {
      final backend = RecordingBackend(pages());
      final container = ProviderContainer(
        overrides: [
          accountRepositoryProvider.overrideWithValue(backend.repository),
        ],
      );
      addTearDown(container.dispose);

      await container.read(ordersProvider(OrderRole.buyer).future);

      final orderCalls = backend.calls.where((c) => c.path == '/orders');
      expect(orderCalls.length, 1);
      expect(orderCalls.single.queryParameters.containsKey('state'), isFalse);
    });

    test('đơn chờ xác nhận mang theo cái đồng hồ của nó', () async {
      final awaiting = {
        ...orderJson,
        'id': 'ord_awaiting',
        'state': 'awaiting-confirmation',
        'confirmed_at': null,
        'confirmation_deadline_at': '2026-08-07T02:47:38Z',
      };
      final backend = RecordingBackend(pages(orders: [awaiting]));
      final container = ProviderContainer(
        overrides: [
          accountRepositoryProvider.overrideWithValue(backend.repository),
        ],
      );
      addTearDown(container.dispose);

      final feed = await container.read(ordersProvider(OrderRole.buyer).future);

      final view = feed.ongoing.single;
      expect(view.isAwaitingConfirmation, isTrue);
      // Neither side's badge says who is waiting; the row around it does.
      expect(view.statusLabel, 'Chờ xác nhận');
      expect(view.confirmationRemaining, isNotNull);
    });
  });

  group('counting the seller work that has a deadline on it', () {
    test('asks for awaiting-confirmation and walks every page', () async {
      var served = 0;
      final backend = RecordingBackend((request) {
        served++;
        return {
          'data': List.filled(served == 1 ? 2 : 1, orderJson),
          'meta': {'next_cursor': served == 1 ? 'p2' : null},
        };
      });

      final result = await backend.seller.countOrders(
        state: OrderState.awaitingConfirmation,
      );

      // A page count would have said 2 and stopped — `/orders` sends no total,
      // so the only right answer is to walk to the last page.
      expect(result.count, 3);
      final orderCalls = backend.calls.where((c) => c.path == '/orders');
      expect(
        orderCalls.map((c) => c.queryParameters['state']),
        everyElement(OrderState.awaitingConfirmation),
      );
      expect(
        orderCalls.map((c) => c.queryParameters['role']),
        everyElement('seller'),
      );
      expect(orderCalls.last.queryParameters['cursor'], 'p2');
    });
  });

  group('GET /items', () {
    test(
      'the two item reads differ by pending, and page is not a param',
      () async {
        final backend = RecordingBackend(pages(items: [orderItemJson]));

        await backend.repository.items(role: OrderRole.buyer, pending: true);
        await backend.repository.items(role: OrderRole.buyer, pending: false);

        final itemCalls = backend.calls.where((c) => c.path == '/items');
        expect(itemCalls.map((c) => c.queryParameters['role']), [
          'buyer',
          'buyer',
        ]);
        expect(itemCalls.map((c) => c.queryParameters['pending']), [
          true,
          false,
        ]);
        expect(
          itemCalls.map((c) => c.queryParameters.containsKey('page')),
          everyElement(isFalse),
        );
      },
    );
  });

  group('cancelling a line', () {
    test('is a POST to the cancellation sub-resource', () async {
      final backend = RecordingBackend((_) => {'data': orderItemJson});

      await backend.repository.cancelItem('itm_fa1kdfqze7egn');

      // DELETE was not a route at all — 405, so the button never cancelled.
      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'items/itm_fa1kdfqze7egn/cancellation');
    });
  });
}
