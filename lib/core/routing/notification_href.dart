/// Chuyển `href` của một thông báo thành đường trong app.
///
/// Server trả về một đường dẫn *đã giải quyết* — `/account/orders/ord_x`,
/// `/inbox`, `/shop/acc_y` — nhưng đó là router của website, không phải của app:
/// cùng một sự việc, hai bản đồ đường khác nhau. Ném thẳng nó vào `context.push`
/// là rơi vào route không tồn tại, nên chỗ này là bản dịch, và nó nằm cạnh
/// `app_router.dart` vì nó chỉ đúng khi hai file nói cùng một thứ.
///
/// Không dịch được thì trả null: một dòng không đi đâu vẫn là một dòng đáng đọc
/// (server nói vậy, `href` rỗng cũng là chuyện thường), và đưa người dùng tới
/// một trang trắng còn tệ hơn không cho bấm.
String? appRouteForNotificationHref(String href) {
  if (href.isEmpty) return null;

  final path = Uri.parse(href).path;
  final segments = [
    for (final segment in path.split('/'))
      if (segment.isNotEmpty) segment,
  ];
  if (segments.isEmpty) return null;

  return switch (segments) {
    // Hộp thư của website là một trang gộp; app tách thành tab Tin nhắn.
    ['inbox'] => '/chat',
    ['cart'] => '/cart',
    // Trang công khai của một người: app không có khái niệm "shop".
    ['shop', final id] => '/users/$id',
    ['account', 'orders'] => '/account/orders',
    ['account', 'orders', final id] => '/account/order-detail/$id',
    // Đơn *bán* nằm trong khu Người bán, không trong khu Tài khoản.
    ['account', 'sales'] => '/seller/orders',
    ['account', 'refunds'] => '/account/refunds',
    // Ví của website là một trang; app chỉ có sổ giao dịch của ví.
    ['account', 'wallet'] => '/account/wallet-ledger',
    // Tin đăng của chính người bán: trang duy nhất trong app nhận một id là
    // trang sửa, và duyệt/hạ tin đều dẫn người bán tới đúng chỗ đó.
    ['account', 'products', final id] => '/seller/products/$id/edit',
    ['account', 'products'] => '/seller/products',
    _ => null,
  };
}
