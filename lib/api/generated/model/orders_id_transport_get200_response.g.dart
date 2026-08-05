// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_id_transport_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersIdTransportGet200Response _$OrdersIdTransportGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OrdersIdTransportGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = OrdersIdTransportGet200Response(
    data: $checkedConvert(
      'data',
      (v) => Transport.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$OrdersIdTransportGet200ResponseToJson(
  OrdersIdTransportGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
