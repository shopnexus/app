import 'package:flutter/material.dart';

/// Widget hiển thị badge trạng thái tranh chấp / hoàn tiền chuẩn hệ màu Stitch
class DisputeStatusBadge extends StatelessWidget {
  final String status;

  const DisputeStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final lowerStatus = status.toLowerCase();
    Color bgColor;
    Color textColor;
    IconData iconData;
    String labelText;

    switch (lowerStatus) {
      case 'shipping':
        bgColor = const Color(0xFFF1F5F9);
        textColor = const Color(0xFF475569);
        iconData = Icons.local_shipping_outlined;
        labelText = 'Đang vận chuyển';
        break;
      case 'awaitingsellerreview':
      case 'pending':
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        iconData = Icons.timer_outlined;
        labelText = 'Chờ Shop phản hồi (3 ngày)';
        break;
      case 'disputed':
      case 'awaitingadminreview':
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFDC2626);
        iconData = Icons.gavel_outlined;
        labelText = 'Đang chờ Mod phán quyết';
        break;
      case 'accepted':
      case 'approved':
      case 'autorefunded':
        bgColor = const Color(0xFFDCFCE7);
        textColor = const Color(0xFF16A34A);
        iconData = Icons.check_circle_outline;
        labelText = lowerStatus == 'autorefunded'
            ? 'Hoàn tiền tự động (Hết 3 ngày)'
            : 'Đã chấp nhận hoàn tiền';
        break;
      case 'withdrawn':
        bgColor = const Color(0xFFF1F5F9);
        textColor = const Color(0xFF64748B);
        iconData = Icons.cancel_outlined;
        labelText = 'Đã rút yêu cầu';
        break;
      case 'rejected':
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFF991B1B);
        iconData = Icons.highlight_off_outlined;
        labelText = 'Bị từ chối hoàn tiền';
        break;
      default:
        bgColor = const Color(0xFFF1F5F9);
        textColor = const Color(0xFF64748B);
        iconData = Icons.info_outline;
        labelText = status;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            labelText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
