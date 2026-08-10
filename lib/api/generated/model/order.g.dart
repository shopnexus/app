// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Order',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'address',
        'buyer',
        'cancelled_at',
        'completed_at',
        'confirmation_deadline_at',
        'confirmed_at',
        'created_at',
        'currency',
        'decline_reason',
        'draft_id',
        'id',
        'items',
        'offer_id',
        'payout_deadline_at',
        'payout_released_at',
        'pickup_address',
        'receipt_attachments',
        'received_at',
        'refund',
        'seller',
        'state',
        'total',
        'transport',
      ],
    );
    final val = Order(
      address: $checkedConvert(
        'address',
        (v) => OrderAddressSnapshot.fromJson(v as Map<String, dynamic>),
      ),
      buyer: $checkedConvert(
        'buyer',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      cancelledAt: $checkedConvert(
        'cancelled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      completedAt: $checkedConvert(
        'completed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      confirmationDeadlineAt: $checkedConvert(
        'confirmation_deadline_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      confirmedAt: $checkedConvert(
        'confirmed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      declineReason: $checkedConvert('decline_reason', (v) => v as String?),
      draftId: $checkedConvert('draft_id', (v) => v as String?),
      id: $checkedConvert('id', (v) => v as String),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      offerId: $checkedConvert('offer_id', (v) => v as String?),
      payoutDeadlineAt: $checkedConvert(
        'payout_deadline_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      payoutReleasedAt: $checkedConvert(
        'payout_released_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      pickupAddress: $checkedConvert(
        'pickup_address',
        (v) => OrderAddressSnapshot.fromJson(v as Map<String, dynamic>),
      ),
      receiptAttachments: $checkedConvert(
        'receipt_attachments',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      receivedAt: $checkedConvert(
        'received_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      refund: $checkedConvert(
        'refund',
        (v) => v == null
            ? null
            : RefundSummary.fromJson(v as Map<String, dynamic>),
      ),
      seller: $checkedConvert(
        'seller',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      state: $checkedConvert(
        'state',
        (v) => $enumDecode(_$OrderStateEnumMap, v),
      ),
      total: $checkedConvert('total', (v) => (v as num).toInt()),
      transport: $checkedConvert(
        'transport',
        (v) => v == null ? null : Transport.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'cancelledAt': 'cancelled_at',
    'completedAt': 'completed_at',
    'confirmationDeadlineAt': 'confirmation_deadline_at',
    'confirmedAt': 'confirmed_at',
    'createdAt': 'created_at',
    'declineReason': 'decline_reason',
    'draftId': 'draft_id',
    'offerId': 'offer_id',
    'payoutDeadlineAt': 'payout_deadline_at',
    'payoutReleasedAt': 'payout_released_at',
    'pickupAddress': 'pickup_address',
    'receiptAttachments': 'receipt_attachments',
    'receivedAt': 'received_at',
  },
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'address': instance.address.toJson(),
  'buyer': instance.buyer.toJson(),
  'cancelled_at': instance.cancelledAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'confirmation_deadline_at': instance.confirmationDeadlineAt
      ?.toIso8601String(),
  'confirmed_at': instance.confirmedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'currency': instance.currency,
  'decline_reason': instance.declineReason,
  'draft_id': instance.draftId,
  'id': instance.id,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'offer_id': instance.offerId,
  'payout_deadline_at': instance.payoutDeadlineAt?.toIso8601String(),
  'payout_released_at': instance.payoutReleasedAt?.toIso8601String(),
  'pickup_address': instance.pickupAddress.toJson(),
  'receipt_attachments': instance.receiptAttachments
      .map((e) => e.toJson())
      .toList(),
  'received_at': instance.receivedAt?.toIso8601String(),
  'refund': instance.refund?.toJson(),
  'seller': instance.seller.toJson(),
  'state': _$OrderStateEnumMap[instance.state]!,
  'total': instance.total,
  'transport': instance.transport?.toJson(),
};

const _$OrderStateEnumMap = {
  OrderState.awaitingConfirmation: 'awaiting-confirmation',
  OrderState.open: 'open',
  OrderState.completed: 'completed',
  OrderState.cancelled: 'cancelled',
};
