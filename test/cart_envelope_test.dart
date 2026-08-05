import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/add_cart_item_request.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/cart/data/repositories/cart_repository.dart';

/// Every cart route answers `{"data": …}`. The hand-written retrofit service
/// declared the bare model as its return type, so `fromJson` was handed the
/// envelope, found none of its required keys and threw — the cart never loaded.
void main() {
  // Captured from GET /cart-items on the dev backend.
  const cartList = {
    'data': [
      {
        'id': 'crt_43wwzanmczq7y',
        'listing_id': 'lst_a60p5qh3t6ry4',
        'variant_id': 'vrn_8vw1sy73ddpkc',
        'quantity': 2,
        'created_at': '2026-08-05T02:46:58.461696Z',
      },
    ],
  };

  const cartRow = {
    'data': {
      'id': 'crt_43wwzanmczq7y',
      'listing_id': 'lst_a60p5qh3t6ry4',
      'variant_id': 'vrn_8vw1sy73ddpkc',
      'quantity': 3,
      'created_at': '2026-08-05T02:46:58.461696Z',
    },
  };

  CartRepository repository(Map<String, Object?> body) {
    final dio = Dio(BaseOptions(baseUrl: 'http://localhost/api/v1'))
      ..httpClientAdapter = _CannedAdapter(body);
    return CartRepository(OrderApi(dio), HiveService());
  }

  group('the cart routes are read through their envelope', () {
    test('listing the cart yields the rows inside data', () async {
      final items = await repository(cartList).getCart();

      expect(items, hasLength(1));
      expect(items.single.id, 'crt_43wwzanmczq7y');
      expect(items.single.listingId, 'lst_a60p5qh3t6ry4');
      expect(items.single.variantId, 'vrn_8vw1sy73ddpkc');
      expect(items.single.quantity, 2);
    });

    test('adding a row yields the row inside data', () async {
      final item = await repository(cartRow).addCartItem(
        AddCartItemRequest(variantId: 'vrn_8vw1sy73ddpkc', quantity: 3),
      );

      expect(item.id, 'crt_43wwzanmczq7y');
      expect(item.quantity, 3);
    });
  });
}

/// Answers every request with one canned body, so a repository can be driven
/// without a server. Dio's own seam — no mocking package involved.
class _CannedAdapter implements HttpClientAdapter {
  _CannedAdapter(this.body);

  final Map<String, Object?> body;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode(body),
    200,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}
