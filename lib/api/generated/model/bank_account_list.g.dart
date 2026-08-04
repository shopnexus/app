// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountList _$BankAccountListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BankAccountList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = BankAccountList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BankAccountListToJson(BankAccountList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
