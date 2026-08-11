// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_listing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateListingRequest _$UpdateListingRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateListingRequest',
  json,
  ($checkedConvert) {
    final val = UpdateListingRequest(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      categoryId: $checkedConvert('category_id', (v) => v as String?),
      clearFeaturedVariantId: $checkedConvert(
        'clear_featured_variant_id',
        (v) => v as bool?,
      ),
      condition: $checkedConvert(
        'condition',
        (v) => $enumDecodeNullable(_$ListingConditionEnumMap, v),
      ),
      description: $checkedConvert('description', (v) => v as String?),
      featuredVariantId: $checkedConvert(
        'featured_variant_id',
        (v) => v as String?,
      ),
      name: $checkedConvert('name', (v) => v as String?),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecodeNullable(_$PriceModeEnumMap, v),
      ),
      specifications: $checkedConvert(
        'specifications',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryId': 'category_id',
    'clearFeaturedVariantId': 'clear_featured_variant_id',
    'featuredVariantId': 'featured_variant_id',
    'priceMode': 'price_mode',
  },
);

Map<String, dynamic> _$UpdateListingRequestToJson(
  UpdateListingRequest instance,
) => <String, dynamic>{
  'attachments': ?instance.attachments,
  'category_id': ?instance.categoryId,
  'clear_featured_variant_id': ?instance.clearFeaturedVariantId,
  'condition': ?_$ListingConditionEnumMap[instance.condition],
  'description': ?instance.description,
  'featured_variant_id': ?instance.featuredVariantId,
  'name': ?instance.name,
  'price_mode': ?_$PriceModeEnumMap[instance.priceMode],
  'specifications': ?instance.specifications,
  'tags': ?instance.tags,
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
