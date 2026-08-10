import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/domain/refund_actions.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_evidence_sheet.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_status_badge.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    // Vai quyết định gần như mọi nút trên màn này, và `refund.buyerId` là thứ duy
    // nhất nói ra được: hàng refund chỉ ghi người mua, phía bán suy từ đơn.
    final me = ref.watch(profileProvider).value?.id;
    final isBuyer = me != null && refund.buyerId == me;
    final actions = refundActionsFor(refund, isBuyer: isBuyer);

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
                if (url.isEmpty) {
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

        const SizedBox(height: 24),
        // Ai đang giữ lượt, nói thành câu. Một cái badge trạng thái trả lời "vụ
        // này đang ở đâu", không trả lời "có phải tôi đang phải làm gì không".
        Text(
          refundWaitingOn(refund.status, isBuyer: isBuyer),
          style: theme.textTheme.titleSmall?.copyWith(
            color: refundIsSettled(refund.status)
                ? theme.colorScheme.onSurfaceVariant
                : theme.colorScheme.primary,
          ),
        ),

        const SizedBox(height: 16),
        for (final action in actions) ...[
          _actionButton(context, ref, action),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  /// Một nút cho mỗi việc bên này còn làm được. Nhãn nói ra hệ quả, vì ba trong
  /// số đó không quay lại được và một cái đẩy vụ việc sang tay người khác.
  Widget _actionButton(
    BuildContext context,
    WidgetRef ref,
    RefundAction action,
  ) => switch (action) {
    RefundAction.accept => FilledButton.icon(
      onPressed: () => _accept(context, ref),
      icon: const Icon(Icons.check_rounded),
      label: const Text('Chấp nhận hoàn tiền'),
    ),
    RefundAction.escalate => OutlinedButton.icon(
      onPressed: () => _escalate(context, ref),
      icon: const Icon(Icons.support_agent_outlined),
      label: const Text('Nhờ ShopNexus xử lý'),
    ),
    RefundAction.withdraw => OutlinedButton(
      onPressed: () => _withdraw(context, ref),
      child: const Text('Hủy yêu cầu hoàn tiền'),
    ),
    RefundAction.reportReturnSent => OutlinedButton.icon(
      onPressed: () =>
          _reportReturn(context, ref, TransportCheckpoint.pickedUp),
      icon: const Icon(Icons.local_shipping_outlined),
      label: const Text('Tôi đã gửi hàng trả lại'),
    ),
    RefundAction.claimReturnDelivered => OutlinedButton.icon(
      onPressed: () =>
          _reportReturn(context, ref, TransportCheckpoint.delivered),
      icon: const Icon(Icons.report_outlined),
      label: const Text('Hàng đã tới nhưng người bán chưa xác nhận'),
    ),
    RefundAction.confirmReturnReceived => FilledButton.icon(
      onPressed: () =>
          _reportReturn(context, ref, TransportCheckpoint.delivered),
      icon: const Icon(Icons.inventory_2_outlined),
      label: const Text('Đã nhận lại hàng'),
    ),
    RefundAction.addEvidence => TextButton.icon(
      onPressed: () => _addEvidence(context, ref),
      icon: const Icon(Icons.add_photo_alternate_outlined),
      label: const Text('Bổ sung ảnh bằng chứng'),
    ),
  };

  Future<void> _accept(BuildContext context, WidgetRef ref) async {
    final confirmed = await _confirm(
      context,
      title: 'Chấp nhận hoàn tiền?',
      // Đồng ý không trả tiền ngay: hàng phải về trước, và người bán còn một cửa
      // sổ kiểm hàng sau đó. Nói trước để "đồng ý" không bị đọc thành "mất tiền".
      body:
          'Người mua sẽ gửi hàng trả lại. Sau khi bạn xác nhận đã nhận hàng, '
          'bạn còn 48 giờ để kiểm tra trước khi tiền được hoàn.',
      confirmLabel: 'Chấp nhận',
    );
    if (confirmed != true || !context.mounted) return;
    await _run(context, ref, (a) => a.accept(refund.id));
  }

  Future<void> _reportReturn(
    BuildContext context,
    WidgetRef ref,
    TransportCheckpoint status,
  ) async {
    await _run(context, ref, (a) => a.reportReturn(refund.id, status));
  }

  Future<void> _addEvidence(BuildContext context, WidgetRef ref) async {
    final added = await RefundEvidenceSheet.show(context, refundId: refund.id);
    if (added != true || !context.mounted) return;
    ref.invalidate(refundDetailProvider(refund.id));
  }

  Future<bool?> _confirm(
    BuildContext context, {
    required String title,
    required String body,
    required String confirmLabel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Không'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  Future<void> _run(
    BuildContext context,
    WidgetRef ref,
    Future<void> Function(RefundActions) action,
  ) async {
    try {
      await action(ref.read(refundActionsProvider.notifier));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  Future<void> _escalate(BuildContext context, WidgetRef ref) async {
    final ticket = await RaiseTicketSheet.show(
      context,
      kind: TicketKind.refundDispute,
      // Đơn, không phải yêu cầu hoàn tiền: server giải mã ref bằng prefix của
      // `order`, nên mã `rfd_…` là `invalid_id`.
      refId: refund.orderId,
      subjectHint: 'Khiếu nại hoàn tiền đơn ${refund.orderId}',
      refLabel: refund.orderId,
    );
    if (ticket == null || !context.mounted) return;
    ref.invalidate(refundDetailProvider(refund.id));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã chuyển yêu cầu cho ShopNexus xử lý.')),
    );
  }

  Future<void> _withdraw(BuildContext context, WidgetRef ref) async {
    final confirmed = await _confirm(
      context,
      title: 'Hủy yêu cầu hoàn tiền?',
      body: 'Bạn sẽ không thể mở lại yêu cầu này.',
      confirmLabel: 'Hủy yêu cầu',
    );
    if (confirmed != true || !context.mounted) return;
    await _run(context, ref, (a) => a.withdraw(refund.id));
  }
}
