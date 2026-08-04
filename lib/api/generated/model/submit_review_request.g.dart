// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitReviewRequest _$SubmitReviewRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SubmitReviewRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['order_id', 'rating']);
      final val = SubmitReviewRequest(
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        body: $checkedConvert('body', (v) => v as String?),
        orderId: $checkedConvert('order_id', (v) => v as String),
        rating: $checkedConvert('rating', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'orderId': 'order_id'});

Map<String, dynamic> _$SubmitReviewRequestToJson(
  SubmitReviewRequest instance,
) => <String, dynamic>{
  'attachments': ?instance.attachments,
  'body': ?instance.body,
  'order_id': instance.orderId,
  'rating': instance.rating,
};
