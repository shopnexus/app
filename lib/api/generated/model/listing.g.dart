// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Listing',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'category_id',
        'condition',
        'created_at',
        'currency',
        'favorited',
        'id',
        'name',
        'price',
        'price_mode',
        'rating',
        'review_count',
        'seller',
        'slug',
        'sold',
        'status',
      ],
    );
    final val = Listing(
      categoryId: $checkedConvert('category_id', (v) => v as String),
      condition: $checkedConvert(
        'condition',
        (v) => $enumDecode(_$ListingConditionEnumMap, v),
      ),
      cover: $checkedConvert(
        'cover',
        (v) => v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      deletedAt: $checkedConvert(
        'deleted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      favorited: $checkedConvert('favorited', (v) => v as bool),
      id: $checkedConvert('id', (v) => v as String),
      location: $checkedConvert(
        'location',
        (v) => v == null
            ? null
            : ListingLocation.fromJson(v as Map<String, dynamic>),
      ),
      name: $checkedConvert('name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecode(_$PriceModeEnumMap, v),
      ),
      rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
      reviewCount: $checkedConvert('review_count', (v) => (v as num).toInt()),
      score: $checkedConvert('score', (v) => (v as num?)?.toDouble()),
      seller: $checkedConvert(
        'seller',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      slug: $checkedConvert('slug', (v) => v as String),
      sold: $checkedConvert('sold', (v) => (v as num).toInt()),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$ListingStatusEnumMap, v),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      takenDownAt: $checkedConvert(
        'taken_down_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryId': 'category_id',
    'createdAt': 'created_at',
    'deletedAt': 'deleted_at',
    'priceMode': 'price_mode',
    'reviewCount': 'review_count',
    'takenDownAt': 'taken_down_at',
  },
);

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
  'category_id': instance.categoryId,
  'condition': _$ListingConditionEnumMap[instance.condition]!,
  'cover': ?instance.cover?.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'currency': instance.currency,
  'deleted_at': ?instance.deletedAt?.toIso8601String(),
  'favorited': instance.favorited,
  'id': instance.id,
  'location': ?instance.location?.toJson(),
  'name': instance.name,
  'price': instance.price,
  'price_mode': _$PriceModeEnumMap[instance.priceMode]!,
  'rating': instance.rating,
  'review_count': instance.reviewCount,
  'score': ?instance.score,
  'seller': instance.seller.toJson(),
  'slug': instance.slug,
  'sold': instance.sold,
  'status': _$ListingStatusEnumMap[instance.status]!,
  'tags': ?instance.tags,
  'taken_down_at': ?instance.takenDownAt?.toIso8601String(),
};

const _$ListingConditionEnumMap = {
  ListingCondition.new_: 'new',
  ListingCondition.used: 'used',
  ListingCondition.damaged: 'damaged',
};

const _$PriceModeEnumMap = {
  PriceMode.fixed: 'fixed',
  PriceMode.negotiable: 'negotiable',
};

const _$ListingStatusEnumMap = {
  ListingStatus.draft: 'draft',
  ListingStatus.pending: 'pending',
  ListingStatus.active: 'active',
  ListingStatus.hidden: 'hidden',
};
