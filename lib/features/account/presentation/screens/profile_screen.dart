import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/account_menu_tile.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/action_inbox_card.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';

/// Trang tài khoản: ba nhóm và một khối việc-cần-làm.
///
/// Khu người bán không ở đây. Nó sống ở tab "Đăng bán" của bottom nav, và trang
/// này từng chép lại gần nguyên vẹn cả Đơn bán, Sản phẩm lẫn Thu nhập của nó —
/// một nửa trang tài khoản lặp lại một tab khác.
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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        // Khớp nhãn tab ở bottom nav, vốn đã là "Tài khoản". Hai tên khác nhau
        // cho cùng một màn hình là một lỗi nhất quán riêng.
        title: Text(
          'Tài khoản',
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
        actions: [_buildNotificationBell(context)],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          ref.invalidate(actionInboxProvider);
          return ref.refresh(profileProvider.future);
        },
        child: profileAsync.when(
          data: (profile) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, profile),
                Divider(
                  height: 1,
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(25)
                      : const Color(0xFFEEEEEE),
                ),

                // Tự ẩn khi không có việc nào đang chờ.
                const ActionInboxCard(),

                const AccountSectionHeader(title: 'GIAO DỊCH'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.local_mall_outlined,
                    title: 'Đơn mua',
                    onTap: () => context.push('/account/orders'),
                  ),
                  AccountMenuTile(
                    icon: Icons.assignment_return_outlined,
                    title: 'Yêu cầu hoàn tiền',
                    onTap: () => context.push('/account/refunds'),
                  ),
                  AccountMenuTile(
                    icon: Icons.star_outline_rounded,
                    title: 'Đánh giá của tôi',
                    onTap: () => context.push('/account/reviews'),
                  ),
                ]),

                const AccountSectionHeader(title: 'HỒ SƠ'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.location_on_outlined,
                    title: 'Địa chỉ',
                    onTap: () => context.push('/account/addresses'),
                  ),
                  AccountMenuTile(
                    icon: Icons.favorite_border_rounded,
                    title: 'Yêu thích',
                    onTap: () => context.push('/account/wishlist'),
                  ),
                  AccountMenuTile(
                    icon: Icons.storefront_outlined,
                    title: 'Xem shop của tôi',
                    onTap: () => context.push('/vendor/${profile.id}'),
                  ),
                  // Lối vào khu người bán, không phải bản sao thứ hai của nó.
                  AccountMenuTile(
                    icon: Icons.sell_outlined,
                    title: 'Kênh người bán',
                    onTap: () => context.push('/seller'),
                  ),
                ]),

                const AccountSectionHeader(title: 'HỖ TRỢ'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Trung tâm trợ giúp',
                    onTap: () => context.push('/account/help-center'),
                  ),
                  AccountMenuTile(
                    icon: Icons.settings_outlined,
                    title: 'Cài đặt',
                    onTap: () => context.push('/account/settings'),
                  ),
                  AccountMenuTile(
                    icon: Icons.logout_rounded,
                    title: 'Đăng xuất',
                    tint: isDarkMode
                        ? const Color(0xFFEF4444)
                        : const Color(0xFFBA1A1A),
                    onTap: () => _handleLogout(context, ref),
                  ),
                ]),
                const SizedBox(height: 48),
              ],
            ),
          ),
          loading: () => _buildShimmer(context),
          error: (err, stack) => _buildError(context, err),
        ),
      ),
    );
  }

  Widget _buildNotificationBell(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer(
      builder: (context, ref, _) {
        final unread = ref.watch(unreadNotificationsCountProvider).value ?? 0;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: theme.colorScheme.onSurfaceVariant,
                size: 24,
              ),
              onPressed: () => context.push('/chat?tab=notifications'),
            ),
            if (unread > 0)
              Positioned(
                top: 8,
                right: 6,
                child: IgnorePointer(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      unread > 99 ? '99+' : '$unread',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, Me profile) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
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
          // Chạm vào mở Account Center — nơi có đủ sáu field và cả thẻ KYC.
          // Trước đây chỗ này mở một bottom sheet riêng với tập field lệch so
          // với form trong Account Center, cùng gọi một endpoint.
          // Bọc cả phần chữ lẫn chevron: chevron là glyph duy nhất báo "chạm vào
          // đây", nên để nó nằm ngoài vùng chạm là chỗ chết đúng nơi người dùng
          // nhắm tới.
          Expanded(
            child: GestureDetector(
              onTap: () => context.push('/account/account-center'),
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Expanded(child: _buildIdentity(context, profile)),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentity(BuildContext context, Me profile) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                profile.name.isNotEmpty
                    ? profile.name
                    : (profile.username ?? 'Chưa đặt tên'),
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
            if (profile.identityVerified) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.verified_rounded,
                size: 16,
                color: Color(0xFF10B981),
              ),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          profile.email ?? profile.phone ?? 'Chưa liên kết email',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }

  /// Một nhóm menu: nền liền, kẻ ngăn giữa các dòng và không kẻ ở đáy.
  Widget _buildGroup(BuildContext context, List<Widget> tiles) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final divider = Divider(
      height: 1,
      color: isDarkMode
          ? AppColors.darkPrimary.withAlpha(20)
          : const Color(0xFFF1F5F9),
      indent: 56,
    );

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: Column(
        children: [
          for (var i = 0; i < tiles.length; i++) ...[
            tiles[i],
            if (i < tiles.length - 1) divider,
          ],
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, Object err) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
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
