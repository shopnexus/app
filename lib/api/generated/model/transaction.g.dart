// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Transaction',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'amount',
        'checkout_url',
        'created_at',
        'currency',
        'error',
        'expired_at',
        'id',
        'note',
        'payment_option',
        'reverses_id',
        'session_id',
        'settled_at',
        'status',
      ],
    );
    final val = Transaction(
      amount: $checkedConvert('amount', (v) => (v as num).toInt()),
      checkoutUrl: $checkedConvert('checkout_url', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      error: $checkedConvert('error', (v) => v as String),
      expiredAt: $checkedConvert(
        'expired_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      note: $checkedConvert('note', (v) => v as String),
      paymentOption: $checkedConvert('payment_option', (v) => v as String),
      reversesId: $checkedConvert('reverses_id', (v) => v as String?),
      sessionId: $checkedConvert('session_id', (v) => v as String),
      settledAt: $checkedConvert(
        'settled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$TransactionStatusEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'checkoutUrl': 'checkout_url',
    'createdAt': 'created_at',
    'expiredAt': 'expired_at',
    'paymentOption': 'payment_option',
    'reversesId': 'reverses_id',
    'sessionId': 'session_id',
    'settledAt': 'settled_at',
  },
);

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'checkout_url': instance.checkoutUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'error': instance.error,
      'expired_at': instance.expiredAt?.toIso8601String(),
      'id': instance.id,
      'note': instance.note,
      'payment_option': instance.paymentOption,
      'reverses_id': instance.reversesId,
      'session_id': instance.sessionId,
      'settled_at': instance.settledAt?.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status]!,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.success: 'success',
  TransactionStatus.failed: 'failed',
};
