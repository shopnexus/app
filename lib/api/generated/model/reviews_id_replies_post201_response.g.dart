// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_id_replies_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsIdRepliesPost201Response _$ReviewsIdRepliesPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReviewsIdRepliesPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ReviewsIdRepliesPost201Response(
    data: $checkedConvert(
      'data',
      (v) => ReviewReply.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ReviewsIdRepliesPost201ResponseToJson(
  ReviewsIdRepliesPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
