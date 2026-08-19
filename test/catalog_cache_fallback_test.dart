import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:shopnexus_flutter_app/core/network/dio_client.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';

/// The offline fallback used to read one global `cached_listings` key, written by
/// whichever browse succeeded last and replayed for whichever browse failed next.
/// A category page that got a 500 therefore rendered another category's products
/// — and rendered them stripped, because a cached card is rebuilt from
/// `RecentListing`, which carries no `category_id` at all.
///
/// A cache that answers a different question than the one asked is worse than no
/// cache: the fallback must match the filters it is standing in for, and must
/// only stand in when the network is the thing that failed.
void main() {
  late Directory hiveDir;
  late HiveService hiveService;
  late ProviderContainer container;
  late Future<ResponseBody> Function(RequestOptions) responder;

  setUp(() async {
    hiveDir = await Directory.systemTemp.createTemp('catalog_cache_test');
    Hive.init(hiveDir.path);
    hiveService = HiveService();
    await hiveService.initBoxes();

    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter((options) => responder(options));

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

  test('a failed category browse does not replay another browse', () async {
    final repo = container.read(catalogRepositoryProvider);

    responder = (_) async => _page([_card('lst_home', 'cat_home')]);
    final home = await repo.listings();
    expect(home.single.id, 'lst_home');

    responder = (_) async => _json(500, {
      'error': {'code': 'internal', 'message': 'boom'},
    });

    await expectLater(
      repo.listings(categoryId: 'cat_shoes'),
      throwsA(isA<DioException>()),
    );
  });

  test('an offline category browse replays only that category', () async {
    final repo = container.read(catalogRepositoryProvider);

    responder = (_) async => _page([_card('lst_shoe', 'cat_shoes')]);
    await repo.listings(categoryId: 'cat_shoes');

    responder = (_) async => _page([_card('lst_home', 'cat_home')]);
    await repo.listings();

    responder = (options) async =>
        throw DioException.connectionError(
          requestOptions: options,
          reason: 'no route to host',
        );

    // The shoes browse is answerable from its own cache.
    final shoes = await repo.listings(categoryId: 'cat_shoes');
    expect(shoes.single.id, 'lst_shoe');
    expect(shoes.single.categoryId, 'cat_shoes');

    // A category never cached has no honest answer, so it fails rather than
    // borrowing one.
    await expectLater(
      repo.listings(categoryId: 'cat_books'),
      throwsA(isA<DioException>()),
    );
  });

  test('the unfiltered feed still falls back when offline', () async {
    final repo = container.read(catalogRepositoryProvider);

    responder = (_) async => _page([_card('lst_home', 'cat_home')]);
    await repo.listings();

    responder = (options) async =>
        throw DioException.connectionError(
          requestOptions: options,
          reason: 'airplane mode',
        );

    final cached = await repo.listings();
    expect(cached.single.id, 'lst_home');
    expect(cached.single.categoryId, 'cat_home');
  });
}

Map<String, dynamic> _card(String id, String categoryId) => {
  'id': id,
  'slug': id,
  'name': 'Card $id',
  'status': 'active',
  'condition': 'new',
  'price_mode': 'fixed',
  'currency': 'VND',
  'price': 49000,
  'sold': 0,
  'cover': null,
  'rating': 0,
  'review_count': 0,
  'category_id': categoryId,
  'seller': {'id': 'acc_1', 'name': 'Bob', 'avatar': null},
  'favorited': false,
  'score': null,
  'tags': <String>[],
  'taken_down_at': null,
  'location': null,
  'deleted_at': null,
  'created_at': '2026-08-02T04:55:15.318908Z',
};

ResponseBody _page(List<Map<String, dynamic>> cards) => _json(200, {
  'data': cards,
  'meta': {'page': 1, 'limit': 20, 'total_count': cards.length},
  'understood': '',
  'probes': <String>[],
});

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
