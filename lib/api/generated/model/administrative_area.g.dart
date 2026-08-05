// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrative_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdministrativeArea _$AdministrativeAreaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdministrativeArea', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'kind', 'name']);
      final val = AdministrativeArea(
        code: $checkedConvert('code', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$AdministrativeAreaKindEnumEnumMap, v),
        ),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AdministrativeAreaToJson(AdministrativeArea instance) =>
    <String, dynamic>{
      'code': instance.code,
      'kind': _$AdministrativeAreaKindEnumEnumMap[instance.kind]!,
      'name': instance.name,
    };

const _$AdministrativeAreaKindEnumEnumMap = {
  AdministrativeAreaKindEnum.province: 'province',
  AdministrativeAreaKindEnum.ward: 'ward',
};
