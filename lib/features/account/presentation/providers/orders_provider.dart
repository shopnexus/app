import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'orders_provider.g.dart';

/// Những đơn đã nạp của một vai, cộng chỗ để nạp tiếp.
///
/// Chia nhóm ở client, không bằng `state`: một lượt đọc `/orders?role=X` trả về
/// cả bốn trạng thái, nên năm provider lọc theo tab trước đây là năm lượt gọi
/// cho cùng một danh sách. `state` vẫn là tham số optional của route — nó chỉ
/// không còn ai cần đến.
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

  /// Việc còn phải trông: đơn chờ xác nhận và đơn đang đi.
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
Future<List<OrderLineView>> unsettledItems(Ref ref, OrderRole role) =>
    ref.watch(accountRepositoryProvider).items(role: role, pending: true);

/// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
/// tồn tại, nên family này có đúng hai thành viên.
@riverpod
class Orders extends _$Orders {
  @override
  Future<OrdersFeed> build(OrderRole role) async {
    final page = await ref.watch(accountRepositoryProvider).orders(role: role);
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
          .orders(role: role, cursor: feed.nextCursor);
      state = AsyncData(
        OrdersFeed(
          orders: [...feed.orders, ...page.orders],
          nextCursor: page.nextCursor,
        ),
      );
    } catch (error) {
      // Không đẩy state sang error: những đơn đã nạp vẫn đúng, và mất cả danh
      // sách vì trang thứ hai hỏng là mất nhiều hơn cái vừa xin.
      state = AsyncData(
        feed.copyWith(isLoadingMore: false, loadMoreError: error.toString()),
      );
    }
  }
}
