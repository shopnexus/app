// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'country',
          'locale',
          'name',
          'password',
          'timezone',
        ],
      );
      final val = RegisterRequest(
        country: $checkedConvert('country', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String?),
        locale: $checkedConvert('locale', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        phone: $checkedConvert('phone', (v) => v as String?),
        timezone: $checkedConvert('timezone', (v) => v as String),
        username: $checkedConvert('username', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'country': instance.country,
      'email': ?instance.email,
      'locale': instance.locale,
      'name': instance.name,
      'password': instance.password,
      'phone': ?instance.phone,
      'timezone': instance.timezone,
      'username': ?instance.username,
    };
