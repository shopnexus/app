import 'package:flutter/material.dart';

/// Ai đang giữ lượt — cách sắp xếp thay cho "Tôi mua | Tôi bán".
///
/// Vai không bao giờ là câu hỏi. Không ai mở app với ý "xem phần tôi bán"; họ mở
/// vì có việc cần họ. Và vai đã nằm trong câu mô tả việc rồi: "Xác nhận đơn của
/// Minh" chỉ có thể là mình bán, "Xác nhận đã nhận hàng" chỉ có thể là mình mua —
/// nên gọi tên vai là nhắc lại thứ động từ đã nói.
///
/// Xếp theo lượt cũng đặt hạn 48 giờ của xác nhận đơn và hạn 12 giờ của một đề
/// nghị lên **cùng một trục**, đúng bản chất: cả hai đều là "không làm thì mất".
/// Trước đây chúng ở hai màn sau hai segment khác nhau, nên cái gấp hơn có thể
/// hoàn toàn không được nhìn thấy.
enum WaitingSide {
  /// Có một cái đồng hồ chỉ vào mình.
  you,

  /// Bên kia, đơn vị vận chuyển, hay ShopNexus đang giữ lượt.
  other,

  /// Đã xong, không còn ai phải làm gì.
  done,
}

/// Nhãn của một nhóm. `XONG` mang theo số lượng vì nó bị gấp lại.
String waitingGroupTitle(WaitingSide side, int count) => switch (side) {
  WaitingSide.you => 'CẦN BẠN',
  WaitingSide.other => 'ĐANG CHỜ',
  WaitingSide.done => 'XONG ($count)',
};

class WaitingGroupHeader extends StatelessWidget {
  const WaitingGroupHeader({
    super.key,
    required this.side,
    required this.count,
    this.trailing,
  });

  final WaitingSide side;
  final int count;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Chỉ nhóm cần mình được tô: một tiêu đề nào cũng đậm thì không tiêu đề nào đậm.
    final colour = side == WaitingSide.you
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              waitingGroupTitle(side, count),
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
                color: colour,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// Còn bao lâu, ngắn gọn — "còn 4g", "còn 12 phút", "đã quá hạn".
///
/// Đây là thứ quyết định thứ tự trong nhóm `CẦN BẠN`, nên nó phải đọc được trong
/// một cái nhìn: một dấu thời gian tuyệt đối buộc người đọc tự trừ.
String? remainingLabel(DateTime? deadline) {
  if (deadline == null) return null;
  final left = deadline.difference(DateTime.now());
  if (left.isNegative) return 'đã quá hạn';
  if (left.inHours >= 24) return 'còn ${left.inDays} ngày';
  if (left.inHours >= 1) return 'còn ${left.inHours} giờ';
  return 'còn ${left.inMinutes} phút';
}
