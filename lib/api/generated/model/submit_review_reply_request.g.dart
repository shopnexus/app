// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_review_reply_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitReviewReplyRequest _$SubmitReviewReplyRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SubmitReviewReplyRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['body']);
  final val = SubmitReviewReplyRequest(
    body: $checkedConvert('body', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$SubmitReviewReplyRequestToJson(
  SubmitReviewReplyRequest instance,
) => <String, dynamic>{'body': instance.body};
