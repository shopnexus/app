// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_id_history_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersIdHistoryGet200Response _$OrdersIdHistoryGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OrdersIdHistoryGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = OrdersIdHistoryGet200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => OrderHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$OrdersIdHistoryGet200ResponseToJson(
  OrdersIdHistoryGet200Response instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
