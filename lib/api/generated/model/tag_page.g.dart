// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagPage _$TagPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TagPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = TagPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TagPageToJson(TagPage instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
