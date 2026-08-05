// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationPage _$ConversationPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConversationPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ConversationPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConversationPageToJson(ConversationPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
