import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/network/api_interceptors.dart';

/// The exact string the server rejected, so this test fails for the original reason if the
/// interceptor is ever dropped: `time.Parse(time.RFC3339Nano, …)` refuses a space separator.
const rejectedByServer = '2026-08-06 16:00:00.000Z';
const acceptedByServer = '2026-08-06T16:00:00.000Z';

RequestOptions run(Map<String, dynamic> query) {
  final interceptor = DateTimeQueryInterceptor();
  final options = RequestOptions(path: '/orders/summary', queryParameters: query);
  interceptor.onRequest(options, RequestInterceptorHandler());
  return options;
}

void main() {
  test('what dio would have sent is what the server refuses', () {
    // Not an assumption about Dart: the whole bug is this one character.
    expect(DateTime.utc(2026, 8, 6, 16).toString(), rejectedByServer);
    expect(DateTime.utc(2026, 8, 6, 16).toIso8601String(), acceptedByServer);
  });

  test('the seller summary window goes out as RFC 3339', () {
    final options = run({
      'role': 'seller',
      'from': DateTime.utc(2026, 8, 6, 16),
      'to': DateTime.utc(2026, 8, 6, 16),
    });

    expect(options.queryParameters['from'], acceptedByServer);
    expect(options.queryParameters['to'], acceptedByServer);
    expect(options.queryParameters['role'], 'seller', reason: 'non-instants untouched');
  });

  test('a chat message key goes out as RFC 3339', () {
    // Editing or deleting a message needs created_at: the table is a hypertable whose key
    // includes its partitioning column, so the id alone does not locate the row.
    final options = run({'created_at': DateTime.utc(2026, 8, 6, 16)});

    expect(options.queryParameters['created_at'], acceptedByServer);
  });

  test('a local instant is normalised to UTC rather than sent with an offset', () {
    final local = DateTime.utc(2026, 8, 6, 16).toLocal();

    final options = run({'from': local});

    expect(options.queryParameters['from'], acceptedByServer);
  });

  test('a repeated parameter is converted element-wise', () {
    final options = run({
      'at': [DateTime.utc(2026, 8, 6, 16), 'not-a-date'],
    });

    expect(options.queryParameters['at'], [acceptedByServer, 'not-a-date']);
  });
}
