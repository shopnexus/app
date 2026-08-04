// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tags_slug_put200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTagsSlugPut200Response _$AdminTagsSlugPut200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminTagsSlugPut200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminTagsSlugPut200Response(
    data: $checkedConvert(
      'data',
      (v) => Tag.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminTagsSlugPut200ResponseToJson(
  AdminTagsSlugPut200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
