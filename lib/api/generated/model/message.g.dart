// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Message',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'attachments',
        'body',
        'conversation_id',
        'created_at',
        'id',
        'refs',
        'type',
      ],
    );
    final val = Message(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      body: $checkedConvert('body', (v) => v as String),
      card: $checkedConvert(
        'card',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      conversationId: $checkedConvert('conversation_id', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      deletedAt: $checkedConvert(
        'deleted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      editedAt: $checkedConvert(
        'edited_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fromSupport: $checkedConvert('from_support', (v) => v as bool?),
      id: $checkedConvert('id', (v) => v as String),
      refs: $checkedConvert(
        'refs',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      senderId: $checkedConvert('sender_id', (v) => v as String?),
      type: $checkedConvert(
        'type',
        (v) => $enumDecode(_$MessageTypeEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'conversationId': 'conversation_id',
    'createdAt': 'created_at',
    'deletedAt': 'deleted_at',
    'editedAt': 'edited_at',
    'fromSupport': 'from_support',
    'senderId': 'sender_id',
  },
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'body': instance.body,
  'card': ?instance.card,
  'conversation_id': instance.conversationId,
  'created_at': instance.createdAt.toIso8601String(),
  'deleted_at': ?instance.deletedAt?.toIso8601String(),
  'edited_at': ?instance.editedAt?.toIso8601String(),
  'from_support': ?instance.fromSupport,
  'id': instance.id,
  'refs': instance.refs,
  'sender_id': ?instance.senderId,
  'type': _$MessageTypeEnumMap[instance.type]!,
};

const _$MessageTypeEnumMap = {
  MessageType.user: 'user',
  MessageType.system: 'system',
};
