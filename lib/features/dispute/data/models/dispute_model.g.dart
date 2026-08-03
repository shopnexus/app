// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundAttachment _$RefundAttachmentFromJson(Map<String, dynamic> json) =>
    _RefundAttachment(
      resourceId: json['resource_id'] as String?,
      description: json['description'] as String?,
      resource: json['resource'] == null
          ? null
          : ResourceModel.fromJson(json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefundAttachmentToJson(_RefundAttachment instance) =>
    <String, dynamic>{
      'resource_id': instance.resourceId,
      'description': instance.description,
      'resource': instance.resource,
    };

_CreateRefundRequest _$CreateRefundRequestFromJson(Map<String, dynamic> json) =>
    _CreateRefundRequest(
      reason: json['reason'] as String,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CreateRefundRequestToJson(
  _CreateRefundRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'attachments': instance.attachments,
};

_BuyerRefundRequest _$BuyerRefundRequestFromJson(Map<String, dynamic> json) =>
    _BuyerRefundRequest(
      orderId: json['order_id'] as String,
      reason: json['reason'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuyerRefundRequestToJson(_BuyerRefundRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'reason': instance.reason,
      'attachments': instance.attachments,
    };

_RejectRefundRequest _$RejectRefundRequestFromJson(Map<String, dynamic> json) =>
    _RejectRefundRequest(reason: json['reason'] as String);

Map<String, dynamic> _$RejectRefundRequestToJson(
  _RejectRefundRequest instance,
) => <String, dynamic>{'reason': instance.reason};

_OpenDisputeRequest _$OpenDisputeRequestFromJson(Map<String, dynamic> json) =>
    _OpenDisputeRequest(reason: json['reason'] as String);

Map<String, dynamic> _$OpenDisputeRequestToJson(_OpenDisputeRequest instance) =>
    <String, dynamic>{'reason': instance.reason};

_SellerDisputeRequest _$SellerDisputeRequestFromJson(
  Map<String, dynamic> json,
) => _SellerDisputeRequest(
  reason: json['reason'] as String,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SellerDisputeRequestToJson(
  _SellerDisputeRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'attachments': instance.attachments,
};

_AddAttachmentsRequest _$AddAttachmentsRequestFromJson(
  Map<String, dynamic> json,
) => _AddAttachmentsRequest(
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AddAttachmentsRequestToJson(
  _AddAttachmentsRequest instance,
) => <String, dynamic>{'attachments': instance.attachments};

_DisputeRulingRequest _$DisputeRulingRequestFromJson(
  Map<String, dynamic> json,
) => _DisputeRulingRequest(
  buyerWins: json['buyer_wins'] as bool,
  note: json['note'] as String?,
);

Map<String, dynamic> _$DisputeRulingRequestToJson(
  _DisputeRulingRequest instance,
) => <String, dynamic>{'buyer_wins': instance.buyerWins, 'note': instance.note};

_RefundDisputeModel _$RefundDisputeModelFromJson(Map<String, dynamic> json) =>
    _RefundDisputeModel(
      id: json['id'] as String,
      refundId: json['refund_id'] as String?,
      openedBy: json['opened_by'] as String?,
      reason: json['reason'] as String?,
      round: json['round'],
      status: json['status'] as String? ?? 'open',
      note: json['note'] as String?,
      ruledAt: json['ruled_at'] as String?,
      createdAt: json['created_at'] as String?,
      legacySellerReason: json['seller_reason'] as String?,
      sellerAttachments:
          (json['seller_attachments'] as List<dynamic>?)
              ?.map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      legacyAdminNote: json['admin_note'] as String?,
      legacyResolvedAt: json['resolved_at'] as String?,
    );

Map<String, dynamic> _$RefundDisputeModelToJson(_RefundDisputeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refund_id': instance.refundId,
      'opened_by': instance.openedBy,
      'reason': instance.reason,
      'round': instance.round,
      'status': instance.status,
      'note': instance.note,
      'ruled_at': instance.ruledAt,
      'created_at': instance.createdAt,
      'seller_reason': instance.legacySellerReason,
      'seller_attachments': instance.sellerAttachments,
      'admin_note': instance.legacyAdminNote,
      'resolved_at': instance.legacyResolvedAt,
    };

_RefundModel _$RefundModelFromJson(Map<String, dynamic> json) => _RefundModel(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  buyerId: json['buyer_id'] as String?,
  sellerId: json['seller_id'] as String?,
  status: json['status'] as String? ?? 'awaiting-seller-review',
  reason: json['reason'] as String,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  deadlineAt: json['deadline_at'] as String?,
  rejectionReason: json['rejection_reason'] as String?,
  returnedAt: json['returned_at'] as String?,
  sellerDecidedAt: json['seller_decided_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  legacyExpiresAt: json['expires_at'] as String?,
  legacySellerResponse: json['seller_response'] as String?,
  dispute: json['dispute'] == null
      ? null
      : RefundDisputeModel.fromJson(json['dispute'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefundModelToJson(_RefundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'buyer_id': instance.buyerId,
      'seller_id': instance.sellerId,
      'status': instance.status,
      'reason': instance.reason,
      'attachments': instance.attachments,
      'created_at': instance.createdAt,
      'deadline_at': instance.deadlineAt,
      'rejection_reason': instance.rejectionReason,
      'returned_at': instance.returnedAt,
      'seller_decided_at': instance.sellerDecidedAt,
      'updated_at': instance.updatedAt,
      'expires_at': instance.legacyExpiresAt,
      'seller_response': instance.legacySellerResponse,
      'dispute': instance.dispute,
    };
