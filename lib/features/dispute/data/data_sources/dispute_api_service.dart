import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/dispute_model.dart';

part 'dispute_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class DisputeApiService {
  factory DisputeApiService(Dio dio, {String baseUrl}) = _DisputeApiService;

  /// Buyer gửi yêu cầu hoàn trả sản phẩm (POST /orders/{id}/refunds)
  @POST(ApiEndpoints.createRefundTemplate)
  Future<DataResponse<RefundModel>> createBuyerRefund(
    @Path('id') String orderId,
    @Body() CreateRefundRequest request,
  );

  /// Lấy danh sách các đơn yêu cầu hoàn tiền (GET /refunds)
  @GET(ApiEndpoints.refunds)
  Future<DataResponse<List<RefundModel>>> getRefunds(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Lấy chi tiết đơn hoàn tiền theo ID (GET /refunds/{id})
  @GET(ApiEndpoints.refundDetailTemplate)
  Future<DataResponse<RefundModel>> getRefundDetail(
    @Path('id') String refundId,
  );

  /// Buyer rút yêu cầu hoàn tiền (DELETE /refunds/{id})
  @DELETE(ApiEndpoints.withdrawRefundTemplate)
  Future<void> withdrawBuyerRefund(
    @Path('id') String refundId,
  );

  /// Seller chấp nhận yêu cầu hoàn tiền (POST /refunds/{id}/acceptance)
  @POST(ApiEndpoints.acceptRefundTemplate)
  Future<DataResponse<RefundModel>> sellerApproveRefund(
    @Path('id') String refundId,
  );

  /// Seller từ chối yêu cầu hoàn tiền (POST /refunds/{id}/rejection)
  @POST(ApiEndpoints.rejectRefundTemplate)
  Future<DataResponse<RefundModel>> sellerRejectRefund(
    @Path('id') String refundId,
    @Body() RejectRefundRequest request,
  );

  /// Đẩy thêm mảng ID bằng chứng vào đơn hoàn tiền (POST /refunds/{id}/attachments)
  @POST(ApiEndpoints.addRefundAttachmentsTemplate)
  Future<DataResponse<RefundModel>> addRefundAttachments(
    @Path('id') String refundId,
    @Body() AddAttachmentsRequest request,
  );

  /// Seller / User leo thang khiếu nại lên Moderator phán quyết (POST /refunds/{id}/dispute)
  @POST(ApiEndpoints.openDisputeTemplate)
  Future<DataResponse<RefundDisputeModel>> sellerDisputeRefund(
    @Path('id') String refundId,
    @Body() OpenDisputeRequest request,
  );

  /// Admin / Moderator lấy danh sách các ca tranh chấp (GET /admin/disputes)
  @GET(ApiEndpoints.adminDisputes)
  Future<DataResponse<List<RefundDisputeModel>>> getAdminDisputes(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Admin / Moderator đưa ra phán quyết ca tranh chấp (POST /admin/disputes/{id}/ruling)
  @POST(ApiEndpoints.adminDisputeRulingTemplate)
  Future<DataResponse<RefundDisputeModel>> ruleAdminDispute(
    @Path('id') String disputeId,
    @Body() DisputeRulingRequest request,
  );
}

@riverpod
DisputeApiService disputeApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return DisputeApiService(dioInstance);
}
