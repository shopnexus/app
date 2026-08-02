import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../account/data/models/account_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

enum MessageType {
  @JsonValue('user')
  user,
  @JsonValue('system')
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
  @JsonValue('withdrawn')
  withdrawn,
}

@freezed
abstract class Counterparty with _$Counterparty {
  const factory Counterparty({
    required String id,
    required String name,
    Resource? avatar,
  }) = _Counterparty;

  factory Counterparty.fromJson(Map<String, dynamic> json) =>
      _$CounterpartyFromJson(json);
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
    @Default(1) @JsonKey(name: 'quantity') int quantity,
    @JsonKey(name: 'offer_note') String? offerNote,
    @JsonKey(name: 'offer_status') OfferStatus? offerStatus,
    @JsonKey(name: 'custom_data') Map<String, dynamic>? customData,
  }) = _ChatMessageMetadata;

  factory ChatMessageMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageMetadataFromJson(json);
}

@freezed
abstract class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_id') dynamic senderId,
    @Default(MessageType.user) MessageType type,
    required String body,
    @Default([]) List<Resource> attachments,
    Map<String, dynamic>? card,
    Map<String, dynamic>? refs,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'edited_at') String? editedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    // Fields compatibility with UI
    @JsonKey(name: 'sender_name') String? senderName,
    @JsonKey(name: 'sender_avatar') String? senderAvatar,
    @JsonKey(name: 'recipient_id') String? recipientId,
    @Default(false) @JsonKey(name: 'is_me') bool isMe,
    @Default(MessageStatus.sent) MessageStatus status,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  String get content => body;

  String get senderIdString {
    if (senderId is String) return senderId as String;
    if (senderId is Map && (senderId as Map).containsKey('id')) {
      return (senderId as Map)['id'].toString();
    }
    return '';
  }

  /// Determines visual message sub-type (text, image, offer, productLink, system) for UI rendering
  String get visualType {
    if (type == MessageType.system) return 'System';
    if (card != null && (card!.containsKey('offer_price') || card!['type'] == 'offer')) {
      return 'Offer';
    }
    if (card != null && (card!.containsKey('product_id') || card!['type'] == 'product_link')) {
      return 'ProductLink';
    }
    if (attachments.isNotEmpty) return 'Image';
    return 'Text';
  }

  /// Returns metadata parsed from `card` payload or legacy metadata field
  ChatMessageMetadata? get metadata {
    if (card != null && card!.isNotEmpty) {
      return ChatMessageMetadata(
        productId: card!['product_id']?.toString(),
        productTitle: card!['product_title']?.toString(),
        productImage: card!['product_image']?.toString(),
        productPrice: card!['product_price'] != null ? (card!['product_price'] as num).toDouble() : null,
        offerPrice: card!['offer_price'] != null ? (card!['offer_price'] as num).toDouble() : null,
        offerOriginalPrice: card!['offer_original_price'] != null ? (card!['offer_original_price'] as num).toDouble() : null,
        quantity: card!['quantity'] != null ? (card!['quantity'] as num).toInt() : 1,
        offerNote: card!['offer_note']?.toString(),
        offerStatus: card!['offer_status'] != null
            ? OfferStatus.values.firstWhere(
                (e) => e.name == card!['offer_status'],
                orElse: () => OfferStatus.pending,
              )
            : null,
      );
    }
    return null;
  }

  DateTime get createdAtDateTime => DateTime.tryParse(createdAt) ?? DateTime.now();
}

@freezed
abstract class ChatConversation with _$ChatConversation {
  const ChatConversation._();

  const factory ChatConversation({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required Counterparty counterparty,
    @JsonKey(name: 'last_message') ChatMessage? lastMessage,
    @JsonKey(name: 'last_message_at') required String lastMessageAt,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'counterparty_read_at') String? counterpartyReadAt,
    @Default(0) int unread,
    // Fields compatibility with UI
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_title') String? productTitle,
    @JsonKey(name: 'product_image') String? productImage,
    @Default(false) bool isOnline,
  }) = _ChatConversation;

  factory ChatConversation.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationFromJson(json);

  String get participantId => counterparty.id;
  String get participantName => counterparty.name;
  String? get participantAvatar => counterparty.avatar?.url;
  String? get lastMessageText => lastMessage?.body;
  DateTime get lastMessageTime => DateTime.tryParse(lastMessageAt) ?? DateTime.now();
  int get unreadCount => unread;
}

typedef Conversation = ChatConversation;
typedef Message = ChatMessage;

@freezed
abstract class StartConversationRequest with _$StartConversationRequest {
  const factory StartConversationRequest({
    @JsonKey(name: 'account_id') required String accountId,
  }) = _StartConversationRequest;

  factory StartConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$StartConversationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    String? body,
    List<String>? attachments,
    Map<String, dynamic>? card,
    Map<String, dynamic>? refs,
  }) = _SendMessageRequest;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class MarkConversationReadRequest with _$MarkConversationReadRequest {
  const factory MarkConversationReadRequest({
    required String before,
  }) = _MarkConversationReadRequest;

  factory MarkConversationReadRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkConversationReadRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateMessageRequest with _$UpdateMessageRequest {
  const factory UpdateMessageRequest({
    required String body,
  }) = _UpdateMessageRequest;

  factory UpdateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class ChatUnreadCount with _$ChatUnreadCount {
  const factory ChatUnreadCount({
    required int conversations,
    required int unread,
  }) = _ChatUnreadCount;

  factory ChatUnreadCount.fromJson(Map<String, dynamic> json) =>
      _$ChatUnreadCountFromJson(json);
}
