// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryRequest _$UpdateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateCategoryRequest',
  json,
  ($checkedConvert) {
    final val = UpdateCategoryRequest(
      clearParentId: $checkedConvert('clear_parent_id', (v) => v as bool?),
      description: $checkedConvert('description', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      parentId: $checkedConvert('parent_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'clearParentId': 'clear_parent_id',
    'parentId': 'parent_id',
  },
);

Map<String, dynamic> _$UpdateCategoryRequestToJson(
  UpdateCategoryRequest instance,
) => <String, dynamic>{
  'clear_parent_id': ?instance.clearParentId,
  'description': ?instance.description,
  'name': ?instance.name,
  'parent_id': ?instance.parentId,
};
