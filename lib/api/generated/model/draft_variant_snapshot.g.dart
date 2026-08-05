// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_variant_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftVariantSnapshot _$DraftVariantSnapshotFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DraftVariantSnapshot', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['price', 'variant_id']);
  final val = DraftVariantSnapshot(
    attributes: $checkedConvert(
      'attributes',
      (v) =>
          (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as Object)),
    ),
    price: $checkedConvert('price', (v) => (v as num).toInt()),
    variantId: $checkedConvert('variant_id', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'variantId': 'variant_id'});

Map<String, dynamic> _$DraftVariantSnapshotToJson(
  DraftVariantSnapshot instance,
) => <String, dynamic>{
  'attributes': ?instance.attributes,
  'price': instance.price,
  'variant_id': instance.variantId,
};
