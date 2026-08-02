import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../account/data/models/account_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const LoginRequest._();

  const factory LoginRequest({
    @JsonKey(name: 'identifier') required String identifier,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  String get id => identifier;

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class OAuthLoginRequest with _$OAuthLoginRequest {
  const factory OAuthLoginRequest({
    required String provider,
    required String credential,
    String? country,
    String? locale,
    String? timezone,
  }) = _OAuthLoginRequest;

  factory OAuthLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthLoginRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String name,
    required String country,
    required String password,
    @Default('vi') String locale,
    @Default('Asia/Ho_Chi_Minh') String timezone,
    String? email,
    String? phone,
    String? username,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class PasswordResetRequest with _$PasswordResetRequest {
  const PasswordResetRequest._();

  const factory PasswordResetRequest({
    @JsonKey(name: 'identifier') required String identifier,
  }) = _PasswordResetRequest;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestFromJson(json);

  String get email => identifier;

  @override
  Map<String, dynamic> toJson();
}

typedef ForgotPasswordRequest = PasswordResetRequest;

@freezed
abstract class PasswordResetConfirmRequest with _$PasswordResetConfirmRequest {
  const factory PasswordResetConfirmRequest({
    required String token,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _PasswordResetConfirmRequest;

  factory PasswordResetConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetConfirmRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    @JsonKey(name: 'current_password') required String currentPassword,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class LogoutRequest with _$LogoutRequest {
  const factory LogoutRequest({
    @JsonKey(name: 'device_id') String? deviceId,
  }) = _LogoutRequest;

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class EmailVerificationRequest with _$EmailVerificationRequest {
  const factory EmailVerificationRequest({
    required String token,
  }) = _EmailVerificationRequest;

  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RefreshRequest with _$RefreshRequest {
  const factory RefreshRequest({
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') int? expiresIn,
    Me? account,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

typedef AuthResult = AuthResponse;
