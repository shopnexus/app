import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/shared/data_sources/common_api_service.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/cart/data/models/cart_model.dart';
import 'package:shopnexus_flutter_app/features/cart/data/repositories/cart_repository.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';

@freezed
abstract class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default([]) List<CartItem> items,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('VND') String preferredCurrency,
    @Default({}) Map<String, double> rates,
  }) = _CartState;

  int get calculatedTotal {
    double total = 0.0;
    final preferred = preferredCurrency.toUpperCase();

    for (final item in items) {
      final origCurrency = item.currency.toUpperCase();
      final itemPrice = (item.sku?.price ?? 0).toDouble();

      double itemPriceInPreferred = itemPrice;

      if (origCurrency != preferred) {
        // Chuyển đổi về USD gốc trước
        double priceInUsd = itemPrice;
        if (origCurrency == 'USD') {
          priceInUsd = itemPrice / 100.0;
        } else {
          final origRate = rates[origCurrency] ?? 1.0;
          priceInUsd = itemPrice / origRate;
        }

        // Từ USD chuyển sang preferred currency
        final prefRate = rates[preferred] ?? 1.0;
        double converted = priceInUsd * prefRate;

        if (preferred == 'USD') {
          itemPriceInPreferred = converted * 100.0;
        } else {
          itemPriceInPreferred = converted;
        }
      }

      total += itemPriceInPreferred * item.quantity;
    }

    return total.round();
  }
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    final repository = ref.watch(cartRepositoryProvider);
    final cachedItems = repository.getCachedCart();

    _initCart();

    return CartState(items: cachedItems);
  }

  Future<void> _initCart() async {
    Future.microtask(() async {
      if (!ref.mounted) return;
      await fetchCart();
      if (!ref.mounted) return;
      await fetchCurrencyAndRates();
    });
  }

  /// Tải thông tin tiền tệ ưu tiên và tỷ giá hối đoái
  Future<void> fetchCurrencyAndRates() async {
    try {
      if (!ref.mounted) return;
      final accountRepository = ref.read(accountRepositoryProvider);
      final profile = await accountRepository.getProfile();
      final preferredCurrency = profile.currency;

      if (!ref.mounted) return;
      final commonApiService = ref.read(commonApiServiceProvider);
      final ratesResponse = await commonApiService.getExchangeRates();
      final rates = ratesResponse.data.rates;

      if (!ref.mounted) return;
      state = state.copyWith(
        preferredCurrency: preferredCurrency,
        rates: rates,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        rates: const {'VND': 25000.0, 'USD': 1.0, 'EUR': 0.92},
      );
    }
  }

  /// Tải thông tin giỏ hàng từ server
  Future<void> fetchCart() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);
      final remoteItems = await repository.getCart();

      if (!ref.mounted) return;
      await repository.cacheCart(remoteItems);

      if (!ref.mounted) return;
      state = state.copyWith(items: remoteItems, isLoading: false);
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
      final repository = ref.read(cartRepositoryProvider);

      await repository.addCartItem(
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

  /// Xóa item khỏi giỏ hàng
  Future<void> removeItem(String idOrVariantId) async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);

      final currentItem = state.items.firstWhere(
        (item) =>
            item.id == idOrVariantId ||
            item.variantId == idOrVariantId ||
            item.sku?.id == idOrVariantId,
        orElse: () => CartItem(
          id: idOrVariantId,
          listingId: '',
          variantId: idOrVariantId,
          quantity: 0,
        ),
      );

      await repository.deleteCartItem(currentItem.id);

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
      final repository = ref.read(cartRepositoryProvider);

      final currentItem = state.items.firstWhere(
        (item) =>
            item.id == idOrVariantId ||
            item.variantId == idOrVariantId ||
            item.sku?.id == idOrVariantId,
        orElse: () => throw Exception('Item not found in cart'),
      );

      final newQuantity = currentItem.quantity + deltaQuantity;
      if (newQuantity <= 0) {
        await removeItem(currentItem.id);
      } else {
        await repository.updateCartItem(
          currentItem.id,
          UpdateCartItemRequest(quantity: newQuantity),
        );
        if (!ref.mounted) return;
        await fetchCart();
      }
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
      final repository = ref.read(cartRepositoryProvider);
      await repository.clearCart();
      if (!ref.mounted) return;
      state = state.copyWith(items: [], isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }
}
