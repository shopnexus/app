import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/hive_storage.dart';
import '../routing/app_router.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/data/models/auth_model.dart';
import '../constants/api_endpoints.dart';
import '../constants/route_constants.dart';

/// Interceptor để tự động đính kèm Token từ Hive vào Header và tự động refresh token khi hết hạn
class AuthInterceptor extends Interceptor {
  final Ref _ref;
  final Dio _dio;
  bool _isRefreshing = false;

  AuthInterceptor(this._ref, this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final hiveService = _ref.read(hiveServiceProvider);
      final box = hiveService.authBox;
      final token = box.get('token');

      if (token != null && token.toString().isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      debugPrint('Lỗi khi truy cập authBox trong interceptor: $e');
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Nếu lỗi là 401 Unauthorized, không phải đã retry và không phải là request refresh token chính nó
    if (err.response?.statusCode == 401 &&
        err.requestOptions.extra['retried'] != true &&
        !err.requestOptions.path.contains(ApiEndpoints.refreshToken)) {
      err.requestOptions.extra['retried'] = true;
      final hiveService = _ref.read(hiveServiceProvider);
      final refreshToken = hiveService.authBox.get('refresh_token');

      if (refreshToken != null && refreshToken.toString().isNotEmpty) {
        if (!_isRefreshing) {
          _isRefreshing = true;
          try {
            // Gửi request refresh token bằng Dio instance phụ
            final dioClient = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
            final response = await dioClient.post(
              ApiEndpoints.refreshToken,
              data: {'refresh_token': refreshToken.toString()},
            );

            if (response.statusCode == 200 || response.statusCode == 201) {
              final responseData = response.data;
              final data = responseData['data'];
              if (data != null) {
                final newAccessToken = data['access_token'] as String;
                final newRefreshToken = data['refresh_token'] as String;

                // Lưu lại token mới vào Hive
                await hiveService.authBox.put('token', newAccessToken);
                await hiveService.authBox.put('refresh_token', newRefreshToken);

                // Cập nhật lại state của AuthNotifier
                _ref
                    .read(authProvider.notifier)
                    .updateToken(
                      AuthResponse(
                        accessToken: newAccessToken,
                        refreshToken: newRefreshToken,
                      ),
                    );

                _isRefreshing = false;

                // Thử gửi lại request gốc với token mới
                final originalRequest = err.requestOptions;
                originalRequest.headers['Authorization'] =
                    'Bearer $newAccessToken';

                final retryResponse = await _dio.fetch(originalRequest);
                return handler.resolve(retryResponse);
              }
            }
          } catch (refreshErr) {
            debugPrint('Lỗi làm mới token: $refreshErr');
          } finally {
            _isRefreshing = false;
          }
        }
      }

      // Nếu refresh token thất bại, hoặc không có refresh token: Đăng xuất cục bộ
      await hiveService.authBox.clear(); // Xóa sạch session trong Hive
      _ref.read(authProvider.notifier).forceLogout();

      // Kiểm tra xem trang hiện tại có yêu cầu đăng nhập hay không
      try {
        final router = _ref.read(appRouterProvider);
        final location = router.routeInformationProvider.value.uri.path;
        final isProtected = RouteConstants.protectedPrefixes.any(
          (prefix) => location.startsWith(prefix),
        );

        if (isProtected) {
          router.go('/login');
        }
      } catch (routerErr) {
        debugPrint('Lỗi khi kiểm tra router redirect: $routerErr');
      }
    }

    super.onError(err, handler);
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
      if (options.data != null) {
        print('=> Body: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        print('=> Query: ${options.queryParameters}');
      }
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
