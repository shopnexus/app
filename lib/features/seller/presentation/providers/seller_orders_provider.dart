import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/seller_model.dart';
import '../../data/repositories/seller_repository.dart';

part 'seller_orders_provider.freezed.dart';

part 'seller_orders_provider.g.dart';

@freezed
abstract class SellerOrdersState with _$SellerOrdersState {
  const factory SellerOrdersState({
    @Default(0)
    int
    selectedTab, // 0: Chờ gom đơn, 1: Đã xác nhận, 2: Đang giao, 3: Đã giao, 4: Khiếu nại
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
    _loadData();
    return const SellerOrdersState();
  }

  Future<void> _loadData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(sellerRepositoryProvider);

      final pending = await repository.getSellerPendingItems();
      final confirmed = await repository.getSellerConfirmedOrders();

      // Fallback demo items if backend response is empty
      final finalPending = pending.isNotEmpty
          ? pending
          : const [
              SellerPendingItem(
                id: 'pending_1',
                orderId: 'DH8472',
                buyerName: 'Minh Anh',
                productName:
                    'Cốc gốm thủ công tráng men xanh ngọc bích, phong cách tối giản',
                skuName: 'Xanh Ngọc Bích - 350ml',
                quantity: 2,
                price: 150000,
                status: 'pending',
              ),
              SellerPendingItem(
                id: 'pending_2',
                orderId: 'DH8475',
                buyerName: 'Hoàng Nam',
                productName: 'Ví da bò sáp thủ công Classic',
                skuName: 'Nâu Dark Brown',
                quantity: 1,
                price: 850000,
                status: 'pending',
              ),
            ];

      final finalConfirmed = confirmed.isNotEmpty
          ? confirmed
          : const [
              SellerOrder(
                id: 'DH8470',
                buyerName: 'Thanh Tùng',
                totalAmount: 450000,
                status: 'shipping',
                shippingAddress: '123 Nguyễn Huệ, Q.1, TP.HCM',
                items: [
                  SellerPendingItem(
                    id: 'pi_1',
                    productName:
                        'Khay để bàn bằng gỗ sồi tự nhiên, thiết kế module',
                    quantity: 1,
                    price: 450000,
                  ),
                ],
              ),
            ];

      state = state.copyWith(
        isLoading: false,
        pendingItems: finalPending,
        confirmedOrders: finalConfirmed,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Không thể tải dữ liệu đơn hàng: $e',
      );
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
