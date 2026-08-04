// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackPage _$FeedbackPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FeedbackPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = FeedbackPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Feedback.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FeedbackPageToJson(FeedbackPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
