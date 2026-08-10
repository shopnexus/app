// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBankAccountRequest _$CreateBankAccountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateBankAccountRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['account_holder', 'account_number', 'bank_code'],
    );
    final val = CreateBankAccountRequest(
      accountHolder: $checkedConvert('account_holder', (v) => v as String),
      accountNumber: $checkedConvert('account_number', (v) => v as String),
      bankCode: $checkedConvert('bank_code', (v) => v as String),
      isDefault: $checkedConvert('is_default', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {
    'accountHolder': 'account_holder',
    'accountNumber': 'account_number',
    'bankCode': 'bank_code',
    'isDefault': 'is_default',
  },
);

Map<String, dynamic> _$CreateBankAccountRequestToJson(
  CreateBankAccountRequest instance,
) => <String, dynamic>{
  'account_holder': instance.accountHolder,
  'account_number': instance.accountNumber,
  'bank_code': instance.bankCode,
  if (instance.isDefault case final value?) 'is_default': value,
};
