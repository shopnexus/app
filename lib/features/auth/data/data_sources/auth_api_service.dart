import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/auth_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiEndpoints.login)
  Future<DataResponse<AuthResponse>> login(@Body() LoginRequest request);

  @POST(ApiEndpoints.register)
  Future<DataResponse<AuthResponse>> register(@Body() RegisterRequest request);

  @POST(ApiEndpoints.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);
}

@riverpod
AuthApiService authApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthApiService(dio);
}
