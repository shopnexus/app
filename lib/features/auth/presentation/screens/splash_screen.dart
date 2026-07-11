import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF121212) : Colors.white,
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
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0D000000),
                            blurRadius: 20,
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
                          Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ) ??
                          const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                    ),
                    const SizedBox(height: 8),
                    // Slogan phụ nhãn hiệu
                    Text(
                      'Nexus of Premium Shopping',
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ) ??
                          const TextStyle(fontSize: 14),
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
                            ? const Color(0xFF2C2C2C)
                            : const Color(0xFFF0F0F0),
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary, // Sử dụng màu Accent từ Theme
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Initializing...',
                      style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: isDarkMode
                                ? const Color(0xFF666666)
                                : const Color(0xFFAAAAAA),
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
