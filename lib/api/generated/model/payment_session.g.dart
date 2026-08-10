// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSession _$PaymentSessionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PaymentSession',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'checkout_url',
        'created_at',
        'currency',
        'expired_at',
        'id',
        'kind',
        'note',
        'outstanding',
        'paid_at',
        'status',
        'total_amount',
      ],
    );
    final val = PaymentSession(
      checkoutUrl: $checkedConvert('checkout_url', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      expiredAt: $checkedConvert(
        'expired_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$PaymentSessionKindEnumMap, v),
      ),
      note: $checkedConvert('note', (v) => v as String),
      outstanding: $checkedConvert('outstanding', (v) => (v as num).toInt()),
      paidAt: $checkedConvert(
        'paid_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$PaymentSessionStatusEnumMap, v),
      ),
      totalAmount: $checkedConvert('total_amount', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutUrl': 'checkout_url',
    'createdAt': 'created_at',
    'expiredAt': 'expired_at',
    'paidAt': 'paid_at',
    'totalAmount': 'total_amount',
  },
);

Map<String, dynamic> _$PaymentSessionToJson(PaymentSession instance) =>
    <String, dynamic>{
      'checkout_url': instance.checkoutUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'expired_at': instance.expiredAt.toIso8601String(),
      'id': instance.id,
      'kind': _$PaymentSessionKindEnumMap[instance.kind]!,
      'note': instance.note,
      'outstanding': instance.outstanding,
      'paid_at': instance.paidAt?.toIso8601String(),
      'status': _$PaymentSessionStatusEnumMap[instance.status]!,
      'total_amount': instance.totalAmount,
    };

const _$PaymentSessionKindEnumMap = {
  PaymentSessionKind.buyerCheckout: 'buyer-checkout',
  PaymentSessionKind.sellerPayout: 'seller-payout',
  PaymentSessionKind.withdrawal: 'withdrawal',
};

const _$PaymentSessionStatusEnumMap = {
  PaymentSessionStatus.pending: 'pending',
  PaymentSessionStatus.processing: 'processing',
  PaymentSessionStatus.success: 'success',
  PaymentSessionStatus.cancelled: 'cancelled',
  PaymentSessionStatus.failed: 'failed',
};
