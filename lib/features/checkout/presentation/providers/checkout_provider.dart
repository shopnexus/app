import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_line.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_result.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quote.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_payment_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/models/checkout_model.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/repositories/checkout_repository.dart';

part 'checkout_provider.freezed.dart';

part 'checkout_provider.g.dart';

/// The single-page form, then what the payment session is doing. There is no
/// step per section: the buyer fills the page in any order.
enum CheckoutStep { address, processing, success, failed }

@freezed
abstract class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  const factory CheckoutState({
    @Default(CheckoutStep.address) CheckoutStep step,
    @Default([]) List<Contact> contacts,
    Contact? selectedContact,
    @Default([]) List<PurchaseLine> lines,
    ShippingQuotes? shippingQuotes,

    /// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
    /// answered — never a label. Null until a quote has been asked for.
    String? transportOption,

    /// The rails this deployment can charge on, and the one the buyer picked. Read from
    /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
    /// checkout that breaks the day an operator retires that rail.
    @Default([]) List<Option> paymentOptions,
    String? paymentOption,
    CheckoutResult? checkoutResult,
    Transaction? paymentTransaction,
    PaymentSession? paymentSession,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(true) bool agreeToTerms,
  }) = _CheckoutState;

  /// `ContactAddressType` has two values, so the old `office`/`other` buckets
  /// were always empty — `work` is what the column actually holds.
  List<Contact> get homeContacts =>
      contacts.where((c) => c.addressType == ContactAddressType.home).toList();

  List<Contact> get workContacts =>
      contacts.where((c) => c.addressType == ContactAddressType.work).toList();

  List<ShippingQuote> get shippingOptions =>
      shippingQuotes?.options ?? const [];

  /// The quoted fee for the chosen carrier. No fallback to the first option: a fee
  /// belonging to a slug other than the one being sent is a total nobody charges.
  int get shippingFee {
    for (final option in shippingOptions) {
      if (option.option == transportOption) return option.fee;
    }
    return 0;
  }

  int get subtotal => lines.fold(0, (total, line) => total + line.lineTotal);

  int get total => subtotal + shippingFee;

  /// The listing states its own currency and `CheckoutRequest.currency` has to
  /// match it, so it is read off the listing rather than off a user preference.
  String get currency {
    for (final line in lines) {
      final stated = line.currency;
      if (stated != null) return stated;
    }
    return 'VND';
  }

  /// A draft is opened for one listing and its checkout refuses a line from
  /// another, spending the draft on the way — so a mixed selection is stopped here
  /// rather than by burning one draft per attempt.
  Set<String> get listingIds => lines.map((line) => line.listingId).toSet();

  /// Store a fresh quote and settle on a carrier: keep the chosen slug when it is
  /// still offered, otherwise take the first the server named.
  CheckoutState withQuotes(ShippingQuotes quotes) {
    final offered = quotes.options.map((option) => option.option);
    return copyWith(
      shippingQuotes: quotes,
      transportOption: offered.contains(transportOption)
          ? transportOption
          : (quotes.options.isEmpty ? null : quotes.options.first.option),
    );
  }

  /// Same rule for the rails: keep the chosen one while it is still offered, otherwise take
  /// the best-priority row the server named. An operator can retire a rail between the page
  /// opening and the buyer pressing pay, and a slug nobody offers is a 422 at the till.
  CheckoutState withPaymentOptions(List<Option> options) {
    final offered = options.map((option) => option.id);
    return copyWith(
      paymentOptions: options,
      paymentOption: offered.contains(paymentOption)
          ? paymentOption
          : (options.isEmpty ? null : options.first.id),
    );
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

  /// Khởi tạo luồng thanh toán với các dòng sản phẩm được chọn
  Future<void> initialize({required List<PurchaseLine> lines}) async {
    state = CheckoutState(lines: lines, isLoading: true);

    await _resolveListings();
    await _loadAddresses();
    await _loadPaymentOptions();
    await quoteShipping();
  }

  /// The rails, and a default so the common case is one tap. A registry that answers
  /// nothing is a deployment that cannot take money — surfaced rather than swallowed,
  /// because pressing "pay" would otherwise fail with nothing on screen to explain it.
  Future<void> _loadPaymentOptions() async {
    try {
      final options = await ref
          .read(checkoutRepositoryProvider)
          .paymentOptions();
      if (!ref.mounted) return;
      state = state.withPaymentOptions(options);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Which rail to charge. A slug the registry does not offer is ignored rather than stored,
  /// so nothing can put one on the wire.
  void selectPaymentOption(String id) {
    if (state.paymentOptions.any((option) => option.id == id)) {
      state = state.copyWith(paymentOption: id);
    }
  }

  /// Fill in the listings the lines arrived without — that is where a line's price,
  /// name and photo live.
  ///
  /// Only the missing ones, and a line never gives one back. Both ways into checkout
  /// already hand over resolved lines (the cart joined them, "mua ngay" had the
  /// listing in hand), and this used to re-read all of them and assign the answer
  /// unconditionally — so one failed read replaced good data with `null` and every
  /// row on the page became "Đang tải sản phẩm…" at 0₫, for a listing the screen
  /// was already holding.
  Future<void> _resolveListings() async {
    final missing = {
      for (final line in state.lines)
        if (line.listing == null) line.listingId,
    };
    if (missing.isEmpty) return;

    try {
      final resolved = await ref
          .read(checkoutRepositoryProvider)
          .listings(missing);

      if (!ref.mounted) return;
      state = state.copyWith(
        lines: [
          for (final line in state.lines)
            line.listing != null
                ? line
                : line.withListing(resolved[line.listingId]),
        ],
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: ErrorHandler.getErrorMessage(e));
    }
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

  /// Làm mới danh sách địa chỉ nhận hàng từ server
  Future<void> reloadAddresses({String? selectId}) async {
    try {
      final accountRepo = ref.read(accountRepositoryProvider);
      final list = await accountRepo.getContacts();

      Contact? newSelected = state.selectedContact;
      if (selectId != null) {
        final found = list.where((c) => c.id == selectId).toList();
        if (found.isNotEmpty) {
          newSelected = found.first;
        }
      }
      if (newSelected == null || !list.any((c) => c.id == newSelected?.id)) {
        newSelected = list.any((c) => c.phoneVerified)
            ? list.firstWhere((c) => c.phoneVerified)
            : list.firstOrNull;
      } else {
        final currentId = newSelected.id;
        newSelected = list.firstWhere((c) => c.id == currentId);
      }

      if (!ref.mounted) return;
      state = state.copyWith(contacts: list, selectedContact: newSelected);
      // The fee is quoted against the address, so an edited address is a requote.
      await quoteShipping();
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Chọn địa chỉ nhận hàng và báo giá lại theo địa chỉ đó
  Future<void> selectContact(Contact contact) async {
    state = state.copyWith(selectedContact: contact, errorMessage: null);
    await quoteShipping();
  }

  /// Chuyển sang bước tiếp theo
  void setStep(CheckoutStep step) {
    state = state.copyWith(step: step, errorMessage: null);
  }

  /// Chọn đơn vị vận chuyển trong số các lựa chọn server đã báo giá
  void selectTransportOption(String option) {
    state = state.copyWith(transportOption: option, errorMessage: null);
  }

  /// Ask the carriers what delivery costs. Asking is what produces the slug the
  /// checkout has to send, so it runs on open and on every address change rather
  /// than only when the buyer touches the list.
  Future<void> quoteShipping() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final quotes = await ref
          .read(checkoutRepositoryProvider)
          .getShippingQuotes(
            ShippingQuotesRequest(
              // Omitted, the caller's default delivery address is used — which is what
              // lets a listing page quote before any form is filled in.
              contactId: state.selectedContact?.id,
              lines: [
                for (final line in state.lines)
                  CheckoutLine(
                    variantId: line.variantId,
                    quantity: line.quantity,
                  ),
              ],
            ),
          );

      if (!ref.mounted) return;
      state = state.withQuotes(quotes).copyWith(isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// Thay đổi trạng thái đồng ý điều khoản dịch vụ
  void toggleAgreeToTerms({bool? value}) {
    state = state.copyWith(
      agreeToTerms: value ?? !state.agreeToTerms,
      errorMessage: null,
    );
  }

  /// Thực hiện đặt hàng và bắt đầu polling kết quả thanh toán
  Future<void> placeOrder() async {
    final refusal = _refusal();
    if (refusal != null) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: refusal);
      return;
    }

    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final checkoutRepo = ref.read(checkoutRepositoryProvider);

      // 1. Mở purchase session (DraftOrder) cho listing, freezing its prices.
      final draft = await checkoutRepo.createDraft(state.listingIds.single);

      // 2. Checkout draft: the money is what creates the order, so this is the
      //    sale. `currency` has to be the listing's own.
      final checkoutResult = await checkoutRepo.checkoutDraft(
        draft.id,
        CheckoutRequest(
          contactId: state.selectedContact!.id,
          currency: draft.currency,
          lines: [
            for (final line in state.lines)
              CheckoutLine(variantId: line.variantId, quantity: line.quantity),
          ],
          transportOption: state.transportOption!,
        ),
      );

      // 3. Tender the session. A failure here leaves a session nobody paid, so it
      //    is shown rather than swallowed — the buyer has an order to pay for and
      //    no way to pay it.
      final transaction = await checkoutRepo.startPayment(
        checkoutResult.paymentSessionId,
        StartPaymentRequest(
          paymentOption: state.paymentOption!,
          amount: checkoutResult.total,
        ),
      );

      if (!ref.mounted) return;
      state = state.copyWith(
        checkoutResult: checkoutResult,
        paymentTransaction: transaction,
        step: CheckoutStep.processing,
      );

      _startPolling(checkoutResult.paymentSessionId);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  /// What stops this order, in the buyer's words, or null when nothing does.
  String? _refusal() {
    if (!state.agreeToTerms) {
      return 'Vui lòng đồng ý với Điều khoản dịch vụ & Chính sách mua hàng trước khi thanh toán!';
    }
    if (state.selectedContact == null) {
      return 'Vui lòng chọn địa chỉ nhận hàng';
    }
    if (state.transportOption == null) {
      return 'Chưa có báo giá vận chuyển. Vui lòng thử lại.';
    }
    if (state.paymentOption == null) {
      return 'Chưa có phương thức thanh toán khả dụng.';
    }
    if (state.lines.isEmpty) {
      return 'Không có sản phẩm nào để thanh toán';
    }
    if (state.listingIds.length > 1) {
      return 'Mỗi đơn hàng chỉ thanh toán được sản phẩm của một tin đăng. Vui lòng tách đơn.';
    }
    return null;
  }

  /// Poll the payment session until it settles. A settled session is the whole
  /// answer *this* screen waits for — the order exists at that point, in
  /// `awaiting-confirmation`, and `order.placed` on the socket is the same fact
  /// arriving sooner. What happens next is the seller's 48 hours to confirm or
  /// decline, which is the order screen's business, not the checkout's.
  void _startPolling(String paymentSessionId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      try {
        final session = await ref
            .read(checkoutRepositoryProvider)
            .paymentSession(paymentSessionId);

        if (!ref.mounted) {
          timer.cancel();
          return;
        }

        switch (session.status) {
          case PaymentSessionStatus.success:
            timer.cancel();
            state = state.copyWith(
              step: CheckoutStep.success,
              paymentSession: session,
              isLoading: false,
            );
          case PaymentSessionStatus.failed:
          case PaymentSessionStatus.cancelled:
            timer.cancel();
            state = state.copyWith(
              step: CheckoutStep.failed,
              paymentSession: session,
              isLoading: false,
              errorMessage: 'Thanh toán không thành công hoặc phiên bị hủy.',
            );
          case PaymentSessionStatus.pending:
          case PaymentSessionStatus.processing:
            state = state.copyWith(paymentSession: session);
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
