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
import 'package:shopnexus_flutter_app/api/generated/model/draft_order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/models/checkout_model.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/repositories/checkout_repository.dart';

part 'checkout_provider.freezed.dart';

part 'checkout_provider.g.dart';

/// Đường cổng thanh toán đẩy người trả tiền về.
///
/// Dùng lại trang `/checkout` của website: nó đã nằm trong allowlist
/// `payment.return_url_hosts` của server, và app thì không có origin web nào của
/// riêng nó để khai. WebView chỉ cần **nhận ra** địa chỉ này để đóng lại — nội
/// dung trang không phải bằng chứng gì cả, callback của cổng mới là.
String paymentReturnUrl(String paymentSessionId) =>
    'https://shopnexus.hopto.org/checkout?session_id=$paymentSessionId';

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

    /// Phiên mua đã mở cho tin đăng này. Nó phải tồn tại **trước** khi hỏi phí vận
    /// chuyển: `POST /shipping-quotes` bắt phải nêu đúng một nguồn — một variant,
    /// một draft, hay một offer — và trang thanh toán có nhiều dòng nên nguồn của
    /// nó là draft. Thiếu nó thì route trả 400 `quote_source_invalid`, và màn hình
    /// chỉ thấy một danh sách rỗng nên nói nhầm thành "chưa có báo giá cho địa chỉ
    /// này".
    DraftOrder? draft,
    ShippingQuotes? shippingQuotes,

    /// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
    /// answered — never a label. Null until a quote has been asked for.
    String? transportOption,

    /// The rails this deployment can charge on, and the one the buyer picked. Read from
    /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
    /// checkout that breaks the day an operator retires that rail.
    @Default([]) List<Option> paymentOptions,
    String? paymentOption,
    String? note,
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

/// `keepAlive` là bắt buộc, không phải tối ưu.
///
/// `initialize()` được gọi bằng `ref.read(checkoutProvider.notifier)` từ **trang
/// khác** (giỏ hàng, trang tin đăng) ngay trước khi điều hướng, nên có một khoảng
/// không widget nào watch provider này. Ở chế độ autoDispose, khoảng đó đủ để nó
/// bị bỏ đi giữa chừng: state quay về `const CheckoutState()` và `ref.mounted`
/// thành false, nên ba bước còn lại của `initialize` lặng lẽ return. Màn thanh
/// toán mở ra với danh sách sản phẩm rỗng, không phương thức thanh toán, và câu
/// "chưa có báo giá vận chuyển cho địa chỉ này" — cả ba từ một nguyên nhân.
///
/// `initialize()` đặt lại toàn bộ state, nên lần thanh toán sau không thừa hưởng
/// gì của lần trước.
@Riverpod(keepAlive: true)
class CheckoutNotifier extends _$CheckoutNotifier {
  Timer? _pollingTimer;

  /// Poll tối đa bằng đời của một payment session. Nó tồn tại vì `keepAlive`:
  /// người dùng rời màn giữa lúc chờ trả tiền thì không còn ai dispose provider,
  /// và một `Timer.periodic` 2 giây sẽ chạy tới hết đời tiến trình. Quá hạn này
  /// thì phiên đã bị job dọn, nên hỏi thêm cũng không có câu trả lời mới.
  static const _pollBudget = Duration(minutes: 15);

  @override
  CheckoutState build() {
    ref.onDispose(() {
      _pollingTimer?.cancel();
    });
    return const CheckoutState();
  }

  /// Khởi tạo luồng thanh toán với các dòng sản phẩm được chọn
  Future<void> initialize({required List<PurchaseLine> lines}) async {
    // Provider sống xuyên suốt, nên một lần thanh toán mới phải tự dọn cái đồng
    // hồ của lần trước.
    _pollingTimer?.cancel();
    _pollingTimer = null;
    state = CheckoutState(lines: lines, isLoading: true);

    await _resolveListings();
    await _loadAddresses();
    await _loadPaymentOptions();
    await _openDraft();
    await quoteShipping();
  }

  /// Mở phiên mua cho tin đăng đang thanh toán, đóng băng giá của người bán.
  ///
  /// Mở ở đây chứ không ở `placeOrder` vì báo giá vận chuyển cần nó — website làm
  /// đúng vậy, nó nhận `?draft_id=` từ trang tin đăng rồi mới hỏi giá. Một draft
  /// bị bỏ dở sẽ tự hết hạn, nên mở sớm không tốn gì; còn hỏi giá mà không có
  /// nguồn thì không bao giờ có câu trả lời.
  Future<void> _openDraft() async {
    final listings = state.listingIds;
    if (listings.length != 1) return;
    try {
      final draft = await ref
          .read(checkoutRepositoryProvider)
          .createDraft(listings.single);
      if (!ref.mounted) return;
      state = state.copyWith(draft: draft);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: ErrorHandler.getErrorMessage(e));
    }
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
    // Không có phiên mua thì không có gì để báo giá. Gửi đi vẫn chỉ nhận 400, và
    // một lỗi im lặng ở đây đọc ra thành "địa chỉ này không giao được".
    if (state.draft == null) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Không mở được phiên mua cho tin đăng này.',
      );
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final quotes = await ref
          .read(checkoutRepositoryProvider)
          .getShippingQuotes(
            ShippingQuotesRequest(
              // Đúng một nguồn, và ở đây là draft: trang này có thể có nhiều dòng
              // (hai màu của cùng một tin), mà `variant_id` chỉ báo giá được một.
              draftId: state.draft!.id,
              // Bỏ trống thì server dùng địa chỉ giao mặc định của người gọi — thứ
              // cho phép trang tin đăng báo giá trước khi có form nào được điền.
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

  /// Cập nhật lời nhắn cho người bán
  void setNote(String note) {
    state = state.copyWith(note: note);
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

      // Phiên mua đã mở lúc vào trang — cùng cái đã đóng băng giá cho báo giá vận
      // chuyển. Mở thêm một cái nữa ở đây là đóng băng giá lần hai và bỏ rơi cái
      // người mua đang nhìn.
      final draft = state.draft!;

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
          note: (state.note?.trim().isNotEmpty == true)
              ? state.note!.trim()
              : null,
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
          // Bắt buộc với rail chuyển hướng — Stripe từ chối thẳng nếu thiếu, nên
          // trước đây app không trả được bằng thẻ chút nào. Host phải nằm trong
          // allowlist của server (`payment.return_url_hosts`), vì một đường về
          // không kiểm là một open redirect mượn uy tín của tên miền này.
          returnUrl: paymentReturnUrl(checkoutResult.paymentSessionId),
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
    // Sau cùng, vì `placeOrder` đọc thẳng `state.draft!`: không có phiên mua thì
    // không có giá nào được đóng băng, và đó là một câu từ chối chứ không phải một
    // cú crash.
    if (state.draft == null) {
      return 'Không mở được phiên mua cho tin đăng này. Vui lòng thử lại.';
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
    final until = DateTime.now().add(_pollBudget);
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (DateTime.now().isAfter(until)) {
        timer.cancel();
        return;
      }
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
