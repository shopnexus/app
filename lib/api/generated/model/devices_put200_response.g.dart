// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_put200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicesPut200Response _$DevicesPut200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DevicesPut200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = DevicesPut200Response(
    data: $checkedConvert(
      'data',
      (v) => Device.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DevicesPut200ResponseToJson(
  DevicesPut200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
