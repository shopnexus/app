// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCreateUploadRequest _$AccountCreateUploadRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AccountCreateUploadRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['filename', 'mime', 'size', 'kind']);
  final val = AccountCreateUploadRequest(
    filename: $checkedConvert('filename', (v) => v as String),
    mime: $checkedConvert('mime', (v) => v as String),
    size: $checkedConvert('size', (v) => (v as num).toInt()),
    kind: $checkedConvert(
      'kind',
      (v) => $enumDecode(_$AccountCreateUploadRequestKindEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$AccountCreateUploadRequestToJson(
  AccountCreateUploadRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'mime': instance.mime,
  'size': instance.size,
  'kind': _$AccountCreateUploadRequestKindEnumEnumMap[instance.kind]!,
};

const _$AccountCreateUploadRequestKindEnumEnumMap = {
  AccountCreateUploadRequestKindEnum.avatar: 'avatar',
  AccountCreateUploadRequestKindEnum.identity: 'identity',
};
