import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'orders_provider.g.dart';

/// Những đơn đã nạp, cộng chỗ để nạp tiếp.
///
/// Chia nhóm ở client, không bằng `state` và không bằng vai: một lượt đọc
/// `/orders` trả về cả hai chiều và cả bốn trạng thái, nên năm provider lọc theo
/// tab trước đây là năm lượt gọi cho cùng một danh sách. `role` và `state` vẫn là
/// tham số optional của route — chỉ là không còn ai cần đến.
class OrdersFeed {
  const OrdersFeed({
    this.orders = const [],
    this.nextCursor,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final List<OrderView> orders;
  final String? nextCursor;
  final bool isLoadingMore;

  /// Trang sau hỏng thì nói ra tại chỗ nút bấm, và những trang đã nạp vẫn còn.
  final String? loadMoreError;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;

  /// Việc còn phải trông: đơn chờ xác nhận và đơn đang đi. Nhóm theo lượt là việc
  /// của màn hình, vì nó cần biết `me` mới nói được lượt thuộc về ai.
  List<OrderView> get ongoing => [
    for (final view in orders)
      if (!view.isFinished) view,
  ];

  List<OrderView> get finished => [
    for (final view in orders)
      if (view.isFinished) view,
  ];

  /// [loadMoreError] không mang theo giá trị cũ: mỗi lần chạm lại là một lần thử
  /// mới, nên lỗi của lần trước phải mất đi mà không ai phải xoá nó bằng tay.
  OrdersFeed copyWith({
    List<OrderView>? orders,
    String? nextCursor,
    bool? isLoadingMore,
    String? loadMoreError,
  }) => OrdersFeed(
    orders: orders ?? this.orders,
    nextCursor: nextCursor ?? this.nextCursor,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    loadMoreError: loadMoreError,
  );
}

/// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
///
/// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
/// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.
@riverpod
Future<List<OrderLineView>> unsettledItems(Ref ref) => ref
    .watch(accountRepositoryProvider)
    .items(role: OrderRole.buyer, pending: true);

/// Notifier quản lý đơn hàng của phía Người mua (buyer).
@riverpod
class Orders extends _$Orders {
  @override
  Future<OrdersFeed> build() async {
    final page = await ref
        .watch(accountRepositoryProvider)
        .orders(role: OrderRole.buyer);
    return OrdersFeed(orders: page.orders, nextCursor: page.nextCursor);
  }

  /// "Xem thêm". Bỏ tab đi thì danh sách dài hơn, nên trang sau phải nạp được
  /// thật: `limit: 20` một lần là đơn thứ 21 vô hình.
  Future<void> loadMore() async {
    final feed = state.value;
    if (feed == null || !feed.hasMore || feed.isLoadingMore) return;

    state = AsyncData(feed.copyWith(isLoadingMore: true));
    try {
      final page = await ref
          .read(accountRepositoryProvider)
          .orders(role: OrderRole.buyer, cursor: feed.nextCursor);
      // Cuộn tới cuối rồi thoát màn ngay là đủ để notifier bị vứt trước khi
      // trang sau về.
      if (!ref.mounted) return;
      state = AsyncData(
        OrdersFeed(
          orders: [...feed.orders, ...page.orders],
          nextCursor: page.nextCursor,
        ),
      );
    } catch (error) {
      if (!ref.mounted) return;
      // Không đẩy state sang error: những đơn đã nạp vẫn đúng, và mất cả danh
      // sách vì trang thứ hai hỏng là mất nhiều hơn cái vừa xin.
      state = AsyncData(
        feed.copyWith(isLoadingMore: false, loadMoreError: error.toString()),
      );
    }
  }
}
