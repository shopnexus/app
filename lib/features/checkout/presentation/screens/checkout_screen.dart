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
    final theme = Theme.of(context);
    final checkoutState = ref.watch(checkoutProvider);

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
    if (state.isLoading &&
        state.contacts.isEmpty &&
        state.quoteResponse == null) {
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
          // 1. Delivery Address Section (Bento Style)
          _buildAddressBentoCard(context, ref, state),
          const SizedBox(height: 16),

          // 2. Delivery Speed Section
          _buildDeliverySpeedCard(context, ref, state),
          const SizedBox(height: 16),

          // 3. Payment Method Section
          _buildPaymentMethodCard(context, ref, state),
          const SizedBox(height: 16),

          // 4. Order Items Section
          _buildOrderItemsCard(context, ref, state),
          const SizedBox(height: 16),

          // 5. Order Summary Card
          _buildOrderSummaryCard(context, state),
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final contact = state.selectedContact;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E3E0);
    final innerBgColor = isDarkMode
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: theme.colorScheme.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () =>
                    _showAddressSelectionModal(context, ref, state),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
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
                color: innerBgColor,
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
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                if (contact.phoneVerified)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.verified_rounded,
                                      size: 15,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              contact.address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (contact.addressDetail != null &&
                                contact.addressDetail!.isNotEmpty)
                              Text(
                                contact.addressDetail!,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              contact.phone,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
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
                              Container(color: cardBorderColor),
                          errorWidget: (context, url, error) => Container(
                            color: cardBorderColor,
                            child: Icon(
                              Icons.map_outlined,
                              color: theme.colorScheme.onSurfaceVariant,
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
            Text(
              'No address selected. Please tap Change to select an address.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: isDarkMode ? const Color(0xFFEF4444) : Colors.red,
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
    final parentTheme = Theme.of(context);
    final isParentDark = parentTheme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isParentDark ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final theme = Theme.of(context);

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
                    color: isParentDark
                        ? AppColors.darkPrimary.withAlpha(50)
                        : const Color(0xFFE2E3E0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Select Shipping Address',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                TabBar(
                  labelColor: theme.colorScheme.primary,
                  unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                  indicatorColor: theme.colorScheme.primary,
                  tabs: const [
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    if (list.isEmpty) {
      return Center(
        child: Text(
          'No addresses in this category.',
          style: TextStyle(
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final contact = list[index];
        final isSelected = selected?.id == contact.id;

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
          onTap: () {
            ref.read(checkoutProvider.notifier).selectContact(contact);
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? selectedBg : unselectedBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor,
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
                        contact.fullName,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        contact.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
      },
    );
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
                'Delivery Speed',
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
          _buildDeliveryOptionTile(
            context,
            ref,
            title: 'Standard Delivery',
            description: 'Estimated arrival: 3 - 5 business days',
            value: 'Standard',
            groupValue: state.shippingOption,
            badge: 'Standard',
          ),
          const SizedBox(height: 8),
          _buildDeliveryOptionTile(
            context,
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
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String description,
    required String value,
    required String groupValue,
    required String badge,
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

    final badgeBg = isSelected
        ? theme.colorScheme.primary.withAlpha(30)
        : (isDarkMode
              ? theme.colorScheme.surfaceContainerHighest
              : const Color(0xFFE2E3E0));

    return InkWell(
      onTap: () =>
          ref.read(checkoutProvider.notifier).selectShippingOption(value),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. PAYMENT METHOD CARD ---
  Widget _buildPaymentMethodCard(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final notifier = ref.read(checkoutProvider.notifier);

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
          Row(
            children: [
              Icon(
                Icons.payment_outlined,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'Payment Method',
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
          Row(
            children: [
              Expanded(
                child: _buildPaymentPill(
                  context,
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
                  context,
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
                  activeColor: theme.colorScheme.primary,
                  onChanged: (val) => notifier.selectPaymentOption(
                    state.paymentOption,
                    useWallet: val,
                  ),
                ),
                Text(
                  'Use wallet balance first',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurface,
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
    BuildContext context,
    WidgetRef ref, {
    required String label,
    required IconData icon,
    required String value,
    required String groupValue,
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
      onTap: () =>
          ref.read(checkoutProvider.notifier).selectPaymentOption(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
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
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
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
                'Order Items',
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
                          item.sku.name.isNotEmpty
                              ? item.sku.name
                              : 'Product Sku',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'Qty: ${item.quantity}',
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
                    MoneyUtils.format(item.sku.price, currency: item.currency),
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

    final subtotal = state.calculatedSubtotal;
    final shipping = state.totalShippingCost;
    final total = subtotal + shipping;
    final totalFormatted = MoneyUtils.format(
      total,
      currency: state.preferredCurrency,
    );

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
              : () => ref.read(checkoutProvider.notifier).placeOrder(),
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
              'We are syncing transaction status with the payment gateway. Please do not close the app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
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
    final summary = state.checkoutSummary;

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
              'Order Placed Successfully!',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Transaction ID: #${summary?.session.id ?? ''}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            if (summary != null)
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
                          'Amount Paid',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          MoneyUtils.format(
                            summary.session.totalAmount,
                            currency: summary.session.currency,
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
