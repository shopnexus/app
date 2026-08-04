// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_unread_count_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsUnreadCountGet200Response
_$ConversationsUnreadCountGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConversationsUnreadCountGet200Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = ConversationsUnreadCountGet200Response(
        data: $checkedConvert(
          'data',
          (v) => ChatUnreadCount.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConversationsUnreadCountGet200ResponseToJson(
  ConversationsUnreadCountGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
