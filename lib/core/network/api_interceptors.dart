import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/core/routing/app_router.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopnexus_flutter_app/core/constants/api_endpoints.dart';
import 'package:shopnexus_flutter_app/core/constants/route_constants.dart';

/// Interceptor để tự động đính kèm Token từ Hive vào Header và tự động refresh
/// token khi hết hạn.
class AuthInterceptor extends Interceptor {
  final Ref _ref;
  final Dio _dio;

  /// `POST /token/refresh` takes no bearer, so it goes on a bare client: the
  /// app's own Dio would attach the expired token and re-enter this interceptor.
  final Dio _refreshClient;

  /// The single in-flight exchange. A screen fires several requests at once, so
  /// the 15-minute access token expires on all of them together; the refresh
  /// token is rotated on every exchange, so a second one would present a token
  /// the server has already retired and lose the session.
  Future<String?>? _exchange;

  AuthInterceptor(this._ref, this._dio, {Dio? refreshClient})
    : _refreshClient =
          refreshClient ?? Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final token = _ref.read(hiveServiceProvider).authBox.get('token');
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
    if (err.response?.statusCode != 401 ||
        err.requestOptions.extra['retried'] == true ||
        err.requestOptions.path.contains(ApiEndpoints.refreshToken)) {
      return handler.next(err);
    }
    err.requestOptions.extra['retried'] = true;

    final hiveService = _ref.read(hiveServiceProvider);
    final stored = hiveService.authBox.get('refresh_token');
    if (stored == null || stored.toString().isEmpty) {
      await _endSession(hiveService);
      return handler.next(err);
    }

    // Whoever gets here first starts the exchange; the rest await that one.
    final accessToken = await (_exchange ??= _refresh(
      hiveService,
      stored.toString(),
    ));
    if (accessToken == null) {
      // Only a failed exchange ends the session — an expired access token is
      // the ordinary case and must not log the user out.
      await _endSession(hiveService);
      return handler.next(err);
    }

    try {
      final retry = err.requestOptions;
      retry.headers['Authorization'] = 'Bearer $accessToken';
      return handler.resolve(await _dio.fetch(retry));
    } on DioException catch (retryErr) {
      return handler.next(retryErr);
    }
  }

  /// Answers the new access token, or null when the session cannot be renewed.
  Future<String?> _refresh(HiveService hiveService, String refreshToken) async {
    try {
      final response = await _refreshClient.post(
        ApiEndpoints.refreshToken,
        data: {'refresh_token': refreshToken},
      );

      final body = response.data;
      final data = (body is Map<String, dynamic> && body.containsKey('data'))
          ? body['data']
          : body;
      if (data is! Map<String, dynamic>) return null;

      final accessToken = data['access_token'] as String?;
      final rotated = data['refresh_token'] as String?;
      if (accessToken == null || rotated == null) return null;

      await hiveService.authBox.put('token', accessToken);
      await hiveService.authBox.put('refresh_token', rotated);
      _ref
          .read(authProvider.notifier)
          .updateToken(accessToken: accessToken, refreshToken: rotated);
      return accessToken;
    } catch (e) {
      debugPrint('Lỗi làm mới token: $e');
      return null;
    } finally {
      // Cleared last, so every awaiter has already taken this future and a
      // later expiry starts a fresh exchange.
      _exchange = null;
    }
  }

  Future<void> _endSession(HiveService hiveService) async {
    await hiveService.authBox.clear();
    _ref.read(authProvider.notifier).forceLogout();

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
