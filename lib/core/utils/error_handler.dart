import 'package:dio/dio.dart';

class ErrorHandler {
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
              // Thử lấy thông điệp lỗi cụ thể từ response của backend
              if (data.containsKey('message') && data['message'] != null) {
                return data['message'].toString();
              }
              if (data.containsKey('error') && data['error'] != null) {
                return data['error'].toString();
              }
              if (data.containsKey('errorMessage') &&
                  data['errorMessage'] != null) {
                return data['errorMessage'].toString();
              }
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
