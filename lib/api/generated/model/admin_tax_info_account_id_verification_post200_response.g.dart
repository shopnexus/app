// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_info_account_id_verification_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTaxInfoAccountIDVerificationPost200Response
_$AdminTaxInfoAccountIDVerificationPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminTaxInfoAccountIDVerificationPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminTaxInfoAccountIDVerificationPost200Response(
    data: $checkedConvert(
      'data',
      (v) => TaxInfo.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminTaxInfoAccountIDVerificationPost200ResponseToJson(
  AdminTaxInfoAccountIDVerificationPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
