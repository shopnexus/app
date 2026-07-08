import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/hive_storage.dart';
import '../constants/route_constants.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(Ref ref) {
  final hiveService = ref.watch(hiveServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Đăng Nhập')),
          body: const Center(
            child: Text(
              'Trang Login\n(Chưa có Token, bị Router guard chặn)', 
              textAlign: TextAlign.center,
            )
          ),
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Trang Chủ')),
          body: const Center(
            child: Text(
              'Trang Home\n(Đã xác thực thành công)',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
    redirect: (context, state) {
      final matchedLocation = state.matchedLocation;
      final isGoingToSplash = matchedLocation == '/splash';
      
      // Kiểm tra Token từ Hive
      final token = hiveService.authBox.get('token');
      final isAuthenticated = token != null && token.toString().isNotEmpty;

      // Không redirect nếu đang ở Splash để ứng dụng xử lý logic khởi tạo
      if (isGoingToSplash) return null;

      // Định nghĩa các vùng cần bảo mật (yêu cầu đăng nhập)
      final isGoingToProtected = RouteConstants.protectedPrefixes.any((prefix) => matchedLocation.startsWith(prefix));

      // Các trang phục vụ authentication
      final authLocations = ['/login', '/register', '/forgot-password'];
      final isGoingToAuth = authLocations.contains(matchedLocation);

      // Nếu chưa đăng nhập và cố truy cập vùng bảo mật => Đá về Login
      if (!isAuthenticated && isGoingToProtected) {
        return '/login';
      }

      // Nếu đã đăng nhập mà lại cố truy cập trang login/register => Đá về Home
      if (isAuthenticated && isGoingToAuth) {
        return '/home';
      }

      return null;
    },
  );
}
