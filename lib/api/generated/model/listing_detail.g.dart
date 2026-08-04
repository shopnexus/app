// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingDetail _$ListingDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListingDetail',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'category',
        'condition',
        'created_at',
        'currency',
        'description',
        'favorite_count',
        'favorited',
        'id',
        'images',
        'name',
        'price_mode',
        'rating',
        'review_count',
        'seller',
        'slug',
        'sold',
        'specifications',
        'status',
        'tags',
        'variants',
      ],
    );
    final val = ListingDetail(
      category: $checkedConvert(
        'category',
        (v) => Category.fromJson(v as Map<String, dynamic>),
      ),
      condition: $checkedConvert(
        'condition',
        (v) => $enumDecode(_$ListingConditionEnumMap, v),
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
      description: $checkedConvert('description', (v) => v as String),
      favoriteCount: $checkedConvert(
        'favorite_count',
        (v) => (v as num).toInt(),
      ),
      favorited: $checkedConvert('favorited', (v) => v as bool),
      featuredVariantId: $checkedConvert(
        'featured_variant_id',
        (v) => v as String?,
      ),
      id: $checkedConvert('id', (v) => v as String),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      location: $checkedConvert(
        'location',
        (v) => v == null
            ? null
            : ListingLocation.fromJson(v as Map<String, dynamic>),
      ),
      name: $checkedConvert('name', (v) => v as String),
      pendingEdit: $checkedConvert(
        'pending_edit',
        (v) =>
            v == null ? null : PendingEdit.fromJson(v as Map<String, dynamic>),
      ),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecode(_$PriceModeEnumMap, v),
      ),
      rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
      reviewCount: $checkedConvert('review_count', (v) => (v as num).toInt()),
      seller: $checkedConvert(
        'seller',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      slug: $checkedConvert('slug', (v) => v as String),
      sold: $checkedConvert('sold', (v) => (v as num).toInt()),
      specifications: $checkedConvert(
        'specifications',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$ListingStatusEnumMap, v),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>)
            .map((e) => Variant.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'deletedAt': 'deleted_at',
    'favoriteCount': 'favorite_count',
    'featuredVariantId': 'featured_variant_id',
    'pendingEdit': 'pending_edit',
    'priceMode': 'price_mode',
    'reviewCount': 'review_count',
  },
);

Map<String, dynamic> _$ListingDetailToJson(ListingDetail instance) =>
    <String, dynamic>{
      'category': instance.category.toJson(),
      'condition': _$ListingConditionEnumMap[instance.condition]!,
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'deleted_at': ?instance.deletedAt?.toIso8601String(),
      'description': instance.description,
      'favorite_count': instance.favoriteCount,
      'favorited': instance.favorited,
      'featured_variant_id': ?instance.featuredVariantId,
      'id': instance.id,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'location': ?instance.location?.toJson(),
      'name': instance.name,
      'pending_edit': ?instance.pendingEdit?.toJson(),
      'price_mode': _$PriceModeEnumMap[instance.priceMode]!,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'seller': instance.seller.toJson(),
      'slug': instance.slug,
      'sold': instance.sold,
      'specifications': instance.specifications,
      'status': _$ListingStatusEnumMap[instance.status]!,
      'tags': instance.tags,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
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
