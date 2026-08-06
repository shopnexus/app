// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftOrder _$DraftOrderFromJson(Map<String, dynamic> json) => $checkedCreate(
  'DraftOrder',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'cancelled_at',
        'created_at',
        'currency',
        'id',
        'listing_id',
        'name',
        'price_mode',
        'seller_id',
        'valid_until',
        'variants',
      ],
    );
    final val = DraftOrder(
      cancelledAt: $checkedConvert(
        'cancelled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      listingId: $checkedConvert('listing_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecode(_$DraftOrderPriceModeEnumEnumMap, v),
      ),
      sellerId: $checkedConvert('seller_id', (v) => v as String),
      validUntil: $checkedConvert(
        'valid_until',
        (v) => DateTime.parse(v as String),
      ),
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DraftVariantSnapshot.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'cancelledAt': 'cancelled_at',
    'createdAt': 'created_at',
    'listingId': 'listing_id',
    'priceMode': 'price_mode',
    'sellerId': 'seller_id',
    'validUntil': 'valid_until',
  },
);

Map<String, dynamic> _$DraftOrderToJson(DraftOrder instance) =>
    <String, dynamic>{
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'id': instance.id,
      'listing_id': instance.listingId,
      'name': instance.name,
      'price_mode': _$DraftOrderPriceModeEnumEnumMap[instance.priceMode]!,
      'seller_id': instance.sellerId,
      'valid_until': instance.validUntil.toIso8601String(),
      'variants': instance.variants.map((e) => e.toJson()).toList(),
    };

const _$DraftOrderPriceModeEnumEnumMap = {
  DraftOrderPriceModeEnum.fixed: 'fixed',
  DraftOrderPriceModeEnum.negotiable: 'negotiable',
};
