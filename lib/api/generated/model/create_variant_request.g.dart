// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_variant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVariantRequest _$CreateVariantRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateVariantRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['attributes', 'package_details', 'price'],
    );
    final val = CreateVariantRequest(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      attributes: $checkedConvert(
        'attributes',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      packageDetails: $checkedConvert(
        'package_details',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {'packageDetails': 'package_details'},
);

Map<String, dynamic> _$CreateVariantRequestToJson(
  CreateVariantRequest instance,
) => <String, dynamic>{
  if (instance.attachments case final value?) 'attachments': value,
  'attributes': instance.attributes,
  'package_details': instance.packageDetails,
  'price': instance.price,
  if (instance.quantity case final value?) 'quantity': value,
};
