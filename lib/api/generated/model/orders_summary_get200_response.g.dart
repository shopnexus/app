// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_summary_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersSummaryGet200Response _$OrdersSummaryGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OrdersSummaryGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = OrdersSummaryGet200Response(
    data: $checkedConvert(
      'data',
      (v) => OrderSummary.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$OrdersSummaryGet200ResponseToJson(
  OrdersSummaryGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
