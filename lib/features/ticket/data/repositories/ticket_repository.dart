import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/open_ticket_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_reason.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';

part 'ticket_repository.g.dart';

/// One page of the caller's tickets plus the cursor that follows it.
class TicketPageResult {
  const TicketPageResult({required this.tickets, this.nextCursor});

  final List<Ticket> tickets;
  final String? nextCursor;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

/// Tickets are the one surface for abuse reports, refund disputes, order issues,
/// payment problems and feature requests — `kind` is what differs.
class TicketRepository {
  const TicketRepository(this._api);

  final TrustApi _api;

  Future<TicketPageResult> list({
    TicketStatus? status,
    String? cursor,
    int? limit,
  }) async {
    final response = await _api.ticketsGet(
      status: status,
      cursor: cursor,
      limit: limit,
    );
    final page = response.data;
    return TicketPageResult(
      tickets: page?.data ?? const [],
      nextCursor: page?.meta.nextCursor,
    );
  }

  Future<Ticket> read(String id) async {
    // Reading is also what repairs a missing conversation_id: the row and the
    // thread live in different schemas, so one of them lands first.
    final response = await _api.ticketsIdGet(id: id);
    final ticket = response.data?.data;
    if (ticket == null) throw StateError('empty ticket response');
    return ticket;
  }

  /// `body` and `attachments` are not columns on the ticket: they are posted as
  /// the opening message of the thread it carries.
  Future<Ticket> open({
    required TicketKind kind,
    required String subject,
    String? body,
    List<String>? attachments,
    String? refId,
    TicketReason? reason,
  }) async {
    final response = await _api.ticketsPost(
      openTicketRequest: OpenTicketRequest(
        kind: kind,
        subject: subject,
        body: body?.isEmpty ?? true ? null : body,
        attachments: attachments == null || attachments.isEmpty
            ? null
            : attachments,
        refId: refId,
        reason: reason,
      ),
    );
    final ticket = response.data?.data;
    if (ticket == null) throw StateError('empty ticket response');
    return ticket;
  }

}

@riverpod
TicketRepository ticketRepository(Ref ref) =>
    TicketRepository(ref.watch(trustApiProvider));
