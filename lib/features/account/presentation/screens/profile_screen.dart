import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/account_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Stitch Background Grey
      appBar: AppBar(
        title: const Text(
          'Cá nhân',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(profileProvider.future),
        child: profileAsync.when(
          data: (profile) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // User Info Card
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: const Color(0xFFE2E8F0),
                        backgroundImage: profile.avatarUrl != null
                            ? NetworkImage(profile.avatarUrl!)
                            : null,
                        child: profile.avatarUrl == null
                            ? const Icon(
                                Icons.person_rounded,
                                size: 36,
                                color: Color(0xFF64748B),
                              )
                            : null,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name ??
                                  profile.username ??
                                  'Chưa đặt tên',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile.email ??
                                  profile.phone ??
                                  'Chưa liên kết email',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF64748B),
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(
                                  12,
                                ), // Standard UI bo góc
                              ),
                              child: Text(
                                'Quốc gia: ${profile.country}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0F172A),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Wallet / Balance Card - Đổi bo góc sang 24px theo chuẩn Stitch Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      // Charcoal Stitch Primary
                      borderRadius: BorderRadius.circular(24),
                      // Bo góc Card 24px
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F172A).withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Số dư ví nội bộ',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 13,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              MoneyUtils.format(
                                profile.internalBalance,
                                currency: profile.currency,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Account Operations Directory
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      _buildMenuItem(
                        icon: Icons.receipt_long_rounded,
                        title: 'Đơn mua hàng của tôi',
                        onTap: () => context.push('/account/orders'),
                      ),
                      const Divider(
                        height: 1,
                        indent: 56,
                        color: Color(0xFFF1F5F9),
                      ),
                      _buildMenuItem(
                        icon: Icons.location_on_rounded,
                        title: 'Sổ địa chỉ nhận hàng',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tính năng địa chỉ đang mở...'),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 56,
                        color: Color(0xFFF1F5F9),
                      ),
                      _buildMenuItem(
                        icon: Icons.favorite_rounded,
                        title: 'Sản phẩm yêu thích',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tính năng yêu thích đang mở...'),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 56,
                        color: Color(0xFFF1F5F9),
                      ),
                      _buildMenuItem(
                        icon: Icons.notifications_rounded,
                        title: 'Thông báo hệ thống',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tính năng thông báo đang mở...'),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 56,
                        color: Color(0xFFF1F5F9),
                      ),
                      _buildMenuItem(
                        icon: Icons.logout_rounded,
                        title: 'Đăng xuất tài khoản',
                        titleColor: const Color(0xFFBA1A1A),
                        // Đổi sang màu Error Stitch #ba1a1a
                        onTap: () => _handleLogout(context, ref),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
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
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 48,
                    color: Color(0xFFBA1A1A),
                  ), // Stitch Error Color
                  const SizedBox(height: 16),
                  const Text(
                    'Không thể tải thông tin cá nhân',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    err.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Nút bấm cao 48px và bo góc 12px theo chuẩn Stitch Button
                  SizedBox(
                    height: 48,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () => ref.refresh(profileProvider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A),
                        foregroundColor: Colors.white,
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color titleColor = const Color(0xFF0F172A),
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: titleColor == const Color(0xFFBA1A1A)
            ? titleColor
            : const Color(0xFF64748B),
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFF94A3B8),
        size: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      onTap: onTap,
    );
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Đăng xuất',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn đăng xuất tài khoản này?',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Hủy',
              style: TextStyle(color: Color(0xFF64748B), fontFamily: 'Inter'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(authProvider.notifier).logout();
            },
            child: const Text(
              'Đăng xuất',
              style: TextStyle(color: Color(0xFFBA1A1A), fontFamily: 'Inter'),
            ), // Đổi sang màu Error Stitch
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF1F5F9),
      highlightColor: const Color(0xFFF8FAFC),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Shimmer Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 36, backgroundColor: Colors.white),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 140, height: 20, color: Colors.white),
                        const SizedBox(height: 8),
                        Container(width: 180, height: 14, color: Colors.white),
                        const SizedBox(height: 8),
                        Container(width: 90, height: 18, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Shimmer Balance Card - Bo góc 24px
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Shimmer Menu Items
            Container(color: Colors.white, height: 300),
          ],
        ),
      ),
    );
  }
}
