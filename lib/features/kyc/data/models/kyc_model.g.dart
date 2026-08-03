// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdentityDocument _$IdentityDocumentFromJson(Map<String, dynamic> json) =>
    _IdentityDocument(
      id: json['id'] as String,
      provider: json['provider'] as String?,
      docType:
          $enumDecodeNullable(_$IdentityDocTypeEnumMap, json['doc_type']) ??
          IdentityDocType.nationalId,
      status:
          $enumDecodeNullable(_$IdentityStatusEnumMap, json['status']) ??
          IdentityStatus.unverified,
      rejectionReason: json['rejection_reason'] as String?,
      createdAt: json['created_at'] as String?,
      expiresAt: json['expires_at'] as String?,
      verifiedAt: json['verified_at'] as String?,
    );

Map<String, dynamic> _$IdentityDocumentToJson(_IdentityDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'doc_type': _$IdentityDocTypeEnumMap[instance.docType]!,
      'status': _$IdentityStatusEnumMap[instance.status]!,
      'rejection_reason': instance.rejectionReason,
      'created_at': instance.createdAt,
      'expires_at': instance.expiresAt,
      'verified_at': instance.verifiedAt,
    };

const _$IdentityDocTypeEnumMap = {
  IdentityDocType.nationalId: 'national-id',
  IdentityDocType.passport: 'passport',
  IdentityDocType.driverLicense: 'driver-license',
};

const _$IdentityStatusEnumMap = {
  IdentityStatus.unverified: 'unverified',
  IdentityStatus.pending: 'pending',
  IdentityStatus.verified: 'verified',
  IdentityStatus.rejected: 'rejected',
};

_StartIdentityVerificationRequest _$StartIdentityVerificationRequestFromJson(
  Map<String, dynamic> json,
) => _StartIdentityVerificationRequest(
  docType: $enumDecode(_$IdentityDocTypeEnumMap, json['doc_type']),
  frontResourceId: json['front_resource_id'] as String,
  backResourceId: json['back_resource_id'] as String?,
  selfieResourceId: json['selfie_resource_id'] as String,
);

Map<String, dynamic> _$StartIdentityVerificationRequestToJson(
  _StartIdentityVerificationRequest instance,
) => <String, dynamic>{
  'doc_type': _$IdentityDocTypeEnumMap[instance.docType]!,
  'front_resource_id': instance.frontResourceId,
  'back_resource_id': instance.backResourceId,
  'selfie_resource_id': instance.selfieResourceId,
};

_IdentityVerificationTicket _$IdentityVerificationTicketFromJson(
  Map<String, dynamic> json,
) => _IdentityVerificationTicket(
  document: IdentityDocument.fromJson(json['document'] as Map<String, dynamic>),
  vendorSessionExpiresAt: json['vendor_session_expires_at'] as String?,
  vendorSessionUrl: json['vendor_session_url'] as String?,
);

Map<String, dynamic> _$IdentityVerificationTicketToJson(
  _IdentityVerificationTicket instance,
) => <String, dynamic>{
  'document': instance.document,
  'vendor_session_expires_at': instance.vendorSessionExpiresAt,
  'vendor_session_url': instance.vendorSessionUrl,
};

_AccountCreateUploadRequest _$AccountCreateUploadRequestFromJson(
  Map<String, dynamic> json,
) => _AccountCreateUploadRequest(
  filename: json['filename'] as String,
  kind: json['kind'] as String? ?? 'identity',
  mime: json['mime'] as String,
  size: (json['size'] as num).toInt(),
);

Map<String, dynamic> _$AccountCreateUploadRequestToJson(
  _AccountCreateUploadRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'kind': instance.kind,
  'mime': instance.mime,
  'size': instance.size,
};

_UploadSlot _$UploadSlotFromJson(Map<String, dynamic> json) => _UploadSlot(
  resourceId: json['resource_id'] as String,
  url: json['url'] as String,
  headers: json['headers'] as Map<String, dynamic>?,
  expiresAt: json['expires_at'] as String?,
);

Map<String, dynamic> _$UploadSlotToJson(_UploadSlot instance) =>
    <String, dynamic>{
      'resource_id': instance.resourceId,
      'url': instance.url,
      'headers': instance.headers,
      'expires_at': instance.expiresAt,
    };
