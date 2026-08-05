import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/profile_fields.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_dashboard_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isUploadingAvatar = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndUploadAvatar(Me profile) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 512,
      maxHeight: 512,
    );

    if (image == null) return;

    setState(() {
      _isUploadingAvatar = true;
    });

    try {
      final rsId = await ref
          .read(accountRepositoryProvider)
          .uploadAvatar(
            bytes: await image.readAsBytes(),
            filename: image.name,
            mime: image.mimeType ?? 'image/jpeg',
          );

      await ref
          .read(accountControllerProvider.notifier)
          .updateProfile(UpdateProfileRequest(avatarResourceId: rsId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật ảnh đại diện thành công!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi upload ảnh: $e'),
            backgroundColor: const Color(0xFFBA1A1A),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingAvatar = false;
        });
      }
    }
  }

  void _showEditProfileBottomSheet(Me profile) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _EditProfileFormSheet(profile: profile),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        unauthenticated: () {
          if (mounted) {
            context.go('/home');
          }
        },
        orElse: () {},
      );
    });

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final profileAsync = ref.watch(profileProvider);
    // The value if there is one, not `when`: the seller rows below are navigation
    // and have to be on screen whether or not the counts have arrived — or failed.
    // In Riverpod 3 `.value` is already nullable, which is exactly this case.
    final dashboard = ref.watch(sellerDashboardProvider).value;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: theme.colorScheme.onSurfaceVariant,
              size: 24,
            ),
            onPressed: () => context.push('/account/settings'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(profileProvider.future),
        child: profileAsync.when(
          data: (profile) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Compact Profile Info (Header)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    children: [
                      // Avatar
                      GestureDetector(
                        onTap: _isUploadingAvatar
                            ? null
                            : () => _pickAndUploadAvatar(profile),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: isDarkMode
                                  ? theme.colorScheme.surfaceContainerHighest
                                  : const Color(0xFFEEEEEE),
                              backgroundImage: profile.avatarUrl != null
                                  ? NetworkImage(profile.avatarUrl!)
                                  : null,
                              child: profile.avatarUrl == null
                                  ? Icon(
                                      Icons.person_rounded,
                                      size: 32,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    )
                                  : null,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: _isUploadingAvatar
                                    ? SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.5,
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                      )
                                    : Icon(
                                        Icons.camera_alt_rounded,
                                        size: 10,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Info Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => _showEditProfileBottomSheet(profile),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      profile.name.isNotEmpty
                                          ? profile.name
                                          : (profile.username ??
                                                'Chưa đặt tên'),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.onSurface,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.edit_outlined,
                                    size: 16,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              profile.email ??
                                  profile.phone ??
                                  'Chưa liên kết email',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(25)
                      : const Color(0xFFEEEEEE),
                ),

                // SHOPPING & SELLER SECTION
                _buildSectionHeader(context, 'SHOPPING & SELLER'),
                Container(
                  color: isDarkMode ? AppColors.darkSurface : Colors.white,
                  child: Column(
                    children: [
                      // --- 1. My Purchases ---
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? theme.colorScheme.surfaceContainerHighest
                                : const Color(0xFFEEEEEC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.local_mall_outlined,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        title: Text(
                          'My Purchases',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 22,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 2,
                        ),
                        onTap: () => context.push('/account/orders?tab=0'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 12,
                        ),
                        child: Row(
                          children: [
                            _buildQuickActionButton(
                              context,
                              icon: Icons.schedule_rounded,
                              label: 'Pending',
                              onTap: () =>
                                  context.push('/account/orders?tab=1'),
                            ),
                            const SizedBox(width: 8),
                            _buildQuickActionButton(
                              context,
                              icon: Icons.local_shipping_outlined,
                              label: 'Shipping',
                              onTap: () =>
                                  context.push('/account/orders?tab=2'),
                            ),
                            const SizedBox(width: 8),
                            _buildQuickActionButton(
                              context,
                              icon: Icons.check_circle_outline_rounded,
                              label: 'Completed',
                              onTap: () =>
                                  context.push('/account/orders?tab=3'),
                            ),
                            const SizedBox(width: 8),
                            _buildQuickActionButton(
                              context,
                              icon: Icons.history_rounded,
                              label: 'Refund',
                              onTap: () =>
                                  context.push('/account/orders?tab=5'),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(20)
                            : const Color(0xFFF1F5F9),
                        indent: 56,
                      ),

                      // --- 2. My Sales (Single Row options) ---
                      // Navigation, not data. This block used to sit inside
                      // `dashboardAsync.when(error: SizedBox.shrink())`, so a
                      // failed summary read took the only way into the seller
                      // area off the screen with no message — a seller with
                      // orders was told nothing at all. The counts are the only
                      // part that needs the read, and a null count just hides
                      // its badge.
                      Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.surfaceContainerHighest
                                    : const Color(0xFFEEEEEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.storefront_outlined,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            title: Text(
                              'My Sales',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                              size: 22,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            onTap: () => context.push('/seller/orders'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12,
                            ),
                            child: Row(
                              children: [
                                // OrderState's three values. `shipping` and
                                // `disputing` were never states of an order.
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.pending_actions,
                                  label: 'Đang xử lý',
                                  count: dashboard?.summary.open,
                                  onTap: () =>
                                      context.push('/seller/orders?state=open'),
                                ),
                                const SizedBox(width: 8),
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.check_circle_outline,
                                  label: 'Hoàn thành',
                                  count: dashboard?.summary.completed,
                                  onTap: () => context.push(
                                    '/seller/orders?state=completed',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.cancel_outlined,
                                  label: 'Đã hủy',
                                  count: dashboard?.summary.cancelled,
                                  onTap: () => context.push(
                                    '/seller/orders?state=cancelled',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: isDarkMode
                                ? AppColors.darkPrimary.withAlpha(20)
                                : const Color(0xFFF1F5F9),
                            indent: 56,
                          ),

                          // --- 3. My Products (Single Row options) ---
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.surfaceContainerHighest
                                    : const Color(0xFFEEEEEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.inventory_2_outlined,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            title: Text(
                              'My Products',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                              size: 22,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            onTap: () => context.push('/seller/products'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12,
                            ),
                            child: Row(
                              children: [
                                // ListingStatus's own values: `inactive` and
                                // `violated` matched no listing at all.
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.inventory_2_outlined,
                                  label: 'Đang bán',
                                  count: dashboard?.listingsWith(
                                    ListingStatus.active,
                                  ),
                                  onTap: () => context.push(
                                    '/seller/products?status=active',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.hourglass_empty,
                                  label: 'Chờ duyệt',
                                  count: dashboard?.listingsWith(
                                    ListingStatus.pending,
                                  ),
                                  onTap: () => context.push(
                                    '/seller/products?status=pending',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildQuickActionButton(
                                  context,
                                  icon: Icons.visibility_off_outlined,
                                  label: 'Đã ẩn',
                                  count: dashboard?.listingsWith(
                                    ListingStatus.hidden,
                                  ),
                                  onTap: () => context.push(
                                    '/seller/products?status=hidden',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: isDarkMode
                                ? AppColors.darkPrimary.withAlpha(20)
                                : const Color(0xFFF1F5F9),
                            indent: 56,
                          ),
                        ],
                      ),
                      // Posting a listing does not depend on
                      // the sales figures, and this used to vanish with them.
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: _buildAiWizardBanner(context),
                      ),
                      Divider(
                        height: 1,
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(20)
                            : const Color(0xFFF1F5F9),
                        indent: 56,
                      ),
                      // Wishlist Link
                      _buildMenuItem(
                        context,
                        icon: Icons.favorite_border_rounded,
                        title: 'Wishlist',
                        onTap: () => context.push('/account/wishlist'),
                      ),
                      Divider(
                        height: 1,
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(20)
                            : const Color(0xFFF1F5F9),
                        indent: 56,
                      ),
                      // Saved Addresses Link
                      _buildMenuItem(
                        context,
                        icon: Icons.location_on_outlined,
                        title: 'Saved Addresses',
                        onTap: () => context.push('/account/addresses'),
                      ),
                      Divider(
                        height: 1,
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(20)
                            : const Color(0xFFF1F5F9),
                        indent: 56,
                      ),
                      // Payment Methods & Earnings Link (Merged & renamed to Payment)
                      _buildMenuItem(
                        context,
                        icon: Icons.credit_card_rounded,
                        title: 'Payment',
                        onTap: () => context.push('/seller/earnings'),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(25)
                      : const Color(0xFFEEEEEE),
                ),

                // SUPPORT SECTION
                _buildSectionHeader(context, 'SUPPORT'),
                Container(
                  color: isDarkMode ? AppColors.darkSurface : Colors.white,
                  child: Column(
                    children: [
                      _buildMenuItem(
                        context,
                        icon: Icons.help_outline_rounded,
                        title: 'Help Center',
                        onTap: () => context.push('/account/help-center'),
                      ),
                      Divider(
                        height: 1,
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(20)
                            : const Color(0xFFF1F5F9),
                        indent: 56,
                      ),
                      // Sign Out
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xFF450A0A)
                                : const Color(0xFFFFDAD6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.logout_rounded,
                            color: isDarkMode
                                ? const Color(0xFFEF4444)
                                : const Color(0xFFBA1A1A),
                          ),
                        ),
                        title: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFFEF4444)
                                : const Color(0xFFBA1A1A),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 2,
                        ),
                        onTap: () => _handleLogout(context, ref),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
          loading: () => _buildShimmer(context),
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
                    'Không thể tải thông tin cá nhân',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
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
                      onPressed: () => ref.refresh(profileProvider),
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
                          fontSize: 15,
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
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? AppColors.darkPrimary : const Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildAiWizardBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AI Product Wizard',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sinh tiêu đề & mô tả từ Image + Audio hoặc Raw Text',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/seller/new-listing'),
              icon: const Icon(Icons.auto_awesome, size: 18),
              label: const Text('Tạo sản phẩm với AI Wizard'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    int? count,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isDarkMode
                ? theme.colorScheme.surfaceContainerHighest
                : const Color(0xFFF4F4F1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    icon,
                    color: iconColor ?? theme.colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                  if (count != null && count > 0)
                    Positioned(
                      top: -4,
                      right: -8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          count > 99 ? '99+' : count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDarkMode
              ? theme.colorScheme.surfaceContainerHighest
              : const Color(0xFFEEEEEC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: theme.colorScheme.onSurfaceVariant,
        size: 22,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: onTap,
    );
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
        title: Text(
          'Đăng xuất',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: Text(
          'Bạn có chắc chắn muốn đăng xuất tài khoản này?',
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
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) {
                context.go('/home');
              }
            },
            child: Text(
              'Đăng xuất',
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

  Widget _buildShimmer(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: isDarkMode
                        ? AppColors.darkSurface
                        : Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140,
                          height: 20,
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          height: 14,
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              color: isDarkMode ? AppColors.darkSurface : Colors.white,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

// ======================== EDIT PROFILE SHEET WIDGET ========================
class _EditProfileFormSheet extends ConsumerStatefulWidget {
  final Me profile;

  const _EditProfileFormSheet({required this.profile});

  @override
  ConsumerState<_EditProfileFormSheet> createState() =>
      _EditProfileFormSheetState();
}

class _EditProfileFormSheetState extends ConsumerState<_EditProfileFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  ProfileGender? _gender;
  DateTime? _dob;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _emailController = TextEditingController(text: widget.profile.email);
    _gender = genderOf(widget.profile.gender);

    if (widget.profile.dateOfBirth != null) {
      _dob = DateTime.tryParse(widget.profile.dateOfBirth!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(2000),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = ref.read(accountControllerProvider.notifier);

    await controller.updateProfile(
      UpdateProfileRequest(
        name: _nameController.text.trim(),
        gender: _gender,
        // The picker answers a local midnight; the day is the whole fact, so the
        // wall-clock date is what goes on the wire.
        dateOfBirth: _dob?.toIso8601String().split('T').first,
      ),
    );

    // A phone and an email are identifiers on `PATCH /me`, not profile fields,
    // and only a real change may be sent: re-posting the same email would clear
    // `email_verified` and mail out a fresh verification.
    final identifiers = _identifierChanges();
    if (identifiers != null && ref.read(accountControllerProvider).hasValue) {
      await controller.updateAccount(identifiers);
    }

    if (!mounted) return;
    final failure = ref.read(accountControllerProvider).error;
    if (failure != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi cập nhật: $failure'),
          backgroundColor: const Color(0xFFBA1A1A),
        ),
      );
      return;
    }
    Navigator.of(context).pop();
  }

  /// Null when neither identifier moved, so an unchanged form sends nothing.
  UpdateAccountRequest? _identifierChanges() {
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final phoneChanged = phone != (widget.profile.phone ?? '');
    final emailChanged = email != (widget.profile.email ?? '');
    if (!phoneChanged && !emailChanged) return null;

    return UpdateAccountRequest(
      phone: phoneChanged && phone.isNotEmpty ? phone : null,
      clearPhone: phoneChanged && phone.isEmpty ? true : null,
      email: emailChanged && email.isNotEmpty ? email : null,
      clearEmail: emailChanged && email.isEmpty ? true : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final inputFillColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF4F4F1);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: 24 + bottomInset,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chỉnh sửa thông tin cá nhân',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Name Field
              TextFormField(
                controller: _nameController,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
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
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Vui lòng nhập họ tên'
                    : null,
              ),
              const SizedBox(height: 16),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
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
              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
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
              const SizedBox(height: 16),

              // Gender Selection Dropdown
              DropdownButtonFormField<ProfileGender>(
                initialValue: _gender,
                dropdownColor: isDarkMode
                    ? AppColors.darkSurface
                    : Colors.white,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Giới tính',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: [
                  for (final gender in ProfileGender.values)
                    DropdownMenuItem(
                      value: gender,
                      child: Text(
                        genderLabel(gender),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                ],
                onChanged: (val) {
                  setState(() {
                    _gender = val;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Date of Birth Selection Box
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: inputFillColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _dob == null
                            ? 'Chọn ngày sinh'
                            : 'Ngày sinh: ${_dob!.day}/${_dob!.month}/${_dob!.year}',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: _dob == null
                              ? theme.colorScheme.onSurfaceVariant
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Action button
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Lưu thông tin',
                    style: TextStyle(
                      fontSize: 15,
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
    );
  }
}
