import 'package:flutter/material.dart';

import '../../../../api/generated/model/ticket_status.dart';
import '../../data/models/ticket_kind_info.dart';

class TicketStatusBadge extends StatelessWidget {
  const TicketStatusBadge({super.key, required this.status});

  final TicketStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (Color background, Color foreground) = switch (status) {
      TicketStatus.open => (
        scheme.tertiaryContainer,
        scheme.onTertiaryContainer,
      ),
      TicketStatus.reviewing => (
        scheme.primaryContainer,
        scheme.onPrimaryContainer,
      ),
      TicketStatus.resolved => (
        scheme.surfaceContainerHighest,
        scheme.onSurfaceVariant,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        ticketStatusLabel(status),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
