// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_browse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShelfBrowse _$ShelfBrowseFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ShelfBrowse',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['category_id', 'similar_to', 'sort']);
    final val = ShelfBrowse(
      categoryId: $checkedConvert('category_id', (v) => v as String?),
      similarTo: $checkedConvert('similar_to', (v) => v as String?),
      sort: $checkedConvert('sort', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'categoryId': 'category_id', 'similarTo': 'similar_to'},
);

Map<String, dynamic> _$ShelfBrowseToJson(ShelfBrowse instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'similar_to': instance.similarTo,
      'sort': instance.sort,
    };
