import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/dispute_model.dart';

part 'dispute_state.freezed.dart';

/// Trạng thái Form đăng ký hoàn tiền của Buyer
@freezed
abstract class BuyerRefundFormState with _$BuyerRefundFormState {
  const BuyerRefundFormState._();

  const factory BuyerRefundFormState({
    @Default('') String orderId,
    @Default('') String reason,
    @Default([]) List<RefundAttachment> attachments,
    @Default(false) bool isUploadingMedia,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _BuyerRefundFormState;

  /// Validation: Bắt buộc có lý do và ít nhất 1 ảnh bằng chứng đính kèm
  bool get isValid => reason.trim().isNotEmpty && attachments.isNotEmpty;
}

/// Trạng thái Form Seller từ chối & khiếu nại lên Admin Mod
@freezed
abstract class SellerDisputeFormState with _$SellerDisputeFormState {
  const SellerDisputeFormState._();

  const factory SellerDisputeFormState({
    @Default('') String refundId,
    @Default('') String reason,
    @Default([]) List<RefundAttachment> attachments,
    @Default(false) bool isUploadingMedia,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _SellerDisputeFormState;

  /// Validation: Bắt buộc có lý do từ chối và ít nhất 1 ảnh bằng chứng đính kèm
  bool get isValid => reason.trim().isNotEmpty && attachments.isNotEmpty;
}

/// Trạng thái tổng quan quản lý tranh chấp & hoàn tiền
@freezed
abstract class DisputeState with _$DisputeState {
  const DisputeState._();

  const factory DisputeState({
    @Default([]) List<RefundModel> refunds,
    RefundModel? selectedRefund,
    @Default([]) List<RefundDisputeModel> disputes,
    String? filterStatus,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DisputeState;
}
