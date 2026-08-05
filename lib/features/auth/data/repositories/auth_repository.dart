import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/login_post200_response.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/auth/data/models/auth_model.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  const AuthRepository(this._api, this._hiveService);

  final AccountApi _api;
  final HiveService _hiveService;

  Future<AuthResult> login(LoginRequest request) =>
      _store(_api.loginPost(loginRequest: request));

  Future<AuthResult> loginOAuth(OAuthLoginRequest request) =>
      _store(_api.loginOauthPost(oAuthLoginRequest: request));

  Future<AuthResult> register(RegisterRequest request) =>
      _store(_api.registerPost(registerRequest: request));

  Future<void> forgotPassword(PasswordResetRequest request) =>
      _api.passwordResetRequestsPost(passwordResetRequest: request);

  Future<void> confirmPasswordReset(PasswordResetConfirmRequest request) =>
      _api.passwordResetsPost(passwordResetConfirmRequest: request);

  Future<void> changePassword(ChangePasswordRequest request) =>
      _api.passwordPut(changePasswordRequest: request);

  Future<void> requestEmailVerification() =>
      _api.emailVerificationRequestsPost();

  Future<void> confirmEmailVerification(EmailVerificationRequest request) =>
      _api.emailVerificationsPost(emailVerificationRequest: request);

  /// Revoking the session server-side is best-effort: the local session has to
  /// go either way, or a failed call leaves the user signed in to a session the
  /// backend may already have killed.
  Future<void> logout({String? deviceId}) async {
    try {
      await _api.logoutPost(logoutRequest: LogoutRequest(deviceId: deviceId));
    } catch (_) {
      // Offline or a server error; proceed with the local logout.
    }
    await _hiveService.authBox.clear();
  }

  /// The tokens land in Hive here rather than in the notifier, because the
  /// request interceptor reads them from there on every request.
  Future<AuthResult> _store(Future<Response<LoginPost200Response>> call) async {
    final result = (await call).data?.data;
    if (result == null) throw StateError('empty auth response');
    final box = _hiveService.authBox;
    await box.put('token', result.accessToken);
    await box.put('refresh_token', result.refreshToken);
    return result;
  }
}

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(
  ref.watch(accountApiProvider),
  ref.watch(hiveServiceProvider),
);
