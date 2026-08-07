import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';

/// The backend requires `ref_id` on exactly the kinds that are about something,
/// refuses it on the others, and checks that its prefix agrees with the kind. Get
/// any of that wrong and the form posts a 400 the user cannot act on.
void main() {
  test('every ticket kind has an entry', () {
    expect(
      TicketKindInfo.all.map((info) => info.kind).toSet(),
      TicketKind.values.toSet(),
    );
  });

  test('only the kinds that are about something carry a ref prefix', () {
    for (final info in TicketKindInfo.all) {
      expect(
        info.refPrefix != null,
        info.needsRef,
        reason: '${info.kind.value} disagrees about needing a ref',
      );
    }
  });

  test('a ref prefix is the opaque-id prefix of what the kind is about', () {
    String prefixOf(TicketKind kind) => TicketKindInfo.of(kind).refPrefix!;

    expect(prefixOf(TicketKind.reportListing), 'lst_');
    expect(prefixOf(TicketKind.reportAccount), 'acc_');
    expect(prefixOf(TicketKind.reportMessage), 'msg_');
    expect(prefixOf(TicketKind.reportReview), 'rvw_');
    expect(prefixOf(TicketKind.reportReviewReply), 'rpl_');
    // Both point at the **order**. A refund dispute is filed against the sale —
    // that is what puts both parties' complaints about it in one thread — so an
    // `rfd_` here is `invalid_id` before the ticket is ever built. This test
    // asserted `rfd_` and so protected the bug rather than catching it.
    expect(prefixOf(TicketKind.refundDispute), 'ord_');
    expect(prefixOf(TicketKind.orderIssue), 'ord_');
  });

  test('a reason belongs to the report kinds and to no other', () {
    for (final info in TicketKindInfo.all) {
      expect(
        info.needsReason,
        info.kind.value.startsWith('report-'),
        reason: '${info.kind.value} disagrees about needing a reason',
      );
    }
  });

  test('the self-serve list is exactly the kinds needing no ref', () {
    expect(TicketKindInfo.selfServe.map((info) => info.kind), [
      TicketKind.payment,
      TicketKind.account,
      TicketKind.featureRequest,
      TicketKind.other,
    ]);
  });
}
