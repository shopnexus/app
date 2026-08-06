// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityDocument _$IdentityDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IdentityDocument',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'created_at',
            'doc_type',
            'expires_at',
            'id',
            'provider',
            'rejection_reason',
            'status',
            'verified_at',
          ],
        );
        final val = IdentityDocument(
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          docType: $checkedConvert(
            'doc_type',
            (v) => $enumDecode(_$IdentityDocumentTypeEnumMap, v),
          ),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          id: $checkedConvert('id', (v) => v as String),
          provider: $checkedConvert('provider', (v) => v as String),
          rejectionReason: $checkedConvert(
            'rejection_reason',
            (v) => v as String?,
          ),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$IdentityStatusEnumMap, v),
          ),
          verifiedAt: $checkedConvert(
            'verified_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'docType': 'doc_type',
        'expiresAt': 'expires_at',
        'rejectionReason': 'rejection_reason',
        'verifiedAt': 'verified_at',
      },
    );

Map<String, dynamic> _$IdentityDocumentToJson(IdentityDocument instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'doc_type': _$IdentityDocumentTypeEnumMap[instance.docType]!,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'id': instance.id,
      'provider': instance.provider,
      'rejection_reason': instance.rejectionReason,
      'status': _$IdentityStatusEnumMap[instance.status]!,
      'verified_at': instance.verifiedAt?.toIso8601String(),
    };

const _$IdentityDocumentTypeEnumMap = {
  IdentityDocumentType.nationalId: 'national-id',
  IdentityDocumentType.passport: 'passport',
  IdentityDocumentType.driverLicense: 'driver-license',
};

const _$IdentityStatusEnumMap = {
  IdentityStatus.pending: 'pending',
  IdentityStatus.verified: 'verified',
  IdentityStatus.rejected: 'rejected',
};
