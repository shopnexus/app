// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AuthResult',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'access_token',
        'account',
        'expires_in',
        'refresh_token',
      ],
    );
    final val = AuthResult(
      accessToken: $checkedConvert('access_token', (v) => v as String),
      account: $checkedConvert(
        'account',
        (v) => Me.fromJson(v as Map<String, dynamic>),
      ),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'accessToken': 'access_token',
    'expiresIn': 'expires_in',
    'refreshToken': 'refresh_token',
  },
);

Map<String, dynamic> _$AuthResultToJson(AuthResult instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'account': instance.account.toJson(),
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
    };
