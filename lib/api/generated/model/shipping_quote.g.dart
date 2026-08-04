// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingQuote _$ShippingQuoteFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShippingQuote', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['fee', 'name', 'option']);
      final val = ShippingQuote(
        fee: $checkedConvert('fee', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        option: $checkedConvert('option', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ShippingQuoteToJson(ShippingQuote instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'name': instance.name,
      'option': instance.option,
    };
