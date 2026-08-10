// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReviewRequest _$UpdateReviewRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateReviewRequest', json, ($checkedConvert) {
      final val = UpdateReviewRequest(
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        body: $checkedConvert('body', (v) => v as String?),
        rating: $checkedConvert('rating', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$UpdateReviewRequestToJson(
  UpdateReviewRequest instance,
) => <String, dynamic>{
  if (instance.attachments case final value?) 'attachments': value,
  if (instance.body case final value?) 'body': value,
  if (instance.rating case final value?) 'rating': value,
};
