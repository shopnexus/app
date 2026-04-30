import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/hive_storage.dart';

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
        // Tạm thời sử dụng Scaffold placeholder để test logic. 
        // Sau này sẽ import SplashScreen từ feature.
        builder: (context, state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
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
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToSplash = state.matchedLocation == '/splash';
      
      // Kiểm tra Token từ Hive
      final token = hiveService.authBox.get('token');
      final isAuthenticated = token != null && token.toString().isNotEmpty;

      // Không redirect nếu đang ở Splash để ứng dụng xử lý logic khởi tạo
      if (isGoingToSplash) return null;

      // Nếu không có token và không phải đang ở trang login => Đá về Login (Guard)
      if (!isAuthenticated && !isGoingToLogin) {
        return '/login';
      }

      // Nếu đã có token mà lại đi vào trang login => Đá về Home
      if (isAuthenticated && isGoingToLogin) {
        return '/home';
      }

      return null;
    },
  );
}
