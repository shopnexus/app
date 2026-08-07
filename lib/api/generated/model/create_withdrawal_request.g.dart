// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_withdrawal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWithdrawalRequest _$CreateWithdrawalRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateWithdrawalRequest', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['amount', 'bank_account_id', 'currency'],
  );
  final val = CreateWithdrawalRequest(
    amount: $checkedConvert('amount', (v) => (v as num).toInt()),
    bankAccountId: $checkedConvert('bank_account_id', (v) => v as String),
    currency: $checkedConvert('currency', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'bankAccountId': 'bank_account_id'});

Map<String, dynamic> _$CreateWithdrawalRequestToJson(
  CreateWithdrawalRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'bank_account_id': instance.bankAccountId,
  'currency': instance.currency,
};
