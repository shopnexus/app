import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../data/models/auth_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_provider.freezed.dart';

part 'auth_provider.g.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated({required AuthResponse authResponse}) =
      _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error({required String message}) = _Error;
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    final hiveService = ref.watch(hiveServiceProvider);
    final token = hiveService.authBox.get('token');
    final refreshToken = hiveService.authBox.get('refresh_token');

    if (token != null &&
        token.toString().isNotEmpty &&
        refreshToken != null &&
        refreshToken.toString().isNotEmpty) {
      return AuthState.authenticated(
        authResponse: AuthResponse(
          accessToken: token.toString(),
          refreshToken: refreshToken.toString(),
        ),
      );
    }
    return const AuthState.unauthenticated();
  }

  /// Đăng nhập bằng email/username/phone và password
  Future<void> login(String id, String password) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(
        LoginRequest(id: id, password: password),
      );
      state = AuthState.authenticated(authResponse: response);
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  /// Đăng ký tài khoản mới kèm quốc gia
  Future<void> register({
    String? username,
    String? email,
    String? phone,
    required String password,
    required String country,
  }) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.register(
        RegisterRequest(
          username: username,
          email: email,
          phone: phone,
          password: password,
          country: country,
        ),
      );
      state = AuthState.authenticated(authResponse: response);
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  /// Yêu cầu khôi phục mật khẩu qua email
  Future<void> forgotPassword(String email) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.forgotPassword(ForgotPasswordRequest(email: email));
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  /// Đăng xuất và dọn sạch session trong local storage
  Future<void> logout() async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  /// Buộc đăng xuất (khi refresh token thất bại hoặc hết hạn)
  void forceLogout() {
    state = const AuthState.unauthenticated();
  }

  /// Cập nhật lại token mới sau khi refresh thành công
  void updateToken(AuthResponse response) {
    state = AuthState.authenticated(authResponse: response);
  }
}
