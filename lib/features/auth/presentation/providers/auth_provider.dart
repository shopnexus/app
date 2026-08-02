import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../account/presentation/providers/account_provider.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../core/utils/error_handler.dart';
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
  Future<void> login(String identifier, String password) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(
        LoginRequest(identifier: identifier, password: password),
      );
      state = AuthState.authenticated(authResponse: response);
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Đăng nhập bằng OAuth (Google, Apple,...)
  Future<void> loginOAuth({
    required String provider,
    required String credential,
    String? country,
    String? locale,
    String? timezone,
  }) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.loginOAuth(
        OAuthLoginRequest(
          provider: provider,
          credential: credential,
          country: country,
          locale: locale,
          timezone: timezone,
        ),
      );
      state = AuthState.authenticated(authResponse: response);
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Đăng ký tài khoản mới
  Future<void> register({
    required String name,
    required String country,
    required String password,
    String locale = 'vi',
    String timezone = 'Asia/Ho_Chi_Minh',
    String? username,
    String? email,
    String? phone,
  }) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.register(
        RegisterRequest(
          name: name,
          country: country,
          password: password,
          locale: locale,
          timezone: timezone,
          username: username,
          email: email,
          phone: phone,
        ),
      );
      state = AuthState.authenticated(authResponse: response);
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Yêu cầu khôi phục mật khẩu qua email / identifier
  Future<void> forgotPassword(String identifier) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.forgotPassword(PasswordResetRequest(identifier: identifier));
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Đăng xuất và dọn sạch session trong local storage
  Future<void> logout({String? deviceId}) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout(deviceId: deviceId);
      ref.invalidate(profileProvider);
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Buộc đăng xuất (khi refresh token thất bại hoặc hết hạn)
  void forceLogout() {
    ref.invalidate(profileProvider);
    state = const AuthState.unauthenticated();
  }

  /// Cập nhật lại token mới sau khi refresh thành công
  void updateToken(AuthResponse response) {
    state = AuthState.authenticated(authResponse: response);
  }
}
