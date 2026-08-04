// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Conversation',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'counterparty',
            'created_at',
            'id',
            'last_message_at',
            'unread',
          ],
        );
        final val = Conversation(
          counterparty: $checkedConvert(
            'counterparty',
            (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
          ),
          counterpartyReadAt: $checkedConvert(
            'counterparty_read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          id: $checkedConvert('id', (v) => v as String),
          lastMessage: $checkedConvert(
            'last_message',
            (v) =>
                v == null ? null : Message.fromJson(v as Map<String, dynamic>),
          ),
          lastMessageAt: $checkedConvert(
            'last_message_at',
            (v) => DateTime.parse(v as String),
          ),
          readAt: $checkedConvert(
            'read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          unread: $checkedConvert('unread', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'counterpartyReadAt': 'counterparty_read_at',
        'createdAt': 'created_at',
        'lastMessage': 'last_message',
        'lastMessageAt': 'last_message_at',
        'readAt': 'read_at',
      },
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'counterparty': instance.counterparty.toJson(),
      'counterparty_read_at': ?instance.counterpartyReadAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'last_message': ?instance.lastMessage?.toJson(),
      'last_message_at': instance.lastMessageAt.toIso8601String(),
      'read_at': ?instance.readAt?.toIso8601String(),
      'unread': instance.unread,
    };
