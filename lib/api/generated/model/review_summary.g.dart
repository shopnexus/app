// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewSummary _$ReviewSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ReviewSummary',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'breakdown',
            'listing_id',
            'rating',
            'review_count',
            'with_media_count',
          ],
        );
        final val = ReviewSummary(
          breakdown: $checkedConvert(
            'breakdown',
            (v) => (v as List<dynamic>)
                .map((e) => RatingBucket.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          listingId: $checkedConvert('listing_id', (v) => v as String),
          rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
          reviewCount: $checkedConvert(
            'review_count',
            (v) => (v as num).toInt(),
          ),
          withMediaCount: $checkedConvert(
            'with_media_count',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'listingId': 'listing_id',
        'reviewCount': 'review_count',
        'withMediaCount': 'with_media_count',
      },
    );

Map<String, dynamic> _$ReviewSummaryToJson(ReviewSummary instance) =>
    <String, dynamic>{
      'breakdown': instance.breakdown.map((e) => e.toJson()).toList(),
      'listing_id': instance.listingId,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'with_media_count': instance.withMediaCount,
    };
