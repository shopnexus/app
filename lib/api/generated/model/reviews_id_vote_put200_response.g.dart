// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_id_vote_put200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsIdVotePut200Response _$ReviewsIdVotePut200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReviewsIdVotePut200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ReviewsIdVotePut200Response(
    data: $checkedConvert(
      'data',
      (v) => ReviewVoteTally.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ReviewsIdVotePut200ResponseToJson(
  ReviewsIdVotePut200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
