// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryRequest _$CreateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateCategoryRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name']);
  final val = CreateCategoryRequest(
    description: $checkedConvert('description', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String),
    parentId: $checkedConvert('parent_id', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'parentId': 'parent_id'});

Map<String, dynamic> _$CreateCategoryRequestToJson(
  CreateCategoryRequest instance,
) => <String, dynamic>{
  'description': ?instance.description,
  'name': instance.name,
  'parent_id': ?instance.parentId,
};
