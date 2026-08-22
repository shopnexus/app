// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_listing_id_reviews_summary_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsListingIDReviewsSummaryGet200Response
_$ListingsListingIDReviewsSummaryGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListingsListingIDReviewsSummaryGet200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ListingsListingIDReviewsSummaryGet200Response(
    data: $checkedConvert(
      'data',
      (v) => ReviewSummary.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListingsListingIDReviewsSummaryGet200ResponseToJson(
  ListingsListingIDReviewsSummaryGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
