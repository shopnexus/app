import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';

/// Cách gọi tình trạng hàng, một chỗ duy nhất.
///
/// Người bán bị bắt buộc khai `condition` (`required,oneof=new used damaged` ở
/// server) và người mua từng không được biết — nên nó phải hiện ở cả thẻ tin lẫn
/// trang chi tiết, và hai chỗ đó phải gọi cùng một cái tên.
extension ListingConditionLabel on ListingCondition {
  String get label => switch (this) {
    ListingCondition.new_ => 'Mới',
    ListingCondition.used => 'Đã dùng',
    ListingCondition.damaged => 'Có lỗi / hỏng',
  };

  IconData get icon => switch (this) {
    ListingCondition.new_ => Icons.new_releases_outlined,
    ListingCondition.used => Icons.history_rounded,
    ListingCondition.damaged => Icons.report_problem_outlined,
  };
}

/// Nhãn tình trạng hàng. `damaged` vẽ màu cảnh báo vì đó là thứ người mua hàng
/// cũ cần thấy trước khi bấm mua, không phải sau khi mở kiện.
class ConditionBadge extends StatelessWidget {
  const ConditionBadge({super.key, required this.condition, this.dense = false});

  final ListingCondition condition;

  /// Bản gọn cho thẻ tin trong lưới, nơi mỗi pixel ngang đều phải trả giá.
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final warn = condition == ListingCondition.damaged;

    final fg = warn
        ? (isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309))
        : theme.colorScheme.onSurfaceVariant;
    final bg = warn
        ? (isDark
              ? const Color(0xFFD97706).withAlpha(40)
              : const Color(0xFFFEF3C7))
        : (isDark
              ? theme.colorScheme.surfaceContainerHighest
              : const Color(0xFFF1F5F9));

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 6 : 8,
        vertical: dense ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(dense ? 4 : 6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(condition.icon, size: dense ? 10 : 13, color: fg),
          SizedBox(width: dense ? 3 : 5),
          Text(
            condition.label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: dense ? 10 : 12,
              fontWeight: FontWeight.bold,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}
