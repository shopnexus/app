// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Feedback',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'comment',
        'created_at',
        'direction',
        'id',
        'order_id',
        'ratee_id',
        'rater',
        'rating',
      ],
    );
    final val = Feedback(
      comment: $checkedConvert('comment', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      direction: $checkedConvert(
        'direction',
        (v) => $enumDecode(_$FeedbackDirectionEnumMap, v),
      ),
      id: $checkedConvert('id', (v) => v as String),
      orderId: $checkedConvert('order_id', (v) => v as String),
      publishedAt: $checkedConvert(
        'published_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      rateeId: $checkedConvert('ratee_id', (v) => v as String),
      rater: $checkedConvert(
        'rater',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      rating: $checkedConvert('rating', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'orderId': 'order_id',
    'publishedAt': 'published_at',
    'rateeId': 'ratee_id',
  },
);

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
  'comment': instance.comment,
  'created_at': instance.createdAt.toIso8601String(),
  'direction': _$FeedbackDirectionEnumMap[instance.direction]!,
  'id': instance.id,
  'order_id': instance.orderId,
  'published_at': ?instance.publishedAt?.toIso8601String(),
  'ratee_id': instance.rateeId,
  'rater': instance.rater.toJson(),
  'rating': instance.rating,
};

const _$FeedbackDirectionEnumMap = {
  FeedbackDirection.buyerToSeller: 'buyer-to-seller',
  FeedbackDirection.sellerToBuyer: 'seller-to-buyer',
};
