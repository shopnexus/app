// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadSlot _$UploadSlotFromJson(Map<String, dynamic> json) => $checkedCreate(
  'UploadSlot',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['expires_at', 'resource_id', 'url']);
    final val = UploadSlot(
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      headers: $checkedConvert(
        'headers',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as String),
        ),
      ),
      resourceId: $checkedConvert('resource_id', (v) => v as String),
      url: $checkedConvert('url', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'expiresAt': 'expires_at', 'resourceId': 'resource_id'},
);

Map<String, dynamic> _$UploadSlotToJson(UploadSlot instance) =>
    <String, dynamic>{
      'expires_at': instance.expiresAt.toIso8601String(),
      'headers': ?instance.headers,
      'resource_id': instance.resourceId,
      'url': instance.url,
    };
