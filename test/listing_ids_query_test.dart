import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/core/network/dio_client.dart';

/// `GET /listings?ids=` is `style: form, explode: false` — one parameter holding
/// a comma-joined list — and so is every other array query parameter this API
/// has (`/tags?near`, `/categories?near`).
///
/// Dio's default is the opposite shape, `ids=a&ids=b&ids=c`, and the server reads
/// one value per key: it answered with the first listing and nothing else. Order
/// history resolves a whole page of lines through this one call, so a three-line
/// order came back with two lines whose listing was missing — and a line with no
/// listing renders "Sản phẩm không còn trong danh mục", for products that were
/// still perfectly there.
void main() {
  late List<RequestOptions> requests;
  late ProviderContainer container;

  setUp(() {
    requests = [];
    // The real client, built the way the app builds it — the list encoding under
    // test lives in `BaseOptions`, so a hand-rolled `Dio()` here would test
    // nothing.
    final source = ProviderContainer.test();
    final dio = source.read(dioProvider)
      ..httpClientAdapter = _FakeAdapter((options) async {
        requests.add(options);
        return _json(200, {
          'data': <Map<String, dynamic>>[],
          'meta': {'page': 1, 'limit': 20, 'total_count': 0},
          'understood': '',
          'probes': <String>[],
        });
      });
    container = ProviderContainer.test(
      overrides: [dioProvider.overrideWithValue(dio)],
    );
  });

  test('ids goes out as one comma-joined parameter', () async {
    await container.read(catalogApiProvider).listingsGet(
      ids: ['lst_a', 'lst_b', 'lst_c'],
    );

    final uri = requests.single.uri;
    expect(uri.queryParametersAll['ids'], ['lst_a,lst_b,lst_c']);
    expect(uri.query, contains('ids=lst_a,lst_b,lst_c'));
  });

  test('near on the tag cloud is joined the same way', () async {
    await container.read(catalogApiProvider).tagsGet(
      near: ['giay-the-thao', 'cat_41fsk4dptzwfs'],
    );

    expect(requests.single.uri.queryParametersAll['near'], [
      'giay-the-thao,cat_41fsk4dptzwfs',
    ]);
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
