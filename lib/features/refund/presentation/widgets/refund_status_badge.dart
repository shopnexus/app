import 'package:flutter/material.dart';

import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';

/// Every live status names the party the case is waiting on, and each of those carries a deadline
/// that party can miss. There is no "waiting on the buyer" any more: a seller cannot refuse a
/// refund, so the buyer is never asked to chase a case they already opened.
String refundStatusLabel(RefundStatus status) => switch (status) {
  RefundStatus.awaitingSellerReview => 'Chờ người bán phản hồi',
  RefundStatus.disputed => 'Đang chờ ShopNexus xử lý',
  RefundStatus.returning => 'Đang trả hàng',
  RefundStatus.returned => 'Người bán đang kiểm tra hàng trả',
  RefundStatus.accepted => 'Đã hoàn tiền',
  RefundStatus.rejected => 'Đã từ chối',
  RefundStatus.cancelled => 'Đã hủy yêu cầu',
};

class RefundStatusBadge extends StatelessWidget {
  const RefundStatusBadge({super.key, required this.status});

  final RefundStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (Color background, Color foreground) = switch (status) {
      RefundStatus.accepted => (
        scheme.primaryContainer,
        scheme.onPrimaryContainer,
      ),
      RefundStatus.rejected || RefundStatus.cancelled => (
        scheme.errorContainer,
        scheme.onErrorContainer,
      ),
      RefundStatus.disputed => (
        scheme.tertiaryContainer,
        scheme.onTertiaryContainer,
      ),
      _ => (scheme.secondaryContainer, scheme.onSecondaryContainer),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        refundStatusLabel(status),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
