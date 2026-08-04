// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RegisterDeviceRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['platform', 'push_token']);
  final val = RegisterDeviceRequest(
    platform: $checkedConvert(
      'platform',
      (v) => $enumDecode(_$DevicePlatformEnumMap, v),
    ),
    pushToken: $checkedConvert('push_token', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'pushToken': 'push_token'});

Map<String, dynamic> _$RegisterDeviceRequestToJson(
  RegisterDeviceRequest instance,
) => <String, dynamic>{
  'platform': _$DevicePlatformEnumMap[instance.platform]!,
  'push_token': instance.pushToken,
};

const _$DevicePlatformEnumMap = {
  DevicePlatform.ios: 'ios',
  DevicePlatform.android: 'android',
  DevicePlatform.web: 'web',
};
