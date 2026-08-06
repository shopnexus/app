import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
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

  /// "còn 31 giờ" until the seller's 48 hours run out, or null once they have
  /// answered — the server drops the deadline at that point.
  String? get confirmationRemaining =>
      DeadlineUtils.remaining(order.confirmationDeadlineAt);
}
