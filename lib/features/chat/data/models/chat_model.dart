import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

enum MessageType {
  @JsonValue('Text')
  text,
  @JsonValue('Image')
  image,
  @JsonValue('Offer')
  offer,
  @JsonValue('ProductLink')
  productLink,
  @JsonValue('System')
  system,
}

enum MessageStatus {
  @JsonValue('sending')
  sending,
  @JsonValue('sent')
  sent,
  @JsonValue('delivered')
  delivered,
  @JsonValue('read')
  read,
}

enum OfferStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('countered')
  countered,
  @JsonValue('declined')
  declined,
}

@freezed
abstract class ChatMessageMetadata with _$ChatMessageMetadata {
  const factory ChatMessageMetadata({
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_title') String? productTitle,
    @JsonKey(name: 'product_image') String? productImage,
    @JsonKey(name: 'product_price') double? productPrice,
    @JsonKey(name: 'offer_price') double? offerPrice,
    @JsonKey(name: 'offer_original_price') double? offerOriginalPrice,
    @JsonKey(name: 'offer_note') String? offerNote,
    @JsonKey(name: 'offer_status') OfferStatus? offerStatus,
    @JsonKey(name: 'custom_data') Map<String, dynamic>? customData,
  }) = _ChatMessageMetadata;

  factory ChatMessageMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageMetadataFromJson(json);
}

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'sender_name') String? senderName,
    @JsonKey(name: 'sender_avatar') String? senderAvatar,
    @JsonKey(name: 'recipient_id') String? recipientId,
    @Default(MessageType.text) MessageType type,
    required String content,
    @JsonKey(name: 'metadata') ChatMessageMetadata? metadata,
    @Default(false) @JsonKey(name: 'is_me') bool isMe,
    @Default(MessageStatus.sent) MessageStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
abstract class ChatConversation with _$ChatConversation {
  const factory ChatConversation({
    required String id,
    @JsonKey(name: 'participant_id') required String participantId,
    @JsonKey(name: 'participant_name') required String participantName,
    @JsonKey(name: 'participant_avatar') String? participantAvatar,
    @JsonKey(name: 'participant_role') String? participantRole,
    @Default(false) @JsonKey(name: 'is_online') bool isOnline,
    @JsonKey(name: 'last_message') String? lastMessage,
    @JsonKey(name: 'last_message_time') DateTime? lastMessageTime,
    @Default(0) @JsonKey(name: 'unread_count') int unreadCount,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_title') String? productTitle,
    @JsonKey(name: 'product_image') String? productImage,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ChatConversation;

  factory ChatConversation.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationFromJson(json);
}
