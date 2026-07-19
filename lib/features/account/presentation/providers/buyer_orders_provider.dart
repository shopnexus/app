import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';

part 'buyer_orders_provider.g.dart';

@riverpod
Future<List<BuyerOrderItem>> buyerPendingItems(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerPendingItems(page: page, limit: limit);
}

@riverpod
Future<List<BuyerOrder>> buyerPendingOrders(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerPendingOrders(page: page, limit: limit);
}

@riverpod
Future<List<BuyerOrder>> buyerCompletedOrders(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerCompletedOrders(page: page, limit: limit);
}

@riverpod
Future<List<BuyerOrder>> buyerCancelledOrders(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerCancelledOrders(page: page, limit: limit);
}

@riverpod
Future<List<BuyerOrderItem>> buyerCancelledItems(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerCancelledItems(page: page, limit: limit);
}

@riverpod
Future<BuyerOrder> buyerOrderDetail(Ref ref, String orderId) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getBuyerOrderDetail(orderId);
}

@riverpod
class BuyerOrderController extends _$BuyerOrderController {
  @override
  FutureOr<void> build() {}

  Future<void> cancelPendingItem(String itemId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.cancelBuyerPendingItem(itemId);

      // Tự động làm mới danh sách
      ref.invalidate(buyerPendingItemsProvider);
      ref.invalidate(buyerCancelledItemsProvider);
    });
  }
}
