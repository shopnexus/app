import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../account/data/models/account_model.dart';
import '../../../account/presentation/providers/addresses_provider.dart';
import '../../../account/presentation/widgets/address_form_sheet.dart';
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
          const SizedBox(height: 16),

          // 6. Terms & Conditions Checkbox
          _buildTermsAndConditionsRow(context, ref, state),
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

  void _showAddressForm(
    BuildContext context,
    WidgetRef ref, {
    Contact? contact,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => AddressFormSheet(contact: contact),
    ).then((_) {
      ref.read(checkoutProvider.notifier).reloadAddresses();
    });
  }

  void _confirmDeleteContact(BuildContext context, WidgetRef ref, String id) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
        title: Text(
          'Xóa địa chỉ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: Text(
          'Bạn có chắc muốn xóa địa chỉ nhận hàng này?',
          style: TextStyle(
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Hủy',
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref
                  .read(addressesControllerProvider.notifier)
                  .deleteContact(id);
              await ref.read(checkoutProvider.notifier).reloadAddresses();
            },
            child: Text(
              'Xóa',
              style: TextStyle(
                color: isDarkMode
                    ? const Color(0xFFEF4444)
                    : const Color(0xFFBA1A1A),
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Address Selection BottomSheet Modal (Section-based, Top-to-Bottom)
  void _showAddressSelectionModal(
    BuildContext context,
    WidgetRef ref,
    CheckoutState state,
  ) {
    final parentTheme = Theme.of(context);
    final isParentDark = parentTheme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isParentDark ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final theme = Theme.of(context);

        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Shipping Address',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showAddressForm(context, ref);
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text(
                        'Add New',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.contacts.isEmpty) ...[
                        const SizedBox(height: 32),
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.location_off_outlined,
                                size: 48,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'No saved addresses.',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                      ] else ...[
                        // Section 1: Home
                        if (state.homeContacts.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            title: 'Home',
                            icon: Icons.home_rounded,
                          ),
                          ...state.homeContacts.map(
                            (contact) => _buildModalAddressCard(
                              context,
                              ref,
                              contact,
                              state.selectedContact,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // Section 2: Office
                        if (state.officeContacts.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            title: 'Office',
                            icon: Icons.work_rounded,
                          ),
                          ...state.officeContacts.map(
                            (contact) => _buildModalAddressCard(
                              context,
                              ref,
                              contact,
                              state.selectedContact,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // Section 3: Other
                        if (state.otherContacts.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            title: 'Other',
                            icon: Icons.location_on_rounded,
                          ),
                          ...state.otherContacts.map(
                            (contact) => _buildModalAddressCard(
                              context,
                              ref,
                              contact,
                              state.selectedContact,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],

                      // Bottom "+ Add New Address" Button inside modal
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _showAddressForm(context, ref);
                          },
                          icon: const Icon(Icons.add_rounded, size: 20),
                          label: const Text(
                            'Add New Address',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: theme.colorScheme.primary,
                            side: BorderSide(color: theme.colorScheme.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModalAddressCard(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
    Contact? selected,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
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

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedBg : unselectedBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1.0),
      ),
      child: InkWell(
        onTap: () {
          ref.read(checkoutProvider.notifier).selectContact(contact);
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        if (contact.phone.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            contact.phone,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${contact.address}${contact.addressDetail != null && contact.addressDetail!.isNotEmpty ? ", ${contact.addressDetail}" : ""}',
                      maxLines: 2,
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
              // Action buttons: Edit & Delete
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showAddressForm(context, ref, contact: contact);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 18,
                      color: isDarkMode
                          ? const Color(0xFFEF4444)
                          : const Color(0xFFBA1A1A),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _confirmDeleteContact(context, ref, contact.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
          Column(
            children: [
              _buildPaymentOptionRow(
                context,
                ref,
                title: 'Thẻ tín dụng / Ghi nợ (Stripe)',
                subtitle: 'Thanh toán trực tuyến an toàn qua cổng Stripe',
                icon: Icons.credit_card_rounded,
                value: 'Stripe',
                groupValue: state.paymentOption,
              ),
              _buildPaymentOptionRow(
                context,
                ref,
                title: 'Ví ShopNexus',
                subtitle: 'Sử dụng số dư trong ví điện tử nội bộ',
                icon: Icons.account_balance_wallet_outlined,
                value: 'Wallet',
                groupValue: state.paymentOption,
              ),
              _buildPaymentOptionRow(
                context,
                ref,
                title: 'Thanh toán khi nhận hàng (COD)',
                subtitle: 'Thanh toán bằng tiền mặt khi giao hàng',
                icon: Icons.local_atm_rounded,
                value: 'COD',
                groupValue: state.paymentOption,
              ),
            ],
          ),
          const SizedBox(height: 4),
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
                  'Ưu tiên khấu trừ từ số dư ví',
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

  Widget _buildPaymentOptionRow(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String subtitle,
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
        margin: const EdgeInsets.only(bottom: 8),
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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primary.withAlpha(20)
                    : theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
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
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
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
                          (item.sku?.name.isNotEmpty ?? false)
                              ? item.sku!.name
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
                    MoneyUtils.format(
                      item.sku?.price ?? 0,
                      currency: item.currency,
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
              : () {
                  if (!state.agreeToTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Vui lòng đồng ý với Điều khoản dịch vụ & Chính sách mua hàng trước khi thanh toán!',
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
                    TextSpan(
                      text: 'Điều khoản dịch vụ',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' và '),
                    TextSpan(
                      text: 'Chính sách mua hàng',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
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
