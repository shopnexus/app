// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CartItem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'created_at',
        'id',
        'listing_id',
        'quantity',
        'variant_id',
      ],
    );
    final val = CartItem(
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      listingId: $checkedConvert('listing_id', (v) => v as String),
      quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      variantId: $checkedConvert('variant_id', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'listingId': 'listing_id',
    'variantId': 'variant_id',
  },
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'created_at': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'listing_id': instance.listingId,
  'quantity': instance.quantity,
  'variant_id': instance.variantId,
};
