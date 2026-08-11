// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_variant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateVariantRequest _$UpdateVariantRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateVariantRequest',
  json,
  ($checkedConvert) {
    final val = UpdateVariantRequest(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      attributes: $checkedConvert(
        'attributes',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      isFeatured: $checkedConvert('is_featured', (v) => v as bool?),
      packageDetails: $checkedConvert(
        'package_details',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      price: $checkedConvert('price', (v) => (v as num?)?.toInt()),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'isFeatured': 'is_featured',
    'packageDetails': 'package_details',
  },
);

Map<String, dynamic> _$UpdateVariantRequestToJson(
  UpdateVariantRequest instance,
) => <String, dynamic>{
  'attachments': ?instance.attachments,
  'attributes': ?instance.attributes,
  'is_featured': ?instance.isFeatured,
  'package_details': ?instance.packageDetails,
  'price': ?instance.price,
  'quantity': ?instance.quantity,
};
