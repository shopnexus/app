// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxVerificationRequest _$TaxVerificationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TaxVerificationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['source', 'status']);
  final val = TaxVerificationRequest(
    note: $checkedConvert('note', (v) => v as String?),
    source_: $checkedConvert('source', (v) => v as String),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$TaxVerificationRequestStatusEnumEnumMap, v),
    ),
  );
  return val;
}, fieldKeyMap: const {'source_': 'source'});

Map<String, dynamic> _$TaxVerificationRequestToJson(
  TaxVerificationRequest instance,
) => <String, dynamic>{
  'note': ?instance.note,
  'source': instance.source_,
  'status': _$TaxVerificationRequestStatusEnumEnumMap[instance.status]!,
};

const _$TaxVerificationRequestStatusEnumEnumMap = {
  TaxVerificationRequestStatusEnum.verified: 'verified',
  TaxVerificationRequestStatusEnum.rejected: 'rejected',
};
