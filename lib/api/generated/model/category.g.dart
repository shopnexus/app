// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Category', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['description', 'id', 'name', 'parent_id', 'score'],
      );
      final val = Category(
        description: $checkedConvert('description', (v) => v as String),
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        parentId: $checkedConvert('parent_id', (v) => v as String?),
        score: $checkedConvert('score', (v) => (v as num?)?.toDouble()),
      );
      return val;
    }, fieldKeyMap: const {'parentId': 'parent_id'});

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'description': instance.description,
  'id': instance.id,
  'name': instance.name,
  'parent_id': instance.parentId,
  'score': instance.score,
};
