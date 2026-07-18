// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExchangeRatesResponse _$ExchangeRatesResponseFromJson(
  Map<String, dynamic> json,
) => _ExchangeRatesResponse(
  base: json['base'] as String,
  rates: (json['rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  fetchedAt: json['fetched_at'] as String,
  supported: (json['supported'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ExchangeRatesResponseToJson(
  _ExchangeRatesResponse instance,
) => <String, dynamic>{
  'base': instance.base,
  'rates': instance.rates,
  'fetched_at': instance.fetchedAt,
  'supported': instance.supported,
};
