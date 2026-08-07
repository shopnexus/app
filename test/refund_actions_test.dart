import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/refund/domain/refund_actions.dart';

Refund _refund(RefundStatus status) => Refund(
  id: 'rfd_1',
  orderId: 'ord_1',
  buyerId: 'acc_buyer',
  status: status,
  reason: 'không đúng mô tả',
  attachments: const [],
  createdAt: DateTime.utc(2026),
  deadlineAt: null,
  returnedAt: null,
  sellerDecidedAt: null,
);

void main() {
  // Cái bug đã dẫn tới file này: màn chi tiết chỉ hỏi trạng thái, nên người bán
  // được mời huỷ khiếu nại của người mua còn nút "chấp nhận" thì không tồn tại.
  group('awaiting-seller-review', () {
    final refund = _refund(RefundStatus.awaitingSellerReview);

    test('người mua rút được, và không đẩy được cho staff', () {
      final actions = refundActionsFor(refund, isBuyer: true);
      expect(actions, contains(RefundAction.withdraw));
      expect(actions, isNot(contains(RefundAction.escalate)));
      expect(actions, isNot(contains(RefundAction.accept)));
    });

    test('người bán chấp nhận hoặc nhờ staff, không rút hộ được', () {
      final actions = refundActionsFor(refund, isBuyer: false);
      expect(actions, contains(RefundAction.accept));
      expect(actions, contains(RefundAction.escalate));
      expect(actions, isNot(contains(RefundAction.withdraw)));
    });
  });

  group('returning', () {
    final refund = _refund(RefundStatus.returning);

    // Thiếu hai nút này thì vụ việc kẹt vĩnh viễn: `returning` không mang
    // deadline nên không vòng quét nào gỡ nó ra.
    test('người mua báo gửi hàng và báo đã tới', () {
      final actions = refundActionsFor(refund, isBuyer: true);
      expect(actions, contains(RefundAction.reportReturnSent));
      expect(actions, contains(RefundAction.claimReturnDelivered));
    });

    test('người bán xác nhận đã nhận lại hàng', () {
      expect(
        refundActionsFor(refund, isBuyer: false),
        contains(RefundAction.confirmReturnReceived),
      );
    });

    test('không bên nào rút hay chấp nhận được nữa', () {
      for (final isBuyer in [true, false]) {
        final actions = refundActionsFor(refund, isBuyer: isBuyer);
        expect(actions, isNot(contains(RefundAction.withdraw)));
        expect(actions, isNot(contains(RefundAction.accept)));
      }
    });
  });

  group('returned', () {
    final refund = _refund(RefundStatus.returned);

    test('chỉ người bán còn cãi được, trong cửa sổ kiểm hàng', () {
      expect(
        refundActionsFor(refund, isBuyer: false),
        contains(RefundAction.escalate),
      );
      expect(
        refundActionsFor(refund, isBuyer: true),
        isNot(contains(RefundAction.escalate)),
      );
    });
  });

  test('disputed: staff cầm, hai bên chỉ nộp thêm bằng chứng', () {
    for (final isBuyer in [true, false]) {
      expect(
        refundActionsFor(_refund(RefundStatus.disputed), isBuyer: isBuyer),
        [RefundAction.addEvidence],
      );
    }
  });

  test('trạng thái kết thúc thì không còn nút nào', () {
    for (final status in [
      RefundStatus.accepted,
      RefundStatus.rejected,
      RefundStatus.cancelled,
    ]) {
      for (final isBuyer in [true, false]) {
        expect(refundActionsFor(_refund(status), isBuyer: isBuyer), isEmpty);
      }
    }
  });

  // Người mua không bao giờ escalate được — server chỉ nhận từ người bán, nên
  // một nút như thế chỉ đổi được một lần bấm lấy 403.
  test('người mua không bao giờ có nút nhờ ShopNexus', () {
    for (final status in RefundStatus.values) {
      expect(
        refundActionsFor(_refund(status), isBuyer: true),
        isNot(contains(RefundAction.escalate)),
        reason: 'status $status',
      );
    }
  });
}
