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

import 'support/fixtures.dart';

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
        (options) async => _json(200, {'data': listingDetailJson}),
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
          'data': {...listingDetailJson, 'specifications': <String, dynamic>{}},
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
