// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_read_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationReadMark _$ConversationReadMarkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ConversationReadMark',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['conversation_id', 'read_at', 'reader_id'],
    );
    final val = ConversationReadMark(
      conversationId: $checkedConvert('conversation_id', (v) => v as String),
      readAt: $checkedConvert('read_at', (v) => DateTime.parse(v as String)),
      readerId: $checkedConvert('reader_id', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'conversationId': 'conversation_id',
    'readAt': 'read_at',
    'readerId': 'reader_id',
  },
);

Map<String, dynamic> _$ConversationReadMarkToJson(
  ConversationReadMark instance,
) => <String, dynamic>{
  'conversation_id': instance.conversationId,
  'read_at': instance.readAt.toIso8601String(),
  'reader_id': instance.readerId,
};
