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

_RefundDisputeModel _$RefundDisputeModelFromJson(Map<String, dynamic> json) =>
    _RefundDisputeModel(
      id: json['id'] as String,
      refundId: json['refund_id'] as String?,
      status: json['status'] as String? ?? 'Pending',
      sellerReason: json['seller_reason'] as String?,
      sellerAttachments:
          (json['seller_attachments'] as List<dynamic>?)
              ?.map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      adminNote: json['admin_note'] as String?,
      resolvedAt: json['resolved_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$RefundDisputeModelToJson(_RefundDisputeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refund_id': instance.refundId,
      'status': instance.status,
      'seller_reason': instance.sellerReason,
      'seller_attachments': instance.sellerAttachments,
      'admin_note': instance.adminNote,
      'resolved_at': instance.resolvedAt,
      'created_at': instance.createdAt,
    };

_RefundModel _$RefundModelFromJson(Map<String, dynamic> json) => _RefundModel(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  buyerId: json['buyer_id'] as String?,
  sellerId: json['seller_id'] as String?,
  status: json['status'] as String? ?? 'AwaitingSellerReview',
  reason: json['reason'] as String,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => RefundAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  expiresAt: json['expires_at'] as String?,
  sellerResponse: json['seller_response'] as String?,
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
      'updated_at': instance.updatedAt,
      'expires_at': instance.expiresAt,
      'seller_response': instance.sellerResponse,
      'dispute': instance.dispute,
    };
