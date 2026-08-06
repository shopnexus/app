// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refund _$RefundFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Refund',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'attachments',
        'buyer_id',
        'created_at',
        'id',
        'order_id',
        'reason',
        'status',
      ],
    );
    final val = Refund(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      buyerId: $checkedConvert('buyer_id', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      deadlineAt: $checkedConvert(
        'deadline_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      orderId: $checkedConvert('order_id', (v) => v as String),
      reason: $checkedConvert('reason', (v) => v as String),
      returnedAt: $checkedConvert(
        'returned_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      sellerDecidedAt: $checkedConvert(
        'seller_decided_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$RefundStatusEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'buyerId': 'buyer_id',
    'createdAt': 'created_at',
    'deadlineAt': 'deadline_at',
    'orderId': 'order_id',
    'returnedAt': 'returned_at',
    'sellerDecidedAt': 'seller_decided_at',
  },
);

Map<String, dynamic> _$RefundToJson(Refund instance) => <String, dynamic>{
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'buyer_id': instance.buyerId,
  'created_at': instance.createdAt.toIso8601String(),
  'deadline_at': ?instance.deadlineAt?.toIso8601String(),
  'id': instance.id,
  'order_id': instance.orderId,
  'reason': instance.reason,
  'returned_at': ?instance.returnedAt?.toIso8601String(),
  'seller_decided_at': ?instance.sellerDecidedAt?.toIso8601String(),
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
