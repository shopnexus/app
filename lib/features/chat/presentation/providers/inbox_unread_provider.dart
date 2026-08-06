import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';

part 'inbox_unread_provider.g.dart';

/// Số chưa đọc của Hộp thư, và **chỉ** của Hộp thư: tin nhắn chưa đọc cộng thông
/// báo chưa đọc, đúng hai thứ mà hai tab của nó chứa.
///
/// Không dùng `ActionInbox.total` cho badge này. `total` còn cộng đơn chờ giao và
/// hoàn tiền chờ duyệt — hai thứ không nằm trong Hộp thư — nên một badge "3" đưa
/// người dùng vào Hộp thư để thấy 1 tin nhắn. Badge là kênh thông báo duy nhất ở
/// đây (không push, không SMS), nên nó nói sai ngay lần đầu là mất luôn niềm tin
/// vào mọi lần sau. "Chưa đọc" và "chưa làm" là hai đại lượng khác nhau: con số
/// việc-cần-làm sống trong khối của nó ở trang Tài khoản, sau một lần chạm.
///
/// Mỗi nguồn bọc [countOrZero] riêng: chat hỏng không được xoá số thông báo, vì
/// một badge biến mất và một badge bằng 0 trông giống nhau với người dùng.
@riverpod
Future<int> inboxUnread(Ref ref) async {
  final chat = ref.watch(chatRepositoryProvider);
  // Đọc trước khi `await` — sau điểm await thì `ref.watch` không còn hợp lệ.
  final notifications = ref.watch(unreadNotificationsCountProvider.future);

  final (messages, activity) = await (
    countOrZero(() async => (await chat.unreadCount()).unread),
    countOrZero(() => notifications),
  ).wait;

  return messages + activity;
}
