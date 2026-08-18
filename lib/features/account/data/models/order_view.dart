import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/utils/deadline_utils.dart';

part 'order_view.freezed.dart';

/// A checkout line and the listing it points at. The line carries no name and no
/// photo — it carries `listing_id`, which order history resolves through
/// `GET /listings?ids=`, one lookup for a whole page. Nothing here is a wire
/// field: a name the server never sent must not look like one.
@freezed
abstract class OrderLineView with _$OrderLineView {
  const OrderLineView._();

  const factory OrderLineView({required OrderItem item, Listing? listing}) =
      _OrderLineView;

  /// Null when the listing is gone from the catalog entirely; a seller merely
  /// hiding or deleting it still resolves, which is why the id is denormalized.
  String? get name => listing?.name;

  String get displayName => name ?? 'Sản phẩm không còn trong danh mục';

  String? get imageUrl => listing?.cover?.url;

  bool get isCancelled => item.cancelledAt != null;

  /// True while the money has not produced an order yet — the only window in
  /// which either side may still drop the line.
  bool get isUnsettled => item.orderId == null && !isCancelled;
}

/// An order with its lines resolved.
@freezed
abstract class OrderView with _$OrderView {
  const OrderView._();

  const factory OrderView({
    required Order order,
    required List<OrderLineView> lines,
  }) = _OrderView;

  int get quantity =>
      lines.fold(0, (total, line) => total + line.item.quantity);

  /// The outcome first, then the parcel: `state` is derived from the two outcome
  /// timestamps, so an order that ended says so whatever the carrier last
  /// reported.
  String get statusLabel {
    if (order.state == OrderState.cancelled) return 'Đã hủy';
    if (order.state == OrderState.completed) return 'Hoàn thành';
    // Before the transport exists at all. Worded for neither side, because both
    // draw this badge: who is waiting on whom is said by the card around it.
    if (order.state == OrderState.awaitingConfirmation) return 'Chờ xác nhận';
    return switch (order.transport?.status) {
      null => 'Đang xử lý',
      TransportStatus.pending => 'Chờ lấy hàng',
      TransportStatus.pickedUp => 'Đã lấy hàng',
      TransportStatus.inTransit => 'Đang giao',
      TransportStatus.delivered => 'Đã giao',
      TransportStatus.returned => 'Đã trả về',
      TransportStatus.failed => 'Giao thất bại',
      TransportStatus.cancelled => 'Vận chuyển đã hủy',
    };
  }

  /// Câu người mua dặn lúc thanh toán, hoặc rỗng nếu họ không dặn gì.
  ///
  /// Ghi chú nằm trên *dòng* chứ không trên đơn: một lượt thanh toán chép cùng
  /// một câu lên mọi dòng nó tạo ra, nên dòng nào cũng mang nó. Vẫn gộp theo
  /// distinct thay vì lấy `lines.first`: nếu về sau một đơn gom nhiều lượt thanh
  /// toán, hai câu dặn khác nhau đều phải tới tay người bán — mất câu thứ hai
  /// còn tệ hơn không hiện câu nào, vì người bán không biết mình đang thiếu.
  String get buyerNote {
    final notes = <String>{};
    for (final line in lines) {
      final note = line.item.note.trim();
      if (note.isNotEmpty) notes.add(note);
    }
    return notes.join('\n');
  }

  /// The snapshot froze area *codes*, not names — a carrier is routed by them and
  /// a renamed ward must not rewrite where a past parcel went. So the lines are
  /// the recipient and the street, and the area is left to the codes.
  String get shippingAddress => [
    order.address.fullName,
    order.address.phone,
    ?order.address.addressDetail,
  ].join('\n');

  /// The goods, against `order.total` which also carries the carriage the buyer
  /// paid. Summed from the lines rather than from a field: the lines are the
  /// record of what was charged.
  int get goodsTotal =>
      lines.fold(0, (total, line) => total + line.item.totalAmount);

  /// Hai nhóm của màn Đơn hàng, và đường chia là *kết quả* chứ không phải kiện
  /// hàng: `state` chỉ có bốn giá trị và hai trong số đó là kết cục, nên "còn
  /// phải trông" và "xong rồi" là toàn bộ câu hỏi mà chín cái tab từng hỏi.
  bool get isFinished =>
      order.state == OrderState.completed ||
      order.state == OrderState.cancelled;

  /// True while the money is in escrow and nothing has been handed to a carrier —
  /// the one window in which a refusal or a silence returns every đồng paid,
  /// carriage included.
  bool get isAwaitingConfirmation =>
      order.state == OrderState.awaitingConfirmation;

  /// Người mua xác nhận được khi đơn đã **mở** và kiện hàng đã tới.
  ///
  /// `state == open` là bắt buộc, không thừa: nó có nghĩa người bán đã xác nhận,
  /// tức là đã có gì đó được giao cho đơn vị vận chuyển. Trước đây điều kiện chỉ
  /// đọc kiện hàng, nên một đơn `awaiting-confirmation` mà hàng ghi `delivered` —
  /// dữ liệu có thật, còn lại từ trước khi có bước xác nhận — mời người mua bấm
  /// "Đã nhận hàng" cho một đơn người bán còn chưa nhận.
  ///
  /// `received_at` mới là thứ điều kiện payout đòi, nên đây đúng là cửa sổ duy
  /// nhất mà tiền của người bán đang chờ một cái chạm của người mua.
  bool get canConfirmReceipt =>
      order.state == OrderState.open &&
      order.receivedAt == null &&
      order.transport?.status == TransportStatus.delivered;

  /// Vụ hoàn tiền đang mở trên đơn này, nếu có.
  ///
  /// `settled` là câu server bảo phải hỏi: các trạng thái chặn là của một cái
  /// index, không phải một danh sách để mỗi client tự dựng lại.
  RefundSummary? get openRefund {
    final refund = order.refund;
    return refund != null && !refund.settled ? refund : null;
  }

  /// Người mua mở được một vụ hoàn tiền. Đúng hai điều kiện server đặt ra:
  /// `POST /orders/{id}/refunds` trả 409 khi escrow đã kết — đơn đã hoàn thành
  /// hoặc đã hủy — và khi đã có một vụ chưa xong trên cùng đơn.
  ///
  /// Hỏi trước chứ không để người mua điền xong biểu mẫu rồi mới nhận 409: một
  /// nút chỉ nên có mặt khi nó bấm được.
  bool get canRequestRefund => !isFinished && openRefund == null;

  /// Kiện hàng chưa rời kho. Đây là cửa sổ duy nhất còn hủy được, và nó đúng cho
  /// **cả hai bên** — server cho bất kỳ ai trong đơn hủy, rồi từ chối nếu hàng đã
  /// đi (`Cancel(transport.Shipped())`), nên nút hỏi đúng câu server hỏi.
  bool get canCancel =>
      !isFinished &&
      (order.transport?.status ?? TransportStatus.pending) ==
          TransportStatus.pending;

  /// "còn 31 giờ" until the seller's 48 hours run out, or null once they have
  /// answered — the server drops the deadline at that point.
  String? get confirmationRemaining =>
      DeadlineUtils.remaining(order.confirmationDeadlineAt);
}
