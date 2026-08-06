// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Resource',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'checksum',
        'id',
        'mime',
        'object_key',
        'provider',
        'size',
        'url',
        'url_expires_at',
      ],
    );
    final val = Resource(
      checksum: $checkedConvert('checksum', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      mime: $checkedConvert('mime', (v) => v as String),
      objectKey: $checkedConvert('object_key', (v) => v as String),
      provider: $checkedConvert('provider', (v) => v as String),
      size: $checkedConvert('size', (v) => (v as num).toInt()),
      url: $checkedConvert('url', (v) => v as String),
      urlExpiresAt: $checkedConvert(
        'url_expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'objectKey': 'object_key',
    'urlExpiresAt': 'url_expires_at',
  },
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
  'checksum': instance.checksum,
  'id': instance.id,
  'mime': instance.mime,
  'object_key': instance.objectKey,
  'provider': instance.provider,
  'size': instance.size,
  'url': instance.url,
  'url_expires_at': instance.urlExpiresAt?.toIso8601String(),
};
