// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Wallet',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'account_id',
        'available_balance',
        'created_at',
        'currency',
        'held_balance',
      ],
    );
    final val = Wallet(
      accountId: $checkedConvert('account_id', (v) => v as String),
      availableBalance: $checkedConvert(
        'available_balance',
        (v) => (v as num).toInt(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      heldBalance: $checkedConvert('held_balance', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'accountId': 'account_id',
    'availableBalance': 'available_balance',
    'createdAt': 'created_at',
    'heldBalance': 'held_balance',
  },
);

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
  'account_id': instance.accountId,
  'available_balance': instance.availableBalance,
  'created_at': instance.createdAt.toIso8601String(),
  'currency': instance.currency,
  'held_balance': instance.heldBalance,
};
