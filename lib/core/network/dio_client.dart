import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/hive_storage.dart';
import '../constants/api_endpoints.dart';
import 'api_interceptors.dart';

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

  // Lấy HiveService từ Provider
  final hiveService = ref.watch(hiveServiceProvider);

  // Thêm interceptors vào Dio instance
  dio.interceptors.addAll([
    AuthInterceptor(hiveService),
    LoggingInterceptor(),
  ]);

  return dio;
}
