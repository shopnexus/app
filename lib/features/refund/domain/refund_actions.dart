import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';

/// Việc mỗi bên còn làm được trên một yêu cầu hoàn tiền.
///
/// Trước đây màn chi tiết chỉ hỏi "vụ này còn sống không" rồi hiện *cả hai* nút
/// cho *cả hai* bên. Nhưng không nút nào trong đó dùng chung được: `withdraw` là
/// của người mua, `escalate` là của người bán — nên người bán được mời huỷ đơn
/// khiếu nại của người mua, còn nút duy nhất họ cần bấm thì không tồn tại.
///
/// Mỗi dòng dưới đây là một guard có thật trong service của server, không phải
/// một suy đoán về giao diện: một nút hỏi câu server không hỏi chỉ đổi được một
/// lần bấm lấy một lỗi 403.
enum RefundAction {
  /// Người mua rút lại vụ việc. Chỉ khi người bán chưa quyết định gì —
  /// sau đó đã có phán quyết trên hồ sơ và rút lui là xoá nó đi.
  withdraw,

  /// Người bán đồng ý hoàn tiền. Đây là cách duy nhất họ tự kết thúc được vụ
  /// việc: server không có đường "từ chối" cho người bán.
  accept,

  /// Người bán đẩy vụ việc cho ShopNexus. Không phải một route riêng — nó là mở
  /// một ticket `refund-dispute`, và người mua **không** làm được việc này.
  escalate,

  /// Người mua báo đã gửi hàng trả đi.
  reportReturnSent,

  /// Người mua báo hàng đã tới nơi. Người bán chưa xác nhận nên việc này đẩy vụ
  /// việc cho staff, chứ không tự mở cửa sổ kiểm hàng.
  claimReturnDelivered,

  /// Người bán xác nhận đã nhận lại hàng, mở cửa sổ kiểm hàng 48 giờ.
  confirmReturnReceived,

  /// Người mua bổ sung ảnh bằng chứng.
  ///
  /// Chỉ của họ: `attachments` là *lời khiếu nại* đang được đưa ra, không phải
  /// một hồ sơ chung. Người bán trả lời bằng cách mở ticket `refund-dispute`, và
  /// bằng chứng của họ nằm trong thread đó — nên hai phía đọc tách nhau được.
  addEvidence,
}

/// Vụ việc đã kết thúc, không ai còn làm gì được.
bool refundIsSettled(RefundStatus status) => switch (status) {
  RefundStatus.accepted ||
  RefundStatus.rejected ||
  RefundStatus.cancelled => true,
  _ => false,
};

/// Những việc [isBuyer] làm được trên [refund], đúng bằng những gì server nhận.
List<RefundAction> refundActionsFor(Refund refund, {required bool isBuyer}) {
  if (refundIsSettled(refund.status)) return const [];

  return switch (refund.status) {
    // Người bán cấp hoặc giao cho staff; người mua rút lui. Im lặng hết 48 giờ
    // cũng thành giao cho staff, nên "để đó" không phải lựa chọn thứ ba.
    RefundStatus.awaitingSellerReview => isBuyer
        ? const [RefundAction.withdraw, RefundAction.addEvidence]
        : const [RefundAction.accept, RefundAction.escalate],

    // Chặng hàng về không có đơn vị vận chuyển nào báo hộ, nên hai bên tự báo.
    // Đây cũng là lý do nó phải có mặt: thiếu nó thì vụ việc kẹt ở đây vĩnh viễn
    // — `returning` không mang deadline nên không có vòng quét nào gỡ ra.
    RefundStatus.returning => isBuyer
        ? const [
            RefundAction.reportReturnSent,
            RefundAction.claimReturnDelivered,
            RefundAction.addEvidence,
          ]
        : const [RefundAction.confirmReturnReceived],

    // Người bán đang kiểm hàng và còn cãi được cho tới hết cửa sổ; hết hạn là tự
    // động hoàn tiền cho người mua.
    RefundStatus.returned => isBuyer
        ? const [RefundAction.addEvidence]
        : const [RefundAction.escalate],

    // Staff đang cầm. Không bên nào quyết được nữa; người mua vẫn nộp thêm được
    // bằng chứng cho người sẽ đọc nó, người bán đã có thread ticket của mình.
    RefundStatus.disputed => isBuyer ? const [RefundAction.addEvidence] : const [],

    _ => const [],
  };
}

/// Ai đang bị đồng hồ chỉ vào, để màn hình nói ra thay vì bắt người đọc suy.
String refundWaitingOn(RefundStatus status, {required bool isBuyer}) =>
    switch (status) {
      RefundStatus.awaitingSellerReview => isBuyer
          ? 'Đang chờ người bán trả lời'
          : 'Đang chờ bạn trả lời',
      RefundStatus.returning => isBuyer
          ? 'Bạn cần gửi hàng trả lại người bán'
          : 'Đang chờ hàng được trả về',
      RefundStatus.returned => isBuyer
          ? 'Người bán đang kiểm tra hàng trả về'
          : 'Bạn đang kiểm tra hàng trả về',
      RefundStatus.disputed => 'ShopNexus đang xem xét vụ việc',
      RefundStatus.accepted => 'Đã hoàn tiền cho người mua',
      RefundStatus.rejected => 'Yêu cầu không được chấp nhận',
      RefundStatus.cancelled => 'Người mua đã rút yêu cầu',
    };
