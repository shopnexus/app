import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/add_cart_item_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_cart_item_request.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/cart/data/repositories/cart_repository.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/models/checkout_model.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/repositories/checkout_repository.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';

@freezed
abstract class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default([]) List<CartItem> items,
    @Default({}) Map<String, ListingDetail> listings,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CartState;

  /// Each row joined to the listing it points at. Absent while that read is in
  /// flight, which is why a line's price is nullable rather than zero.
  List<PurchaseLine> get lines => [
    for (final item in items)
      PurchaseLine(
        cartItemId: item.id,
        listingId: item.listingId,
        variantId: item.variantId,
        quantity: item.quantity,
        listing: listings[item.listingId],
      ),
  ];

  int get subtotal => lines.fold(0, (total, line) => total + line.lineTotal);

  /// The listing states its own currency and the platform is VND only, so the
  /// first resolved line labels the cart. No conversion: there is no rates route.
  String get currency {
    for (final line in lines) {
      final stated = line.currency;
      if (stated != null) return stated;
    }
    return 'VND';
  }
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    final repository = ref.watch(cartRepositoryProvider);
    final cachedItems = repository.getCachedCart();

    Future.microtask(() async {
      if (!ref.mounted) return;
      await fetchCart();
    });

    return CartState(items: cachedItems);
  }

  /// Tải thông tin giỏ hàng từ server
  Future<void> fetchCart() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);
      final remoteItems = await repository.getCart();
      final resolved = await ref
          .read(checkoutRepositoryProvider)
          .listings(remoteItems.map((item) => item.listingId));

      if (!ref.mounted) return;
      await repository.cacheCart(remoteItems);

      if (!ref.mounted) return;
      state = state.copyWith(
        items: remoteItems,
        listings: resolved,
        isLoading: false,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Thêm item vào giỏ hàng với variantId và quantity
  Future<void> addItem(String variantId, int quantity) async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await ref
          .read(cartRepositoryProvider)
          .addCartItem(
            AddCartItemRequest(variantId: variantId, quantity: quantity),
          );

      if (!ref.mounted) return;
      await fetchCart();
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Xóa item khỏi giỏ hàng theo id dòng giỏ hàng hoặc id phân loại
  Future<void> removeItem(String idOrVariantId) async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final row = _row(idOrVariantId);
      if (row == null) return;

      await ref.read(cartRepositoryProvider).deleteCartItem(row.id);

      if (!ref.mounted) return;
      await fetchCart();
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Tăng hoặc giảm số lượng của một item
  Future<void> updateQuantity(String idOrVariantId, int deltaQuantity) async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final row = _row(idOrVariantId);
      if (row == null) return;

      final newQuantity = row.quantity + deltaQuantity;
      if (newQuantity <= 0) {
        await removeItem(row.id);
        return;
      }

      await ref
          .read(cartRepositoryProvider)
          .updateCartItem(row.id, UpdateCartItemRequest(quantity: newQuantity));
      if (!ref.mounted) return;
      await fetchCart();
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Xóa sạch giỏ hàng
  Future<void> clearCart() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await ref.read(cartRepositoryProvider).clearCart();
      if (!ref.mounted) return;
      state = state.copyWith(items: [], listings: {}, isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// A screen may hold either identifier — the row, or the variant it points at.
  CartItem? _row(String idOrVariantId) {
    for (final item in state.items) {
      if (item.id == idOrVariantId || item.variantId == idOrVariantId) {
        return item;
      }
    }
    state = state.copyWith(isLoading: false);
    return null;
  }
}
