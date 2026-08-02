import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/chat_api_service.dart';
import '../data_sources/chat_websocket_service.dart';
import '../models/chat_model.dart';

part 'chat_repository.g.dart';

abstract class IChatRepository {
  Future<List<ChatConversation>> getConversations({
    int page = 1,
    int limit = 20,
  });

  Future<List<ChatMessage>> getMessages(
    String conversationId, {
    int page = 1,
    int limit = 50,
  });

  Future<ChatMessage> sendMessage({
    required String conversationId,
    required String content,
    MessageType type = MessageType.user,
    ChatMessageMetadata? metadata,
  });

  Future<bool> markAsRead(String conversationId);

  void connectRealtime(String conversationId, {String? token});

  void disconnectRealtime();

  Stream<ChatMessage> getRealtimeStream();
}

class ChatRepository implements IChatRepository {
  final ChatApiService _apiService;
  final ChatWebSocketService _webSocketService;

  ChatRepository(this._apiService, this._webSocketService);

  @override
  Future<List<ChatConversation>> getConversations({
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _apiService.getConversations(page, limit);
    return response.data;
  }

  @override
  Future<List<ChatMessage>> getMessages(
    String conversationId, {
    int page = 1,
    int limit = 50,
  }) async {
    final response = await _apiService.getMessages(
      conversationId,
      page,
      limit,
    );
    return response.data;
  }

  @override
  Future<ChatMessage> sendMessage({
    required String conversationId,
    required String content,
    MessageType type = MessageType.user,
    ChatMessageMetadata? metadata,
  }) async {
    Map<String, dynamic>? cardPayload;
    if (metadata != null) {
      cardPayload = {
        if (metadata.productId != null) 'product_id': metadata.productId,
        if (metadata.productTitle != null) 'product_title': metadata.productTitle,
        if (metadata.productImage != null) 'product_image': metadata.productImage,
        if (metadata.productPrice != null) 'product_price': metadata.productPrice,
        if (metadata.offerPrice != null) 'offer_price': metadata.offerPrice,
        if (metadata.offerOriginalPrice != null) 'offer_original_price': metadata.offerOriginalPrice,
        'quantity': metadata.quantity,
        if (metadata.offerNote != null) 'offer_note': metadata.offerNote,
        if (metadata.offerStatus != null) 'offer_status': metadata.offerStatus?.name,
      };
    }

    final newMessage = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      conversationId: conversationId,
      senderId: 'current_user',
      senderName: 'Me',
      type: type,
      body: content,
      card: cardPayload,
      isMe: true,
      status: MessageStatus.sent,
      createdAt: DateTime.now().toIso8601String(),
    );

    // Try WebSocket send first if connected
    if (_webSocketService.isConnected) {
      final sent = _webSocketService.sendMessage(newMessage);
      if (sent) return newMessage;
    }

    // Call REST API directly
    final response = await _apiService.sendMessage(
      conversationId,
      SendMessageRequest(
        body: content,
        card: cardPayload,
      ),
    );
    return response.data;
  }

  @override
  Future<bool> markAsRead(String conversationId) async {
    await _apiService.markAsRead(
      conversationId,
      MarkConversationReadRequest(before: DateTime.now().toIso8601String()),
    );
    return true;
  }

  @override
  void connectRealtime(String conversationId, {String? token}) {
    _webSocketService.connect(conversationId: conversationId, token: token);
  }

  @override
  void disconnectRealtime() {
    _webSocketService.disconnect();
  }

  @override
  Stream<ChatMessage> getRealtimeStream() {
    return _webSocketService.messageStream;
  }
}

@riverpod
IChatRepository chatRepository(Ref ref) {
  final apiService = ref.watch(chatApiServiceProvider);
  final webSocketService = ref.watch(chatWebSocketServiceProvider);
  return ChatRepository(apiService, webSocketService);
}
