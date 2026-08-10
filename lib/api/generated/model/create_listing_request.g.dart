// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_listing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateListingRequest _$CreateListingRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateListingRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'category_id',
        'condition',
        'currency',
        'name',
        'price_mode',
        'variants',
      ],
    );
    final val = CreateListingRequest(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      categoryId: $checkedConvert('category_id', (v) => v as String),
      condition: $checkedConvert(
        'condition',
        (v) => $enumDecode(_$ListingConditionEnumMap, v),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecode(_$PriceModeEnumMap, v),
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
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>)
            .map(
              (e) => CreateVariantRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'categoryId': 'category_id', 'priceMode': 'price_mode'},
);

Map<String, dynamic> _$CreateListingRequestToJson(
  CreateListingRequest instance,
) => <String, dynamic>{
  if (instance.attachments case final value?) 'attachments': value,
  'category_id': instance.categoryId,
  'condition': _$ListingConditionEnumMap[instance.condition]!,
  'currency': instance.currency,
  if (instance.description case final value?) 'description': value,
  'name': instance.name,
  'price_mode': _$PriceModeEnumMap[instance.priceMode]!,
  if (instance.specifications case final value?) 'specifications': value,
  if (instance.tags case final value?) 'tags': value,
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
