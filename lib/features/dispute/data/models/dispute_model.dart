import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/resource_model.dart';

part 'dispute_model.freezed.dart';

part 'dispute_model.g.dart';

/// Bằng chứng đính kèm khi gửi yêu cầu hoàn tiền hoặc tranh chấp
@freezed
abstract class RefundAttachment with _$RefundAttachment {
  const factory RefundAttachment({
    @JsonKey(name: 'resource_id') String? resourceId,
    String? description,
    ResourceModel? resource,
  }) = _RefundAttachment;

  factory RefundAttachment.fromJson(Map<String, dynamic> json) =>
      _$RefundAttachmentFromJson(json);
}

/// DTO gửi yêu cầu hoàn tiền từ phía Buyer (POST order/buyer/refund)
@freezed
abstract class BuyerRefundRequest with _$BuyerRefundRequest {
  const factory BuyerRefundRequest({
    @JsonKey(name: 'order_id') required String orderId,
    required String reason,
    required List<RefundAttachment> attachments,
  }) = _BuyerRefundRequest;

  factory BuyerRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$BuyerRefundRequestFromJson(json);
}

/// DTO Seller khiếu nại lên Mod/Admin (POST order/refunds/{id}/dispute)
@freezed
abstract class SellerDisputeRequest with _$SellerDisputeRequest {
  const factory SellerDisputeRequest({
    required String reason,
    required List<RefundAttachment> attachments,
  }) = _SellerDisputeRequest;

  factory SellerDisputeRequest.fromJson(Map<String, dynamic> json) =>
      _$SellerDisputeRequestFromJson(json);
}

/// Thông tin tranh chấp do Admin phán quyết
@freezed
abstract class RefundDisputeModel with _$RefundDisputeModel {
  const factory RefundDisputeModel({
    required String id,
    @JsonKey(name: 'refund_id') String? refundId,
    @Default('Pending') String status, // 'Pending', 'Uheld', 'Dismissed'
    @JsonKey(name: 'seller_reason') String? sellerReason,
    @JsonKey(name: 'seller_attachments')
    @Default([])
    List<RefundAttachment> sellerAttachments,
    @JsonKey(name: 'admin_note') String? adminNote,
    @JsonKey(name: 'resolved_at') String? resolvedAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _RefundDisputeModel;

  factory RefundDisputeModel.fromJson(Map<String, dynamic> json) =>
      _$RefundDisputeModelFromJson(json);
}

/// Model lưu giữ đầy đủ thông tin của đơn hoàn tiền (Refund Request)
@freezed
abstract class RefundModel with _$RefundModel {
  const RefundModel._();

  const factory RefundModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'buyer_id') String? buyerId,
    @JsonKey(name: 'seller_id') String? sellerId,
    @Default('AwaitingSellerReview')
    String
    status, // 'Shipping', 'AwaitingSellerReview', 'Accepted', 'Disputed', 'Withdrawn', 'AutoRefunded'
    required String reason,
    @Default([]) List<RefundAttachment> attachments,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'expires_at')
    String? expiresAt, // Hạn chót 3 ngày Seller phải phản hồi
    @JsonKey(name: 'seller_response') String? sellerResponse,
    RefundDisputeModel? dispute,
  }) = _RefundModel;

  factory RefundModel.fromJson(Map<String, dynamic> json) =>
      _$RefundModelFromJson(json);

  /// Kiểm tra Buyer có được quyền rút yêu cầu hoàn tiền hay không
  /// (Chỉ cho phép khi đơn ở trạng thái Shipping hoặc mới tạo chưa chuyển sang AwaitingSellerReview/Disputed)
  bool get canBuyerWithdraw {
    final lowerStatus = status.toLowerCase();
    return lowerStatus == 'shipping';
  }

  /// Đơn hoàn tiền đang chờ phản hồi từ phía Seller trong hạn 3 ngày
  bool get isAwaitingSellerReview {
    final lowerStatus = status.toLowerCase();
    return lowerStatus == 'awaitingsellerreview' || lowerStatus == 'pending';
  }

  /// Seller đã từ chối và khiếu nại lên Admin -> Trạng thái chuyển sang Disputed
  bool get isDisputed {
    final lowerStatus = status.toLowerCase();
    return lowerStatus == 'disputed' || lowerStatus == 'awaitingadminreview';
  }

  /// Trong lúc chờ phán quyết từ Mod (Disputed), cả Buyer và Seller bị khóa tương tác
  bool get isLockedForInteraction => isDisputed;

  /// Đã hoàn tất xử lý (Chấp nhận, từ chối hoàn toàn, hoặc đã rút)
  bool get isResolved {
    final lowerStatus = status.toLowerCase();
    return lowerStatus == 'accepted' ||
        lowerStatus == 'approved' ||
        lowerStatus == 'rejected' ||
        lowerStatus == 'withdrawn' ||
        lowerStatus == 'autorefunded';
  }
}
