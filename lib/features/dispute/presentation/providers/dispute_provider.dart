import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/dispute_model.dart';
import '../../data/repositories/dispute_repository.dart';
import 'dispute_state.dart';

part 'dispute_provider.g.dart';

/// Provider quản lý danh sách & trạng thái chuyển đổi của Đơn Hoàn tiền / Tranh chấp
@riverpod
class DisputeNotifier extends _$DisputeNotifier {
  @override
  FutureOr<DisputeState> build() async {
    final repository = ref.watch(disputeRepositoryProvider);
    final refunds = await repository.getSellerRefunds();
    return DisputeState(refunds: refunds);
  }

  /// Lấy danh sách các đơn hoàn tiền (hỗ trợ lọc theo trạng thái)
  Future<void> fetchRefunds({String? status}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(disputeRepositoryProvider);
      final refunds = await repository.getSellerRefunds();
      if (status != null && status.isNotEmpty) {
        final filtered = refunds
            .where((r) => r.status.toLowerCase() == status.toLowerCase())
            .toList();
        return DisputeState(refunds: filtered, filterStatus: status);
      }
      return DisputeState(refunds: refunds);
    });
  }

  /// Lấy chi tiết thông tin đơn hoàn tiền & lịch sử đối chất Admin
  Future<void> fetchRefundDetail(String refundId) async {
    final repository = ref.read(disputeRepositoryProvider);
    final refund = await repository.getRefundById(refundId);
    final disputes = await repository.getDisputesByRefund(refundId);

    final currentState = state.value ?? const DisputeState();
    state = AsyncValue.data(
      currentState.copyWith(selectedRefund: refund, disputes: disputes),
    );
  }

  /// Buyer rút yêu cầu hoàn tiền (Chỉ hợp lệ khi ở trạng thái Shipping)
  Future<bool> withdrawBuyerRefund(String refundId) async {
    final repository = ref.read(disputeRepositoryProvider);
    try {
      final updatedRefund = await repository.withdrawBuyerRefund(refundId);
      final currentState = state.value ?? const DisputeState();
      final updatedList = currentState.refunds.map((r) {
        return r.id == refundId ? updatedRefund : r;
      }).toList();

      state = AsyncValue.data(
        currentState.copyWith(
          refunds: updatedList,
          selectedRefund: currentState.selectedRefund?.id == refundId
              ? updatedRefund
              : currentState.selectedRefund,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Seller chấp nhận yêu cầu hoàn tiền trong vòng 3 ngày
  Future<bool> sellerApproveRefund(String refundId) async {
    final repository = ref.read(disputeRepositoryProvider);
    try {
      final updatedRefund = await repository.sellerApproveRefund(refundId);
      final currentState = state.value ?? const DisputeState();
      final updatedList = currentState.refunds.map((r) {
        return r.id == refundId ? updatedRefund : r;
      }).toList();

      state = AsyncValue.data(
        currentState.copyWith(
          refunds: updatedList,
          selectedRefund: currentState.selectedRefund?.id == refundId
              ? updatedRefund
              : currentState.selectedRefund,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// Provider quản lý Form tạo yêu cầu hoàn tiền của Buyer
@riverpod
class BuyerRefundFormNotifier extends _$BuyerRefundFormNotifier {
  @override
  BuyerRefundFormState build() {
    return const BuyerRefundFormState();
  }

  void init(String orderId) {
    state = state.copyWith(orderId: orderId, errorMessage: null);
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason, errorMessage: null);
  }

  /// Upload ảnh/bằng chứng bất đồng bộ và thêm vào mảng attachments
  Future<void> uploadAndAddAttachment(String filePath) async {
    state = state.copyWith(isUploadingMedia: true, errorMessage: null);
    try {
      final repository = ref.read(disputeRepositoryProvider);
      final resource = await repository.uploadEvidenceFile(filePath);
      final attachment = RefundAttachment(
        resourceId: resource.id,
        description: resource.description ?? 'Ảnh bằng chứng',
        resource: resource,
      );

      final updatedAttachments = [...state.attachments, attachment];
      state = state.copyWith(
        attachments: updatedAttachments,
        isUploadingMedia: false,
      );
    } catch (e) {
      state = state.copyWith(
        isUploadingMedia: false,
        errorMessage: 'Tải ảnh bằng chứng thất bại: ${e.toString()}',
      );
    }
  }

  void removeAttachment(int index) {
    if (index >= 0 && index < state.attachments.length) {
      final updated = [...state.attachments]..removeAt(index);
      state = state.copyWith(attachments: updated);
    }
  }

  /// Gửi đơn hoàn tiền (Bắt buộc phải hợp lệ isValid)
  Future<RefundModel?> submit() async {
    if (!state.isValid) {
      state = state.copyWith(
        errorMessage:
            'Vui lòng nhập lý do và đính kèm ít nhất 1 ảnh bằng chứng.',
      );
      return null;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final repository = ref.read(disputeRepositoryProvider);
      final request = BuyerRefundRequest(
        orderId: state.orderId,
        reason: state.reason,
        attachments: state.attachments,
      );

      final refund = await repository.createBuyerRefund(request);
      state = state.copyWith(isSubmitting: false);
      // Invalidate danh sách tranh chấp để cập nhật UI tự động
      ref.invalidate(disputeProvider);
      return refund;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Gửi yêu cầu hoàn tiền thất bại: ${e.toString()}',
      );
      return null;
    }
  }
}

/// Provider quản lý Form Seller từ chối & khiếu nại lên Admin Mod
@riverpod
class SellerDisputeFormNotifier extends _$SellerDisputeFormNotifier {
  @override
  SellerDisputeFormState build() {
    return const SellerDisputeFormState();
  }

  void init(String refundId) {
    state = state.copyWith(refundId: refundId, errorMessage: null);
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason, errorMessage: null);
  }

  /// Upload ảnh/bằng chứng bất đồng bộ và thêm vào mảng attachments
  Future<void> uploadAndAddAttachment(String filePath) async {
    state = state.copyWith(isUploadingMedia: true, errorMessage: null);
    try {
      final repository = ref.read(disputeRepositoryProvider);
      final resource = await repository.uploadEvidenceFile(filePath);
      final attachment = RefundAttachment(
        resourceId: resource.id,
        description: resource.description ?? 'Ảnh bằng chứng đối chất',
        resource: resource,
      );

      final updatedAttachments = [...state.attachments, attachment];
      state = state.copyWith(
        attachments: updatedAttachments,
        isUploadingMedia: false,
      );
    } catch (e) {
      state = state.copyWith(
        isUploadingMedia: false,
        errorMessage: 'Tải ảnh bằng chứng thất bại: ${e.toString()}',
      );
    }
  }

  void removeAttachment(int index) {
    if (index >= 0 && index < state.attachments.length) {
      final updated = [...state.attachments]..removeAt(index);
      state = state.copyWith(attachments: updated);
    }
  }

  /// Gửi khiếu nại lên Admin Mod (Bắt buộc phải hợp lệ isValid)
  Future<RefundDisputeModel?> submit() async {
    if (!state.isValid) {
      state = state.copyWith(
        errorMessage:
            'Vui lòng nhập lý do đối chất và đính kèm ít nhất 1 ảnh bằng chứng.',
      );
      return null;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final repository = ref.read(disputeRepositoryProvider);
      final request = SellerDisputeRequest(
        reason: state.reason,
        attachments: state.attachments,
      );

      final dispute = await repository.sellerDisputeRefund(
        state.refundId,
        request,
      );
      state = state.copyWith(isSubmitting: false);
      // Invalidate danh sách tranh chấp để cập nhật UI tự động
      ref.invalidate(disputeProvider);
      return dispute;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Gửi khiếu nại thất bại: ${e.toString()}',
      );
      return null;
    }
  }
}
