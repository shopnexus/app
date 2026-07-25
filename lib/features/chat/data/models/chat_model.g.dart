// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageMetadata _$ChatMessageMetadataFromJson(Map<String, dynamic> json) =>
    _ChatMessageMetadata(
      imageUrl: json['image_url'] as String?,
      productId: json['product_id'] as String?,
      productTitle: json['product_title'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: (json['product_price'] as num?)?.toDouble(),
      offerPrice: (json['offer_price'] as num?)?.toDouble(),
      offerOriginalPrice: (json['offer_original_price'] as num?)?.toDouble(),
      offerNote: json['offer_note'] as String?,
      offerStatus: $enumDecodeNullable(
        _$OfferStatusEnumMap,
        json['offer_status'],
      ),
      customData: json['custom_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ChatMessageMetadataToJson(
  _ChatMessageMetadata instance,
) => <String, dynamic>{
  'image_url': instance.imageUrl,
  'product_id': instance.productId,
  'product_title': instance.productTitle,
  'product_image': instance.productImage,
  'product_price': instance.productPrice,
  'offer_price': instance.offerPrice,
  'offer_original_price': instance.offerOriginalPrice,
  'offer_note': instance.offerNote,
  'offer_status': _$OfferStatusEnumMap[instance.offerStatus],
  'custom_data': instance.customData,
};

const _$OfferStatusEnumMap = {
  OfferStatus.pending: 'pending',
  OfferStatus.accepted: 'accepted',
  OfferStatus.countered: 'countered',
  OfferStatus.declined: 'declined',
};

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  conversationId: json['conversation_id'] as String,
  senderId: json['sender_id'] as String,
  senderName: json['sender_name'] as String?,
  senderAvatar: json['sender_avatar'] as String?,
  recipientId: json['recipient_id'] as String?,
  type:
      $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
      MessageType.text,
  content: json['content'] as String,
  metadata: json['metadata'] == null
      ? null
      : ChatMessageMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  isMe: json['is_me'] as bool? ?? false,
  status:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
      MessageStatus.sent,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'sender_name': instance.senderName,
      'sender_avatar': instance.senderAvatar,
      'recipient_id': instance.recipientId,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'content': instance.content,
      'metadata': instance.metadata,
      'is_me': instance.isMe,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'Text',
  MessageType.image: 'Image',
  MessageType.offer: 'Offer',
  MessageType.productLink: 'ProductLink',
  MessageType.system: 'System',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
};

_ChatConversation _$ChatConversationFromJson(Map<String, dynamic> json) =>
    _ChatConversation(
      id: json['id'] as String,
      participantId: json['participant_id'] as String,
      participantName: json['participant_name'] as String,
      participantAvatar: json['participant_avatar'] as String?,
      participantRole: json['participant_role'] as String?,
      isOnline: json['is_online'] as bool? ?? false,
      lastMessage: json['last_message'] as String?,
      lastMessageTime: json['last_message_time'] == null
          ? null
          : DateTime.parse(json['last_message_time'] as String),
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      productId: json['product_id'] as String?,
      productTitle: json['product_title'] as String?,
      productImage: json['product_image'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChatConversationToJson(_ChatConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participant_id': instance.participantId,
      'participant_name': instance.participantName,
      'participant_avatar': instance.participantAvatar,
      'participant_role': instance.participantRole,
      'is_online': instance.isOnline,
      'last_message': instance.lastMessage,
      'last_message_time': instance.lastMessageTime?.toIso8601String(),
      'unread_count': instance.unreadCount,
      'product_id': instance.productId,
      'product_title': instance.productTitle,
      'product_image': instance.productImage,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
