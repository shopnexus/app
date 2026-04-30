import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/hive_storage.dart';

/// Interceptor để tự động đính kèm Token từ Hive vào Header
class AuthInterceptor extends Interceptor {
  final HiveService _hiveService;

  AuthInterceptor(this._hiveService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final box = _hiveService.authBox;
      // Giả sử token được lưu với key là 'token'
      final token = box.get('token'); 
      
      if (token != null && token.toString().isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      debugPrint('Lỗi khi truy cập authBox trong interceptor: $e');
    }
    
    super.onRequest(options, handler);
  }
}

/// Interceptor để log API request/response ra console (dễ debug)
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('==================== REQUEST ====================');
      print('=> [${options.method}] ${options.uri}');
      print('=> Headers: ${options.headers}');
      if (options.data != null) print('=> Body: ${options.data}');
      if (options.queryParameters.isNotEmpty) print('=> Query: ${options.queryParameters}');
      print('=================================================');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('==================== RESPONSE ===================');
      print('<= [${response.statusCode}] ${response.requestOptions.uri}');
      print('<= Data: ${response.data}');
      print('=================================================');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('====================== ERROR ====================');
      print('!! [Error ${err.response?.statusCode}] ${err.requestOptions.uri}');
      print('!! Message: ${err.message}');
      print('!! Data: ${err.response?.data}');
      print('=================================================');
    }
    super.onError(err, handler);
  }
}
