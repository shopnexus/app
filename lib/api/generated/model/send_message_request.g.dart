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
      );
      return val;
    });

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      if (instance.attachments case final value?) 'attachments': value,
      if (instance.body case final value?) 'body': value,
      if (instance.refs case final value?) 'refs': value,
    };
