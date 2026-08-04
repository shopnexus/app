// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CategoryList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = CategoryList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
