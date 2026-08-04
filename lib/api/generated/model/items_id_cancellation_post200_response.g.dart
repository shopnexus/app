// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_id_cancellation_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsIdCancellationPost200Response _$ItemsIdCancellationPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ItemsIdCancellationPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ItemsIdCancellationPost200Response(
    data: $checkedConvert(
      'data',
      (v) => OrderItem.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ItemsIdCancellationPost200ResponseToJson(
  ItemsIdCancellationPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
