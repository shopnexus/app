import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/generated/model/ticket.dart';
import '../../../../api/generated/model/ticket_kind.dart';
import '../../../../api/generated/model/ticket_reason.dart';
import '../../../../api/generated/model/ticket_status.dart';
import '../../../../core/utils/error_handler.dart';
import '../../data/repositories/ticket_repository.dart';

part 'ticket_provider.g.dart';

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
@riverpod
class TicketList extends _$TicketList {
  String? _cursor;

  @override
  Future<List<Ticket>> build({TicketStatus? status}) async {
    final page = await ref.watch(ticketRepositoryProvider).list(status: status);
    _cursor = page.nextCursor;
    return page.tickets;
  }

  bool get hasMore => _cursor != null && _cursor!.isNotEmpty;

  Future<void> loadMore() async {
    final cursor = _cursor;
    if (cursor == null || cursor.isEmpty) return;
    final current = state.value ?? const <Ticket>[];
    final page = await ref
        .read(ticketRepositoryProvider)
        .list(status: status, cursor: cursor);
    _cursor = page.nextCursor;
    state = AsyncValue.data([...current, ...page.tickets]);
  }
}

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.
@riverpod
Future<Ticket> ticketDetail(Ref ref, String id) =>
    ref.watch(ticketRepositoryProvider).read(id);

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.
@riverpod
class RaiseTicket extends _$RaiseTicket {
  @override
  AsyncValue<Ticket?> build() => const AsyncValue.data(null);

  Future<Ticket?> submit({
    required TicketKind kind,
    required String subject,
    String? body,
    List<String>? attachments,
    String? refId,
    TicketReason? reason,
  }) async {
    state = const AsyncValue.loading();
    try {
      final ticket = await ref.read(ticketRepositoryProvider).open(
        kind: kind,
        subject: subject,
        body: body,
        attachments: attachments,
        refId: refId,
        reason: reason,
      );
      state = AsyncValue.data(ticket);
      ref.invalidate(ticketListProvider);
      return ticket;
    } catch (e, stack) {
      state = AsyncValue.error(ErrorHandler.getErrorMessage(e), stack);
      return null;
    }
  }
}
