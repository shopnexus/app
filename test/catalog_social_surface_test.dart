import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_vote_tally.dart';
import 'package:shopnexus_flutter_app/core/network/dio_client.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/rating_repository.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';

/// Everything the app had a client for and never called: tags, the review
/// filters, the helpful vote, and the search mode. A wrong *request* is the
/// drift that matters here — the parameters are all optional, so a dropped one
/// fails silently as "the server just answered that".
void main() {
  late Directory hiveDir;
  late HiveService hiveService;
  late List<RequestOptions> requests;
  late ProviderContainer container;

  setUp(() async {
    hiveDir = await Directory.systemTemp.createTemp('catalog_social_test');
    Hive.init(hiveDir.path);
    hiveService = HiveService();
    await hiveService.initBoxes();
    requests = [];

    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter((options) async {
        requests.add(options);
        if (options.path.endsWith('/vote')) {
          return _json(200, {
            'data': {'helpful': 4, 'not_helpful': 1, 'my_vote': 1},
          });
        }
        if (options.path.endsWith('tags')) {
          return _json(200, {
            'data': [
              {
                'slug': 'do-cu',
                'description': 'Hàng đã qua sử dụng',
                'score': null,
              },
            ],
            'meta': {'page': 1, 'limit': 20, 'total_count': 1},
          });
        }
        return _json(200, {
          'data': <dynamic>[],
          'meta': {
            'next_cursor': null,
            'page': 1,
            'limit': 20,
            'total_count': 0,
          },
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

  CatalogRepository catalog() => container.read(catalogRepositoryProvider);

  test('a tag browse sends the slug, not a keyword', () async {
    await catalog().listings(tag: 'do-cu');

    expect(requests.single.path, endsWith('listings'));
    expect(requests.single.queryParameters['tag'], 'do-cu');
    expect(requests.single.queryParameters.containsKey('q'), isFalse);
  });

  test('the search mode rides along only with a query', () async {
    await catalog().listings(keyword: 'ống kính', mode: SearchMode.semantic);
    expect(requests.single.queryParameters['mode'], 'semantic');

    requests.clear();
    // No keyword: the server ignores `mode` there, so sending it would only
    // claim something the request cannot mean.
    await catalog().listings(mode: SearchMode.semantic);
    expect(requests.single.queryParameters.containsKey('mode'), isFalse);
  });

  test('GET /tags carries the ranking query and the limit', () async {
    final tags = await catalog().tags(q: 'máy ảnh', limit: 20);

    expect(requests.single.path, endsWith('tags'));
    expect(requests.single.queryParameters['q'], 'máy ảnh');
    expect(requests.single.queryParameters['limit'], 20);
    // A tag's id is its slug, so this is directly what `?tag=` takes.
    expect(tags.single.slug, 'do-cu');
  });

  test('a review filter narrows to one bucket and names its order', () async {
    await catalog().reviews(
      'lst_1',
      rating: 5,
      sort: ReviewSort.helpful,
      limit: 20,
    );

    expect(requests.single.path, endsWith('listings/lst_1/reviews'));
    expect(requests.single.queryParameters['rating'], 5);
    expect(requests.single.queryParameters['sort'], 'helpful');
  });

  group('helpful vote', () {
    RatingRepository rating() =>
        RatingRepository(TrustApi(container.read(dioProvider)));

    test('a helpful vote is +1 and answers the recomputed tally', () async {
      final tally = await rating().voteReview('rvw_1', helpful: true);

      expect(requests.single.method, 'PUT');
      expect(requests.single.path, endsWith('reviews/rvw_1/vote'));
      expect(jsonDecode(requests.single.data as String), {'vote': 1});
      expect(tally.helpful, 4);
      expect(tally.myVote, ReviewVoteTallyMyVoteEnum.number1);
    });

    test('a not-helpful vote is -1', () async {
      await rating().voteReview('rvw_1', helpful: false);

      expect(jsonDecode(requests.single.data as String), {'vote': -1});
    });

    test('withdrawing a vote deletes it rather than sending a zero', () async {
      await rating().clearVote('rvw_1');

      expect(requests.single.method, 'DELETE');
      expect(requests.single.path, endsWith('reviews/rvw_1/vote'));
    });
  });
}

typedef _Responder = Future<ResponseBody> Function(RequestOptions options);

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this._responder);

  final _Responder _responder;

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
