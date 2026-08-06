import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/reputation_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';

part 'my_reviews_provider.g.dart';

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
@riverpod
Future<List<Feedback>> myFeedback(Ref ref, ReputationRole role) async {
  final me = await ref.watch(profileProvider.future);
  return ref
      .watch(reputationRepositoryProvider)
      .receivedBy(accountId: me.id, role: role);
}

/// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
/// người bán bằng, thay cho một câu quảng cáo viết cứng.
@riverpod
Future<Reputation> sellerReputation(Ref ref, String accountId) => ref
    .watch(reputationRepositoryProvider)
    .reputation(accountId: accountId, role: ReputationRole.seller);
