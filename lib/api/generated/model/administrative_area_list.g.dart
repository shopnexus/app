// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrative_area_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdministrativeAreaList _$AdministrativeAreaListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdministrativeAreaList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdministrativeAreaList(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => AdministrativeArea.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdministrativeAreaListToJson(
  AdministrativeAreaList instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
