import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/features/account/data/data_sources/account_api_service.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/repositories/ticket_repository.dart';

/// The account repository wired onto a Dio that records what it was asked to
/// send. Most drift these tests guard against is a wrong *request* — an unknown
/// body key, a missing `role`, a `page` on a cursor route — so the assertion is
/// usually on [calls] rather than on a parsed answer.
class RecordingBackend {
  RecordingBackend([this.responder = _emptyEnvelope]);

  /// The whole response envelope for a request, e.g.
  /// `{'data': [...], 'meta': {'next_cursor': null}}`.
  final Map<String, dynamic> Function(RequestOptions request) responder;

  final List<RequestOptions> calls = [];

  late final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl))
    ..httpClientAdapter = _Adapter(this);

  late final AccountRepository repository = AccountRepository(
    AccountApiService(dio, baseUrl: _baseUrl),
    AccountApi(dio),
    OrderApi(dio),
    CatalogApi(dio),
  );

  late final SellerRepository seller = SellerRepository(
    OrderApi(dio),
    CatalogApi(dio),
    FinanceApi(dio),
  );

  /// Where a party's complaint goes now that neither of them writes a shipment's
  /// position: staff read it and decide.
  late final TicketRepository tickets = TicketRepository(
    TrustApi(dio),
    ChatApi(dio),
  );

  RequestOptions get only {
    if (calls.length != 1) {
      throw StateError('expected one request, got ${calls.length}');
    }
    return calls.single;
  }

  /// A leading slash normalised away: the generated client writes `/contacts`,
  /// the retrofit one writes `me/profile`, and neither is the point of a test.
  List<String> get paths => [
    for (final call in calls) call.path.replaceFirst(RegExp(r'^/'), ''),
  ];

  /// The decoded JSON body of the [index]th call.
  Map<String, dynamic> bodyOf(int index) {
    final data = calls[index].data;
    if (data is Map<String, dynamic>) return data;
    return jsonDecode(data as String) as Map<String, dynamic>;
  }

  static Map<String, dynamic> _emptyEnvelope(RequestOptions request) => const {
    'data': <String, dynamic>{},
  };

  static const _baseUrl = 'http://test.local/api/v1/';
}

class _Adapter implements HttpClientAdapter {
  _Adapter(this._backend);

  final RecordingBackend _backend;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    _backend.calls.add(options);
    return ResponseBody.fromString(
      jsonEncode(_backend.responder(options)),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
