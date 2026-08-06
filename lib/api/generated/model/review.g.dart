// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Review',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'attachments',
        'author',
        'body',
        'created_at',
        'id',
        'listing_id',
        'rating',
        'replies',
        'reply_count',
        'updated_at',
        'votes',
      ],
    );
    final val = Review(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map((e) => Resource.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
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
      listingId: $checkedConvert('listing_id', (v) => v as String),
      rating: $checkedConvert('rating', (v) => (v as num).toInt()),
      replies: $checkedConvert(
        'replies',
        (v) => (v as List<dynamic>)
            .map((e) => ReviewReply.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      replyCount: $checkedConvert('reply_count', (v) => (v as num).toInt()),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      votes: $checkedConvert(
        'votes',
        (v) => ReviewVoteTally.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'listingId': 'listing_id',
    'replyCount': 'reply_count',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'author': instance.author.toJson(),
  'body': instance.body,
  'created_at': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'listing_id': instance.listingId,
  'rating': instance.rating,
  'replies': instance.replies.map((e) => e.toJson()).toList(),
  'reply_count': instance.replyCount,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'votes': instance.votes.toJson(),
};
