import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';

/// Tiêu đề một nhóm trong trang tài khoản.
class AccountSectionHeader extends StatelessWidget {
  const AccountSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkPrimary : const Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

/// Một dòng menu trong trang tài khoản.
///
/// Tách khỏi profile_screen để mười dòng của ba nhóm vẽ ra cùng một hình dạng
/// thay vì mười bản sao lệch nhau vài pixel, như trước đây.
class AccountMenuTile extends StatelessWidget {
  const AccountMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.tint,
    required this.onTap,
  });

  final IconData icon;
  final String title;

  /// Màu chữ và icon. Chỉ đặt cho dòng phá vỡ nhịp — hiện chỉ có Đăng xuất.
  final Color? tint;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final foreground = tint ?? theme.colorScheme.onSurface;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: tint != null
              ? tint!.withValues(alpha: 0.12)
              : (isDark
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFEEEEEC)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: tint ?? theme.colorScheme.onSurfaceVariant),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: foreground,
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
}
