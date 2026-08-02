// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      identifier: json['identifier'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
    };

_OAuthLoginRequest _$OAuthLoginRequestFromJson(Map<String, dynamic> json) =>
    _OAuthLoginRequest(
      provider: json['provider'] as String,
      credential: json['credential'] as String,
      country: json['country'] as String?,
      locale: json['locale'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$OAuthLoginRequestToJson(_OAuthLoginRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'credential': instance.credential,
      'country': instance.country,
      'locale': instance.locale,
      'timezone': instance.timezone,
    };

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      name: json['name'] as String,
      country: json['country'] as String,
      password: json['password'] as String,
      locale: json['locale'] as String? ?? 'vi',
      timezone: json['timezone'] as String? ?? 'Asia/Ho_Chi_Minh',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'password': instance.password,
      'locale': instance.locale,
      'timezone': instance.timezone,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
    };

_PasswordResetRequest _$PasswordResetRequestFromJson(
  Map<String, dynamic> json,
) => _PasswordResetRequest(identifier: json['identifier'] as String);

Map<String, dynamic> _$PasswordResetRequestToJson(
  _PasswordResetRequest instance,
) => <String, dynamic>{'identifier': instance.identifier};

_PasswordResetConfirmRequest _$PasswordResetConfirmRequestFromJson(
  Map<String, dynamic> json,
) => _PasswordResetConfirmRequest(
  token: json['token'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$PasswordResetConfirmRequestToJson(
  _PasswordResetConfirmRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'new_password': instance.newPassword,
};

_ChangePasswordRequest _$ChangePasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordRequest(
  currentPassword: json['current_password'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestToJson(
  _ChangePasswordRequest instance,
) => <String, dynamic>{
  'current_password': instance.currentPassword,
  'new_password': instance.newPassword,
};

_LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) =>
    _LogoutRequest(deviceId: json['device_id'] as String?);

Map<String, dynamic> _$LogoutRequestToJson(_LogoutRequest instance) =>
    <String, dynamic>{'device_id': instance.deviceId};

_EmailVerificationRequest _$EmailVerificationRequestFromJson(
  Map<String, dynamic> json,
) => _EmailVerificationRequest(token: json['token'] as String);

Map<String, dynamic> _$EmailVerificationRequestToJson(
  _EmailVerificationRequest instance,
) => <String, dynamic>{'token': instance.token};

_RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) =>
    _RefreshRequest(refreshToken: json['refresh_token'] as String);

Map<String, dynamic> _$RefreshRequestToJson(_RefreshRequest instance) =>
    <String, dynamic>{'refresh_token': instance.refreshToken};

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      account: json['account'] == null
          ? null
          : Me.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'account': instance.account,
    };
