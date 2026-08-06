import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/constants/api_endpoints.dart';
import 'package:shopnexus_flutter_app/core/network/api_interceptors.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  // Cấu hình cơ bản cho Dio
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Thêm interceptors vào Dio instance
  // DateTimeQueryInterceptor comes first: it rewrites the request before anything logs it, so the
  // logged URL is the one that actually goes out.
  dio.interceptors.addAll([
    DateTimeQueryInterceptor(),
    AuthInterceptor(ref, dio),
    LoggingInterceptor(),
  ]);

  return dio;
}
