import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/wishlist_provider.dart';
import 'package:shopnexus_flutter_app/features/auth/data/models/auth_model.dart';
import 'package:shopnexus_flutter_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  /// The two tokens and nothing else: that is all a signed-in session is, and
  /// the account itself is `profileProvider`'s to hold and refresh.
  const factory AuthState.authenticated({
    required String accessToken,
    required String refreshToken,
  }) = _Authenticated;

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
        accessToken: token.toString(),
        refreshToken: refreshToken.toString(),
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
      state = AuthState.authenticated(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
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
      state = AuthState.authenticated(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
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
      state = AuthState.authenticated(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Yêu cầu khôi phục mật khẩu qua email / identifier
  Future<void> forgotPassword(String identifier) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.forgotPassword(
        PasswordResetRequest(identifier: identifier),
      );
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
      _clearLocalSession();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(message: ErrorHandler.getErrorMessage(e));
    }
  }

  /// Buộc đăng xuất (khi refresh token thất bại hoặc hết hạn)
  void forceLogout() {
    ref.read(hiveServiceProvider).clearUserData(keepPreferences: true);
    _clearLocalSession();
    state = const AuthState.unauthenticated();
  }

  void _clearLocalSession() {
    ref.invalidate(profileProvider);
    ref.invalidate(recentSearchesProvider);
    ref.invalidate(recentlyViewedProductsProvider);
    ref.invalidate(cartProvider);
    ref.invalidate(wishlistProductsProvider);
  }

  /// Cập nhật lại token mới sau khi refresh thành công
  void updateToken({
    required String accessToken,
    required String refreshToken,
  }) {
    state = AuthState.authenticated(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
