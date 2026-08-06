import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/models/kyc_model.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/repositories/kyc_repository.dart';

part 'selling_gate_provider.g.dart';

/// Bốn câu trả lời cho "tôi đăng bán được chưa", vì bốn câu đó cần bốn cách nói
/// khác nhau — chưa nộp thì mở form định danh, đang chờ thì nói rõ đang chờ, bị
/// từ chối thì nói lý do và cho nộp lại.
enum SellingGate { allowed, notStarted, pending, rejected }

class SellingEligibility {
  const SellingEligibility(this.gate, {this.rejectionReason});

  final SellingGate gate;

  /// Lý do server/vendor đã ghi. Người bị từ chối mà không được biết vì sao thì
  /// chỉ có thể nộp lại đúng hồ sơ vừa bị từ chối.
  final String? rejectionReason;

  bool get allowed => gate == SellingGate.allowed;
}

/// Server chặn đăng tin nếu chưa định danh (`identity_required`, 422). App phải
/// biết điều đó *trước* khi mở form: chụp ảnh, tải lên, ghi âm, đợi model chạy
/// rồi mới bị từ chối là bắt người ta trả toàn bộ công sức cho một câu "không".
///
/// `identity_verified` là nguồn duy nhất cho "được bán", đúng cái cờ server đọc.
/// Trạng thái hồ sơ chỉ dùng để *nói* — vì một hồ sơ `verified` nhưng đã hết hạn
/// vẫn làm `identity_verified` false, và lúc đó việc cần làm là nộp lại.
@riverpod
Future<SellingEligibility> sellingEligibility(Ref ref) async {
  final me = await ref.watch(profileProvider.future);
  if (me.identityVerified) return const SellingEligibility(SellingGate.allowed);

  final document = await ref.watch(kycRepositoryProvider).getKycStatus(me.id);
  return switch (document?.status) {
    IdentityStatus.pending => const SellingEligibility(SellingGate.pending),
    IdentityStatus.rejected => SellingEligibility(
      SellingGate.rejected,
      rejectionReason: document?.rejectionReason,
    ),
    // Không có hồ sơ, hoặc có một hồ sơ `verified` đã hết hạn: việc cần làm là
    // như nhau, nộp một hồ sơ mới.
    _ => const SellingEligibility(SellingGate.notStarted),
  };
}
