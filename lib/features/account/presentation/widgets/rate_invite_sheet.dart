import 'package:flutter/material.dart';

/// Lời mời đánh giá, mở ra ngay lúc một đơn vừa hoàn tất.
///
/// Không phải một bản sao thu nhỏ của biểu mẫu đánh giá, mà là *một câu hỏi*:
/// "người bán này thế nào". Hàng sao **chính là** cái nút — chạm vào một ngôi sao
/// là vừa nhận lời mời vừa trả lời luôn câu hỏi, rồi biểu mẫu mở ra với đúng số
/// sao đó đã điền. Một hộp thoại có nút "Đánh giá ngay" rồi mới hỏi số sao là bắt
/// người ta trả giá cho cùng một việc hai lần.
///
/// Nói ra tính *kín* của đánh giá ngay tại đây, vì đó là thứ khiến người ta dám
/// chấm thật: người bán không thấy điểm của bạn cho tới khi họ cũng chấm, hoặc
/// tới khi hết 14 ngày.
class RateInviteSheet extends StatefulWidget {
  const RateInviteSheet({super.key, required this.sellerName});

  final String sellerName;

  /// Trả về số sao người mua vừa chạm, hoặc null khi họ để sau.
  static Future<int?> show(BuildContext context, {required String sellerName}) {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RateInviteSheet(sellerName: sellerName),
    );
  }

  @override
  State<RateInviteSheet> createState() => _RateInviteSheetState();
}

class _RateInviteSheetState extends State<RateInviteSheet> {
  static const _labels = [
    'Rất tệ',
    'Không hài lòng',
    'Tạm được',
    'Hài lòng',
    'Tuyệt vời',
  ];

  /// Ngôi sao đang được nhấn. Chỉ để hàng sao phản hồi dưới ngón tay — chạm xong
  /// là sheet đóng, nên đây không phải một lựa chọn được giữ.
  int _pressed = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giao dịch với ${widget.sellerName} thế nào?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Đơn đã hoàn tất. Đánh giá là kín: người bán chỉ thấy điểm của bạn '
            'khi họ cũng đánh giá, hoặc sau 14 ngày.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // Hàng sao là cái nút: chạm một ngôi sao là mở biểu mẫu với số sao ấy.
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var star = 1; star <= 5; star++)
                      IconButton(
                        tooltip: _labels[star - 1],
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 52,
                          minHeight: 52,
                        ),
                        onPressed: () {
                          setState(() => _pressed = star);
                          Navigator.pop(context, star);
                        },
                        icon: Icon(
                          star <= _pressed
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 36,
                          color: star <= _pressed
                              ? const Color(0xFFF59E0B)
                              : theme.colorScheme.outlineVariant,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _pressed == 0 ? 'Chạm để chọn số sao' : _labels[_pressed - 1],
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Để sau'),
            ),
          ),
        ],
      ),
    );
  }
}
