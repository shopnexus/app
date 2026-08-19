// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_interactions_post_request_interactions_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsInteractionsPostRequestInteractionsInner
_$ListingsInteractionsPostRequestInteractionsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListingsInteractionsPostRequestInteractionsInner',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['listing_id', 'type']);
    final val = ListingsInteractionsPostRequestInteractionsInner(
      listingId: $checkedConvert('listing_id', (v) => v as String),
      type: $checkedConvert(
        'type',
        (v) => $enumDecode(
          _$ListingsInteractionsPostRequestInteractionsInnerTypeEnumEnumMap,
          v,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'listingId': 'listing_id'},
);

Map<String, dynamic> _$ListingsInteractionsPostRequestInteractionsInnerToJson(
  ListingsInteractionsPostRequestInteractionsInner instance,
) => <String, dynamic>{
  'listing_id': instance.listingId,
  'type':
      _$ListingsInteractionsPostRequestInteractionsInnerTypeEnumEnumMap[instance
          .type]!,
};

const _$ListingsInteractionsPostRequestInteractionsInnerTypeEnumEnumMap = {
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.view: 'view',
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.clickFromSearch:
      'click-from-search',
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.clickFromRecommended:
      'click-from-recommended',
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.clickFromCategory:
      'click-from-category',
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.notInterested:
      'not-interested',
  ListingsInteractionsPostRequestInteractionsInnerTypeEnum.hidden: 'hidden',
};
