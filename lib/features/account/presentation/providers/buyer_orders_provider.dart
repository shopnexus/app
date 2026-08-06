import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'buyer_orders_provider.g.dart';

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
@riverpod
Future<OrderView> buyerOrderDetail(Ref ref, String orderId) =>
    ref.watch(accountRepositoryProvider).buyerOrder(orderId);
