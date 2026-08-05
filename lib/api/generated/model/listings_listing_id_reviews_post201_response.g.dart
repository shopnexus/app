// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_listing_id_reviews_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsListingIDReviewsPost201Response
_$ListingsListingIDReviewsPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingsListingIDReviewsPost201Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = ListingsListingIDReviewsPost201Response(
        data: $checkedConvert(
          'data',
          (v) => Review.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingsListingIDReviewsPost201ResponseToJson(
  ListingsListingIDReviewsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
