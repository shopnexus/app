// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WalletTransaction',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'available_after',
            'available_delta',
            'created_at',
            'currency',
            'held_after',
            'held_delta',
            'kind',
            'note',
            'ref_id',
            'ref_type',
            'seq',
          ],
        );
        final val = WalletTransaction(
          availableAfter: $checkedConvert(
            'available_after',
            (v) => (v as num).toInt(),
          ),
          availableDelta: $checkedConvert(
            'available_delta',
            (v) => (v as num).toInt(),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          currency: $checkedConvert('currency', (v) => v as String),
          heldAfter: $checkedConvert('held_after', (v) => (v as num).toInt()),
          heldDelta: $checkedConvert('held_delta', (v) => (v as num).toInt()),
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(_$WalletTransactionKindEnumMap, v),
          ),
          note: $checkedConvert('note', (v) => v as String),
          refId: $checkedConvert('ref_id', (v) => v as String),
          refType: $checkedConvert(
            'ref_type',
            (v) => $enumDecode(_$WalletTransactionRefTypeEnumEnumMap, v),
          ),
          seq: $checkedConvert('seq', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'availableAfter': 'available_after',
        'availableDelta': 'available_delta',
        'createdAt': 'created_at',
        'heldAfter': 'held_after',
        'heldDelta': 'held_delta',
        'refId': 'ref_id',
        'refType': 'ref_type',
      },
    );

Map<String, dynamic> _$WalletTransactionToJson(WalletTransaction instance) =>
    <String, dynamic>{
      'available_after': instance.availableAfter,
      'available_delta': instance.availableDelta,
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'held_after': instance.heldAfter,
      'held_delta': instance.heldDelta,
      'kind': _$WalletTransactionKindEnumMap[instance.kind]!,
      'note': instance.note,
      'ref_id': instance.refId,
      'ref_type': _$WalletTransactionRefTypeEnumEnumMap[instance.refType]!,
      'seq': instance.seq,
    };

const _$WalletTransactionKindEnumMap = {
  WalletTransactionKind.topup: 'topup',
  WalletTransactionKind.escrowHold: 'escrow-hold',
  WalletTransactionKind.escrowRelease: 'escrow-release',
  WalletTransactionKind.payout: 'payout',
  WalletTransactionKind.refund: 'refund',
  WalletTransactionKind.withdrawal: 'withdrawal',
  WalletTransactionKind.fee: 'fee',
  WalletTransactionKind.adjustment: 'adjustment',
};

const _$WalletTransactionRefTypeEnumEnumMap = {
  WalletTransactionRefTypeEnum.empty: '',
  WalletTransactionRefTypeEnum.order: 'order',
  WalletTransactionRefTypeEnum.paymentSession: 'payment-session',
};
