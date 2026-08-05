// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceList _$DeviceListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeviceList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = DeviceList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Device.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeviceListToJson(DeviceList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
