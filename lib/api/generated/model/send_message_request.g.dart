// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SendMessageRequest', json, ($checkedConvert) {
      final val = SendMessageRequest(
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        body: $checkedConvert('body', (v) => v as String?),
        refs: $checkedConvert(
          'refs',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ),
        ),
        replyTo: $checkedConvert(
          'reply_to',
          (v) => v == null
              ? null
              : MessageReplyRef.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'replyTo': 'reply_to'});

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'attachments': ?instance.attachments,
      'body': ?instance.body,
      'refs': ?instance.refs,
      'reply_to': ?instance.replyTo?.toJson(),
    };
