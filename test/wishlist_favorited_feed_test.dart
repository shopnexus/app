import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:shopnexus_flutter_app/core/network/dio_client.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/wishlist_provider.dart';

/// The backend removed `GET /favorites`. The wishlist is `GET /listings` with
/// `favorited=true`, which also fixes the price: resolving each saved id through
/// `GET /listings/{id}` gave a `ListingDetail`, and a detail carries no card
/// price, so every row rendered 0 ₫.
void main() {
  late Directory hiveDir;
  late HiveService hiveService;
  late List<RequestOptions> requests;
  late ProviderContainer container;

  setUp(() async {
    hiveDir = await Directory.systemTemp.createTemp('wishlist_feed_test');
    Hive.init(hiveDir.path);
    hiveService = HiveService();
    await hiveService.initBoxes();
    requests = [];

    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter((options) async {
        requests.add(options);
        // Anything that is not the feed answers as the real backend does now.
        if (!options.path.endsWith('listings')) {
          return _json(404, {
            'error': {'code': 'not_found', 'message': 'no such route'},
          });
        }
        return _json(200, {
          'data': [_favoritedCard],
          'meta': {'page': 1, 'limit': 100, 'total_count': 1},
        });
      });

    container = ProviderContainer.test(
      overrides: [
        dioProvider.overrideWithValue(dio),
        hiveServiceProvider.overrideWithValue(hiveService),
      ],
    );
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await Hive.close();
    await hiveDir.delete(recursive: true);
  });

  test('the wishlist reads the favorited listing feed', () async {
    final products = await container.read(wishlistProductsProvider.future);

    expect(requests.map((r) => r.path), ['/listings']);
    expect(requests.single.queryParameters['favorited'], true);

    expect(products, hasLength(1));
    // The card price, not the 0 a detail response has no field for.
    expect(products.single.price, 49000);
    expect(products.single.favorited, isTrue);
    expect(products.single.seller.name, 'Bob Electronics');
    expect(products.single.cover?.url, isNotNull);
  });
}

/// Verbatim from `GET /listings?favorited=true` on the dev backend.
const Map<String, dynamic> _favoritedCard = {
  'id': 'lst_a60p5qh3t6ry4',
  'slug':
      'ke-ong-dung-dua-muong-co-khay-thoat-nuoc-phong-cach-chau-au-tien-loi',
  'name':
      'Kệ ống đựng đũa muỗng có khay thoát nước phong cách châu Âu tiện lợi',
  'status': 'active',
  'condition': 'new',
  'price_mode': 'fixed',
  'currency': 'VND',
  'price': 49000,
  'sold': 0,
  'cover': {
    'id': 'res_cnzz61t6cr7pf',
    'provider': 'remote',
    'object_key':
        'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
    'mime': 'image/jpeg',
    'size': 0,
    'checksum': '',
    'url_expires_at': null,
    'url':
        'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
  },
  'rating': 0,
  'review_count': 0,
  'category_id': 'cat_b68877mkawpab',
  'seller': {
    'id': 'acc_48gmxxfhd8ta3',
    'name': 'Bob Electronics',
    'avatar': null,
  },
  'favorited': true,
  'score': null,
  'tags': <String>[],
  'taken_down_at': null,
  'location': {
    'province_code': '01',
    'province_name': 'Ha Noi',
    'district_code': '007',
    'district_name': 'Hai Ba Trung',
    'ward_code': '00091',
    'ward_name': 'Bach Khoa',
    'distance_km': null,
  },
  'deleted_at': null,
  'created_at': '2026-08-02T04:55:15.318908Z',
};

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this._responder);

  final Future<ResponseBody> Function(RequestOptions) _responder;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) => _responder(options);

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(int status, Map<String, dynamic> body) =>
    ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
