// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_tax_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertTaxInfoRequest _$UpsertTaxInfoRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpsertTaxInfoRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['legal_name', 'tax_code', 'tax_code_type'],
    );
    final val = UpsertTaxInfoRequest(
      legalName: $checkedConvert('legal_name', (v) => v as String),
      taxCode: $checkedConvert('tax_code', (v) => v as String),
      taxCodeType: $checkedConvert(
        'tax_code_type',
        (v) => $enumDecode(_$TaxCodeTypeEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'legalName': 'legal_name',
    'taxCode': 'tax_code',
    'taxCodeType': 'tax_code_type',
  },
);

Map<String, dynamic> _$UpsertTaxInfoRequestToJson(
  UpsertTaxInfoRequest instance,
) => <String, dynamic>{
  'legal_name': instance.legalName,
  'tax_code': instance.taxCode,
  'tax_code_type': _$TaxCodeTypeEnumMap[instance.taxCodeType]!,
};

const _$TaxCodeTypeEnumMap = {
  TaxCodeType.individual: 'individual',
  TaxCodeType.business: 'business',
  TaxCodeType.household: 'household',
};
