// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsPost200Response _$ConversationsPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConversationsPost200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ConversationsPost200Response(
    data: $checkedConvert(
      'data',
      (v) => Conversation.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ConversationsPost200ResponseToJson(
  ConversationsPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
