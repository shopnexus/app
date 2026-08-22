import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_ref_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/providers/ticket_provider.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/ticket_status_badge.dart';

/// Yêu cầu hỗ trợ mà thread này nói về, ghim ở đầu thread.
///
/// Đây là chỗ màn "Chi tiết yêu cầu" cũ để lại: trạng thái, việc gì được nêu ra,
/// và kết quả xử lý. Kết quả nằm ngay đây chứ không cách một màn — "kết quả" là
/// lý do người ta mở lại một yêu cầu đã xong, mà phải cuộn cả thread mới thấy nó
/// là cách nó bị bỏ sót.
class TicketThreadBanner extends ConsumerWidget {
  const TicketThreadBanner({super.key, required this.ticketId});

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Không có gì đứng chờ tấm băng này: thread đọc được trước, và một yêu cầu
    // đọc hỏng thì mất phần chú giải, không mất chỗ để trả lời.
    final ticket = ref.watch(ticketDetailProvider(ticketId)).value;
    if (ticket == null) return const SizedBox.shrink();

    return _Banner(ticket: ticket);
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.ticket});

  final Ticket ticket;

  /// Trang mở ra được cho thứ mà yêu cầu này nói *về*, hoặc null khi thứ đó không
  /// có trang riêng — một tin nhắn, một đánh giá hay một câu trả lời thì không.
  String? get _refRoute {
    final refId = ticket.refId;
    if (refId == null || refId.isEmpty) return null;
    return switch (ticket.refType) {
      TicketRefType.listing => '/home/product/$refId',
      TicketRefType.order => '/account/order-detail/$refId',
      TicketRefType.refund => '/account/refunds/$refId',
      TicketRefType.account => '/users/$refId',
      _ => null,
    };
  }

  String get _kindLine {
    final kind = TicketKindInfo.of(ticket.kind).label;
    final reason = ticket.reason;
    return reason == null ? kind : '$kind · ${ticketReasonLabel(reason)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resolved = ticket.status == TicketStatus.resolved;
    final refRoute = _refRoute;
    final note = ticket.resolutionNote;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TicketStatusBadge(status: ticket.status),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _kindLine,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      ticket.subject,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (refRoute != null)
                TextButton(
                  onPressed: () => context.push(refRoute),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Xem liên quan'),
                ),
            ],
          ),
          if (resolved) ...[
            const SizedBox(height: 10),
            Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 8),
            Text(
              // `none` là câu từ chối, nên nó được nói ra như một phán quyết chứ
              // không bị giấu đi như một chỗ trống.
              'Kết quả: ${ticket.actionTaken == null ? '—' : ticketActionLabel(ticket.actionTaken!)}',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (note != null && note.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                note,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (ticket.resolvedAt != null) ...[
              const SizedBox(height: 4),
              Text(
                'Xử lý lúc ${DateFormat('dd/MM/yyyy HH:mm').format(ticket.resolvedAt!.toLocal())}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
