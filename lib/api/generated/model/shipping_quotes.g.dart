// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_quotes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingQuotes _$ShippingQuotesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShippingQuotes', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['contact_id', 'currency', 'options'],
      );
      final val = ShippingQuotes(
        contactId: $checkedConvert('contact_id', (v) => v as String),
        currency: $checkedConvert('currency', (v) => v as String),
        options: $checkedConvert(
          'options',
          (v) => (v as List<dynamic>)
              .map((e) => ShippingQuote.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'contactId': 'contact_id'});

Map<String, dynamic> _$ShippingQuotesToJson(ShippingQuotes instance) =>
    <String, dynamic>{
      'contact_id': instance.contactId,
      'currency': instance.currency,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };
