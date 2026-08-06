import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';

/// Every error body this API answers is `{"error": {"code", "message"}}`. The handler used to
/// look for a flat `message`, then fall back to `data['error'].toString()` — which on a map
/// prints Dart syntax, so a refused payment showed the buyer
/// `{code: payment_option_unknown, message: no enabled payment option by that id}`.
void main() {
  Object failWith(Map<String, dynamic> body, int status) => DioException(
    requestOptions: RequestOptions(path: '/payment-sessions/x/payments'),
    type: DioExceptionType.badResponse,
    response: Response(
      requestOptions: RequestOptions(path: '/payment-sessions/x/payments'),
      statusCode: status,
      data: body,
    ),
  );

  test('the coded message is what the user reads', () {
    final message = ErrorHandler.getErrorMessage(
      failWith({
        'error': {
          'code': 'payment_option_unknown',
          'message': 'no enabled payment option by that id',
        },
      }, 422),
    );

    expect(message, 'no enabled payment option by that id');
  });

  test('a body that is not this API falls back rather than throwing', () {
    final message = ErrorHandler.getErrorMessage(
      failWith({'message': 'Bad Gateway'}, 502),
    );

    expect(message, 'Bad Gateway');
  });

  /// Cái mã này từng tới người dùng đúng nguyên văn tiếng Anh của server —
  /// "identity verification is required before selling" — sau khi họ đã chụp
  /// ảnh, tải lên và đợi model chạy.
  test('a code the app has words for reads in Vietnamese', () {
    final message = ErrorHandler.getErrorMessage(
      failWith({
        'error': {
          'code': 'identity_required',
          'message': 'identity verification is required before selling',
        },
      }, 422),
    );

    expect(message, contains('định danh'));
    expect(message, isNot(contains('identity verification')));
  });

  test('an unrecognised body still yields a status-based sentence', () {
    final message = ErrorHandler.getErrorMessage(failWith({}, 500));

    expect(message, contains('500'));
  });
}
