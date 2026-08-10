// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_feedback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitFeedbackRequest _$SubmitFeedbackRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SubmitFeedbackRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['rating']);
  final val = SubmitFeedbackRequest(
    comment: $checkedConvert('comment', (v) => v as String?),
    rating: $checkedConvert('rating', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$SubmitFeedbackRequestToJson(
  SubmitFeedbackRequest instance,
) => <String, dynamic>{
  if (instance.comment case final value?) 'comment': value,
  'rating': instance.rating,
};
