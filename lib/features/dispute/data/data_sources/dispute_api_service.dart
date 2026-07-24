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

  /// Buyer gửi yêu cầu hoàn trả sản phẩm kèm lý do và ảnh bằng chứng
  @POST(ApiEndpoints.buyerRefund)
  Future<DataResponse<RefundModel>> createBuyerRefund(
    @Body() BuyerRefundRequest request,
  );

  /// Buyer rút yêu cầu hoàn tiền (chỉ thực hiện được khi chưa bị từ chối/disputed)
  @POST(ApiEndpoints.withdrawBuyerRefundTemplate)
  Future<DataResponse<RefundModel>> withdrawBuyerRefund(
    @Path('id') String refundId,
  );

  /// Seller chấp nhận yêu cầu hoàn tiền của Buyer
  @POST(ApiEndpoints.sellerApproveRefundTemplate)
  Future<DataResponse<RefundModel>> sellerApproveRefund(
    @Path('id') String refundId,
  );

  /// Seller từ chối hoàn tiền và khiếu nại lên Admin đối chất (kèm mảng bằng chứng attachments)
  @POST(ApiEndpoints.sellerDisputeRefundTemplate)
  Future<DataResponse<RefundDisputeModel>> sellerDisputeRefund(
    @Path('id') String refundId,
    @Body() SellerDisputeRequest request,
  );

  /// Seller lấy danh sách các đơn đang được yêu cầu hoàn tiền
  @GET(ApiEndpoints.sellerRefunds)
  Future<DataResponse<List<RefundModel>>> getSellerRefunds(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Lấy thông tin khiếu nại tranh chấp của một đơn hoàn tiền cụ thể
  @GET(ApiEndpoints.disputesByRefundTemplate)
  Future<DataResponse<List<RefundDisputeModel>>> getDisputesByRefund(
    @Path('refundID') String refundId,
  );

  /// Admin xem danh sách toàn bộ các ca tranh chấp
  @GET(ApiEndpoints.adminDisputes)
  Future<DataResponse<List<RefundDisputeModel>>> getAdminDisputes(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Admin xem chi tiết 1 ca tranh chấp
  @GET(ApiEndpoints.adminDisputeDetailTemplate)
  Future<DataResponse<RefundDisputeModel>> getAdminDisputeDetail(
    @Path('disputeID') String disputeId,
  );
}

@riverpod
DisputeApiService disputeApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return DisputeApiService(dioInstance);
}
