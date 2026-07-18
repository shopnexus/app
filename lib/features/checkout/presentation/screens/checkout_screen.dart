import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../account/data/models/account_model.dart';
import '../../data/models/checkout_model.dart';
import '../providers/checkout_provider.dart';
import '../../../cart/presentation/providers/cart_provider.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutState = ref.watch(checkoutProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: _buildAppBar(context, checkoutState),
      body: _buildBody(context, ref, checkoutState),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, CheckoutState state) {
    // Ẩn thanh AppBar mặc định khi đang processing hoặc thành công để giữ tính tập trung giao dịch
    final isTransactional =
        state.step == CheckoutStep.processing ||
        state.step == CheckoutStep.success ||
        state.step == CheckoutStep.failed;

    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        state.step == CheckoutStep.success
            ? 'Success'
            : state.step == CheckoutStep.failed
            ? 'Payment Failed'
            : 'Checkout',
      ),
      leading: isTransactional
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              onPressed: () => context.pop(),
            ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CheckoutState state) {
    if (state.isLoading && state.contacts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    switch (state.step) {
      case CheckoutStep.address:
        return _buildAddressStep(context, ref, state);
      case CheckoutStep.shipping:
        return _buildShippingStep(context, ref, state);
      case CheckoutStep.payment:
        return _buildPaymentStep(context, ref, state);
      case CheckoutStep.processing:
        return _buildProcessingStep(context, ref, state);
      case CheckoutStep.success:
        return _buildSuccessStep(context, ref, state);
      case CheckoutStep.failed:
        return _buildFailedStep(context, ref, state);
    }
  }

  // --- BƯỚC 1: CHỌN ĐỊA CHỈ NHẬN HÀNG ---
  Widget _buildAddressStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final notifier = ref.read(checkoutProvider.notifier);

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: Colors.white,
            child: TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(icon: Icon(Icons.home_outlined), text: 'Home'),
                Tab(icon: Icon(Icons.work_outline), text: 'Office'),
                Tab(icon: Icon(Icons.more_horiz_outlined), text: 'Other'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildAddressList(
                  ref,
                  state.homeContacts,
                  state.selectedContact,
                ),
                _buildAddressList(
                  ref,
                  state.officeContacts,
                  state.selectedContact,
                ),
                _buildAddressList(
                  ref,
                  state.otherContacts,
                  state.selectedContact,
                ),
              ],
            ),
          ),
          _buildStepCTA(
            context,
            title: 'Continue to Shipping',
            enabled: state.selectedContact != null,
            onPressed: () {
              notifier.setStep(CheckoutStep.shipping);
              notifier.selectShippingOption(
                state.shippingOption,
              ); // Lấy báo giá phí vận chuyển mặc định
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddressList(
    WidgetRef ref,
    List<Contact> list,
    Contact? selected,
  ) {
    if (list.isEmpty) {
      return const Center(
        child: Text(
          'No addresses found in this category.',
          style: TextStyle(fontFamily: 'Inter', color: AppColors.textSecondary),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final contact = list[index];
        final isSelected = selected?.id == contact.id;

        return GestureDetector(
          onTap: () =>
              ref.read(checkoutProvider.notifier).selectContact(contact),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
                width: isSelected ? 2.0 : 1.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            contact.fullName,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          if (contact.phoneVerified)
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.verified_user_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        contact.address,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (contact.addressDetail != null)
                        Text(
                          contact.addressDetail!,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        contact.phone,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Radio<String>(
                  value: contact.id,
                  groupValue: selected?.id,
                  activeColor: AppColors.primary,
                  onChanged: (_) => ref
                      .read(checkoutProvider.notifier)
                      .selectContact(contact),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- BƯỚC 2: CHỌN HÌNH THỨC VẬN CHUYỂN ---
  Widget _buildShippingStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final notifier = ref.read(checkoutProvider.notifier);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildShippingOptionCard(
                ref,
                title: 'Standard Delivery',
                description: 'Estimated arrival: 3 - 5 business days',
                value: 'Standard',
                groupValue: state.shippingOption,
                costDisplay: state.quoteResponse != null
                    ? 'Calculated'
                    : 'Select to calculate',
              ),
              const SizedBox(height: 12),
              _buildShippingOptionCard(
                ref,
                title: 'Express Delivery',
                description: 'Estimated arrival: 1 - 2 business days',
                value: 'Express',
                groupValue: state.shippingOption,
                costDisplay: state.quoteResponse != null
                    ? 'Calculated'
                    : 'Select to calculate',
              ),
              if (state.quoteResponse != null) ...[
                const SizedBox(height: 24),
                const Text(
                  'Shipping Cost Details',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E3E0)),
                  ),
                  child: Column(
                    children: state.quoteResponse!.items.map((quote) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Item SKU #${quote.skuId.substring(0, 8)}...',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              MoneyUtils.format(
                                quote.cost,
                                currency: quote.currency,
                              ),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ],
          ),
        ),
        _buildStepCTA(
          context,
          title: 'Continue to Payment',
          enabled: state.quoteResponse != null && !state.isLoading,
          onPressed: () => notifier.setStep(CheckoutStep.payment),
        ),
      ],
    );
  }

  Widget _buildShippingOptionCard(
    WidgetRef ref, {
    required String title,
    required String description,
    required String value,
    required String groupValue,
    required String costDisplay,
  }) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () =>
          ref.read(checkoutProvider.notifier).selectShippingOption(value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE6F4EA) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              activeColor: AppColors.primary,
              onChanged: (val) => ref
                  .read(checkoutProvider.notifier)
                  .selectShippingOption(val!),
            ),
          ],
        ),
      ),
    );
  }

  // --- BƯỚC 3: PHƯƠNG THỨC THANH TOÁN & ĐẶT HÀNG ---
  Widget _buildPaymentStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final notifier = ref.read(checkoutProvider.notifier);
    final cartState = ref.watch(cartProvider);

    // Tính toán tổng tiền hàng quy đổi từ giỏ hàng
    final subtotal = cartState.calculatedTotal;
    final shipping = state.totalShippingCost;
    final total = subtotal + shipping;

    final subtotalFormatted = MoneyUtils.format(
      subtotal,
      currency: cartState.preferredCurrency,
    );
    final shippingFormatted = MoneyUtils.format(
      shipping,
      currency: cartState.preferredCurrency,
    );
    final totalFormatted = MoneyUtils.format(
      total,
      currency: cartState.preferredCurrency,
    );

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildPaymentOptionButton(
                      ref,
                      label: 'Stripe Card',
                      icon: Icons.credit_card_rounded,
                      value: 'Stripe',
                      groupValue: state.paymentOption,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildPaymentOptionButton(
                      ref,
                      label: 'Platform Wallet',
                      icon: Icons.account_balance_wallet_outlined,
                      value: 'Wallet',
                      groupValue: state.paymentOption,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Option to use wallet as priority
              CheckboxListTile(
                value: state.useWallet,
                activeColor: AppColors.primary,
                title: const Text(
                  'Use wallet balance first',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
                onChanged: (val) => notifier.selectPaymentOption(
                  state.paymentOption,
                  useWallet: val,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 24),
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Render list of items
              ...state.items.map(
                (item) => _buildSummaryItem(context, ref, item, state.buyNow),
              ),
              const SizedBox(height: 24),
              // Breakdown Cost Table
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E3E0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Items subtotal',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          subtotalFormatted,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping cost',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          shippingFormatted,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFE2E3E0), height: 1),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total amount',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          totalFormatted,
                          style: const TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildStepCTA(
          context,
          title: 'Place Order',
          enabled: !state.isLoading,
          onPressed: () => notifier.placeOrder(),
        ),
      ],
    );
  }

  Widget _buildPaymentOptionButton(
    WidgetRef ref, {
    required String label,
    required IconData icon,
    required String value,
    required String groupValue,
  }) {
    final isSelected = value == groupValue;

    return ElevatedButton(
      onPressed: () =>
          ref.read(checkoutProvider.notifier).selectPaymentOption(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFFE6F4EA) : Colors.white,
        foregroundColor: isSelected
            ? AppColors.primary
            : AppColors.textSecondary,
        elevation: 0,
        side: BorderSide(
          color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
          width: isSelected ? 2.0 : 1.0,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    WidgetRef ref,
    CheckoutItem item,
    bool buyNow,
  ) {
    if (!buyNow) {
      final cartState = ref.watch(cartProvider);
      final matchingItems = cartState.items
          .where((c) => c.sku.id == item.skuId)
          .toList();
      if (matchingItems.isNotEmpty) {
        final cartItem = matchingItems.first;
        return _buildItemCard(
          name: cartItem.sku.name,
          imageUrl: cartItem.resource?.url ?? '',
          quantity: item.quantity,
          price: cartItem.sku.price,
          currency: cartItem.currency,
          attributes: cartItem.sku.attributes,
        );
      }
    }

    return _buildItemCard(
      name: 'Product SKU #${item.skuId.substring(0, 8)}...',
      imageUrl: '',
      quantity: item.quantity,
      price: 0,
      currency: 'USD',
    );
  }

  Widget _buildItemCard({
    required String name,
    required String imageUrl,
    required int quantity,
    required int price,
    required String currency,
    dynamic attributes,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E3E0)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Container(color: const Color(0xFFF4F4F1)),
              errorWidget: (context, url, error) => Container(
                color: const Color(0xFFF4F4F1),
                child: const Icon(Icons.image, size: 20, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Quantity: $quantity',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            MoneyUtils.format(price, currency: currency),
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  // --- BƯỚC 4: ĐANG THANH TOÁN (POLLING) ---
  Widget _buildProcessingStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 4,
            ),
            const SizedBox(height: 24),
            const Text(
              'Processing Payment...',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We are syncing transaction status with the payment gateway. Please do not close the app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            if (state.checkoutResponse?.paymentUrl != null &&
                state.checkoutResponse!.paymentUrl!.isNotEmpty) ...[
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  // Mở link thanh toán Stripe bằng trình duyệt ngoài
                },
                child: const Text('Open Stripe Link Again'),
              ),
            ],
            const SizedBox(height: 24),
            TextButton(
              onPressed: () =>
                  ref.read(checkoutProvider.notifier).stopPolling(),
              child: const Text(
                'Cancel Payment',
                style: TextStyle(color: Color(0xFFBA1A1A)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- BƯỚC 5: GIAO DỊCH THÀNH CÔNG ---
  Widget _buildSuccessStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final summary = state.checkoutSummary;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F4EA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                size: 72,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Order Placed Successfully!',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Transaction ID: #${summary?.session.id ?? ''}',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            if (summary != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E3E0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Amount Paid',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          MoneyUtils.format(
                            summary.session.totalAmount,
                            currency: summary.session.currency,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Payment Time',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          summary.session.datePaid ??
                              summary.session.dateCreated,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: AppColors.textPrimary,
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
                  // Đăng xuất và dọn dẹp Cart
                  ref.read(cartProvider.notifier).fetchCart();
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- BƯỚC 6: GIAO DỊCH THẤT BẠI ---
  Widget _buildFailedStep(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFFFDAD6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 72,
                color: Color(0xFFBA1A1A),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Payment Failed',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ??
                  'An error occurred during transaction processing.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => ref
                    .read(checkoutProvider.notifier)
                    .setStep(CheckoutStep.payment),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
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

  // Helper CTA bottom bar
  Widget _buildStepCTA(
    BuildContext context, {
    required String title,
    required bool enabled,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE2E3E0))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            offset: const Offset(0, -4),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: const Color(0xFFBEC9C6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
