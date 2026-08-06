import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
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

  /// Uy tín của một tài khoản ở một vai. Server trả zero chứ không trả 404 cho
  /// người chưa ai đánh giá, nên "chưa có đánh giá" là `rating_count == 0` —
  /// một con số, không phải một lỗi phải bắt.
  ///
  /// `rating_average` là điểm giao dịch, tách khỏi `review_rating_*` là điểm sản
  /// phẩm: một đơn sinh ra được cả hai, gộp lại là đếm đơn đó hai lần.
  Future<Reputation> reputation({
    required String accountId,
    required ReputationRole role,
  }) async {
    final reputation = (await _trustApi.accountsAccountIDReputationGet(
      accountID: accountId,
      role: role,
    )).data?.data;
    if (reputation == null) throw StateError('empty reputation');
    return reputation;
  }
}

@riverpod
ReputationRepository reputationRepository(Ref ref) =>
    ReputationRepository(ref.watch(trustApiProvider));
