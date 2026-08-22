// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageQuote _$MessageQuoteFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MessageQuote',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'attachments',
            'created_at',
            'from_support',
            'id',
            'preview',
            'redacted',
            'sender_id',
          ],
        );
        final val = MessageQuote(
          attachments: $checkedConvert(
            'attachments',
            (v) => (v as num).toInt(),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          fromSupport: $checkedConvert('from_support', (v) => v as bool),
          id: $checkedConvert('id', (v) => v as String),
          preview: $checkedConvert('preview', (v) => v as String),
          redacted: $checkedConvert('redacted', (v) => v as bool),
          senderId: $checkedConvert('sender_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'fromSupport': 'from_support',
        'senderId': 'sender_id',
      },
    );

Map<String, dynamic> _$MessageQuoteToJson(MessageQuote instance) =>
    <String, dynamic>{
      'attachments': instance.attachments,
      'created_at': instance.createdAt.toIso8601String(),
      'from_support': instance.fromSupport,
      'id': instance.id,
      'preview': instance.preview,
      'redacted': instance.redacted,
      'sender_id': instance.senderId,
    };
