import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/storage/hive_storage.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopNexus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('ShopNexus - Cấu hình Hive & Dio hoàn tất!'),
        ),
      ),
    );
  }
}
