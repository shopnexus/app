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

  /// Đăng nhập bằng OAuth (Google, Apple,...)
  Future<AuthResponse> loginOAuth(OAuthLoginRequest request) async {
    try {
      final response = await _apiService.loginOAuth(request);
      final authData = response.data;

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

  /// Khôi phục mật khẩu (Gửi yêu cầu reset)
  Future<void> forgotPassword(PasswordResetRequest request) async {
    try {
      await _apiService.forgotPassword(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Xác nhận khôi phục mật khẩu với token mới
  Future<void> confirmPasswordReset(PasswordResetConfirmRequest request) async {
    try {
      await _apiService.confirmPasswordReset(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Đổi mật khẩu cho người dùng đang đăng nhập
  Future<void> changePassword(ChangePasswordRequest request) async {
    try {
      await _apiService.changePassword(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Đăng xuất: Gọi API logout -> Xóa token và dọn sạch session trong authBox
  Future<void> logout({String? deviceId}) async {
    try {
      try {
        await _apiService.logout(LogoutRequest(deviceId: deviceId));
      } catch (_) {
        // Ignored if offline or server error, proceed with local logout
      }
      final box = _hiveService.authBox;
      await box.delete('token');
      await box.delete('refresh_token');
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
