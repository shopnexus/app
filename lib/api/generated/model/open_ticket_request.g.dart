// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenTicketRequest _$OpenTicketRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OpenTicketRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['kind', 'subject']);
      final val = OpenTicketRequest(
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        body: $checkedConvert('body', (v) => v as String?),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$TicketKindEnumMap, v),
        ),
        reason: $checkedConvert(
          'reason',
          (v) => $enumDecodeNullable(_$TicketReasonEnumMap, v),
        ),
        refId: $checkedConvert('ref_id', (v) => v as String?),
        subject: $checkedConvert('subject', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'refId': 'ref_id'});

Map<String, dynamic> _$OpenTicketRequestToJson(OpenTicketRequest instance) =>
    <String, dynamic>{
      'attachments': ?instance.attachments,
      'body': ?instance.body,
      'kind': _$TicketKindEnumMap[instance.kind]!,
      'reason': ?_$TicketReasonEnumMap[instance.reason],
      'ref_id': ?instance.refId,
      'subject': instance.subject,
    };

const _$TicketKindEnumMap = {
  TicketKind.reportListing: 'report-listing',
  TicketKind.reportAccount: 'report-account',
  TicketKind.reportMessage: 'report-message',
  TicketKind.reportReview: 'report-review',
  TicketKind.reportReviewReply: 'report-review-reply',
  TicketKind.refundDispute: 'refund-dispute',
  TicketKind.orderIssue: 'order-issue',
  TicketKind.payment: 'payment',
  TicketKind.account: 'account',
  TicketKind.featureRequest: 'feature-request',
  TicketKind.other: 'other',
};

const _$TicketReasonEnumMap = {
  TicketReason.scam: 'scam',
  TicketReason.counterfeit: 'counterfeit',
  TicketReason.prohibited: 'prohibited',
  TicketReason.harassment: 'harassment',
  TicketReason.spam: 'spam',
  TicketReason.inappropriate: 'inappropriate',
  TicketReason.other: 'other',
};
