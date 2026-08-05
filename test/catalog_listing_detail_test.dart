import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';

/// `specifications` and a variant's `attributes` are `type: object` in the
/// contract and both are required, so the wire value is at least `{}`. Reading
/// them as a list of `{name, value}` pairs made `GET /listings/{id}` throw inside
/// `fromJson` — every product page showed its error state, with no buy-now, no
/// variant picker and no reviews.
void main() {
  late Directory hiveDir;
  late HiveService hiveService;

  setUp(() async {
    hiveDir = await Directory.systemTemp.createTemp('catalog_detail_test');
    Hive.init(hiveDir.path);
    hiveService = HiveService();
    await hiveService.initBoxes();
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await Hive.close();
    await hiveDir.delete(recursive: true);
  });

  CatalogRepository repository() {
    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter(
        (options) async => _json(200, {'data': _listingDetailPayload}),
      );
    return CatalogRepository(CatalogApi(dio), TrustApi(dio), hiveService);
  }

  test('the real GET /listings/{id} payload deserialises', () async {
    final detail = await repository().listingDetail('lst_a60p5qh3t6ry4');

    expect(detail.id, 'lst_a60p5qh3t6ry4');
    expect(detail.specifications['Xuất xứ'], 'Trung Quốc');
    expect(detail.images, hasLength(2));
    expect(detail.variants, hasLength(2));
    expect(detail.variants.first.attributes['Màu sắc'], 'Màu Be');
    expect(detail.variants.first.stock.available, 62);
    expect(detail.seller.name, 'Bob Electronics');
  });

  test('an empty specifications object is not an error', () async {
    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter(
        (options) async => _json(200, {
          'data': {
            ..._listingDetailPayload,
            'specifications': <String, dynamic>{},
          },
        }),
      );
    final repository = CatalogRepository(
      CatalogApi(dio),
      TrustApi(dio),
      hiveService,
    );

    final detail = await repository.listingDetail('lst_a60p5qh3t6ry4');

    expect(detail.specifications, isEmpty);
  });
}

/// Verbatim from the dev backend, trimmed to two images and two variants.
const Map<String, dynamic> _listingDetailPayload = {
  'id': 'lst_a60p5qh3t6ry4',
  'slug':
      'ke-ong-dung-dua-muong-co-khay-thoat-nuoc-phong-cach-chau-au-tien-loi',
  'name':
      'Kệ ống đựng đũa muỗng có khay thoát nước phong cách châu Âu tiện lợi',
  'description':
      'Hộp đựng đũa muỗng phong cách Châu Âu siêu xinh, có khay hứng nước cực kì sạch sẽ và hợp vệ sinh.',
  'status': 'active',
  'condition': 'new',
  'price_mode': 'fixed',
  'currency': 'VND',
  'specifications': {'Hạn bảo hành': 'Không bảo hành', 'Xuất xứ': 'Trung Quốc'},
  'images': [
    {
      'id': 'res_cnzz61t6cr7pf',
      'provider': 'remote',
      'object_key':
          'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
      'mime': 'image/jpeg',
      'size': 0,
      'url':
          'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
    },
    {
      'id': 'res_dcqj7cpbeet18',
      'provider': 'remote',
      'object_key':
          'https://down-cl.img.susercontent.com/file/538fcf6b96fbbb3cc874405f5c19a562_tn',
      'mime': 'image/jpeg',
      'size': 0,
      'url':
          'https://down-cl.img.susercontent.com/file/538fcf6b96fbbb3cc874405f5c19a562_tn',
    },
  ],
  'category': {
    'id': 'cat_b68877mkawpab',
    'parent_id': null,
    'name': 'Trang trí nhà cửa & Đèn chiếu sáng',
    'description': 'Tranh treo tường, khung ảnh, bình hoa, nến, gương, thảm',
  },
  'tags': ['bo-do-an', 'dung-cu-an-uong', 'nha-cua-va-doi-song'],
  'variants': [
    {
      'id': 'vrn_0ev7apet9dsq8',
      'price': 49000,
      'attributes': {'Màu sắc': 'Màu Be'},
      'package_details': {
        'chiều cao (cm)': 28,
        'chiều dài (cm)': 36,
        'chiều rộng (cm)': 15,
        'cân nặng (g)': 420,
      },
      'images': <Map<String, dynamic>>[],
      'is_featured': true,
      'stock': {'quantity': 62, 'reserved': 0, 'sold': 0, 'available': 62},
      'created_at': '2026-08-02T04:55:15.318908Z',
    },
    {
      'id': 'vrn_8vw1sy73ddpkc',
      'price': 49000,
      'attributes': {'Màu sắc': 'Xanh dương'},
      'package_details': {
        'chiều cao (cm)': 42,
        'chiều dài (cm)': 12,
        'chiều rộng (cm)': 17,
        'cân nặng (g)': 520,
      },
      'images': <Map<String, dynamic>>[],
      'is_featured': false,
      'stock': {'quantity': 62, 'reserved': 0, 'sold': 2, 'available': 60},
      'created_at': '2026-08-02T04:55:15.318908Z',
    },
  ],
  'featured_variant_id': 'vrn_0ev7apet9dsq8',
  'sold': 2,
  'rating': 0,
  'review_count': 0,
  'seller': {'id': 'acc_48gmxxfhd8ta3', 'name': 'Bob Electronics'},
  'favorited': false,
  'favorite_count': 0,
  'pending_edit': null,
  'location': {
    'province_code': '01',
    'province_name': 'Ha Noi',
    'district_code': '007',
    'district_name': 'Hai Ba Trung',
    'ward_code': '00091',
    'ward_name': 'Bach Khoa',
  },
  'created_at': '2026-08-02T04:55:15.318908Z',
  'deleted_at': null,
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
