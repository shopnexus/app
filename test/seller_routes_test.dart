import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// The seller feature called four routes this backend does not serve, and every
/// screen behind them was permanently empty or permanently in its error state:
///
///  * `GET analytic/seller-dashboard` — never existed; product analytics is not
///    in this backend at all. `GET /orders/summary` is what replaced it.
///  * `GET order/seller/pending` and `GET order/seller/confirmed` — deleted with
///    the seller-approval flow, because the money creates the order. A 404 was
///    swallowed by `catch (_)`, so every tab was silently empty.
///  * `catalog/product-spu` / `catalog/product-sku` — SPU/SKU is gone; a listing
///    has variants.
void main() {
  Map<String, dynamic> Function(RequestOptions) pages({
    List<Map<String, dynamic>> orders = const [],
    List<Map<String, dynamic>> items = const [],
    List<Map<String, dynamic>> listings = const [],
    int listingTotal = 0,
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
          'meta': {'page': 1, 'limit': 20, 'total_count': listingTotal},
        },
        _ => const {'data': <String, dynamic>{}},
      };

  /// `GET /orders/summary` không còn ai đọc: bảng số liệu người bán đã bị xoá,
  /// vì nó cần sáu request thành công mới vẽ nổi tám con số và một biểu đồ doanh
  /// thu 90 ngày không phải câu hỏi của ai ở C2C. Còn lại đúng con số vẫn có
  /// người hỏi: có bao nhiêu tin ở mỗi trạng thái, dùng cho màn "Tin của tôi".
  group('đếm tin đăng theo trạng thái', () {
    test('the listing counts are one total_count read per status', () async {
      final backend = RecordingBackend(pages(listingTotal: 200));

      final counts = await backend.seller.listingCounts();

      expect(backend.paths, everyElement('listings'));
      expect(backend.calls.map((c) => c.queryParameters['status']), [
        ListingStatus.draft,
        ListingStatus.pending,
        ListingStatus.active,
        ListingStatus.hidden,
      ]);
      // Only with mine=true is a status filter honoured at all.
      expect(
        backend.calls.map((c) => c.queryParameters['mine']),
        everyElement(true),
      );
      // The count comes off meta, not off the page: a page would cap it at limit.
      expect(
        backend.calls.map((c) => c.queryParameters['limit']),
        everyElement(1),
      );
      expect(counts[ListingStatus.active], 200);
    });
  });

  group('the sales tabs read GET /orders?role=seller', () {
    test('every tab sends its own state, and always role=seller', () async {
      final backend = RecordingBackend(pages());

      await backend.seller.orders(state: OrderState.open);
      await backend.seller.orders(state: OrderState.completed);
      await backend.seller.orders(state: OrderState.cancelled);

      // Not `order/seller/pending`/`order/seller/confirmed`, which are 404.
      expect(backend.paths, everyElement('orders'));
      expect(
        backend.calls.map((c) => c.queryParameters['role']),
        everyElement('seller'),
      );
      expect(backend.calls.map((c) => c.queryParameters['state']), [
        OrderState.open,
        OrderState.completed,
        OrderState.cancelled,
      ]);
    });

    test('a sale resolves its lines in one listings lookup', () async {
      final backend = RecordingBackend(
        pages(orders: [orderJson], listings: [listingJson]),
      );

      final views = await backend.seller.orders(state: OrderState.open);

      final listingCall = backend.calls.firstWhere(
        (c) => c.path == '/listings',
      );
      expect(listingCall.queryParameters['ids'], ['lst_a60p5qh3t6ry4']);
      expect(views.single.lines.single.name, 'Kệ ống đựng đũa muỗng');
      // The buyer is an object on the wire, so the card needs no second read.
      expect(views.single.order.buyer.name, "Alice's Corner");
      expect(views.single.goodsTotal, 98000);
    });

    test('the retry list is GET /items?role=seller&pending=true', () async {
      final backend = RecordingBackend(pages(items: [orderItemJson]));

      await backend.seller.unsettledItems();

      final itemCall = backend.calls.firstWhere((c) => c.path == '/items');
      expect(itemCall.queryParameters['role'], 'seller');
      expect(itemCall.queryParameters['pending'], true);
    });

    // A seller reporting `picked-up` used to be enough to end the buyer's right to
    // cancel — one request against days of theirs, with nobody checking a parcel
    // was behind it. The carrier reports that leg now, so what a seller can do
    // about a wrong status is ask for it to be looked at.
    test('a wrong shipment status is raised, not written', () async {
      final backend = RecordingBackend((_) => {'data': ticketJson});

      await backend.tickets.open(
        kind: TicketKind.orderIssue,
        subject: 'Sự cố vận chuyển đơn ord_2ybcv39246zn7',
        refId: 'ord_2ybcv39246zn7',
      );

      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'tickets');
      final body = backend.bodyOf(0);
      expect(body['kind'], 'order-issue');
      // `ref_type` follows from the kind, so the order's id is all that is sent.
      expect(body['ref_id'], 'ord_2ybcv39246zn7');
      expect(body.containsKey('ref_type'), isFalse);
    });

    test('cancelling is a POST, and there is nothing to confirm', () async {
      final backend = RecordingBackend((_) => {'data': orderJson});

      await backend.seller.cancelOrder('ord_2ybcv39246zn7');

      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'orders/ord_2ybcv39246zn7/cancellation');
      // No body: there is nowhere to record a reason.
      expect(backend.only.data, isNull);
    });
  });

  group('the product list reads GET /listings?mine=true', () {
    test('a status filter rides with mine=true', () async {
      final backend = RecordingBackend(pages(listings: [listingJson]));

      final listings = await backend.seller.listings(
        status: ListingStatus.hidden,
      );

      // Not `catalog/product-spu`, which is 404 — and no `vendor_id` either.
      expect(backend.paths.single, 'listings');
      expect(backend.only.queryParameters['mine'], true);
      expect(backend.only.queryParameters['status'], ListingStatus.hidden);
      expect(listings.single.id, 'lst_a60p5qh3t6ry4');
      expect(listings.single.status, ListingStatus.active);
    });

    test('hiding a listing deletes its publication, not the row', () async {
      final backend = RecordingBackend((_) => {'data': listingDetailJson});

      await backend.seller.hideListing('lst_a60p5qh3t6ry4');

      expect(backend.only.method, 'DELETE');
      expect(backend.paths.single, 'listings/lst_a60p5qh3t6ry4/publication');
    });

    test('a card carries its own tags, so chips cost no request', () async {
      final backend = RecordingBackend(pages(listings: [listingJson]));

      final listings = await backend.seller.listings();

      expect(backend.paths.single, 'listings');
      expect(listings.single.tags, [
        'bo-do-an',
        'dung-cu-an-uong',
        'nha-cua-va-doi-song',
      ]);
    });

    test('a takedown is told apart from the seller hiding their own', () async {
      final backend = RecordingBackend(
        pages(listings: [takenDownListingJson, listingJson]),
      );

      final listings = await backend.seller.listings();

      // Both read `hidden` in the status alone, which is why the badge reads the marker.
      expect(listings.first.status, ListingStatus.hidden);
      expect(listings.first.takenDownAt, isNotNull);
      expect(listings.last.takenDownAt, isNull);
    });

    test(
      'the reason is read from the detail, and only for a row that is down',
      () async {
        final backend = RecordingBackend((_) => {'data': listingDetailJson});

        final reason = await backend.seller.takedownReason('lst_a60p5qh3t6ry4');

        expect(backend.paths.single, 'listings/lst_a60p5qh3t6ry4');
        // The fixture is a live listing, so there is no reason to read — which is the same
        // answer as a moderator who chose not to give one, and the screen says so.
        expect(reason, isNull);
      },
    );

    test('deleting a variant is DELETE /variants/{id}', () async {
      final backend = RecordingBackend((_) => {'data': listingDetailJson});

      // The old button posted to `catalog/product-sku/{id}` and silently no-oped.
      await backend.seller.deleteVariant('vrn_8vw1sy73ddpkc');

      expect(backend.only.method, 'DELETE');
      expect(backend.paths.single, 'variants/vrn_8vw1sy73ddpkc');
    });
  });
}
