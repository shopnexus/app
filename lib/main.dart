import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/storage/hive_storage.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Khởi tạo Hive.initFlutter()
  await Hive.initFlutter();

  // 2. Khởi tạo và mở các Box cần thiết
  final hiveService = HiveService();
  await hiveService.initBoxes();

  runApp(
    // Bọc ứng dụng bằng ProviderScope để Riverpod hoạt động
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lấy GoRouter instance từ Provider
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'ShopNexus',
      debugShowCheckedModeBanner: false,
      
      // Áp dụng Theme (Light & Dark)
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Tự động đổi theo thiết bị
      
      // Sử dụng GoRouter
      routerConfig: router,
    );
  }
}
