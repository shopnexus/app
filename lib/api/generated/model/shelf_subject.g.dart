// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShelfSubject _$ShelfSubjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShelfSubject', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'kind', 'name']);
      final val = ShelfSubject(
        id: $checkedConvert('id', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$ShelfSubjectKindEnumEnumMap, v),
        ),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ShelfSubjectToJson(ShelfSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$ShelfSubjectKindEnumEnumMap[instance.kind]!,
      'name': instance.name,
    };

const _$ShelfSubjectKindEnumEnumMap = {
  ShelfSubjectKindEnum.listing: 'listing',
  ShelfSubjectKindEnum.category: 'category',
};
