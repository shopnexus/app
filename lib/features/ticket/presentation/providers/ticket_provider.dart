import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_reason.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/repositories/ticket_repository.dart';

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
///
/// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua cái
/// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
/// been disposed" trong khi ticket *đã* được tạo trên server.
/// Không đổi sang `keepAlive`: annotation đó chỉ có hiệu lực sau khi chạy lại
/// codegen. Chặn bằng `ref.mounted` là thay đổi thuần source, và đủ — sheet đã
/// nhận ticket qua giá trị trả về, nên state chỉ còn là thứ để hiển thị.
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
      final ticket = await ref
          .read(ticketRepositoryProvider)
          .open(
            kind: kind,
            subject: subject,
            body: body,
            attachments: attachments,
            refId: refId,
            reason: reason,
          );
      if (!ref.mounted) return ticket;
      state = AsyncValue.data(ticket);
      ref.invalidate(ticketListProvider);
      return ticket;
    } catch (e, stack) {
      if (!ref.mounted) return null;
      state = AsyncValue.error(ErrorHandler.getErrorMessage(e), stack);
      return null;
    }
  }
}

/// Ticket theo thread của nó, để một hàng trong hộp thư tự gọi được tên mình.
///
/// Bên kia của một thread hỗ trợ là cả sàn, nên tên đối phương không nói được gì:
/// hàng ấy phải mang chủ đề của yêu cầu và trạng thái của nó. Một lượt đọc cho cả
/// danh sách — ticket là một hàng ở module khác, còn cuộc trò chuyện chỉ mang id
/// của nó.
///
/// Ticket chưa có `conversation_id` thì không vào map: nó chưa có thread nào để
/// đặt tên cho.
@riverpod
Future<Map<String, Ticket>> ticketsByConversation(Ref ref) async {
  final tickets = await ref.watch(ticketListProvider().future);
  return {
    for (final ticket in tickets)
      if (ticket.conversationId != null && ticket.conversationId!.isNotEmpty)
        ticket.conversationId!: ticket,
  };
}
