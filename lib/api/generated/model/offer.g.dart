// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Offer',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'author_id',
        'buyer_id',
        'created_at',
        'currency',
        'expires_at',
        'id',
        'listing_id',
        'quantity',
        'reason',
        'seller_id',
        'status',
        'total',
        'variant_id',
      ],
    );
    final val = Offer(
      authorId: $checkedConvert('author_id', (v) => v as String),
      buyerId: $checkedConvert('buyer_id', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      listingId: $checkedConvert('listing_id', (v) => v as String),
      quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      reason: $checkedConvert('reason', (v) => v as String),
      sellerId: $checkedConvert('seller_id', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$OfferStatusEnumMap, v),
      ),
      total: $checkedConvert('total', (v) => (v as num).toInt()),
      variantId: $checkedConvert('variant_id', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'authorId': 'author_id',
    'buyerId': 'buyer_id',
    'createdAt': 'created_at',
    'expiresAt': 'expires_at',
    'listingId': 'listing_id',
    'sellerId': 'seller_id',
    'variantId': 'variant_id',
  },
);

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
  'author_id': instance.authorId,
  'buyer_id': instance.buyerId,
  'created_at': instance.createdAt.toIso8601String(),
  'currency': instance.currency,
  'expires_at': instance.expiresAt.toIso8601String(),
  'id': instance.id,
  'listing_id': instance.listingId,
  'quantity': instance.quantity,
  'reason': instance.reason,
  'seller_id': instance.sellerId,
  'status': _$OfferStatusEnumMap[instance.status]!,
  'total': instance.total,
  'variant_id': instance.variantId,
};

const _$OfferStatusEnumMap = {
  OfferStatus.active: 'active',
  OfferStatus.accepted: 'accepted',
  OfferStatus.checkedOut: 'checked-out',
  OfferStatus.cancelled: 'cancelled',
};
