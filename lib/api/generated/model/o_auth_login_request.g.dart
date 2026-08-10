// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_auth_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthLoginRequest _$OAuthLoginRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OAuthLoginRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['credential', 'provider']);
      final val = OAuthLoginRequest(
        country: $checkedConvert('country', (v) => v as String?),
        credential: $checkedConvert('credential', (v) => v as String),
        locale: $checkedConvert('locale', (v) => v as String?),
        provider: $checkedConvert('provider', (v) => v as String),
        timezone: $checkedConvert('timezone', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$OAuthLoginRequestToJson(OAuthLoginRequest instance) =>
    <String, dynamic>{
      if (instance.country case final value?) 'country': value,
      'credential': instance.credential,
      if (instance.locale case final value?) 'locale': value,
      'provider': instance.provider,
      if (instance.timezone case final value?) 'timezone': value,
    };
