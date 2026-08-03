import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/kyc_model.dart';

part 'kyc_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class KycApiService {
  factory KycApiService(Dio dio, {String baseUrl}) = _KycApiService;

  /// Lấy lịch sử xác minh danh tính của tài khoản (GET /me/identity-documents)
  @GET(ApiEndpoints.meIdentityDocuments)
  Future<DataResponse<List<IdentityDocument>>> getMyIdentityDocuments();

  /// Bắt đầu xác minh danh tính (POST /identity-documents)
  @POST(ApiEndpoints.identityDocuments)
  Future<DataResponse<IdentityVerificationTicket>> startIdentityVerification(
    @Body() StartIdentityVerificationRequest request,
  );

  /// Đăng ký slot upload file hình ảnh scan (POST /me/uploads)
  @POST(ApiEndpoints.meUploads)
  Future<DataResponse<UploadSlot>> createUploadSlot(
    @Body() AccountCreateUploadRequest request,
  );
}

@riverpod
KycApiService kycApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return KycApiService(dio);
}
