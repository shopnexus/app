import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/resource_model.dart';
import '../data_sources/dispute_api_service.dart';
import '../models/dispute_model.dart';

part 'dispute_repository.g.dart';

class DisputeRepository {
  final DisputeApiService _apiService;
  final Dio _dio;

  DisputeRepository(this._apiService, this._dio);

  /// Buyer gửi yêu cầu hoàn tiền trả hàng kèm bằng chứng (POST /orders/{id}/refunds)
  Future<RefundModel> createBuyerRefund(BuyerRefundRequest request) async {
    final attachmentIds = request.attachments
        .map((a) => a.resourceId ?? a.resource?.id ?? '')
        .where((id) => id.isNotEmpty)
        .toList();

    final response = await _apiService.createBuyerRefund(
      request.orderId,
      CreateRefundRequest(
        reason: request.reason,
        attachments: attachmentIds,
      ),
    );
    return response.data;
  }

  /// Buyer rút yêu cầu hoàn tiền (DELETE /refunds/{id})
  Future<RefundModel> withdrawBuyerRefund(String refundId) async {
    await _apiService.withdrawBuyerRefund(refundId);
    final detail = await getRefundById(refundId);
    return detail ??
        RefundModel(id: refundId, orderId: '', reason: '', status: 'cancelled');
  }

  /// Seller chấp nhận hoàn tiền cho Buyer (POST /refunds/{id}/acceptance)
  Future<RefundModel> sellerApproveRefund(String refundId) async {
    final response = await _apiService.sellerApproveRefund(refundId);
    return response.data;
  }

  /// Seller từ chối và khiếu nại lên Mod/Admin (POST /refunds/{id}/dispute)
  Future<RefundDisputeModel> sellerDisputeRefund(
    String refundId,
    SellerDisputeRequest request,
  ) async {
    final attachmentIds = request.attachments
        .map((a) => a.resourceId ?? a.resource?.id ?? '')
        .where((id) => id.isNotEmpty)
        .toList();

    if (attachmentIds.isNotEmpty) {
      await _apiService.addRefundAttachments(
        refundId,
        AddAttachmentsRequest(attachments: attachmentIds),
      );
    }

    final response = await _apiService.sellerDisputeRefund(
      refundId,
      OpenDisputeRequest(reason: request.reason),
    );
    return response.data;
  }

  /// Lấy danh sách các yêu cầu hoàn tiền từ Server (GET /refunds)
  Future<List<RefundModel>> getSellerRefunds({int? page, int? limit}) async {
    final response = await _apiService.getRefunds(page, limit);
    return response.data;
  }

  /// Lấy chi tiết lịch sử tranh chấp theo Refund ID từ Server
  Future<List<RefundDisputeModel>> getDisputesByRefund(String refundId) async {
    try {
      final refundDetail = await getRefundById(refundId);
      if (refundDetail?.dispute != null) {
        return [refundDetail!.dispute!];
      }
      return [];
    } catch (_) {
      return [];
    }
  }

  /// Lấy thông tin Refund theo Refund ID từ Server (GET /refunds/{id})
  Future<RefundModel?> getRefundById(String refundId) async {
    final response = await _apiService.getRefundDetail(refundId);
    return response.data;
  }

  /// Upload ảnh/bằng chứng trực tiếp lên server để lấy ResourceModel
  Future<ResourceModel> uploadEvidenceFile(String filePath) async {
    final fileName = filePath.split('/').last;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });

    final response = await _dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.uploadFile,
      data: formData,
    );

    if (response.data != null && response.data['data'] != null) {
      return ResourceModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    }
    throw Exception('Tải ảnh bằng chứng thất bại');
  }
}

@riverpod
DisputeRepository disputeRepository(Ref ref) {
  final apiService = ref.watch(disputeApiServiceProvider);
  final dioInstance = ref.watch(dioProvider);
  return DisputeRepository(apiService, dioInstance);
}
