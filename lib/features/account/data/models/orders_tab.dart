import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';

/// Các tab của màn Đơn hàng, và câu hỏi mà mỗi tab đặt ra.
///
/// Một chỗ duy nhất, vì trước đây có hai: màn Đơn hàng lọc theo một bộ điều kiện
/// còn dãy phím tắt ở trang Cá nhân đếm theo một bản chép của nó, nên con số trên
/// phím tắt và số dòng sau khi bấm vào đã có lúc khác nhau. Tab cũng không còn là
/// số nguyên trần: `tab == 4` không nói được nó là tab nào, và chèn một tab vào
/// giữa thì mọi con số sau đó nói sai.
///
/// Điều kiện đọc trên `state` chứ không dựng lại từ dấu vết của kiện hàng.
/// `state` là *kết cục* của đơn, server suy ra từ hai mốc thời gian của chính nó
/// và chỉ có bốn giá trị; còn `transport.status` là chuyện của cái kiện. Trộn hai
/// thứ là cách một đơn `open` mà kiện đã `delivered` — người mua chưa bấm "Đã
/// nhận hàng", tiền của người bán vẫn đang chờ đúng cú chạm đó — bị xếp vào
/// "Hoàn thành" và mất luôn cái nút.
enum OrdersTab {
  all('Tất cả'),

  /// Lượt đặt hàng đã tạo mà tiền chưa về.
  ///
  /// Tab duy nhất không phải một `OrderState`, và không thể là: đơn chỉ ra đời
  /// khi webhook thanh toán chạy, nên thứ đang chờ trả tiền vẫn còn là *dòng*
  /// checkout và `/orders` không bao giờ nhắc tới nó. Nó đọc `/items?pending=true`
  /// — xem `unsettledItemsProvider`.
  pendingPayment('Chờ thanh toán'),

  awaitingConfirmation('Chờ xác nhận'),

  /// Người bán đã nhận đơn: `state == open` cho tới khi đơn có kết cục, dù kiện
  /// hàng đang ở đâu trên đường.
  processing('Đang xử lý'),

  completed('Hoàn thành'),

  /// Cắt ngang các tab trạng thái chứ không nằm cùng hàng với chúng: một đơn đã
  /// hoàn thành vẫn có thể đang có vụ hoàn tiền, và nó thuộc cả hai chỗ — hai tab
  /// hỏi hai câu khác nhau. Đọc `order.refund`, đúng như contract dặn ("Read it
  /// rather than searching the caller's own refund list"): danh sách hoàn tiền
  /// riêng chỉ là *một trang*, nên một vụ cũ hơn trang đó từng làm đơn của nó rơi
  /// khỏi tab này mà không ai biết.
  refunding('Hoàn tiền'),

  cancelled('Đã hủy');

  const OrdersTab(this.label);

  final String label;

  /// Đơn này có thuộc tab đang mở hay không.
  ///
  /// [pendingPayment] luôn `false`: không một `Order` nào ở đó được: có đơn nghĩa
  /// là tiền đã về.
  bool matchesOrder(OrderView view) => switch (this) {
    OrdersTab.all => true,
    OrdersTab.pendingPayment => false,
    OrdersTab.awaitingConfirmation =>
      view.order.state == OrderState.awaitingConfirmation,
    OrdersTab.processing => view.order.state == OrderState.open,
    OrdersTab.completed => view.order.state == OrderState.completed,
    OrdersTab.refunding => view.order.refund != null,
    OrdersTab.cancelled => view.order.state == OrderState.cancelled,
  };

  /// Dòng đã trả tiền mà chưa thành đơn được vẽ ở đây.
  bool get showsUnsettledLines =>
      this == OrdersTab.all || this == OrdersTab.pendingPayment;

  /// Dòng bị hủy trước khi thành đơn: cũng chưa có `Order` nào để lọc, mà "đã
  /// hủy" đúng là chỗ người ta đi tìm nó.
  bool get showsCancelledLines =>
      this == OrdersTab.all || this == OrdersTab.cancelled;

  /// Các tab của màn đơn *mua*: tất cả, theo đúng thứ tự một lượt mua đi qua.
  static const buyerTabs = OrdersTab.values;

  /// Các tab của màn đơn *bán*. Không có [pendingPayment]: chỗ đó là một lượt
  /// thanh toán còn dở của người mua, và người bán không có gì trả nốt hộ họ —
  /// đơn chỉ tới tay người bán khi tiền đã về.
  static const sellerTabs = [
    OrdersTab.all,
    OrdersTab.awaitingConfirmation,
    OrdersTab.processing,
    OrdersTab.completed,
    OrdersTab.refunding,
    OrdersTab.cancelled,
  ];

  /// Tab từ một liên kết sâu (`/account/orders?tab=2`), đọc trong [tabs] của
  /// đúng màn đang mở. Số ngoài phạm vi rơi về [OrdersTab.all] thay vì làm màn
  /// hình mở ra một tab không có.
  static OrdersTab fromIndex(int index, {List<OrdersTab> tabs = buyerTabs}) =>
      index >= 0 && index < tabs.length ? tabs[index] : OrdersTab.all;
}
