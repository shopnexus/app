// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCreateUploadRequest _$AccountCreateUploadRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AccountCreateUploadRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['filename', 'kind', 'mime', 'size']);
  final val = AccountCreateUploadRequest(
    filename: $checkedConvert('filename', (v) => v as String),
    kind: $checkedConvert(
      'kind',
      (v) => $enumDecode(_$AccountCreateUploadRequestKindEnumEnumMap, v),
    ),
    mime: $checkedConvert('mime', (v) => v as String),
    size: $checkedConvert('size', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AccountCreateUploadRequestToJson(
  AccountCreateUploadRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'kind': _$AccountCreateUploadRequestKindEnumEnumMap[instance.kind]!,
  'mime': instance.mime,
  'size': instance.size,
};

const _$AccountCreateUploadRequestKindEnumEnumMap = {
  AccountCreateUploadRequestKindEnum.avatar: 'avatar',
  AccountCreateUploadRequestKindEnum.identity: 'identity',
};
