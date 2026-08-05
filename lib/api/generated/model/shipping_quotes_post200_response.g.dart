// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_quotes_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingQuotesPost200Response _$ShippingQuotesPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShippingQuotesPost200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ShippingQuotesPost200Response(
    data: $checkedConvert(
      'data',
      (v) => ShippingQuotes.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ShippingQuotesPost200ResponseToJson(
  ShippingQuotesPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
