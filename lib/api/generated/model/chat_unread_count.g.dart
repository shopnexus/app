// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_unread_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUnreadCount _$ChatUnreadCountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatUnreadCount', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['conversations', 'unread']);
      final val = ChatUnreadCount(
        conversations: $checkedConvert(
          'conversations',
          (v) => (v as num).toInt(),
        ),
        unread: $checkedConvert('unread', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ChatUnreadCountToJson(ChatUnreadCount instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
      'unread': instance.unread,
    };
