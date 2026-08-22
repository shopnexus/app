import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/constants/api_endpoints.dart';
import 'package:shopnexus_flutter_app/core/network/api_interceptors.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  // Cấu hình cơ bản cho Dio
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      // Every array query parameter this API has — `/listings?ids`, `/tags?near`,
      // `/categories?near` — is `style: form, explode: false`, i.e. one parameter
      // holding a comma-joined list. Dio's default is the opposite (`ids=a&ids=b`),
      // and the server reads only the first value of a repeated key: an
      // order with three lines resolved exactly one listing, so the other two
      // rendered "Sản phẩm không còn trong danh mục" for products that were never
      // gone.
      listFormat: ListFormat.csv,
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
