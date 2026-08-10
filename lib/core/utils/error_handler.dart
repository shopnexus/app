import 'package:dio/dio.dart';

class ErrorHandler {
  /// Những mã lỗi app có câu tiếng Việt riêng, tra theo `error.code` — cái phần
  /// ổn định của envelope, không phải câu chữ.
  ///
  /// `identity_required` từng lọt tới người dùng đúng nguyên văn tiếng Anh của
  /// server, sau khi họ đã chụp ảnh, tải lên và đợi model chạy.
  static const _messages = <String, String>{
    'identity_required':
        'Bạn cần định danh trước khi đăng bán. Mọi người bán trên ShopNexus '
        'đều đã định danh — đó là lý do người mua dám mua.',
  };

  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Kết nối mạng quá hạn. Vui lòng kiểm tra lại đường truyền internet.';
        case DioExceptionType.sendTimeout:
          return 'Yêu cầu gửi đi quá hạn. Vui lòng thử lại sau.';
        case DioExceptionType.receiveTimeout:
          return 'Phản hồi từ máy chủ quá hạn. Vui lòng thử lại sau.';
        case DioExceptionType.badResponse:
          final response = error.response;
          if (response != null) {
            final statusCode = response.statusCode;
            final data = response.data;
            if (data is Map<String, dynamic>) {
              // The envelope is `{"error": {"code", "message"}}` — one shape, every route. It
              // used to be read as a flat string too, and `.toString()` on the map printed Dart
              // syntax at the user: `{code: payment_option_unknown, message: ...}`.
              final envelope = data['error'];
              if (envelope is Map) {
                // Câu tiếng Việt của app thắng câu tiếng Anh của server, nhưng
                // chỉ cho những mã app thật sự có bản dịch: một map bắt-tất-cả
                // sẽ đổi mọi lỗi lạ thành một câu chung vô nghĩa.
                final translated = _messages[envelope['code']?.toString()];
                if (translated != null) return translated;
                if (envelope['message'] != null) {
                  return envelope['message'].toString();
                }
              }
              // A body that is not this API's — a proxy's error page, say.
              if (data['message'] != null) return data['message'].toString();
              if (envelope != null) return envelope.toString();
            }
            if (statusCode == 400) {
              return 'Thông tin yêu cầu không hợp lệ. Vui lòng kiểm tra lại dữ liệu nhập.';
            }
            if (statusCode == 401 || statusCode == 403) {
              return 'Tên đăng nhập hoặc mật khẩu không chính xác.';
            }
            if (statusCode == 404) {
              return 'Không tìm thấy tài khoản hoặc tài nguyên yêu cầu.';
            }
            if (statusCode != null && statusCode >= 500) {
              return 'Lỗi hệ thống máy chủ ($statusCode). Vui lòng thử lại sau.';
            }
            return 'Lỗi từ máy chủ: ${response.statusMessage ?? "Không xác định"} ($statusCode)';
          }
          return 'Nhận phản hồi không hợp lệ từ máy chủ.';
        case DioExceptionType.cancel:
          return 'Yêu cầu kết nối đã bị hủy.';
        case DioExceptionType.connectionError:
          return 'Không thể kết nối với máy chủ. Vui lòng kiểm tra kết nối mạng của bạn.';
        case DioExceptionType.unknown:
        default:
          if (error.message != null &&
              error.message!.contains('SocketException')) {
            return 'Không có kết nối internet. Vui lòng kiểm tra thiết bị của bạn.';
          }
          return error.message ?? 'Đã xảy ra lỗi kết nối không xác định.';
      }
    }

    final errorStr = error.toString();
    if (errorStr.startsWith('Exception: ')) {
      return errorStr.substring('Exception: '.length);
    }
    return errorStr;
  }
}
