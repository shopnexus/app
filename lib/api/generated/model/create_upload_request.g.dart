// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUploadRequest _$CreateUploadRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateUploadRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['filename', 'mime', 'size']);
      final val = CreateUploadRequest(
        filename: $checkedConvert('filename', (v) => v as String),
        mime: $checkedConvert('mime', (v) => v as String),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$CreateUploadRequestToJson(
  CreateUploadRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'mime': instance.mime,
  'size': instance.size,
};
