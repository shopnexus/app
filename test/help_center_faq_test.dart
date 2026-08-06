import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/features/help_center/data/repositories/help_center_repository.dart';
import 'package:shopnexus_flutter_app/features/help_center/presentation/providers/help_center_provider.dart';

/// FAQ sau khi ô tìm kiếm và bộ lọc danh mục đi khỏi.
///
/// Tám câu viết cứng trong app, hiện thẳng cả tám dạng accordion: một ô tìm kiếm
/// lọc tám dòng là một bộ máy to hơn thứ nó lọc, và bộ lọc danh mục thì chưa từng
/// có UI nào gọi tới — nó lọc trong bóng tối.
///
/// Phần Ticket không đụng tới: nó là thứ thật, có backend.
void main() {
  Ticket ticketWith(TicketStatus status) => Ticket(
    actionTaken: null,
    conversationId: 'cnv_1',
    createdAt: DateTime.utc(2026, 8),
    id: 'tkt_$status',
    kind: TicketKind.orderIssue,
    reason: null,
    refId: null,
    refType: null,
    resolutionNote: null,
    resolvedAt: null,
    status: status,
    subject: 'Đơn chưa tới',
  );

  test('tám câu, và không còn cách nào lọc chúng', () async {
    final faqs = await HelpCenterRepository().getFaqs();

    expect(faqs.length, 8);
    // Mỗi câu vẫn đủ hai nửa để vẽ một dòng accordion.
    for (final faq in faqs) {
      expect(faq.question, isNotEmpty);
      expect(faq.answer, isNotEmpty);
    }
  });

  group('phần Ticket vẫn nguyên', () {
    test('đếm mở và đã xử lý ngay trên danh sách', () {
      final state = HelpCenterState(
        tickets: [
          ticketWith(TicketStatus.open),
          ticketWith(TicketStatus.resolved),
        ],
      );

      // `/tickets` không có route summary, nên con số đếm từ chính danh sách là
      // con số duy nhất không thể lệch với nó.
      expect(state.openCount, 1);
      expect(state.resolvedCount, 1);
      expect(state.totalCount, 2);
    });
  });
}
