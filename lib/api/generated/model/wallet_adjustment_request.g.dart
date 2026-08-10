// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_adjustment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletAdjustmentRequest _$WalletAdjustmentRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WalletAdjustmentRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['currency', 'idempotency_key', 'reason'],
    );
    final val = WalletAdjustmentRequest(
      availableDelta: $checkedConvert(
        'available_delta',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      heldDelta: $checkedConvert(
        'held_delta',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      idempotencyKey: $checkedConvert('idempotency_key', (v) => v as String),
      reason: $checkedConvert('reason', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'availableDelta': 'available_delta',
    'heldDelta': 'held_delta',
    'idempotencyKey': 'idempotency_key',
  },
);

Map<String, dynamic> _$WalletAdjustmentRequestToJson(
  WalletAdjustmentRequest instance,
) => <String, dynamic>{
  if (instance.availableDelta case final value?) 'available_delta': value,
  'currency': instance.currency,
  if (instance.heldDelta case final value?) 'held_delta': value,
  'idempotency_key': instance.idempotencyKey,
  'reason': instance.reason,
};
