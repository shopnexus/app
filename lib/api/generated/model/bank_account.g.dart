// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => $checkedCreate(
  'BankAccount',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'account_holder',
        'account_number_masked',
        'bank_code',
        'created_at',
        'id',
        'is_default',
      ],
    );
    final val = BankAccount(
      accountHolder: $checkedConvert('account_holder', (v) => v as String),
      accountNumberMasked: $checkedConvert(
        'account_number_masked',
        (v) => v as String,
      ),
      bankCode: $checkedConvert('bank_code', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      isDefault: $checkedConvert('is_default', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'accountHolder': 'account_holder',
    'accountNumberMasked': 'account_number_masked',
    'bankCode': 'bank_code',
    'createdAt': 'created_at',
    'isDefault': 'is_default',
  },
);

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'account_holder': instance.accountHolder,
      'account_number_masked': instance.accountNumberMasked,
      'bank_code': instance.bankCode,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'is_default': instance.isDefault,
    };
