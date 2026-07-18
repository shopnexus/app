import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../../../account/data/repositories/account_repository.dart';
import '../../data/models/cart_model.dart';
import '../../data/repositories/cart_repository.dart';

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
      final itemPrice = item.sku.price.toDouble();

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
      await fetchCart();
      await fetchCurrencyAndRates();
    });
  }

  /// Tải thông tin tiền tệ ưu tiên và tỷ giá hối đoái
  Future<void> fetchCurrencyAndRates() async {
    try {
      final accountRepository = ref.read(accountRepositoryProvider);
      final profile = await accountRepository.getProfile();
      final preferredCurrency = profile.currency;

      final commonApiService = ref.read(commonApiServiceProvider);
      final ratesResponse = await commonApiService.getExchangeRates();
      final rates = ratesResponse.data.rates;

      state = state.copyWith(
        preferredCurrency: preferredCurrency,
        rates: rates,
      );
    } catch (e) {
      // Bỏ qua lỗi và giữ nguyên mặc định VND
    }
  }

  /// Tải thông tin giỏ hàng từ server
  Future<void> fetchCart() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);
      final remoteItems = await repository.getCart();

      await repository.cacheCart(remoteItems);

      state = state.copyWith(items: remoteItems, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Thêm item vào giỏ hàng
  Future<void> addItem(String skuId, int quantity) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);

      await repository.updateCart(
        UpdateCartRequest(skuId: skuId, deltaQuantity: quantity),
      );

      await fetchCart();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Xóa item khỏi giỏ hàng
  Future<void> removeItem(String skuId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);

      await repository.updateCart(UpdateCartRequest(skuId: skuId, quantity: 0));

      await fetchCart();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Tăng hoặc giảm số lượng của một SKU
  Future<void> updateQuantity(String skuId, int deltaQuantity) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(cartRepositoryProvider);

      final currentItem = state.items.firstWhere(
        (item) => item.sku.id == skuId,
        orElse: () => throw Exception('Item not found in cart'),
      );

      final newQuantity = currentItem.quantity + deltaQuantity;
      if (newQuantity <= 0) {
        await removeItem(skuId);
      } else {
        await repository.updateCart(
          UpdateCartRequest(skuId: skuId, deltaQuantity: deltaQuantity),
        );
        await fetchCart();
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }
}
