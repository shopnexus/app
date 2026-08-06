import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/addresses_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/address_form_sheet.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';

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
                        // The two `ContactAddressType` values, and no more:
                        // the "Office"/"Other" sections could never fill.
                        if (state.homeContacts.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            title: 'Nhà riêng',
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

                        if (state.workContacts.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            title: 'Cơ quan',
                            icon: Icons.work_rounded,
                          ),
                          ...state.workContacts.map(
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
          if (state.shippingOptions.isEmpty)
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
          else
            for (final option in state.shippingOptions)
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
          if (state.paymentOptions.isEmpty)
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
          else
            for (final option in state.paymentOptions)
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
                          line.name ?? 'Đang tải sản phẩm…',
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
                          'SL: ${line.quantity}',
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
              'Đang chờ cổng thanh toán xác nhận. Vui lòng không đóng ứng dụng.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            // A rail that redirects hands back a URL instead of an outcome, and the payer has to
            // go there for anything to happen — waiting on a spinner alone would time out. Shown
            // as selectable text rather than opened: this app has no url_launcher, and a link it
            // cannot follow is worse than one the buyer can copy.
            if (state.paymentTransaction?.checkoutUrl != null) ...[
              const SizedBox(height: 20),
              Text(
                'Phương thức này cần hoàn tất trên trang của cổng thanh toán. Mở liên kết sau trên trình duyệt:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              SelectableText(
                state.paymentTransaction!.checkoutUrl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: theme.colorScheme.primary,
                ),
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
              'Mã phiên thanh toán: ${session?.id ?? ''}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
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
                          'Amount Paid',
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
