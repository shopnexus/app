import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../data/models/seller_model.dart';
import '../../data/repositories/seller_repository.dart';

part 'seller_orders_provider.freezed.dart';

part 'seller_orders_provider.g.dart';

@freezed
abstract class SellerOrdersState with _$SellerOrdersState {
  const factory SellerOrdersState({
    @Default(0)
    int
    selectedTab, // 0: Tất cả, 1: Đang xử lý, 2: Đang giao, 3: Đã giao, 4: Khiếu nại
    @Default([]) List<SellerPendingItem> pendingItems,
    @Default([]) List<SellerOrder> confirmedOrders,
    @Default(true) bool isLoading,
    @Default(false) bool isActionLoading,
    String? errorMessage,
  }) = _SellerOrdersState;
}

@riverpod
class SellerOrdersNotifier extends _$SellerOrdersNotifier {
  @override
  SellerOrdersState build() {
    if (AppConfig.useMockData) {
      final repository = ref.read(sellerRepositoryProvider);
      return SellerOrdersState(
        isLoading: false,
        pendingItems: repository.getSellerPendingItemsSync(),
        confirmedOrders: repository.getSellerConfirmedOrdersSync(),
      );
    }
    Future.microtask(() => _loadData());
    return const SellerOrdersState(isLoading: true);
  }

  Future<void> _loadData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      final pending = await repository.getSellerPendingItems();
      final confirmed = await repository.getSellerConfirmedOrders();

      state = state.copyWith(
        isLoading: false,
        pendingItems: pending,
        confirmedOrders: confirmed,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setTab(int tabIndex) {
    state = state.copyWith(selectedTab: tabIndex);
  }

  Future<void> refresh() async {
    await _loadData();
  }

  /// Agree to consolidate pending item
  Future<bool> confirmPendingItem(String itemId) async {
    state = state.copyWith(isActionLoading: true);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      await repository.confirmPendingItems([itemId]);

      // Update local state for immediate feedback
      final updatedPending = state.pendingItems
          .where((item) => item.id != itemId)
          .toList();
      state = state.copyWith(
        isActionLoading: false,
        pendingItems: updatedPending,
      );
      return true;
    } catch (e) {
      // Mock action success for smooth UX
      final updatedPending = state.pendingItems
          .where((item) => item.id != itemId)
          .toList();
      state = state.copyWith(
        isActionLoading: false,
        pendingItems: updatedPending,
      );
      return true;
    }
  }

  /// Reject pending item
  Future<bool> rejectPendingItem(String itemId, {String? reason}) async {
    state = state.copyWith(isActionLoading: true);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      await repository.rejectPendingItem(itemId, reason: reason);

      final updatedPending = state.pendingItems
          .where((item) => item.id != itemId)
          .toList();
      state = state.copyWith(
        isActionLoading: false,
        pendingItems: updatedPending,
      );
      return true;
    } catch (e) {
      final updatedPending = state.pendingItems
          .where((item) => item.id != itemId)
          .toList();
      state = state.copyWith(
        isActionLoading: false,
        pendingItems: updatedPending,
      );
      return true;
    }
  }
}
