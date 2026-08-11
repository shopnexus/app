// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_identity_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartIdentityVerificationRequest _$StartIdentityVerificationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StartIdentityVerificationRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'doc_type',
        'front_resource_id',
        'selfie_resource_id',
      ],
    );
    final val = StartIdentityVerificationRequest(
      backResourceId: $checkedConvert('back_resource_id', (v) => v as String?),
      docType: $checkedConvert(
        'doc_type',
        (v) => $enumDecode(_$IdentityDocumentTypeEnumMap, v),
      ),
      frontResourceId: $checkedConvert('front_resource_id', (v) => v as String),
      selfieResourceId: $checkedConvert(
        'selfie_resource_id',
        (v) => v as String,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'backResourceId': 'back_resource_id',
    'docType': 'doc_type',
    'frontResourceId': 'front_resource_id',
    'selfieResourceId': 'selfie_resource_id',
  },
);

Map<String, dynamic> _$StartIdentityVerificationRequestToJson(
  StartIdentityVerificationRequest instance,
) => <String, dynamic>{
  'back_resource_id': ?instance.backResourceId,
  'doc_type': _$IdentityDocumentTypeEnumMap[instance.docType]!,
  'front_resource_id': instance.frontResourceId,
  'selfie_resource_id': instance.selfieResourceId,
};

const _$IdentityDocumentTypeEnumMap = {
  IdentityDocumentType.nationalId: 'national-id',
  IdentityDocumentType.passport: 'passport',
  IdentityDocumentType.driverLicense: 'driver-license',
};
