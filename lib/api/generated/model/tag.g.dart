// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Tag', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['description', 'score', 'slug']);
      final val = Tag(
        description: $checkedConvert('description', (v) => v as String?),
        score: $checkedConvert('score', (v) => (v as num?)?.toDouble()),
        slug: $checkedConvert('slug', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'description': instance.description,
  'score': instance.score,
  'slug': instance.slug,
};
