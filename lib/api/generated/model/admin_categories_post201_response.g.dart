// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_categories_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCategoriesPost201Response _$AdminCategoriesPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminCategoriesPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminCategoriesPost201Response(
    data: $checkedConvert(
      'data',
      (v) => Category.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminCategoriesPost201ResponseToJson(
  AdminCategoriesPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
