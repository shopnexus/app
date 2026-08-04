// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_id_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersIdGet200Response _$OrdersIdGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OrdersIdGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = OrdersIdGet200Response(
    data: $checkedConvert(
      'data',
      (v) => Order.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$OrdersIdGet200ResponseToJson(
  OrdersIdGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
