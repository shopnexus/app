// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reply_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageReplyRef _$MessageReplyRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MessageReplyRef', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['created_at', 'id']);
      final val = MessageReplyRef(
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        id: $checkedConvert('id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$MessageReplyRefToJson(MessageReplyRef instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
