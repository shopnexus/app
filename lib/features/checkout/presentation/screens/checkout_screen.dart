import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/screens/payment_webview_screen.dart';
import 'package:shopnexus_flutter_app/shared/widgets/escrow_notice.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  static const int _initialVisibleCount = 3;
  static const int _expandStepCount = 5;

  int _visibleShippingCount = _initialVisibleCount;
  int _visiblePaymentCount = _initialVisibleCount;
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(
      text: ref.read(checkoutProvider).note ?? '',
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final checkoutState = ref.watch(checkoutProvider);

    // Rail chuyển hướng thì mở trang của cổng ngay khi có URL, không bắt chạm
    // thêm một nút: người trả tiền vừa bấm "đặt hàng", và trang đó là bước tiếp
    // theo của chính cái họ vừa bấm. Nút bên dưới là đường quay lại nếu họ đóng.
    //
    // `listen` chứ không phải mở trong `build`: build chạy lại nhiều lần, và mỗi
    // lần chạy lại sẽ chồng thêm một WebView nữa.
    ref.listen(checkoutProvider, (previous, next) {
      final url = next.paymentTransaction?.checkoutUrl ?? '';
      final had = previous?.paymentTransaction?.checkoutUrl ?? '';
      if (url.isEmpty || url == had) return;
      final sessionId = next.checkoutResult?.paymentSessionId;
      if (sessionId == null) return;
      PaymentWebViewScreen.show(
        context,
        checkoutUrl: url,
        returnUrl: paymentReturnUrl(sessionId),
      );
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, checkoutState),
      body: _buildBody(context, ref, checkoutState),
      bottomNavigationBar: _shouldShowBottomCTA(checkoutState)
          ? _buildFixedBottomCTA(context, ref, checkoutState)
          : null,
    );
  }

  bool _shouldShowBottomCTA(CheckoutState state) {
    return state.step != CheckoutStep.processing &&
        state.step != CheckoutStep.success &&
        state.step != CheckoutStep.failed;
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, CheckoutState state) {
    final theme = Theme.of(context);
    final isTransactional =
        state.step == CheckoutStep.processing ||
        state.step == CheckoutStep.success ||
        state.step == CheckoutStep.failed;

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        state.step == CheckoutStep.success
            ? 'Success'
            : state.step == CheckoutStep.failed
            ? 'Payment Failed'
            : 'Checkout',
        style: TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
      leading: isTransactional
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: () => context.pop(),
            ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CheckoutState state) {
    final theme = Theme.of(context);
    if (state.isLoading && state.contacts.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: theme.colorScheme.primary),
      );
    }

    switch (state.step) {
      case CheckoutStep.processing:
        return _buildProcessingStep(context, ref, state);
      case CheckoutStep.success:
        return _buildSuccessStep(context, ref, state);
      case CheckoutStep.failed:
        return _buildFailedStep(context, ref, state);
      default:
        return _buildSinglePageBentoLayout(context, ref, state);
    }
  }

  // --- STITCH BENTO SINGLE PAGE LAYOUT ---
  Widget _buildSinglePageBentoLayout(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cái đang mua đứng trước cách nó tới và cách trả tiền: một trang thanh
          // toán mở ra ở "địa chỉ" bắt người ta cuộn qua ba thẻ để kiểm lại mình
          // đang mua gì, mà đó là câu hỏi đầu tiên họ có.
          _buildOrderItemsCard(context, ref, state),
          const SizedBox(height: 16),

          _buildAddressBentoCard(context, ref, state),
          const SizedBox(height: 16),

          _buildDeliverySpeedCard(context, ref, state),
          const SizedBox(height: 16),

          _buildPaymentMethodCard(context, ref, state),
          const SizedBox(height: 16),

          _buildBuyerNoteCard(context, ref, state),
          const SizedBox(height: 16),

          _buildOrderSummaryCard(context, state),
          const SizedBox(height: 16),

          // 6. Terms & Conditions Checkbox
          _buildTermsAndConditionsRow(context, ref, state),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // --- 1. DELIVERY ADDRESS BENTO CARD ---
  /// Một dòng địa chỉ đang chọn và một nút "Đổi". Sổ địa chỉ là màn hình
  /// `AddressesScreen`, dùng lại ở chế độ chọn — checkout từng dựng lại thẻ địa
  /// chỉ của riêng nó, nên "một địa chỉ trông thế nào" có hai định nghĩa và chỉ
  /// một trong hai được sửa mỗi lần.
  Widget _buildAddressBentoCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final contact = state.selectedContact;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: theme.colorScheme.primary,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: contact == null
                ? Text(
                    'Chưa chọn địa chỉ nhận hàng',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode
                          ? const Color(0xFFEF4444)
                          : const Color(0xFFBA1A1A),
                    ),
                  )
                : Text(
                    '${contact.fullName} · ${contact.phone}\n${contact.address}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      height: 1.4,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () => _pickAddress(context, ref),
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
            child: const Text(
              'Đổi',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Địa chỉ được chọn quay về theo `pop`, nhưng cái được dùng là **id** của nó:
  /// `reloadAddresses` đọc lại danh sách từ server, nên một địa chỉ vừa thêm
  /// trong picker cũng vào được state, và nó báo giá vận chuyển lại — phí giao
  /// hàng được tính theo địa chỉ.
  Future<void> _pickAddress(BuildContext context, WidgetRef ref) async {
    final picked = await context.push<Contact>('/checkout/select-address');
    if (picked == null) return;
    await ref
        .read(checkoutProvider.notifier)
        .reloadAddresses(selectId: picked.id);
  }

  // --- 2. DELIVERY SPEED CARD ---
  Widget _buildDeliverySpeedCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);

    final shippingOptions = state.shippingOptions;
    final displayedOptions = shippingOptions
        .take(_visibleShippingCount)
        .toList();
    final hasMore = shippingOptions.length > _visibleShippingCount;
    final remaining = shippingOptions.length - _visibleShippingCount;
    final canCollapse =
        !hasMore && shippingOptions.length > _initialVisibleCount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Đơn vị vận chuyển',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Whatever POST /shipping-quotes named, and only that: the slug sent at
          // checkout has to be one the carrier registry actually has enabled.
          if (shippingOptions.isEmpty)
            Text(
              state.isLoading
                  ? 'Đang lấy báo giá vận chuyển…'
                  : 'Chưa có báo giá vận chuyển cho địa chỉ này.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          else ...[
            for (final option in displayedOptions)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildRegistryOptionTile(
                  context,
                  title: option.name,
                  description: MoneyUtils.format(
                    option.fee,
                    currency: state.shippingQuotes!.currency,
                  ),
                  value: option.option,
                  groupValue: state.transportOption,
                  onTap: () => ref
                      .read(checkoutProvider.notifier)
                      .selectTransportOption(option.option),
                ),
              ),
            if (hasMore)
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _visibleShippingCount += _expandStepCount;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                  label: Text(
                    'Xem thêm ($remaining)',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                  ),
                ),
              )
            else if (canCollapse)
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _visibleShippingCount = _initialVisibleCount;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 18),
                  label: const Text(
                    'Thu gọn',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  /// One row of a registry the buyer picks from — a carrier or a payment rail. The tap is the
  /// caller's, because the two registries are chosen through different methods and a widget that
  /// hardcodes one of them cannot serve the other.
  Widget _buildRegistryOptionTile(
    BuildContext context, {
    required String title,
    required String description,
    required String value,
    required String? groupValue,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final isSelected = value == groupValue;

    final selectedBg = isDarkMode
        ? AppColors.darkPrimary.withAlpha(35)
        : const Color(0xFFE6F4EA);
    final unselectedBg = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF9F9F7);
    final borderColor = isSelected
        ? theme.colorScheme.primary
        : (isDarkMode
              ? AppColors.darkPrimary.withAlpha(30)
              : const Color(0xFFE2E3E0));

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1.0),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. PAYMENT METHOD CARD ---
  /// One rail, because the platform has one enabled. There is no route listing the
  /// registry, so offering a choice here could only invent slugs the server refuses.
  Widget _buildPaymentMethodCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);

    final paymentOptions = state.paymentOptions;
    final displayedOptions = paymentOptions.take(_visiblePaymentCount).toList();
    final hasMore = paymentOptions.length > _visiblePaymentCount;
    final remaining = paymentOptions.length - _visiblePaymentCount;
    final canCollapse =
        !hasMore && paymentOptions.length > _initialVisibleCount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.payment_outlined,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Phương thức thanh toán',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Whatever GET /options?category=payment named, and only that. The card used to show one
          // hardcoded box: it claimed a rail the registry no longer had, so every checkout ended in
          // a 422 the buyer could do nothing about, and there was nothing to pick anyway.
          if (paymentOptions.isEmpty)
            Text(
              state.isLoading
                  ? 'Đang tải phương thức thanh toán…'
                  : 'Chưa có phương thức thanh toán khả dụng.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          else ...[
            for (final option in displayedOptions)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildRegistryOptionTile(
                  context,
                  title: option.name,
                  description: option.description,
                  value: option.id,
                  groupValue: state.paymentOption,
                  onTap: () => ref
                      .read(checkoutProvider.notifier)
                      .selectPaymentOption(option.id),
                ),
              ),
            if (hasMore)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _visiblePaymentCount += _expandStepCount;
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                    ),
                    label: Text(
                      'Xem thêm ($remaining)',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ),
                ),
              )
            else if (canCollapse)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _visiblePaymentCount = _initialVisibleCount;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 18),
                    label: const Text(
                      'Thu gọn',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
          ],
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Tiền được giữ tại ShopNexus cho tới khi bạn nhận hàng',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 4. BUYER NOTE CARD ---
  Widget _buildBuyerNoteCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);
    final inputBgColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF8FAFC);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_note_rounded,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Lời nhắn cho người bán',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _noteController,
            maxLines: 3,
            minLines: 1,
            maxLength: 200,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: theme.colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText:
                  'Lưu ý cho người bán (ví dụ: thời gian nhận hàng, đóng gói cẩn thận...)',
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              filled: true,
              fillColor: inputBgColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(30)
                      : const Color(0xFFE2E3E0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(30)
                      : const Color(0xFFE2E3E0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.5,
                ),
              ),
              counterStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            onChanged: (value) {
              ref.read(checkoutProvider.notifier).setNote(value);
            },
          ),
        ],
      ),
    );
  }

  // --- 5. ORDER ITEMS CARD ---
  Widget _buildOrderItemsCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);
    final itemPlaceholderBg = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF9F9F7);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                state.lines.length > 1
                    ? 'Đang mua ${state.lines.length} món'
                    : 'Đang mua',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...state.lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: line.imageUrl ?? '',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: itemPlaceholderBg),
                      errorWidget: (context, url, error) => Container(
                        color: itemPlaceholderBg,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 18,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // Một dòng không đọc được tin đăng thì nói thẳng, không
                          // treo "Đang tải…" mãi: tin có thể đã bị gỡ, và người
                          // mua cần biết trước khi trả tiền chứ không sau.
                          line.name ?? 'Không đọc được tin đăng này',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: line.name == null
                                ? theme.colorScheme.error
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                        // Phiên bản nào, vì hai dòng cùng một tin chỉ khác nhau ở
                        // đây — "Màu sắc: Xanh dương" là thứ phân biệt chúng.
                        if (line.attributesLabel != null)
                          Text(
                            line.attributesLabel!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        Text(
                          // Đơn giá × số lượng, không chỉ số lượng: tổng dòng bên
                          // phải là phép nhân của hai số này, và không hiện đơn giá
                          // thì người đọc không kiểm được nó.
                          line.unitPrice == null
                              ? 'SL: ${line.quantity}'
                              : '${MoneyUtils.format(line.unitPrice!, currency: line.currency ?? state.currency)}'
                                    ' × ${line.quantity}',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    MoneyUtils.format(
                      line.lineTotal,
                      currency: line.currency ?? state.currency,
                    ),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 5. ORDER SUMMARY CARD ---
  Widget _buildOrderSummaryCard(BuildContext context, CheckoutState state) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final subtotal = state.subtotal;
    final shipping = state.shippingFee;
    final total = subtotal + shipping;

    final subtotalFormatted = MoneyUtils.format(
      subtotal,
      currency: state.currency,
    );
    final shippingFormatted = MoneyUtils.format(
      shipping,
      currency: state.currency,
    );
    final totalFormatted = MoneyUtils.format(total, currency: state.currency);

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 40 : 6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items Subtotal',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                subtotalFormatted,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                shippingFormatted,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: cardBorderColor, height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                totalFormatted,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- FIXED BOTTOM CTA ---
  Widget _buildFixedBottomCTA(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final subtotal = state.subtotal;
    final shipping = state.shippingFee;
    final total = subtotal + shipping;
    final totalFormatted = MoneyUtils.format(total, currency: state.currency);

    final ctaBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkSurface : Colors.white,
        border: Border(top: BorderSide(color: ctaBorderColor)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDarkMode ? 60 : 10),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () {
                  if (!state.agreeToTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Vui lòng đồng ý với Điều khoản sử dụng & Chính sách bảo mật trước khi thanh toán!',
                        ),
                        backgroundColor: Colors.orange,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  ref.read(checkoutProvider.notifier).placeOrder();
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            disabledBackgroundColor: isDarkMode
                ? theme.colorScheme.surfaceContainerHighest
                : const Color(0xFFBEC9C6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline_rounded, size: 18),
              const SizedBox(width: 8),
              Text(
                'Place Order • $totalFormatted',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionsRow(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF9F9F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode
              ? AppColors.darkPrimary.withAlpha(30)
              : const Color(0xFFE2E3E0),
        ),
      ),
      child: InkWell(
        onTap: () => ref.read(checkoutProvider.notifier).toggleAgreeToTerms(),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Checkbox(
              value: state.agreeToTerms,
              activeColor: theme.colorScheme.primary,
              onChanged: (val) => ref
                  .read(checkoutProvider.notifier)
                  .toggleAgreeToTerms(value: val),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurface,
                  ),
                  children: [
                    const TextSpan(text: 'Tôi đồng ý với '),
                    // Mở ra được, không còn là chữ xanh trang trí: người mua đang
                    // được hỏi có đồng ý với một văn bản, nên văn bản đó phải đọc
                    // được ngay tại chỗ hỏi.
                    TextSpan(
                      text: 'Điều khoản sử dụng',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push('/terms'),
                    ),
                    const TextSpan(text: ' và '),
                    TextSpan(
                      text: 'Chính sách bảo mật',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push('/privacy'),
                    ),
                    const TextSpan(text: ' của ShopNexus.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- TRANSACTIONAL STATES (PROCESSING, SUCCESS, FAILED) ---
  Widget _buildProcessingStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
              strokeWidth: 4,
            ),
            const SizedBox(height: 24),
            Text(
              'Processing Payment...',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Đang chờ cổng thanh toán xác nhận. Vui lòng không đóng ứng dụng.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            // Một rail chuyển hướng trả về URL chứ không trả về kết quả, và người
            // trả tiền phải tới đó thì mới có gì xảy ra. Mở **trong app**: trước
            // đây chỗ này in URL ra để tự chép sang trình duyệt, nghĩa là rời khỏi
            // app giữa lúc trả tiền và quay lại bằng cách nào là chuyện của họ.
            if (state.paymentTransaction?.checkoutUrl != null) ...[
              const SizedBox(height: 20),
              Text(
                'Phương thức này cần hoàn tất trên trang của cổng thanh toán.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => PaymentWebViewScreen.show(
                  context,
                  checkoutUrl: state.paymentTransaction!.checkoutUrl,
                  returnUrl: paymentReturnUrl(
                    state.checkoutResult!.paymentSessionId,
                  ),
                ),
                icon: const Icon(Icons.lock_outline_rounded, size: 18),
                label: const Text('Mở trang thanh toán'),
              ),
            ],
            const SizedBox(height: 24),
            TextButton(
              onPressed: () =>
                  ref.read(checkoutProvider.notifier).stopPolling(),
              child: Text(
                'Cancel Payment',
                style: TextStyle(
                  color: isDarkMode
                      ? const Color(0xFFEF4444)
                      : const Color(0xFFBA1A1A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final session = state.paymentSession;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                size: 72,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              // Không phải "đặt hàng thành công" nữa: tiền đã vào escrow và đơn
              // đang chờ người bán xác nhận, nên đây là "đã thanh toán".
              'Đã thanh toán',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mã phiên thanh toán: ${session?.id ?? ''}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            // Ngay tại đây, không phải trong FAQ: người mua vừa chuyển tiền cho
            // một người lạ và đây là câu nói tiền đang ở đâu.
            if (session != null) ...[
              EscrowNotice(
                amount: session.totalAmount,
                currency: session.currency,
              ),
              const SizedBox(height: 16),
            ],
            if (session != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode
                        ? AppColors.darkPrimary.withAlpha(40)
                        : const Color(0xFFE2E3E0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số tiền đã trả',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          MoneyUtils.format(
                            session.totalAmount,
                            currency: session.currency,
                          ),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).fetchCart();
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Về trang chủ'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFailedStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF450A0A)
                    : const Color(0xFFFFDAD6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 72,
                color: isDarkMode
                    ? const Color(0xFFEF4444)
                    : const Color(0xFFBA1A1A),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Payment Failed',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ??
                  'An error occurred during transaction processing.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => ref
                    .read(checkoutProvider.notifier)
                    .setStep(CheckoutStep.address),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Try Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
