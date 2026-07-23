import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../account/data/models/account_model.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../providers/checkout_provider.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutState = ref.watch(checkoutProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
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
    final isTransactional =
        state.step == CheckoutStep.processing ||
        state.step == CheckoutStep.success ||
        state.step == CheckoutStep.failed;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        state.step == CheckoutStep.success
            ? 'Success'
            : state.step == CheckoutStep.failed
            ? 'Payment Failed'
            : 'Checkout',
        style: const TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
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
    if (state.isLoading &&
        state.contacts.isEmpty &&
        state.quoteResponse == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
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
          // 1. Delivery Address Section (Bento Style)
          _buildAddressBentoCard(context, ref, state),
          const SizedBox(height: 16),

          // 2. Delivery Speed Section
          _buildDeliverySpeedCard(ref, state),
          const SizedBox(height: 16),

          // 3. Payment Method Section
          _buildPaymentMethodCard(ref, state),
          const SizedBox(height: 16),

          // 4. Order Items Section
          _buildOrderItemsCard(context, ref, state),
          const SizedBox(height: 16),

          // 5. Order Summary Card
          _buildOrderSummaryCard(state),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // --- 1. DELIVERY ADDRESS BENTO CARD ---
  Widget _buildAddressBentoCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final contact = state.selectedContact;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () =>
                    _showAddressSelectionModal(context, ref, state),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                ),
                child: const Text(
                  'Change',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (contact != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: const Color(0xFFF9F9F7),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  contact.fullName,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                if (contact.phoneVerified)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.verified_rounded,
                                      size: 15,
                                      color: AppColors.primary,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              contact.address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            if (contact.addressDetail != null &&
                                contact.addressDetail!.isNotEmpty)
                              Text(
                                contact.addressDetail!,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              contact.phone,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Map Placeholder Image Overlay
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuCcht0CZm9E6p76WuIc7ot1PwtrnGodafyW8t2fimE-d9JTZHAJqnAFZkNqu_YDVfIuQ3XbG0T8muYuvnRu9GUxWYQoGNFOyf9AKqBWereVEnA8odf3HWfIkyl8z_lhpVwRSlqrKtgPgD43PJYJMdfkBofhBf4nvcXypUCsYLU55Xm8ytunYl83-KCYEFRJXzq4J2WyWDgx2zx1EOagubS-S6YON9e8fvE_7JaqvTufreotJtYG0M2ba0oIMGdyj6YXgSNplZcO3iE',
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Container(color: const Color(0xFFE2E3E0)),
                          errorWidget: (context, url, error) => Container(
                            color: const Color(0xFFE2E3E0),
                            child: const Icon(
                              Icons.map_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            const Text(
              'No address selected. Please tap Change to select an address.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: Colors.red,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Address Selection BottomSheet Modal
  void _showAddressSelectionModal(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DefaultTabController(
          length: 3,
          child: SizedBox(
            height: 400,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 4),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E3E0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Select Shipping Address',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Office'),
                    Tab(text: 'Other'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildModalAddressList(
                        context,
                        ref,
                        state.homeContacts,
                        state.selectedContact,
                      ),
                      _buildModalAddressList(
                        context,
                        ref,
                        state.officeContacts,
                        state.selectedContact,
                      ),
                      _buildModalAddressList(
                        context,
                        ref,
                        state.otherContacts,
                        state.selectedContact,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildModalAddressList(
    BuildContext context,
    WidgetRef ref,
    List<Contact> list,
    Contact? selected,
  ) {
    if (list.isEmpty) {
      return const Center(
        child: Text(
          'No addresses in this category.',
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

        return InkWell(
          onTap: () {
            ref.read(checkoutProvider.notifier).selectContact(contact);
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFE6F4EA)
                  : const Color(0xFFF9F9F7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
                width: isSelected ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.fullName,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        contact.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 2. DELIVERY SPEED CARD ---
  Widget _buildDeliverySpeedCard(WidgetRef ref, CheckoutState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.local_shipping_outlined,
                color: AppColors.primary,
                size: 22,
              ),
              SizedBox(width: 8),
              Text(
                'Delivery Speed',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildDeliveryOptionTile(
            ref,
            title: 'Standard Delivery',
            description: 'Estimated arrival: 3 - 5 business days',
            value: 'Standard',
            groupValue: state.shippingOption,
            badge: 'Standard',
          ),
          const SizedBox(height: 8),
          _buildDeliveryOptionTile(
            ref,
            title: 'Express Delivery',
            description: 'Estimated arrival: 1 - 2 business days',
            value: 'Express',
            groupValue: state.shippingOption,
            badge: 'Fast',
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptionTile(
    WidgetRef ref, {
    required String title,
    required String description,
    required String value,
    required String groupValue,
    required String badge,
  }) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: () =>
          ref.read(checkoutProvider.notifier).selectShippingOption(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE6F4EA) : const Color(0xFFF9F9F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withAlpha(25)
                    : const Color(0xFFE2E3E0),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. PAYMENT METHOD CARD ---
  Widget _buildPaymentMethodCard(WidgetRef ref, CheckoutState state) {
    final notifier = ref.read(checkoutProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.payment_outlined, color: AppColors.primary, size: 22),
              SizedBox(width: 8),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildPaymentPill(
                  ref,
                  label: 'Card (Stripe)',
                  icon: Icons.credit_card_rounded,
                  value: 'Stripe',
                  groupValue: state.paymentOption,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPaymentPill(
                  ref,
                  label: 'Platform Wallet',
                  icon: Icons.account_balance_wallet_outlined,
                  value: 'Wallet',
                  groupValue: state.paymentOption,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => notifier.selectPaymentOption(
              state.paymentOption,
              useWallet: !state.useWallet,
            ),
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Checkbox(
                  value: state.useWallet,
                  activeColor: AppColors.primary,
                  onChanged: (val) => notifier.selectPaymentOption(
                    state.paymentOption,
                    useWallet: val,
                  ),
                ),
                const Text(
                  'Use wallet balance first',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentPill(
    WidgetRef ref, {
    required String label,
    required IconData icon,
    required String value,
    required String groupValue,
  }) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: () =>
          ref.read(checkoutProvider.notifier).selectPaymentOption(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE6F4EA) : const Color(0xFFF9F9F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE2E3E0),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 4. ORDER ITEMS CARD ---
  Widget _buildOrderItemsCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.primary,
                size: 22,
              ),
              SizedBox(width: 8),
              Text(
                'Order Items',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...state.resolvedItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: item.resource?.url ?? '',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: const Color(0xFFF9F9F7)),
                      errorWidget: (context, url, error) => Container(
                        color: const Color(0xFFF9F9F7),
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 18,
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
                          item.sku.name.isNotEmpty
                              ? item.sku.name
                              : 'Product Sku',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Qty: ${item.quantity}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    MoneyUtils.format(item.sku.price, currency: item.currency),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
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
  Widget _buildOrderSummaryCard(CheckoutState state) {
    final subtotal = state.calculatedSubtotal;
    final shipping = state.totalShippingCost;
    final total = subtotal + shipping;

    final subtotalFormatted = MoneyUtils.format(
      subtotal,
      currency: state.preferredCurrency,
    );
    final shippingFormatted = MoneyUtils.format(
      shipping,
      currency: state.preferredCurrency,
    );
    final totalFormatted = MoneyUtils.format(
      total,
      currency: state.preferredCurrency,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Items Subtotal',
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
                'Delivery Fee',
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
                'Total Amount',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                totalFormatted,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
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
    final subtotal = state.calculatedSubtotal;
    final shipping = state.totalShippingCost;
    final total = subtotal + shipping;
    final totalFormatted = MoneyUtils.format(
      total,
      currency: state.preferredCurrency,
    );

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE2E3E0))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
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
              : () => ref.read(checkoutProvider.notifier).placeOrder(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xFFBEC9C6),
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

  // --- TRANSACTIONAL STATES (PROCESSING, SUCCESS, FAILED) ---
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
                    .setStep(CheckoutStep.address),
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
}
