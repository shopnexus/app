import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/addresses_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/address_form_sheet.dart';

class AddressesScreen extends ConsumerWidget {
  /// Chế độ chọn: mỗi dòng trả địa chỉ về cho màn hình gọi (`context.pop`) thay
  /// vì mở form sửa, và mọi hành động sửa/xóa/đặt mặc định bị ẩn — người mua
  /// xóa một địa chỉ rồi pop về checkout sẽ trả về một `Contact` không còn tồn
  /// tại, và checkout đặt hàng bằng đúng cái id đó.
  final bool selectMode;

  const AddressesScreen({super.key, this.selectMode = false});

  void _showAddressFormSheet(
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
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final contactsAsync = ref.watch(buyerContactsProvider);
    final controllerState = ref.watch(addressesControllerProvider);

    ref.listen<AsyncValue<void>>(addressesControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thao tác thất bại: $err'),
              backgroundColor: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFBA1A1A),
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          selectMode ? 'Chọn địa chỉ nhận hàng' : 'Địa chỉ',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Thêm địa chỉ mới',
            color: theme.colorScheme.primary,
            onPressed: () => _showAddressFormSheet(context, ref),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            color: theme.colorScheme.primary,
            onRefresh: () async {
              ref.invalidate(buyerContactsProvider);
            },
            child: contactsAsync.when(
              data: (contacts) {
                if (contacts.isEmpty) {
                  return _EmptyAddresses(
                    onAddAddress: () => _showAddressFormSheet(context, ref),
                  );
                }
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      itemBuilder: (context, index) =>
                          _buildContactCard(context, ref, contacts[index]),
                    ),
                    const SizedBox(height: 16),
                    // Add New Address Button at the bottom
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showAddressFormSheet(context, ref),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add_rounded, size: 20),
                        label: const Text(
                          'Thêm địa chỉ mới',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                );
              },
              loading: () => _buildShimmerList(context),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 48,
                        color: isDarkMode
                            ? const Color(0xFFEF4444)
                            : const Color(0xFFBA1A1A),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Không thể tải danh sách địa chỉ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        err.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () => ref.refresh(buyerContactsProvider),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Thử lại',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (controllerState.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // The contract has two kinds, lowercase — the old 'Home'/'Office' comparison
    // matched neither, so every card drew the generic pin.
    final isHome = contact.addressType == ContactAddressType.home;
    final typeIcon = isHome ? Icons.home_rounded : Icons.work_rounded;
    final typeLabel = isHome ? 'Nhà riêng' : 'Công ty';
    final isDefault = contact.isDefaultDelivery;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFEEEEEC);
    final badgeBgColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFA8ECE4);
    final badgeTextColor = isDarkMode
        ? AppColors.darkPrimary
        : const Color(0xFF005049);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          // Ngoài chế độ chọn, cả thẻ không phải là một nút — các hành động nằm
          // ở hàng dưới.
          onTap: selectMode ? () => context.pop(contact) : null,
          child: Stack(
            children: [
              // Default Badge ở góc trên bên phải
              if (isDefault)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBgColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Default',
                      style: TextStyle(
                        color: badgeTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Row with Icon
                    Row(
                      children: [
                        Icon(
                          typeIcon,
                          color: isHome
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurfaceVariant,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          typeLabel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Recipient & Address Details
                    Text(
                      contact.fullName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${contact.address}${contact.addressDetail != null && contact.addressDetail!.isNotEmpty ? ", ${contact.addressDetail}" : ""}',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: theme.colorScheme.onSurfaceVariant,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          contact.phone,
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Số này là số đơn vị giao hàng sẽ gọi, nên "đã xác thực"
                        // là một tính chất của *địa chỉ*, không của account. Ở chế
                        // độ chọn thì chỉ hiện, không cho làm — người mua đang giữa
                        // một lần thanh toán, không phải đang dọn hồ sơ.
                        if (contact.phoneVerified)
                          Icon(
                            Icons.verified_rounded,
                            size: 14,
                            color: theme.colorScheme.primary,
                          )
                        else if (!selectMode)
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              minimumSize: const Size(0, 28),
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () =>
                                _verifyPhone(context, ref, contact),
                            child: const Text(
                              'Xác thực',
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        else
                          Text(
                            'chưa xác thực',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    // Sửa, xóa và đặt mặc định vắng mặt ở chế độ chọn: người mua
                    // không được xóa mất chính địa chỉ họ đang chọn cho đơn hàng.
                    if (!selectMode) ...[
                      const SizedBox(height: 16),
                      Divider(height: 1, color: dividerColor),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          // Edit Button
                          InkWell(
                            onTap: () => _showAddressFormSheet(
                              context,
                              ref,
                              contact: contact,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    size: 16,
                                    color: theme.colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13,
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Set Default Button — a default is a flag on the contact,
                          // and delivery and pickup are separate defaults.
                          if (!isDefault)
                            InkWell(
                              onTap: () {
                                ref
                                    .read(addressesControllerProvider.notifier)
                                    .updateContact(
                                      contact.id,
                                      UpdateContactRequest(
                                        isDefaultDelivery: true,
                                      ),
                                    );
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Text(
                                  'Set as Default',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    color: theme.colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          const Spacer(),
                          // Delete Button
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              size: 18,
                              color: isDarkMode
                                  ? const Color(0xFFEF4444)
                                  : const Color(0xFFBA1A1A),
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () =>
                                _confirmDelete(context, ref, contact.id),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Gửi mã rồi hỏi mã, trong một mạch. Tách thành hai bước ở hai chỗ là mời người
  /// dùng đóng app giữa lúc một mã có TTL đang chạy.
  Future<void> _verifyPhone(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
  ) async {
    final repository = ref.read(accountRepositoryProvider);
    try {
      await repository.requestPhoneCode(contact.id);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không gửi được mã, thử lại sau')),
      );
      return;
    }
    if (!context.mounted) return;
    final code = await showDialog<String>(
      context: context,
      builder: (dialogContext) =>
          _PhoneVerificationDialog(phone: contact.phone),
    );
    if (code == null || code.isEmpty || !context.mounted) return;

    try {
      await repository.verifyPhone(contact.id, code);
      ref.invalidate(buyerContactsProvider);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã xác thực số điện thoại')),
      );
    } catch (_) {
      if (!context.mounted) return;
      // Mã được đọc một lần rồi mất, nên sai mã là phải gửi lại — nói ra điều đó
      // thay vì để người dùng nhập lại vào một mã đã không còn tồn tại.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mã không đúng hoặc đã hết hạn')),
      );
    }
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
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
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(addressesControllerProvider.notifier).deleteContact(id);
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

  Widget _buildShimmerList(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 180,
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}

class _EmptyAddresses extends StatelessWidget {
  final VoidCallback onAddAddress;

  const _EmptyAddresses({required this.onAddAddress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_off_rounded,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Sổ địa chỉ trống',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Bạn chưa thêm địa chỉ nhận hàng nào. Hãy thêm một địa chỉ để bắt đầu mua sắm thuận tiện nhé.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: onAddAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                icon: const Icon(Icons.add_rounded, size: 20),
                label: const Text(
                  'Thêm địa chỉ mới',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneVerificationDialog extends StatefulWidget {
  final String phone;

  const _PhoneVerificationDialog({required this.phone});

  @override
  State<_PhoneVerificationDialog> createState() =>
      _PhoneVerificationDialogState();
}

class _PhoneVerificationDialogState extends State<_PhoneVerificationDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      title: Text(
        'Nhập mã xác thực',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: theme.colorScheme.onSurface,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chúng tôi vừa gửi mã tới ${widget.phone}.',
              style: TextStyle(
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              maxLength: 6,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
                color: theme.colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'Mã 6 số',
                counterText: '',
                filled: true,
                fillColor: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF4F4F1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Để sau',
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'Inter',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text.trim()),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Xác thực',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }
}
