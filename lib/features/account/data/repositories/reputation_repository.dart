import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';

part 'reputation_repository.g.dart';

/// Đánh giá một tài khoản **nhận được**, tách theo vai đã đứng trong giao dịch.
///
/// Chỉ có chiều này. `GET /accounts/{id}/feedback` là endpoint duy nhất trả một
/// danh sách feedback, và `direction` trên bản ghi được server suy ra từ phía
/// người gọi đứng trong đơn chứ không nhận làm bộ lọc — nên "đánh giá tôi đã
/// viết" không đọc được bằng một lời gọi nào.
///
/// Tách khỏi `AccountRepository` vì đó là repository của hồ sơ và đơn hàng, đã
/// giữ bốn API client; uy tín là một trách nhiệm khác và chỉ cần `TrustApi`.
class ReputationRepository {
  ReputationRepository(this._trustApi);

  final TrustApi _trustApi;

  /// Chỉ trả về các bản đã publish — một đánh giá còn trong cửa sổ ẩn danh thì
  /// không ai ngoài người viết thấy được, kể cả người bị đánh giá.
  Future<List<Feedback>> receivedBy({
    required String accountId,
    required ReputationRole role,
    int limit = 20,
  }) async {
    final page = await _trustApi.accountsAccountIDFeedbackGet(
      accountID: accountId,
      role: role,
      limit: limit,
    );
    return page.data?.data ?? const [];
  }
}

@riverpod
ReputationRepository reputationRepository(Ref ref) =>
    ReputationRepository(ref.watch(trustApiProvider));
