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
      _$RefundAttachmentFromJson(RefundAttachment._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);
    if (modified.containsKey('url') && !modified.containsKey('resource')) {
      modified['resource'] = json;
      if (json['id'] != null) {
        modified['resource_id'] = json['id'];
      }
    }
    return modified;
  }
}

/// OpenAPI CreateRefundRequest (POST /orders/{id}/refunds)
@freezed
abstract class CreateRefundRequest with _$CreateRefundRequest {
  const factory CreateRefundRequest({
    required String reason,
    @Default([]) List<String> attachments,
  }) = _CreateRefundRequest;

  factory CreateRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRefundRequestFromJson(json);
}

/// DTO gửi yêu cầu hoàn tiền từ phía Buyer (Legacy DTO)
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

/// OpenAPI RejectRefundRequest (POST /refunds/{id}/rejection)
@freezed
abstract class RejectRefundRequest with _$RejectRefundRequest {
  const factory RejectRefundRequest({
    required String reason,
  }) = _RejectRefundRequest;

  factory RejectRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectRefundRequestFromJson(json);
}

/// OpenAPI OpenDisputeRequest (POST /refunds/{id}/dispute)
@freezed
abstract class OpenDisputeRequest with _$OpenDisputeRequest {
  const factory OpenDisputeRequest({
    required String reason,
  }) = _OpenDisputeRequest;

  factory OpenDisputeRequest.fromJson(Map<String, dynamic> json) =>
      _$OpenDisputeRequestFromJson(json);
}

/// DTO Seller khiếu nại lên Mod/Admin (Legacy DTO)
@freezed
abstract class SellerDisputeRequest with _$SellerDisputeRequest {
  const factory SellerDisputeRequest({
    required String reason,
    required List<RefundAttachment> attachments,
  }) = _SellerDisputeRequest;

  factory SellerDisputeRequest.fromJson(Map<String, dynamic> json) =>
      _$SellerDisputeRequestFromJson(json);
}

/// OpenAPI AddAttachmentsRequest (POST /refunds/{id}/attachments)
@freezed
abstract class AddAttachmentsRequest with _$AddAttachmentsRequest {
  const factory AddAttachmentsRequest({
    required List<String> attachments,
  }) = _AddAttachmentsRequest;

  factory AddAttachmentsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAttachmentsRequestFromJson(json);
}

/// OpenAPI DisputeRulingRequest (POST /admin/disputes/{id}/ruling)
@freezed
abstract class DisputeRulingRequest with _$DisputeRulingRequest {
  const factory DisputeRulingRequest({
    @JsonKey(name: 'buyer_wins') required bool buyerWins,
    String? note,
  }) = _DisputeRulingRequest;

  factory DisputeRulingRequest.fromJson(Map<String, dynamic> json) =>
      _$DisputeRulingRequestFromJson(json);
}

/// Model Tranh chấp RefundDispute (OpenAPI /admin/disputes & /refunds/{id}/dispute)
@freezed
abstract class RefundDisputeModel with _$RefundDisputeModel {
  const RefundDisputeModel._();

  const factory RefundDisputeModel({
    required String id,
    @JsonKey(name: 'refund_id') String? refundId,
    @JsonKey(name: 'opened_by') String? openedBy,
    String? reason,
    dynamic round,
    @Default('open') String status, // 'open', 'seller-wins', 'buyer-wins'
    String? note,
    @JsonKey(name: 'ruled_at') String? ruledAt,
    @JsonKey(name: 'created_at') String? createdAt,
    // Backward compatibility fields
    @JsonKey(name: 'seller_reason') String? legacySellerReason,
    @JsonKey(name: 'seller_attachments')
    @Default([])
    List<RefundAttachment> sellerAttachments,
    @JsonKey(name: 'admin_note') String? legacyAdminNote,
    @JsonKey(name: 'resolved_at') String? legacyResolvedAt,
  }) = _RefundDisputeModel;

  factory RefundDisputeModel.fromJson(Map<String, dynamic> json) =>
      _$RefundDisputeModelFromJson(json);

  String get sellerReason => legacySellerReason ?? reason ?? '';
  String? get adminNote => note ?? legacyAdminNote;
  String? get resolvedAt => ruledAt ?? legacyResolvedAt;
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
    @Default('awaiting-seller-review')
    String
    status, // 'awaiting-seller-review', 'awaiting-buyer-action', 'disputed', 'returning', 'returned', 'accepted', 'rejected', 'cancelled'
    required String reason,
    @Default([]) List<RefundAttachment> attachments,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deadline_at') String? deadlineAt,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'returned_at') String? returnedAt,
    @JsonKey(name: 'seller_decided_at') String? sellerDecidedAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    // Backward compatibility fields
    @JsonKey(name: 'expires_at') String? legacyExpiresAt,
    @JsonKey(name: 'seller_response') String? legacySellerResponse,
    RefundDisputeModel? dispute,
  }) = _RefundModel;

  factory RefundModel.fromJson(Map<String, dynamic> json) =>
      _$RefundModelFromJson(json);

  String? get expiresAt => deadlineAt ?? legacyExpiresAt;
  String? get sellerResponse => rejectionReason ?? legacySellerResponse;

  /// Kiểm tra Buyer có được quyền rút yêu cầu hoàn tiền hay không
  bool get canBuyerWithdraw {
    final lower = status.toLowerCase();
    return lower == 'awaiting-seller-review' ||
        lower == 'awaitingsellerreview' ||
        lower == 'shipping';
  }

  /// Đơn hoàn tiền đang chờ phản hồi từ phía Seller
  bool get isAwaitingSellerReview {
    final lower = status.toLowerCase();
    return lower == 'awaiting-seller-review' ||
        lower == 'awaitingsellerreview' ||
        lower == 'pending';
  }

  /// Trạng thái đã leo thang tranh chấp
  bool get isDisputed {
    final lower = status.toLowerCase();
    return lower == 'disputed' || lower == 'awaitingadminreview';
  }

  /// Trong lúc chờ phán quyết từ Mod (Disputed), cả Buyer và Seller bị khóa tương tác
  bool get isLockedForInteraction => isDisputed;

  /// Đã hoàn tất xử lý
  bool get isResolved {
    final lower = status.toLowerCase();
    return lower == 'accepted' ||
        lower == 'approved' ||
        lower == 'rejected' ||
        lower == 'cancelled' ||
        lower == 'withdrawn' ||
        lower == 'autorefunded';
  }
}
