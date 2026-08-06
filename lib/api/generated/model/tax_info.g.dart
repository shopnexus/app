// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxInfo _$TaxInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TaxInfo',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'legal_name',
        'tax_code',
        'tax_code_type',
        'updated_at',
        'verification_status',
        'verified_at',
      ],
    );
    final val = TaxInfo(
      legalName: $checkedConvert('legal_name', (v) => v as String),
      taxCode: $checkedConvert('tax_code', (v) => v as String),
      taxCodeType: $checkedConvert(
        'tax_code_type',
        (v) => $enumDecode(_$TaxCodeTypeEnumMap, v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      verificationStatus: $checkedConvert(
        'verification_status',
        (v) => $enumDecode(_$TaxVerificationStatusEnumMap, v),
      ),
      verifiedAt: $checkedConvert(
        'verified_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'legalName': 'legal_name',
    'taxCode': 'tax_code',
    'taxCodeType': 'tax_code_type',
    'updatedAt': 'updated_at',
    'verificationStatus': 'verification_status',
    'verifiedAt': 'verified_at',
  },
);

Map<String, dynamic> _$TaxInfoToJson(TaxInfo instance) => <String, dynamic>{
  'legal_name': instance.legalName,
  'tax_code': instance.taxCode,
  'tax_code_type': _$TaxCodeTypeEnumMap[instance.taxCodeType]!,
  'updated_at': instance.updatedAt.toIso8601String(),
  'verification_status':
      _$TaxVerificationStatusEnumMap[instance.verificationStatus]!,
  'verified_at': instance.verifiedAt?.toIso8601String(),
};

const _$TaxCodeTypeEnumMap = {
  TaxCodeType.individual: 'individual',
  TaxCodeType.business: 'business',
  TaxCodeType.household: 'household',
};

const _$TaxVerificationStatusEnumMap = {
  TaxVerificationStatus.pending: 'pending',
  TaxVerificationStatus.verified: 'verified',
  TaxVerificationStatus.rejected: 'rejected',
};
