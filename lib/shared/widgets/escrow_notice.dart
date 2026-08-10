import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';

/// Câu nói rằng tiền đang ở chỗ ShopNexus, không ở chỗ người bán.
///
/// Giữ tiền hộ là thứ đáng tin nhất sản phẩm này có, và trước đây app chỉ nói
/// điều đó trong một câu FAQ — đúng chỗ không ai đọc, và không nói ở chỗ người
/// mua vừa chuyển tiền đi cho một người lạ.
///
/// Câu "hoàn đủ, gồm cả phí giao" là đúng theo server: cả `DeclineOrder` lẫn
/// đường quá hạn đều hoàn escrow *cộng* `transport.fee`, vì kiện hàng chưa đi.
class EscrowNotice extends StatelessWidget {
  const EscrowNotice({
    super.key,
    required this.amount,
    required this.currency,
    this.remaining,
  });

  /// Số tiền đang được giữ, lấy từ đơn hoặc từ phiên thanh toán.
  final int amount;
  final String currency;

  /// "còn 31 giờ" khi đã biết hạn của đơn. Không biết thì câu nói về 48 giờ —
  /// ngay sau khi trả tiền thì đơn còn chưa đọc về, nên chưa có hạn để đếm.
  final String? remaining;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF34D399) : const Color(0xFF047857);
    final window = remaining == null
        ? 'Người bán có 48 giờ để xác nhận.'
        : 'Người bán $remaining để xác nhận.';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF059669).withAlpha(30)
            : const Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent.withAlpha(60)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_rounded, size: 18, color: accent),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  height: 1.5,
                  color: theme.colorScheme.onSurface,
                ),
                children: [
                  TextSpan(
                    text:
                        'ShopNexus đang giữ '
                        '${MoneyUtils.format(amount, currency: currency)}.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: accent,
                    ),
                  ),
                  TextSpan(text: ' $window '),
                  const TextSpan(
                    text:
                        'Chưa xác nhận thì bạn được hoàn đủ, gồm cả phí giao.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
