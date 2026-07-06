import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../data_sources/auth_api_service.dart';
import '../models/auth_model.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final HiveService _hiveService;

  AuthRepository(this._apiService, this._hiveService);

  /// Đăng nhập: Gửi request -> Lưu token vào authBox -> Trả về AuthResponse
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _apiService.login(request);
      final authData = response.data;
      
      // Lưu token vào Hive
      final box = _hiveService.authBox;
      await box.put('token', authData.accessToken);
      await box.put('refresh_token', authData.refreshToken);
      
      return authData;
    } catch (e) {
      rethrow;
    }
  }

  /// Đăng ký: Gửi request -> Lưu token vào authBox -> Trả về AuthResponse
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiService.register(request);
      final authData = response.data;

      // Lưu token vào Hive
      final box = _hiveService.authBox;
      await box.put('token', authData.accessToken);
      await box.put('refresh_token', authData.refreshToken);

      return authData;
    } catch (e) {
      rethrow;
    }
  }

  /// Khôi phục mật khẩu
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      await _apiService.forgotPassword(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Đăng xuất: Xóa token và dọn sạch session trong authBox
  Future<void> logout() async {
    try {
      final box = _hiveService.authBox;
      await box.delete('token');
      await box.delete('refresh_token');
      // Dọn sạch toàn bộ box (ví dụ: các thông tin profile hoặc settings nếu có)
      await box.clear();
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final apiService = ref.watch(authApiServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return AuthRepository(apiService, hiveService);
}
