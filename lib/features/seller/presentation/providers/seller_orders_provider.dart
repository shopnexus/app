import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

part 'seller_orders_provider.freezed.dart';

part 'seller_orders_provider.g.dart';

@freezed
abstract class SellerOrdersState with _$SellerOrdersState {
  const factory SellerOrdersState({
    /// The contract's own three states. There is no `processing`/`shipping`/
    /// `disputing`: where the parcel is comes off `order.transport`.
    @Default(OrderState.open) OrderState selected,
    @Default([]) List<OrderView> orders,

    /// Paid lines the money has not turned into an order yet. Only meaningful
    /// beside the open tab, and nothing here waits on the seller.
    @Default([]) List<OrderLineView> unsettled,
    @Default(true) bool isLoading,
    @Default(false) bool isActionLoading,
    String? errorMessage,
  }) = _SellerOrdersState;
}

@riverpod
class SellerOrdersNotifier extends _$SellerOrdersNotifier {
  @override
  SellerOrdersState build() {
    Future.microtask(_load);
    return const SellerOrdersState();
  }

  Future<void> _load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      final (orders, unsettled) = await (
        repository.orders(state: state.selected),
        // Only the open tab draws them, so the other two do not pay for the read.
        state.selected == OrderState.open
            ? repository.unsettledItems()
            : Future.value(const <OrderLineView>[]),
      ).wait;
      state = state.copyWith(
        isLoading: false,
        orders: orders,
        unsettled: unsettled,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  void setState(OrderState selected) {
    state = SellerOrdersState(selected: selected);
    _load();
  }

  Future<void> refresh() => _load();

  /// The parcel's position, as the seller sees it. Forward-only server-side, so a
  /// checkpoint behind the one already recorded is refused rather than applied.
  Future<bool> reportCheckpoint(
    String orderId,
    TransportCheckpoint checkpoint,
  ) => _act((repository) => repository.reportCheckpoint(orderId, checkpoint));

  /// The seller's two answers to a paid order. Doing neither is not a third option that resolves
  /// itself: staff are asked to chase it after 48 hours, because the platform will neither void
  /// the sale nor post the goods on their behalf.
  Future<bool> confirmOrder(String orderId) =>
      _act((repository) => repository.confirmOrder(orderId));

  Future<bool> declineOrder(String orderId, String reason) =>
      _act((repository) => repository.declineOrder(orderId, reason));

  /// Only while the parcel has not left `pending`; after that the route answers
  /// 409 and a refund is the way back.
  Future<bool> cancelOrder(String orderId) =>
      _act((repository) => repository.cancelOrder(orderId));

  Future<bool> _act(Future<void> Function(SellerRepository) action) async {
    state = state.copyWith(isActionLoading: true, errorMessage: null);
    try {
      await action(ref.read(sellerRepositoryProvider));
      await _load();
      state = state.copyWith(isActionLoading: false);
      return true;
    } catch (error) {
      // The old buttons reported success whatever happened, because the route
      // they called did not exist and the failure was caught and discarded.
      state = state.copyWith(
        isActionLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }
}
