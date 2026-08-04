// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Ticket',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['created_at', 'id', 'kind', 'status', 'subject'],
    );
    final val = Ticket(
      actionTaken: $checkedConvert(
        'action_taken',
        (v) => $enumDecodeNullable(_$TicketActionEnumMap, v),
      ),
      conversationId: $checkedConvert('conversation_id', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String),
      kind: $checkedConvert('kind', (v) => $enumDecode(_$TicketKindEnumMap, v)),
      reason: $checkedConvert(
        'reason',
        (v) => $enumDecodeNullable(_$TicketReasonEnumMap, v),
      ),
      refId: $checkedConvert('ref_id', (v) => v as String?),
      refType: $checkedConvert(
        'ref_type',
        (v) => $enumDecodeNullable(_$TicketRefTypeEnumMap, v),
      ),
      resolutionNote: $checkedConvert('resolution_note', (v) => v as String?),
      resolvedAt: $checkedConvert(
        'resolved_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$TicketStatusEnumMap, v),
      ),
      subject: $checkedConvert('subject', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'actionTaken': 'action_taken',
    'conversationId': 'conversation_id',
    'createdAt': 'created_at',
    'refId': 'ref_id',
    'refType': 'ref_type',
    'resolutionNote': 'resolution_note',
    'resolvedAt': 'resolved_at',
  },
);

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
  'action_taken': ?_$TicketActionEnumMap[instance.actionTaken],
  'conversation_id': ?instance.conversationId,
  'created_at': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'kind': _$TicketKindEnumMap[instance.kind]!,
  'reason': ?_$TicketReasonEnumMap[instance.reason],
  'ref_id': ?instance.refId,
  'ref_type': ?_$TicketRefTypeEnumMap[instance.refType],
  'resolution_note': ?instance.resolutionNote,
  'resolved_at': ?instance.resolvedAt?.toIso8601String(),
  'status': _$TicketStatusEnumMap[instance.status]!,
  'subject': instance.subject,
};

const _$TicketActionEnumMap = {
  TicketAction.none: 'none',
  TicketAction.listingRemoved: 'listing-removed',
  TicketAction.messageRemoved: 'message-removed',
  TicketAction.accountSuspended: 'account-suspended',
  TicketAction.warning: 'warning',
  TicketAction.refundGranted: 'refund-granted',
  TicketAction.refundRefused: 'refund-refused',
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

const _$TicketRefTypeEnumMap = {
  TicketRefType.listing: 'listing',
  TicketRefType.account: 'account',
  TicketRefType.message: 'message',
  TicketRefType.review: 'review',
  TicketRefType.reviewReply: 'review-reply',
  TicketRefType.order: 'order',
  TicketRefType.refund: 'refund',
};

const _$TicketStatusEnumMap = {
  TicketStatus.open: 'open',
  TicketStatus.reviewing: 'reviewing',
  TicketStatus.resolved: 'resolved',
};
