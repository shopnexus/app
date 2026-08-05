// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Device',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'created_at',
        'id',
        'last_seen_at',
        'platform',
        'push_token_suffix',
      ],
    );
    final val = Device(
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      lastSeenAt: $checkedConvert(
        'last_seen_at',
        (v) => DateTime.parse(v as String),
      ),
      platform: $checkedConvert(
        'platform',
        (v) => $enumDecode(_$DevicePlatformEnumMap, v),
      ),
      pushTokenSuffix: $checkedConvert('push_token_suffix', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'lastSeenAt': 'last_seen_at',
    'pushTokenSuffix': 'push_token_suffix',
  },
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'created_at': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'last_seen_at': instance.lastSeenAt.toIso8601String(),
  'platform': _$DevicePlatformEnumMap[instance.platform]!,
  'push_token_suffix': instance.pushTokenSuffix,
};

const _$DevicePlatformEnumMap = {
  DevicePlatform.ios: 'ios',
  DevicePlatform.android: 'android',
  DevicePlatform.web: 'web',
};
