/// Cấu hình toàn hệ thống ShopNexus
class AppConfig {
  /// Cờ bật/tắt dữ liệu mẫu (Mock Data):
  /// - `true` (Dev Mode): Trả về dữ liệu mẫu tức thì (0ms delay) giúp phát triển UI/UX nhanh chóng khi chưa kết nối Backend.
  /// - `false` (Production Mode): Gọi trực tiếp REST API từ Backend qua Retrofit & Dio Client.
  static const bool useMockData = true;
}
