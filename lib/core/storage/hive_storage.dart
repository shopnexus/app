import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_storage.g.dart';

/// Khai báo tên các Box để tránh sai sót (Typo) khi gọi
class HiveBoxNames {
  static const String authBox = 'authBox';
  static const String cartBox = 'cartBox';
  static const String recentBox = 'recentBox';
}

/// Service quản lý đóng/mở Box
class HiveService {
  /// Khởi tạo và mở các Box
  Future<void> initBoxes() async {
    await Hive.openBox(HiveBoxNames.authBox);
    await Hive.openBox(HiveBoxNames.cartBox);
    await Hive.openBox(HiveBoxNames.recentBox);
  }

  /// Đóng tất cả Box
  Future<void> closeBoxes() async {
    await Hive.close();
  }

  // Cung cấp getters để truy cập Box nhanh chóng
  Box get authBox => Hive.box(HiveBoxNames.authBox);
  Box get cartBox => Hive.box(HiveBoxNames.cartBox);
  Box get recentBox => Hive.box(HiveBoxNames.recentBox);

  /// Xóa toàn bộ dữ liệu người dùng cục bộ khi đăng xuất (lịch sử tìm kiếm, sản phẩm vừa xem, giỏ hàng, token...).
  /// Tùy chọn [keepPreferences] cho phép giữ lại cài đặt thiết bị như theme.
  Future<void> clearUserData({bool keepPreferences = true}) async {
    String? savedTheme;
    if (keepPreferences && Hive.isBoxOpen(HiveBoxNames.authBox)) {
      savedTheme = authBox.get('theme_mode') as String?;
    }

    if (Hive.isBoxOpen(HiveBoxNames.authBox)) {
      await authBox.clear();
      if (keepPreferences && savedTheme != null) {
        await authBox.put('theme_mode', savedTheme);
      }
    }
    if (Hive.isBoxOpen(HiveBoxNames.cartBox)) {
      await cartBox.clear();
    }
    if (Hive.isBoxOpen(HiveBoxNames.recentBox)) {
      await recentBox.clear();
    }
  }
}

/// Riverpod Provider cung cấp instance của HiveService
@riverpod
HiveService hiveService(Ref ref) {
  return HiveService();
}
