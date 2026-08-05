import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/core/routing/app_router.dart';
import 'package:shopnexus_flutter_app/core/theme/app_theme.dart';

import 'package:shopnexus_flutter_app/core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Khởi tạo Hive.initFlutter()
  await Hive.initFlutter();

  // 2. Khởi tạo và mở các Box cần thiết
  final hiveService = HiveService();
  await hiveService.initBoxes();

  runApp(
    // Bọc ứng dụng bằng ProviderScope để Riverpod hoạt động
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lấy GoRouter instance từ Provider
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(appThemeModeProvider);

    return MaterialApp.router(
      title: 'ShopNexus',
      debugShowCheckedModeBanner: false,

      // Áp dụng Theme (Light & Dark)
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      // Đổi động theo Provider & cài đặt của người dùng

      // Sử dụng GoRouter
      routerConfig: router,
    );
  }
}
