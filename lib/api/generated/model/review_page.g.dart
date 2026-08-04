// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPage _$ReviewPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReviewPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ReviewPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReviewPageToJson(ReviewPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
