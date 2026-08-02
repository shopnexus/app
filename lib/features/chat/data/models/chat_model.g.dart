// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Counterparty _$CounterpartyFromJson(Map<String, dynamic> json) =>
    _Counterparty(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] == null
          ? null
          : Resource.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CounterpartyToJson(_Counterparty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_ChatMessageMetadata _$ChatMessageMetadataFromJson(Map<String, dynamic> json) =>
    _ChatMessageMetadata(
      imageUrl: json['image_url'] as String?,
      productId: json['product_id'] as String?,
      productTitle: json['product_title'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: (json['product_price'] as num?)?.toDouble(),
      offerPrice: (json['offer_price'] as num?)?.toDouble(),
      offerOriginalPrice: (json['offer_original_price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
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
  'quantity': instance.quantity,
  'offer_note': instance.offerNote,
  'offer_status': _$OfferStatusEnumMap[instance.offerStatus],
  'custom_data': instance.customData,
};

const _$OfferStatusEnumMap = {
  OfferStatus.pending: 'pending',
  OfferStatus.accepted: 'accepted',
  OfferStatus.countered: 'countered',
  OfferStatus.declined: 'declined',
  OfferStatus.withdrawn: 'withdrawn',
};

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  conversationId: json['conversation_id'] as String,
  senderId: json['sender_id'],
  type:
      $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
      MessageType.user,
  body: json['body'] as String,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  card: json['card'] as Map<String, dynamic>?,
  refs: json['refs'] as Map<String, dynamic>?,
  createdAt: json['created_at'] as String,
  editedAt: json['edited_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
  senderName: json['sender_name'] as String?,
  senderAvatar: json['sender_avatar'] as String?,
  recipientId: json['recipient_id'] as String?,
  isMe: json['is_me'] as bool? ?? false,
  status:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
      MessageStatus.sent,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'body': instance.body,
      'attachments': instance.attachments,
      'card': instance.card,
      'refs': instance.refs,
      'created_at': instance.createdAt,
      'edited_at': instance.editedAt,
      'deleted_at': instance.deletedAt,
      'sender_name': instance.senderName,
      'sender_avatar': instance.senderAvatar,
      'recipient_id': instance.recipientId,
      'is_me': instance.isMe,
      'status': _$MessageStatusEnumMap[instance.status]!,
    };

const _$MessageTypeEnumMap = {
  MessageType.user: 'user',
  MessageType.system: 'system',
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
      createdAt: json['created_at'] as String,
      counterparty: Counterparty.fromJson(
        json['counterparty'] as Map<String, dynamic>,
      ),
      lastMessage: json['last_message'] == null
          ? null
          : ChatMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      lastMessageAt: json['last_message_at'] as String,
      readAt: json['read_at'] as String?,
      counterpartyReadAt: json['counterparty_read_at'] as String?,
      unread: (json['unread'] as num?)?.toInt() ?? 0,
      productId: json['product_id'] as String?,
      productTitle: json['product_title'] as String?,
      productImage: json['product_image'] as String?,
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatConversationToJson(_ChatConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'counterparty': instance.counterparty,
      'last_message': instance.lastMessage,
      'last_message_at': instance.lastMessageAt,
      'read_at': instance.readAt,
      'counterparty_read_at': instance.counterpartyReadAt,
      'unread': instance.unread,
      'product_id': instance.productId,
      'product_title': instance.productTitle,
      'product_image': instance.productImage,
      'isOnline': instance.isOnline,
    };

_StartConversationRequest _$StartConversationRequestFromJson(
  Map<String, dynamic> json,
) => _StartConversationRequest(accountId: json['account_id'] as String);

Map<String, dynamic> _$StartConversationRequestToJson(
  _StartConversationRequest instance,
) => <String, dynamic>{'account_id': instance.accountId};

_SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    _SendMessageRequest(
      body: json['body'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      card: json['card'] as Map<String, dynamic>?,
      refs: json['refs'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SendMessageRequestToJson(_SendMessageRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
      'attachments': instance.attachments,
      'card': instance.card,
      'refs': instance.refs,
    };

_MarkConversationReadRequest _$MarkConversationReadRequestFromJson(
  Map<String, dynamic> json,
) => _MarkConversationReadRequest(before: json['before'] as String);

Map<String, dynamic> _$MarkConversationReadRequestToJson(
  _MarkConversationReadRequest instance,
) => <String, dynamic>{'before': instance.before};

_UpdateMessageRequest _$UpdateMessageRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateMessageRequest(body: json['body'] as String);

Map<String, dynamic> _$UpdateMessageRequestToJson(
  _UpdateMessageRequest instance,
) => <String, dynamic>{'body': instance.body};

_ChatUnreadCount _$ChatUnreadCountFromJson(Map<String, dynamic> json) =>
    _ChatUnreadCount(
      conversations: (json['conversations'] as num).toInt(),
      unread: (json['unread'] as num).toInt(),
    );

Map<String, dynamic> _$ChatUnreadCountToJson(_ChatUnreadCount instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
      'unread': instance.unread,
    };
