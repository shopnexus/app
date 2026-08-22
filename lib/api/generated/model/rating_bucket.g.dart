// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_bucket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingBucket _$RatingBucketFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RatingBucket', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['count', 'rating']);
      final val = RatingBucket(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        rating: $checkedConvert('rating', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$RatingBucketToJson(RatingBucket instance) =>
    <String, dynamic>{'count': instance.count, 'rating': instance.rating};
