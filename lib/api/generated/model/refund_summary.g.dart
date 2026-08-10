// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundSummary _$RefundSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RefundSummary', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['created_at', 'id', 'settled', 'status'],
      );
      final val = RefundSummary(
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        id: $checkedConvert('id', (v) => v as String),
        settled: $checkedConvert('settled', (v) => v as bool),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$RefundStatusEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$RefundSummaryToJson(RefundSummary instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'settled': instance.settled,
      'status': _$RefundStatusEnumMap[instance.status]!,
    };

const _$RefundStatusEnumMap = {
  RefundStatus.awaitingSellerReview: 'awaiting-seller-review',
  RefundStatus.disputed: 'disputed',
  RefundStatus.returning: 'returning',
  RefundStatus.returned: 'returned',
  RefundStatus.accepted: 'accepted',
  RefundStatus.rejected: 'rejected',
  RefundStatus.cancelled: 'cancelled',
};
