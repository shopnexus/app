import 'package:flutter_riverpod/flutter_riverpod.dart';
// `Feedback` cũng là một class của Flutter Material (haptic feedback), nên tên
// trần ở đây là mơ hồ.
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart' as api;
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/reputation_repository.dart';

/// Uy tín của **một tài khoản bất kỳ** ở một vai.
///
/// `myFeedbackProvider` cạnh đây chỉ đọc được của chính mình vì nó lấy id từ hồ
/// sơ; nhưng cả hai endpoint đều công khai — trang của người khác đọc được đúng
/// những gì họ đã nhận, và đó là toàn bộ lý do một trang công khai tồn tại.
///
/// Khoá bằng record chứ không bằng hai provider riêng: record so sánh theo giá
/// trị, nên `(id, seller)` và `(id, buyer)` là hai entry khác nhau và không cái
/// nào ghi đè cái nào.
typedef ReputationQuery = ({String accountId, ReputationRole role});

/// Chỉ các bản đã publish — bản còn trong cửa sổ mù thì không ai ngoài người
/// viết thấy được, kể cả người bị đánh giá.
final accountFeedbackProvider = FutureProvider.autoDispose
    .family<List<api.Feedback>, ReputationQuery>((ref, query) {
      return ref
          .watch(reputationRepositoryProvider)
          .receivedBy(accountId: query.accountId, role: query.role);
    });

/// Zero chứ không phải 404 cho người chưa ai đánh giá, nên "chưa có đánh giá"
/// là `ratingCount == 0` — một con số, không phải một lỗi phải bắt.
final accountReputationProvider = FutureProvider.autoDispose
    .family<Reputation, ReputationQuery>((ref, query) {
      return ref
          .watch(reputationRepositoryProvider)
          .reputation(accountId: query.accountId, role: query.role);
    });
