import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../account/data/models/account_model.dart';
import '../../../account/data/repositories/account_repository.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../data/models/checkout_model.dart';
import '../../data/repositories/checkout_repository.dart';

part 'checkout_provider.freezed.dart';

part 'checkout_provider.g.dart';

enum CheckoutStep { address, shipping, payment, processing, success, failed }

@freezed
abstract class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  const factory CheckoutState({
    @Default(CheckoutStep.address) CheckoutStep step,
    @Default([]) List<Contact> contacts,
    Contact? selectedContact,
    @Default([]) List<CheckoutItem> items,
    @Default([]) List<CartItem> resolvedItems,
    @Default(false) bool buyNow,
    @Default('Standard') String shippingOption,
    QuoteTransportResponse? quoteResponse,
    @Default('Stripe') String paymentOption,
    @Default(false) bool useWallet,
    @Default([]) List<String> promotionCodes,
    CheckoutResponse? checkoutResponse,
    CheckoutSummary? checkoutSummary,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('USD') String preferredCurrency,
    @Default({}) Map<String, double> rates,
  }) = _CheckoutState;

  List<Contact> get homeContacts =>
      contacts.where((c) => c.addressType.toLowerCase() == 'home').toList();

  List<Contact> get officeContacts =>
      contacts.where((c) => c.addressType.toLowerCase() == 'office').toList();

  List<Contact> get otherContacts =>
      contacts.where((c) => c.addressType.toLowerCase() == 'other').toList();

  int get totalShippingCost {
    if (quoteResponse == null) return 0;
    return quoteResponse!.items.fold(0, (sum, item) => sum + item.cost);
  }

  int get calculatedSubtotal {
    double totalUsd = 0.0;
    for (final item in resolvedItems) {
      final price = item.sku.price;
      final currency = item.currency.toUpperCase();
      final qty = item.quantity;

      double priceUsd = price.toDouble();
      if (currency == 'USD') {
        priceUsd = price / 100.0;
      } else {
        final rate = rates[currency] ?? 1.0;
        priceUsd = price / rate;
      }
      totalUsd += priceUsd * qty;
    }

    final prefCurrency = preferredCurrency.toUpperCase();
    final prefRate = rates[prefCurrency] ?? 1.0;
    final converted = totalUsd * prefRate;

    if (prefCurrency == 'USD') {
      return (converted * 100.0).round();
    } else {
      return converted.round();
    }
  }
}

@riverpod
class CheckoutNotifier extends _$CheckoutNotifier {
  Timer? _pollingTimer;

  @override
  CheckoutState build() {
    ref.onDispose(() {
      _pollingTimer?.cancel();
    });
    return const CheckoutState();
  }

  /// Khởi tạo luồng thanh toán với các sản phẩm được chọn
  Future<void> initialize({
    required List<CheckoutItem> items,
    required List<CartItem> resolvedItems,
    required bool buyNow,
  }) async {
    final cartState = ref.read(cartProvider);
    state = CheckoutState(
      items: items,
      resolvedItems: resolvedItems,
      buyNow: buyNow,
      preferredCurrency: cartState.preferredCurrency,
      rates: cartState.rates,
      isLoading: true,
    );

    await _loadAddresses();
  }

  /// Tải danh sách địa chỉ nhận hàng của người dùng
  Future<void> _loadAddresses() async {
    try {
      final accountRepo = ref.read(accountRepositoryProvider);
      final list = await accountRepo.getContacts();

      final defaultContact = list.any((c) => c.phoneVerified)
          ? list.firstWhere((c) => c.phoneVerified)
          : list.firstOrNull;

      if (!ref.mounted) return;
      state = state.copyWith(
        contacts: list,
        selectedContact: defaultContact,
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

  /// Chọn địa chỉ nhận hàng
  void selectContact(Contact contact) {
    state = state.copyWith(selectedContact: contact, errorMessage: null);
  }

  /// Chuyển sang bước tiếp theo
  void setStep(CheckoutStep step) {
    state = state.copyWith(step: step, errorMessage: null);
  }

  /// Chọn phương thức vận chuyển và tự động lấy báo giá
  Future<void> selectShippingOption(String option) async {
    if (!ref.mounted) return;
    state = state.copyWith(
      shippingOption: option,
      isLoading: true,
      errorMessage: null,
    );

    if (state.selectedContact == null) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Vui lòng chọn địa chỉ nhận hàng trước',
      );
      return;
    }

    try {
      final checkoutRepo = ref.read(checkoutRepositoryProvider);

      // Tạo danh sách items với phương thức vận chuyển được chọn
      final updatedItems = state.items.map((item) {
        return QuoteTransportItem(
          skuId: item.skuId,
          quantity: item.quantity,
          transportOption: option,
        );
      }).toList();

      final quote = await checkoutRepo.quoteTransport(
        QuoteTransportRequest(
          address: state.selectedContact!.address,
          items: updatedItems,
        ),
      );

      if (!ref.mounted) return;
      state = state.copyWith(quoteResponse: quote, isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Chọn phương thức thanh toán
  void selectPaymentOption(String option, {bool? useWallet}) {
    state = state.copyWith(
      paymentOption: option,
      useWallet: useWallet ?? state.useWallet,
      errorMessage: null,
    );
  }

  /// Thực hiện đặt hàng và bắt đầu polling kết quả thanh toán
  Future<void> placeOrder() async {
    if (state.selectedContact == null) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: 'Vui lòng chọn địa chỉ nhận hàng');
      return;
    }

    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final checkoutRepo = ref.read(checkoutRepositoryProvider);

      // Cập nhật transport_option cho các items
      final finalItems = state.items.map((item) {
        return item.copyWith(transportOption: state.shippingOption);
      }).toList();

      final checkoutRes = await checkoutRepo.checkout(
        CheckoutRequest(
          buyNow: state.buyNow,
          address: state.selectedContact!.address,
          paymentOption: state.paymentOption,
          useWallet: state.useWallet,
          promotionCodes: state.promotionCodes.isEmpty
              ? null
              : state.promotionCodes,
          items: finalItems,
        ),
      );

      if (!ref.mounted) return;
      state = state.copyWith(
        checkoutResponse: checkoutRes,
        step: CheckoutStep.processing,
      );

      // Bắt đầu polling kết quả dựa trên checkout_session_id
      _startPolling(checkoutRes.checkoutSessionId);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Bắt đầu cơ chế Polling cứ mỗi 2 giây
  void _startPolling(String txID) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      try {
        final checkoutRepo = ref.read(checkoutRepositoryProvider);
        final summary = await checkoutRepo.getCheckoutSummary(txID);

        if (!ref.mounted) {
          timer.cancel();
          return;
        }

        final status = summary.session.status.toUpperCase();
        if (status == 'SUCCESS') {
          timer.cancel();
          state = state.copyWith(
            step: CheckoutStep.success,
            checkoutSummary: summary,
            isLoading: false,
          );
        } else if (status == 'FAILED') {
          timer.cancel();
          state = state.copyWith(
            step: CheckoutStep.failed,
            checkoutSummary: summary,
            isLoading: false,
            errorMessage: 'Thanh toán không thành công hoặc phiên bị hủy.',
          );
        } else {
          // Trạng thái vẫn là PENDING, cập nhật dữ liệu tạm thời
          state = state.copyWith(checkoutSummary: summary);
        }
      } catch (e) {
        // Bỏ qua lỗi mạng nhất thời khi polling
      }
    });
  }

  /// Dừng Polling thủ công nếu cần
  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    state = state.copyWith(isLoading: false);
  }
}
