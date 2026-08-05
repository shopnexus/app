import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Khởi tạo Controller cho hiệu ứng xuất hiện của Logo
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();

    // Bắt đầu quá trình khởi tạo ứng dụng và chuyển trang
    _initializeApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // Chờ 2 giây để hiển thị Splash Logo một cách trọn vẹn
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Điều hướng trực tiếp tới Trang chủ Marketplace công khai
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Logo chính và tiêu đề ở giữa màn hình
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Hiển thị Logo ShopNexus
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.darkSurface
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: isDarkMode
                            ? Border.all(
                                color: AppColors.darkPrimary.withAlpha(50),
                                width: 1.5,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode
                                ? AppColors.darkPrimary.withAlpha(25)
                                : const Color(0x0D000000),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/logo_shopnexus.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Tên ứng dụng
                    Text(
                      'ShopNexus',
                      style:
                          theme.textTheme.displayLarge?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: theme.colorScheme.onSurface,
                          ) ??
                          TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: theme.colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 8),
                    // Slogan phụ nhãn hiệu
                    Text(
                      'Nexus of Premium Shopping',
                      style:
                          theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            letterSpacing: 0.5,
                            color: theme.colorScheme.onSurfaceVariant,
                          ) ??
                          TextStyle(
                            fontSize: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // Loading Indicator hoặc text phía dưới cùng màn hình
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Thanh Progress bar nhỏ chạy mượt mà thay vì Spinner xoay vô vị
                    SizedBox(
                      width: 120,
                      height: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: isDarkMode
                            ? AppColors.darkSurface
                            : const Color(0xFFE2E8F0),
                        color: theme.colorScheme.primary,
                        // Màu Primary từ Theme (Soft Teal ở Dark mode)
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Initializing...',
                      style:
                          theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: isDarkMode
                                ? AppColors.darkTextSecondary
                                : const Color(0xFF6E7977),
                          ) ??
                          const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
