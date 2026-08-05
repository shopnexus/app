// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Variant',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'attributes',
        'created_at',
        'id',
        'images',
        'is_featured',
        'package_details',
        'price',
        'stock',
      ],
    );
    final val = Variant(
      attributes: $checkedConvert(
        'attributes',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      isFeatured: $checkedConvert('is_featured', (v) => v as bool),
      packageDetails: $checkedConvert(
        'package_details',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      stock: $checkedConvert(
        'stock',
        (v) => Stock.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'isFeatured': 'is_featured',
    'packageDetails': 'package_details',
  },
);

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
  'attributes': instance.attributes,
  'created_at': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'images': instance.images.map((e) => e.toJson()).toList(),
  'is_featured': instance.isFeatured,
  'package_details': instance.packageDetails,
  'price': instance.price,
  'stock': instance.stock.toJson(),
};
