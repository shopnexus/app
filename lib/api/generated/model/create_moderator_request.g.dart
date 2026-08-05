// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_moderator_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateModeratorRequest _$CreateModeratorRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateModeratorRequest', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'country',
      'email',
      'locale',
      'name',
      'password',
      'timezone',
    ],
  );
  final val = CreateModeratorRequest(
    country: $checkedConvert('country', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    locale: $checkedConvert('locale', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
    timezone: $checkedConvert('timezone', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CreateModeratorRequestToJson(
  CreateModeratorRequest instance,
) => <String, dynamic>{
  'country': instance.country,
  'email': instance.email,
  'locale': instance.locale,
  'name': instance.name,
  'password': instance.password,
  'timezone': instance.timezone,
};
