import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'buyer_orders_provider.g.dart';

/// One provider per tab, told apart by `state` — the three order tabs used to
/// call the same path with no filter and render the same list three times.
///
/// "Đang xử lý" is both in-flight states, because `open` alone means *confirmed*
/// by the seller: a buyer who had just paid found this tab empty, "Chờ thanh
/// toán" empty too (that tab is lines the money has not settled), and their
/// order only under "Tất cả". Two calls rather than one — `state` takes a value,
/// not a list — and the whole tab fails if either does, since a list quietly
/// missing the newest order is the bug being fixed here.
@riverpod
Future<List<OrderView>> buyerOpenOrders(Ref ref) async {
  final repository = ref.watch(accountRepositoryProvider);
  final lists = await Future.wait([
    repository.buyerOrders(state: OrderState.awaitingConfirmation),
    repository.buyerOrders(state: OrderState.open),
  ]);
  // Awaiting confirmation first: those are the newest, and the only ones with a
  // clock running on somebody else.
  return [...lists.first, ...lists.last];
}

@riverpod
Future<List<OrderView>> buyerCompletedOrders(Ref ref) => ref
    .watch(accountRepositoryProvider)
    .buyerOrders(state: OrderState.completed);

@riverpod
Future<List<OrderView>> buyerCancelledOrders(Ref ref) => ref
    .watch(accountRepositoryProvider)
    .buyerOrders(state: OrderState.cancelled);

@riverpod
Future<OrderView> buyerOrderDetail(Ref ref, String orderId) =>
    ref.watch(accountRepositoryProvider).buyerOrder(orderId);

/// Lines the money has not produced an order for: the only ones either side can
/// still drop.
@riverpod
Future<List<OrderLineView>> buyerUnsettledItems(Ref ref) =>
    ref.watch(accountRepositoryProvider).buyerItems(pending: true);

/// `/items` has no cancelled filter, so this reads `cancelled_at` off the one
/// list the route serves.
@riverpod
Future<List<OrderLineView>> buyerCancelledItems(Ref ref) async {
  final items = await ref
      .watch(accountRepositoryProvider)
      .buyerItems(pending: false);
  return items.where((line) => line.isCancelled).toList();
}

@riverpod
class BuyerOrderController extends _$BuyerOrderController {
  @override
  FutureOr<void> build() {}

  Future<void> cancelItem(String itemId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(accountRepositoryProvider).cancelItem(itemId);
      ref.invalidate(buyerUnsettledItemsProvider);
      ref.invalidate(buyerCancelledItemsProvider);
    });
  }
}
