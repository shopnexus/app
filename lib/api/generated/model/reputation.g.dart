// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reputation _$ReputationFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Reputation',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'account_id',
        'cancelled_orders',
        'completed_orders',
        'rating_average',
        'rating_count',
        'review_rating_average',
        'review_rating_count',
        'role',
        'updated_at',
      ],
    );
    final val = Reputation(
      accountId: $checkedConvert('account_id', (v) => v as String),
      cancelledOrders: $checkedConvert(
        'cancelled_orders',
        (v) => (v as num).toInt(),
      ),
      completedOrders: $checkedConvert(
        'completed_orders',
        (v) => (v as num).toInt(),
      ),
      ratingAverage: $checkedConvert(
        'rating_average',
        (v) => (v as num).toDouble(),
      ),
      ratingCount: $checkedConvert('rating_count', (v) => (v as num).toInt()),
      reviewRatingAverage: $checkedConvert(
        'review_rating_average',
        (v) => (v as num).toDouble(),
      ),
      reviewRatingCount: $checkedConvert(
        'review_rating_count',
        (v) => (v as num).toInt(),
      ),
      role: $checkedConvert(
        'role',
        (v) => $enumDecode(_$ReputationRoleEnumMap, v),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'accountId': 'account_id',
    'cancelledOrders': 'cancelled_orders',
    'completedOrders': 'completed_orders',
    'ratingAverage': 'rating_average',
    'ratingCount': 'rating_count',
    'reviewRatingAverage': 'review_rating_average',
    'reviewRatingCount': 'review_rating_count',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ReputationToJson(Reputation instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'cancelled_orders': instance.cancelledOrders,
      'completed_orders': instance.completedOrders,
      'rating_average': instance.ratingAverage,
      'rating_count': instance.ratingCount,
      'review_rating_average': instance.reviewRatingAverage,
      'review_rating_count': instance.reviewRatingCount,
      'role': _$ReputationRoleEnumMap[instance.role]!,
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ReputationRoleEnumMap = {
  ReputationRole.seller: 'seller',
  ReputationRole.buyer: 'buyer',
};
