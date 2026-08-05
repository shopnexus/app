// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_accounts_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountsPost201Response _$BankAccountsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BankAccountsPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = BankAccountsPost201Response(
    data: $checkedConvert(
      'data',
      (v) => BankAccount.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$BankAccountsPost201ResponseToJson(
  BankAccountsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
