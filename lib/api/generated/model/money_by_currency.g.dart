// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_by_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyByCurrency _$MoneyByCurrencyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoneyByCurrency', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['amount', 'currency']);
      final val = MoneyByCurrency(
        amount: $checkedConvert('amount', (v) => (v as num).toInt()),
        currency: $checkedConvert('currency', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MoneyByCurrencyToJson(MoneyByCurrency instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};
