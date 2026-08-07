import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/theme/theme_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/account_center_section.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final currentThemeMode = ref.watch(appThemeModeProvider);

    final borderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFBEC9C6);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Cài đặt',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: theme.colorScheme.onSurface,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Account & Security
            //
            // Nội dung của "Trung tâm tài khoản" nằm thẳng ở đây, không còn là
            // một dòng dẫn sang một màn hình nữa: nó *là* cài đặt tài khoản, và
            // một trang chỉ có đúng một dòng thì cái dòng đó là một cú chạm phải
            // trả tiền mà không mua được gì.
            _buildSectionHeader('TÀI KHOẢN & BẢO MẬT'),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor, width: 1)),
              ),
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  const AccountCenterSection(),
                  // Một dòng, không bốn: mật khẩu, xác minh email, liên kết và
                  // thiết bị đều trả lời "ai vào được tài khoản của tôi", nên
                  // chúng ở chung một màn thay vì rải ra đây.
                  _buildSettingRow(
                    icon: Icons.lock_outline_rounded,
                    label: 'Đăng nhập & bảo mật',
                    onTap: () => context.push('/account/security'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section: App Preferences
            _buildSectionHeader('TÙY CHỌN ỨNG DỤNG'),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor, width: 1)),
              ),
              child: Column(
                children: [
                  // Theme Setting Row with 3-option Dropdown (System, Dark, Light)
                  _buildSettingRow(
                    icon: Icons.brightness_6_outlined,
                    label: 'Giao diện (Theme)',
                    trailingWidget: DropdownButtonHideUnderline(
                      child: DropdownButton<ThemeMode>(
                        value: currentThemeMode,
                        dropdownColor: isDarkMode
                            ? AppColors.darkSurface
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: theme.colorScheme.primary,
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.colorScheme.primary,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                        onChanged: (ThemeMode? newMode) {
                          if (newMode != null) {
                            ref
                                .read(appThemeModeProvider.notifier)
                                .setThemeMode(newMode);
                          }
                        },
                        items: [
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text(
                              'Hệ thống',
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text(
                              'Sáng',
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text(
                              'Tối',
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Từng là một công tắc "Thông báo đẩy" chỉ đổi trong phiên:
                  // không có chỗ lưu, không có push, bật rồi thoát là mất. Giờ
                  // nó dẫn sang thứ thật sự quyết định — cái gì vào Hộp thư.
                  _buildSettingRow(
                    icon: Icons.notifications_none_rounded,
                    label: 'Thông báo',
                    onTap: () => context.push('/account/notification-settings'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Section: Legal
            _buildSectionHeader('PHÁP LÝ'),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor, width: 1)),
              ),
              child: Column(
                children: [
                  // "Điều khoản dịch vụ" và "Chính sách bảo mật" từng ở đây,
                  // nhưng chạm vào chỉ hiện một SnackBar rồi biến mất — một ngõ
                  // cụt giả vờ làm được việc. Chưa có trang thật để dẫn tới, nên
                  // gỡ hẳn còn trung thực hơn là để chúng đứng đó.
                  _buildSettingRow(
                    icon: Icons.info_outline_rounded,
                    label: 'Về ShopNexus',
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'v1.0.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.chevron_right,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 22,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildSettingRow({
    required IconData icon,
    required String label,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final rowBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFBEC9C6).withValues(alpha: 0.5);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: rowBorderColor, width: 1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
            child: Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary, size: 24),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                trailingWidget ??
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant,
                      size: 22,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
