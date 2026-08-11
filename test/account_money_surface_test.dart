import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_code_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_verification_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upsert_tax_info_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_kind.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

import 'support/recording_backend.dart';

/// The routes the app had a client for and never called: the caller's push
/// devices, the payee's tax registration, and the wallet ledger read with a
/// filter. Each assertion is about the *request*, because that is where a
/// contract drifts silently — a body key nobody sends, a `page` on a route that
/// has no page.
void main() {
  const taxInfoJson = <String, dynamic>{
    'tax_code': '0123456789',
    'tax_code_type': 'individual',
    'legal_name': 'Nguyen Van An',
    'verification_status': 'pending',
    'verified_at': null,
    'updated_at': '2026-08-05T02:34:22.408272Z',
  };

  group('devices', () {
    test('the list is the caller\'s own route', () async {
      final backend = RecordingBackend((_) => const {'data': []});

      final devices = await backend.repository.devices();

      expect(backend.paths.single, 'me/devices');
      expect(backend.only.method, 'GET');
      // A fresh install registers nothing, so empty is the ordinary answer and
      // has to reach the screen as a list rather than an error.
      expect(devices, isEmpty);
    });

    test('unregistering names the device in the path', () async {
      final backend = RecordingBackend();

      await backend.repository.unregisterDevice('dev_2h9qk4mfx7bd3');

      expect(backend.paths.single, 'devices/dev_2h9qk4mfx7bd3');
      expect(backend.only.method, 'DELETE');
    });
  });

  group('tax info', () {
    test('nothing registered is null, not a thrown 404', () async {
      final repository = _statusBackend(404, {
        'error': {'code': 'tax_info_not_found', 'message': 'not found'},
      });

      // Every seller starts here, so a 404 surfacing as an error state would put
      // a red screen in front of the form that fixes it.
      expect(await repository.taxInfo(), isNull);
    });

    test('a registration parses into the contract enums', () async {
      final backend = RecordingBackend((_) => const {'data': taxInfoJson});

      final info = await backend.seller.taxInfo();

      expect(backend.paths.single, 'tax-info');
      expect(info?.taxCodeType, TaxCodeType.individual);
      expect(info?.verificationStatus, TaxVerificationStatus.pending);
      expect(info?.verifiedAt, isNull);
    });

    test('saving is a PUT of the whole registration', () async {
      final backend = RecordingBackend((_) => const {'data': taxInfoJson});

      await backend.seller.saveTaxInfo(
        UpsertTaxInfoRequest(
          legalName: 'Nguyen Van An',
          taxCode: '0123456789-001',
          taxCodeType: TaxCodeType.household,
        ),
      );

      expect(backend.paths.single, 'tax-info');
      expect(backend.only.method, 'PUT');
      expect(backend.bodyOf(0), {
        'legal_name': 'Nguyen Van An',
        'tax_code': '0123456789-001',
        'tax_code_type': 'household',
      });
    });
  });

  group('wallet ledger', () {
    test('a kind filter travels as a query parameter', () async {
      final backend = RecordingBackend(
        (_) => const {
          'data': [],
          'meta': {'page': 1, 'limit': 100, 'total_count': 0},
        },
      );

      await backend.seller.ledgerPage(
        'VND',
        kind: WalletTransactionKind.fee,
      );

      expect(backend.paths.single, 'wallets/VND/transactions');
      // Dio serialises the enum with `toString()`, which the generated type
      // overrides to the contract's kebab value — that is what reaches the wire.
      expect(backend.only.queryParameters['kind'].toString(), 'fee');
      // The ledger is page-paginated, and this read takes the cap in one go:
      // the surface shows a wallet's recent movements, not a pager over them.
      expect(backend.only.queryParameters['limit'], 100);
      expect(backend.only.queryParameters['page'], 1);
    });

    test('a ledger longer than the read says so', () async {
      final backend = RecordingBackend(
        (_) => const {
          'data': [],
          'meta': {'page': 1, 'limit': 100, 'total_count': 137},
        },
      );

      final page = await backend.seller.ledgerPage('VND');

      expect(page.totalCount, 137);
      expect(page.truncated, isTrue);
    });
  });
}

/// A seller repository whose backend answers one fixed status. [RecordingBackend]
/// always answers 200, and "nothing registered yet" is a 404 by design.
SellerRepository _statusBackend(int status, Map<String, dynamic> body) {
  final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
    ..httpClientAdapter = _StatusAdapter(status, body);
  return SellerRepository(OrderApi(dio), CatalogApi(dio), FinanceApi(dio));
}

class _StatusAdapter implements HttpClientAdapter {
  _StatusAdapter(this._status, this._body);

  final int _status;
  final Map<String, dynamic> _body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode(_body),
    _status,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}
