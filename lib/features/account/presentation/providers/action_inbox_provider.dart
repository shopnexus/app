import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_dashboard_provider.dart';

part 'action_inbox_provider.g.dart';

/// Một nguồn hỏng chỉ mất phần của nó. Khối việc-cần-làm gom bốn nguồn không liên
/// quan nhau, và một `Future.wait` trần sẽ để hộp thư chat hỏng xoá luôn cảnh
/// báo đơn chờ giao của người bán — đúng kiểu hỏng đã phải sửa một lần ở
/// profile_screen, nơi một lần đọc summary hỏng từng làm biến mất toàn bộ lối
/// vào khu người bán.
Future<int> countOrZero(Future<int> Function() read) async {
  try {
    return await read();
  } catch (_) {
    return 0;
  }
}

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Đây là bản tạm cho phần đơn hàng: `summary.open` đếm mọi đơn còn mở trong cửa
/// sổ thời gian của dashboard, nên nó vừa rộng hơn "chờ tôi giao" vừa bỏ sót đơn
/// cũ hơn cửa sổ đó. Khi `OrderStatus` lên (kế hoạch riêng), đổi nguồn sang
/// `?action_required=true` là con số thành đúng nghĩa và hết phụ thuộc cửa sổ.
@riverpod
Future<ActionInbox> actionInbox(Ref ref) async {
  final repository = ref.watch(refundRepositoryProvider);

  final (ordersToShip, refundsAsSeller, unreadMessages) =
      await (
        countOrZero(() async {
          final dashboard = await ref.watch(sellerDashboardProvider.future);
          return dashboard.summary.open;
        }),
        // Lọc phía server: `/refunds` phân trang bằng cursor, nên đếm trên trang
        // đầu sẽ báo 0 cho một người bán vừa đóng 20 vụ và còn 3 vụ chờ duyệt.
        countOrZero(
          () => _countRefunds(
            repository,
            role: RefundRole.seller,
            status: RefundStatus.awaitingSellerReview,
          ),
        ),
        countOrZero(() async {
          final unread = await ref.watch(chatRepositoryProvider).unreadCount();
          return unread.unread;
        }),
      ).wait;

  return ActionInbox(
    ordersToShip: ordersToShip,
    refundsAsSeller: refundsAsSeller,
    unreadMessages: unreadMessages,
  );
}

/// Đếm hết chứ không chỉ trang đầu. Route trả cursor và không trả tổng, nên con
/// số duy nhất đúng là đi hết các trang; chặn ở [maxPages] để một hàng đợi bất
/// thường không giữ màn hình tài khoản mãi không vẽ.
Future<int> _countRefunds(
  RefundRepository repository, {
  required RefundRole role,
  required RefundStatus status,
  int maxPages = 5,
}) async {
  var total = 0;
  String? cursor;

  for (var page = 0; page < maxPages; page++) {
    final result = await repository.list(
      role: role,
      status: status,
      cursor: cursor,
    );
    total += result.refunds.length;
    cursor = result.nextCursor;
    if (cursor == null || result.refunds.isEmpty) break;
  }

  return total;
}
