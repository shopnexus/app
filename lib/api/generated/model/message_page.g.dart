// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePage _$MessagePageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MessagePage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = MessagePage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MessagePageToJson(MessagePage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
