import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/waiting_group.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_status_badge.dart';

/// Các vụ hoàn tiền của mình, xếp theo ai đang giữ lượt.
///
/// Hai tab "Tôi mua | Tôi bán" đã bỏ. Vụ mình đòi và vụ bị đòi trên đơn mình bán
/// là **cùng một hàng đợi**: cả hai đều là "có thứ cần mình trả lời, và có đồng
/// hồ". Chia làm hai tab thì một người vừa mua vừa bán phải nhớ kiểm cả hai, và
/// `deadline_at` — thứ đắt nhất ở đây, vì hết hạn là tự động lên bàn moderator —
/// không so được với nhau qua một cái tab.
class RefundListScreen extends ConsumerWidget {
  const RefundListScreen({super.key});

  /// Lượt của ai, theo trạng thái. Không có `seller_id` trên hàng: danh sách chỉ
  /// trả về vụ mình là một bên, nên "mình là bên bán" chính là `buyer_id != me`.
  static WaitingSide sideOf(Refund refund, String? me) {
    final selling = refund.buyerId != me;
    return switch (refund.status) {
      // Người bán chấp nhận hay khiếu nại — im lặng hết 48 giờ là tự mở ticket.
      RefundStatus.awaitingSellerReview =>
        selling ? WaitingSide.you : WaitingSide.other,
      // Người mua phải gửi hàng về.
      RefundStatus.returning => selling ? WaitingSide.other : WaitingSide.you,
      // Hàng đã về: người bán có cửa sổ kiểm tra trước khi tiền đi.
      RefundStatus.returned => selling ? WaitingSide.you : WaitingSide.other,
      // Đang ở chỗ moderator: không bên nào làm gì được.
      RefundStatus.disputed => WaitingSide.other,
      RefundStatus.accepted ||
      RefundStatus.rejected ||
      RefundStatus.cancelled => WaitingSide.done,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refunds = ref.watch(refundListProvider);
    final me = ref.watch(profileProvider).value?.id;

    return Scaffold(
      appBar: AppBar(title: const Text('Yêu cầu hoàn tiền')),
      body: refunds.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Không tải được danh sách.'),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => ref.invalidate(refundListProvider),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('Chưa có yêu cầu hoàn tiền nào.'));
          }

          final groups = <WaitingSide, List<Refund>>{
            for (final side in WaitingSide.values) side: [],
          };
          for (final refund in data) {
            groups[sideOf(refund, me)]!.add(refund);
          }
          // Hạn gần nhất lên trước; vụ không có hạn xuống cuối nhóm.
          groups[WaitingSide.you]!.sort(
            (a, b) =>
                (a.deadlineAt ?? _never).compareTo(b.deadlineAt ?? _never),
          );

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(refundListProvider),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                for (final side in WaitingSide.values)
                  if (groups[side]!.isNotEmpty) ...[
                    WaitingGroupHeader(side: side, count: groups[side]!.length),
                    for (final refund in groups[side]!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        child: _RefundCard(refund: refund, side: side, me: me),
                      ),
                  ],
              ],
            ),
          );
        },
      ),
    );
  }
}

final _never = DateTime.utc(9999);

class _RefundCard extends StatelessWidget {
  const _RefundCard({
    required this.refund,
    required this.side,
    required this.me,
  });

  final Refund refund;
  final WaitingSide side;
  final String? me;

  bool get _selling => refund.buyerId != me;

  /// Một câu nói việc. Vai nằm trong câu — "Trả lời yêu cầu hoàn tiền" chỉ có thể
  /// là mình bán, "Gửi hàng về cho người bán" chỉ có thể là mình mua — nên không
  /// cần một cái nhãn vai riêng.
  String get _line => switch (refund.status) {
    RefundStatus.awaitingSellerReview =>
      _selling ? 'Trả lời yêu cầu hoàn tiền' : 'Chờ người bán trả lời',
    RefundStatus.returning =>
      _selling ? 'Chờ hàng được gửi về' : 'Gửi hàng về cho người bán',
    RefundStatus.returned =>
      _selling
          ? 'Hàng đã về — kiểm tra trước khi tiền đi'
          : 'Hàng đã về, người bán đang kiểm tra',
    RefundStatus.disputed => 'ShopNexus đang xem xét',
    RefundStatus.accepted => 'Đã hoàn tiền',
    RefundStatus.rejected => 'Bị từ chối',
    RefundStatus.cancelled => 'Đã huỷ',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final remaining = side == WaitingSide.done
        ? null
        : remainingLabel(refund.deadlineAt);

    return Opacity(
      opacity: side == WaitingSide.done ? 0.7 : 1,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.push('/account/refunds/${refund.id}'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Đơn ${refund.orderId}',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    RefundStatusBadge(status: refund.status),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  _line,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: side == WaitingSide.you
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: side == WaitingSide.you
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (remaining != null)
                  Text(
                    remaining,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.error,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  refund.reason,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  dateFormat.format(refund.createdAt.toLocal()),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
