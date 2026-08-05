// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_id_messages_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsIdMessagesPost201Response
_$ConversationsIdMessagesPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConversationsIdMessagesPost201Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = ConversationsIdMessagesPost201Response(
        data: $checkedConvert(
          'data',
          (v) => Message.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConversationsIdMessagesPost201ResponseToJson(
  ConversationsIdMessagesPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
