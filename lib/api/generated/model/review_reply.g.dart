// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewReply _$ReviewReplyFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ReviewReply',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['author', 'body', 'created_at', 'id', 'is_seller'],
    );
    final val = ReviewReply(
      author: $checkedConvert(
        'author',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      body: $checkedConvert('body', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      isSeller: $checkedConvert('is_seller', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {'createdAt': 'created_at', 'isSeller': 'is_seller'},
);

Map<String, dynamic> _$ReviewReplyToJson(ReviewReply instance) =>
    <String, dynamic>{
      'author': instance.author.toJson(),
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'is_seller': instance.isSeller,
    };
