import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/providers/ticket_provider.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/ticket_status_badge.dart';

/// What staff decided, and a door into the thread. Everything the requester and
/// support actually said lives in the chat thread the ticket carries, so this
/// screen never grows a message list of its own.
class TicketDetailScreen extends ConsumerWidget {
  const TicketDetailScreen({super.key, required this.ticketId});

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticket = ref.watch(ticketDetailProvider(ticketId));

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết yêu cầu')),
      body: ticket.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _Failure(
          onRetry: () => ref.invalidate(ticketDetailProvider(ticketId)),
        ),
        data: (data) => _Body(ticket: data),
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  const _Failure({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 40),
          const SizedBox(height: 12),
          const Text('Không tải được yêu cầu này.'),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onRetry, child: const Text('Thử lại')),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final conversationId = ticket.conversationId;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(ticket.subject, style: theme.textTheme.titleLarge),
            ),
            const SizedBox(width: 12),
            TicketStatusBadge(status: ticket.status),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '${TicketKindInfo.of(ticket.kind).label} · ${dateFormat.format(ticket.createdAt.toLocal())}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),

        if (ticket.refType != null && ticket.refId != null) ...[
          const SizedBox(height: 16),
          _Row(
            label: ticketRefTypeLabel(ticket.refType!),
            value: ticket.refId!,
          ),
        ],
        if (ticket.reason != null) ...[
          const SizedBox(height: 8),
          _Row(label: 'Lý do', value: ticketReasonLabel(ticket.reason!)),
        ],

        // A resolved ticket carries `action_taken`; `none` is the turn-down, so it
        // is shown as a verdict rather than hidden as an absence.
        if (ticket.actionTaken != null) ...[
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kết quả xử lý', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(ticketActionLabel(ticket.actionTaken!)),
                  if (ticket.resolutionNote != null &&
                      ticket.resolutionNote!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      ticket.resolutionNote!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (ticket.resolvedAt != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Xử lý lúc ${dateFormat.format(ticket.resolvedAt!.toLocal())}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],

        const SizedBox(height: 24),
        if (conversationId != null)
          FilledButton.icon(
            onPressed: () => context.push('/chat/$conversationId'),
            icon: const Icon(Icons.forum_outlined),
            label: const Text('Mở cuộc trò chuyện'),
          )
        else
          // The row and the thread live in different schemas, so one lands first.
          // Reading the ticket again is what repairs it.
          Text(
            'Cuộc trò chuyện đang được tạo. Vui lòng tải lại sau một lát.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
      ],
    );
  }
}
