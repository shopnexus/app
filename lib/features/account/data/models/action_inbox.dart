/// Một dòng trong khối "Việc cần làm": số việc, và chỗ để đi tới khi chạm vào.
class ActionInboxEntry {
  const ActionInboxEntry({
    required this.label,
    required this.count,
    required this.route,
  });

  final String label;
  final int count;
  final String route;
}

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai mua và bán.
///
/// Thuần Dart, không codegen: đây là một tổng hợp chỉ đọc dựng lại sau mỗi lần
/// refresh, không phải một thực thể trên dây cần `fromJson` hay `copyWith`.
class ActionInbox {
  const ActionInbox({
    this.ordersToShip = 0,
    this.refundsAsSeller = 0,
    this.unreadMessages = 0,
  });

  /// Đơn người khác đã trả tiền mà mình chưa giao.
  final int ordersToShip;

  /// Yêu cầu hoàn tiền đang chờ chính mình duyệt, ở vai người bán.
  ///
  /// Không có dòng tương ứng cho vai người mua: người bán không được phép từ chối
  /// hoàn tiền, nên người mua không bao giờ phải phản hồi lại một vụ họ đã mở —
  /// im lặng của người bán sẽ tự chuyển vụ đó sang cho ShopNexus xử lý.
  final int refundsAsSeller;

  final int unreadMessages;

  bool get isEmpty => total == 0;

  int get total => ordersToShip + refundsAsSeller + unreadMessages;

  /// Chỉ những loại thật sự có việc. Một mục với số 0 không được chiếm chỗ.
  List<ActionInboxEntry> get entries => [
    if (ordersToShip > 0)
      ActionInboxEntry(
        label: 'đơn chờ giao',
        count: ordersToShip,
        route: '/seller/orders',
      ),
    if (refundsAsSeller > 0)
      ActionInboxEntry(
        label: 'yêu cầu hoàn tiền chờ bạn duyệt',
        count: refundsAsSeller,
        route: '/account/refunds?role=seller',
      ),
    if (unreadMessages > 0)
      ActionInboxEntry(
        label: 'tin nhắn chưa đọc',
        count: unreadMessages,
        route: '/chat',
      ),
  ];
}
