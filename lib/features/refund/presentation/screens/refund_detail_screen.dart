import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../api/generated/model/refund.dart';
import '../../../../api/generated/model/refund_status.dart';
import '../../../../api/generated/model/ticket_kind.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../ticket/presentation/widgets/raise_ticket_sheet.dart';
import '../providers/refund_provider.dart';
import '../widgets/refund_status_badge.dart';

class RefundDetailScreen extends ConsumerWidget {
  const RefundDetailScreen({super.key, required this.refundId});

  final String refundId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refund = ref.watch(refundDetailProvider(refundId));

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết hoàn tiền')),
      body: refund.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Không tải được yêu cầu này.'),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => ref.invalidate(refundDetailProvider(refundId)),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (data) => _Body(refund: data),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.refund});

  final Refund refund;

  bool get _isLive => switch (refund.status) {
    RefundStatus.accepted ||
    RefundStatus.rejected ||
    RefundStatus.cancelled => false,
    _ => true,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Đơn ${refund.orderId}',
                style: theme.textTheme.titleLarge,
              ),
            ),
            RefundStatusBadge(status: refund.status),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Tạo lúc ${dateFormat.format(refund.createdAt.toLocal())}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),

        // Missing the deadline is itself a move, so it is shown rather than
        // buried: it is null only while the case waits on staff or a carrier.
        if (refund.deadlineAt != null) ...[
          const SizedBox(height: 12),
          Card(
            color: theme.colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Hạn phản hồi: ${dateFormat.format(refund.deadlineAt!.toLocal())}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
        ],

        const SizedBox(height: 20),
        Text('Lý do', style: theme.textTheme.titleSmall),
        const SizedBox(height: 4),
        Text(refund.reason),

        // Null in `awaiting-buyer-action` when the seller never answered at all,
        // which is how the two paths into that state are told apart.
        if (refund.rejectionReason != null) ...[
          const SizedBox(height: 20),
          Text('Người bán từ chối vì', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(refund.rejectionReason!),
        ],

        if (refund.attachments.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text('Bằng chứng', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: refund.attachments.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                final url = refund.attachments[index].url;
                if (url == null || url.isEmpty) {
                  // `url` is absent until a module can presign one.
                  return const SizedBox(
                    width: 96,
                    height: 96,
                    child: Center(child: Icon(Icons.image_outlined)),
                  );
                }
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],

        const SizedBox(height: 28),
        if (_isLive)
          // There is no escalate route: opening a `refund-dispute` ticket is what
          // hands the case to staff, and the verdict comes back as that ticket
          // closing with `refund-granted` or `refund-refused`.
          FilledButton.icon(
            onPressed: () => _escalate(context, ref),
            icon: const Icon(Icons.support_agent_outlined),
            label: const Text('Nhờ ShopNexus xử lý'),
          )
        else
          Text(
            'Yêu cầu đã kết thúc.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

        if (_isLive) ...[
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => _withdraw(context, ref),
            child: const Text('Hủy yêu cầu hoàn tiền'),
          ),
        ],
      ],
    );
  }

  Future<void> _escalate(BuildContext context, WidgetRef ref) async {
    final ticket = await RaiseTicketSheet.show(
      context,
      kind: TicketKind.refundDispute,
      refId: refund.id,
      subjectHint: 'Khiếu nại hoàn tiền đơn ${refund.orderId}',
      refLabel: refund.id,
    );
    if (ticket == null || !context.mounted) return;
    ref.invalidate(refundDetailProvider(refund.id));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã chuyển yêu cầu cho ShopNexus xử lý.')),
    );
  }

  Future<void> _withdraw(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hủy yêu cầu hoàn tiền?'),
        content: const Text('Bạn sẽ không thể mở lại yêu cầu này.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Không'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Hủy yêu cầu'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(refundActionsProvider.notifier).withdraw(refund.id);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }
}
