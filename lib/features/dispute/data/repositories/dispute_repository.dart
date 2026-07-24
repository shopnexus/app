import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/constants/app_config.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/resource_model.dart';
import '../data_sources/dispute_api_service.dart';
import '../models/dispute_model.dart';

part 'dispute_repository.g.dart';

class DisputeRepository {
  final DisputeApiService _apiService;
  final Dio _dio;

  DisputeRepository(this._apiService, this._dio);

  /// Buyer gửi yêu cầu hoàn tiền trả hàng kèm bằng chứng (attachments bắt buộc)
  Future<RefundModel> createBuyerRefund(BuyerRefundRequest request) async {
    if (AppConfig.useMockData) {
      final newRefund = RefundModel(
        id: 'refund_mock_${DateTime.now().millisecondsSinceEpoch}',
        orderId: request.orderId,
        reason: request.reason,
        attachments: request.attachments,
        status: 'AwaitingSellerReview',
        createdAt: DateTime.now().toIso8601String(),
        expiresAt: DateTime.now()
            .add(const Duration(days: 3))
            .toIso8601String(),
      );
      _mockRefunds.insert(0, newRefund);
      return newRefund;
    }
    final response = await _apiService.createBuyerRefund(request);
    return response.data;
  }

  /// Buyer rút yêu cầu hoàn tiền khi đơn chưa ở trạng thái AwaitingSellerReview/Disputed
  Future<RefundModel> withdrawBuyerRefund(String refundId) async {
    if (AppConfig.useMockData) {
      final index = _mockRefunds.indexWhere((r) => r.id == refundId);
      if (index != -1) {
        final updated = _mockRefunds[index].copyWith(
          status: 'Withdrawn',
          updatedAt: DateTime.now().toIso8601String(),
        );
        _mockRefunds[index] = updated;
        return updated;
      }
    }
    final response = await _apiService.withdrawBuyerRefund(refundId);
    return response.data;
  }

  /// Seller chấp nhận hoàn tiền cho Buyer trong vòng 3 ngày
  Future<RefundModel> sellerApproveRefund(String refundId) async {
    if (AppConfig.useMockData) {
      final index = _mockRefunds.indexWhere((r) => r.id == refundId);
      if (index != -1) {
        final updated = _mockRefunds[index].copyWith(
          status: 'Accepted',
          updatedAt: DateTime.now().toIso8601String(),
        );
        _mockRefunds[index] = updated;
        return updated;
      }
    }
    final response = await _apiService.sellerApproveRefund(refundId);
    return response.data;
  }

  /// Seller từ chối và khiếu nại lên Mod/Admin trong vòng 3 ngày (kèm mảng bằng chứng attachments)
  Future<RefundDisputeModel> sellerDisputeRefund(
    String refundId,
    SellerDisputeRequest request,
  ) async {
    if (AppConfig.useMockData) {
      final dispute = RefundDisputeModel(
        id: 'dispute_mock_${DateTime.now().millisecondsSinceEpoch}',
        refundId: refundId,
        status: 'Pending',
        sellerReason: request.reason,
        sellerAttachments: request.attachments,
        createdAt: DateTime.now().toIso8601String(),
      );
      final index = _mockRefunds.indexWhere((r) => r.id == refundId);
      if (index != -1) {
        _mockRefunds[index] = _mockRefunds[index].copyWith(
          status: 'Disputed',
          sellerResponse: request.reason,
          dispute: dispute,
          updatedAt: DateTime.now().toIso8601String(),
        );
      }
      return dispute;
    }
    final response = await _apiService.sellerDisputeRefund(refundId, request);
    return response.data;
  }

  /// Lấy danh sách các yêu cầu hoàn tiền dành cho Seller
  Future<List<RefundModel>> getSellerRefunds({int? page, int? limit}) async {
    if (AppConfig.useMockData) {
      return _mockRefunds;
    }
    final response = await _apiService.getSellerRefunds(page, limit);
    return response.data;
  }

  /// Lấy chi tiết lịch sử tranh chấp theo Refund ID
  Future<List<RefundDisputeModel>> getDisputesByRefund(String refundId) async {
    if (AppConfig.useMockData) {
      final refund = _mockRefunds.firstWhere(
        (r) => r.id == refundId,
        orElse: () => _mockRefunds.first,
      );
      return refund.dispute != null ? [refund.dispute!] : [];
    }
    final response = await _apiService.getDisputesByRefund(refundId);
    return response.data;
  }

  /// Lấy thông tin Refund theo Refund ID
  Future<RefundModel?> getRefundById(String refundId) async {
    if (AppConfig.useMockData) {
      return _mockRefunds.firstWhere(
        (r) => r.id == refundId,
        orElse: () => _mockRefunds.first,
      );
    }
    final refunds = await getSellerRefunds();
    return refunds.firstWhere(
      (r) => r.id == refundId,
      orElse: () => refunds.first,
    );
  }

  /// Upload ảnh/bằng chứng trực tiếp lên server để lấy ResourceModel (dùng trong attachments)
  Future<ResourceModel> uploadEvidenceFile(String filePath) async {
    if (AppConfig.useMockData) {
      return ResourceModel(
        id: 'res_mock_${DateTime.now().millisecondsSinceEpoch}',
        url: filePath.startsWith('http')
            ? filePath
            : 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=500',
        type: 'Image',
        description: 'Bằng chứng đối chất',
      );
    }

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

  /// Mock Data phục vụ testing UI/UX cho luồng Tranh chấp & Hoàn tiền
  static final List<RefundModel> _mockRefunds = [
    RefundModel(
      id: 'rf_001',
      orderId: 'DH8465',
      buyerId: 'buyer_101',
      sellerId: 'seller_202',
      status: 'AwaitingSellerReview',
      reason:
          'Sản phẩm bị nứt vỡ vòi xịt khi mở hộp, dung dịch tinh dầu bị rò rỉ ra ngoài.',
      createdAt: DateTime.now()
          .subtract(const Duration(hours: 12))
          .toIso8601String(),
      expiresAt: DateTime.now()
          .add(const Duration(hours: 60))
          .toIso8601String(),
      attachments: const [
        RefundAttachment(
          resourceId: 'res_01',
          description: 'Ảnh hộp hàng khi mở nắp bị rò rỉ',
          resource: ResourceModel(
            id: 'res_01',
            url:
                'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=500',
            type: 'Image',
          ),
        ),
        RefundAttachment(
          resourceId: 'res_02',
          description: 'Ảnh cận cảnh vết nứt chai glass',
          resource: ResourceModel(
            id: 'res_02',
            url:
                'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=500',
            type: 'Image',
          ),
        ),
      ],
    ),
    RefundModel(
      id: 'rf_002',
      orderId: 'DH8460',
      buyerId: 'buyer_102',
      sellerId: 'seller_202',
      status: 'Disputed',
      reason: 'Bình giữ nhiệt không giữ được nước nóng, bị xước vỏ.',
      createdAt: DateTime.now()
          .subtract(const Duration(days: 2))
          .toIso8601String(),
      expiresAt: DateTime.now()
          .subtract(const Duration(hours: 5))
          .toIso8601String(),
      sellerResponse:
          'Shop đóng gói bình titan mới 100% kiểm tra kỹ trước khi giao, vết xước do Buyer cố tình làm xước.',
      attachments: const [
        RefundAttachment(
          resourceId: 'res_03',
          description: 'Vết xước góc dưới bình',
          resource: ResourceModel(
            id: 'res_03',
            url:
                'https://images.unsplash.com/photo-1517254456976-ee8682099819?w=500',
            type: 'Image',
          ),
        ),
      ],
      dispute: RefundDisputeModel(
        id: 'disp_001',
        refundId: 'rf_002',
        status: 'Pending',
        sellerReason:
            'Băng keo niêm phong vận chuyển còn nguyên vẹn, nghi vấn tráo hàng.',
        sellerAttachments: const [
          RefundAttachment(
            resourceId: 'res_seller_01',
            description:
                'Video quay lúc shop đóng gói hàng giao đơn vị vận chuyển',
            resource: ResourceModel(
              id: 'res_seller_01',
              url:
                  'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?w=500',
              type: 'Image',
            ),
          ),
        ],
        createdAt: DateTime.now()
            .subtract(const Duration(hours: 8))
            .toIso8601String(),
      ),
    ),
  ];
}

@riverpod
DisputeRepository disputeRepository(Ref ref) {
  final apiService = ref.watch(disputeApiServiceProvider);
  final dioInstance = ref.watch(dioProvider);
  return DisputeRepository(apiService, dioInstance);
}
