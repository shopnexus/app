import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_feedback.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/rating_repository.dart';

part 'order_feedback_provider.g.dart';

/// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
///
/// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
/// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
/// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.
@riverpod
Future<OrderFeedback> orderFeedback(Ref ref, String orderId) =>
    ref.watch(ratingRepositoryProvider).orderFeedback(orderId);

/// Những đơn đã mời đánh giá trong phiên này.
///
/// `keepAlive` vì đây là *ký ức của phiên*, không phải state của một màn: người
/// dùng đóng hộp thoại rồi mở lại đúng cái đơn đó thì không được bị hỏi lần nữa,
/// mà provider của màn thì chết theo màn. Không lưu xuống ổ đĩa: mở app lại là
/// một phiên khác, và một lời mời mỗi phiên cho một đơn chưa đánh giá là lời mời
/// chứ không phải cái nag.
@Riverpod(keepAlive: true)
class RateInvitesShown extends _$RateInvitesShown {
  @override
  Set<String> build() => const {};

  bool alreadyShown(String orderId) => state.contains(orderId);

  void markShown(String orderId) {
    state = {...state, orderId};
  }
}
