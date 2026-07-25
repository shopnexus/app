import 'package:flutter/foundation.dart';
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
    MessageType type = MessageType.text,
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
    try {
      final response = await _apiService.getConversations(page, limit);
      if (response.data.isNotEmpty) {
        return response.data;
      }
    } catch (e) {
      debugPrint('ChatApiService getConversations error (using mock data): $e');
    }
    return _getMockConversations();
  }

  @override
  Future<List<ChatMessage>> getMessages(
    String conversationId, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      final response = await _apiService.getMessages(
        conversationId,
        page,
        limit,
      );
      if (response.data.isNotEmpty) {
        return response.data;
      }
    } catch (e) {
      debugPrint('ChatApiService getMessages error (using mock data): $e');
    }
    return _getMockMessages(conversationId);
  }

  @override
  Future<ChatMessage> sendMessage({
    required String conversationId,
    required String content,
    MessageType type = MessageType.text,
    ChatMessageMetadata? metadata,
  }) async {
    final newMessage = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      conversationId: conversationId,
      senderId: 'current_user',
      senderName: 'Me',
      type: type,
      content: content,
      metadata: metadata,
      isMe: true,
      status: MessageStatus.sent,
      createdAt: DateTime.now(),
    );

    // Try WebSocket send first if connected
    if (_webSocketService.isConnected) {
      final sent = _webSocketService.sendMessage(newMessage);
      if (sent) return newMessage;
    }

    // Try REST API send
    try {
      final response = await _apiService.sendMessage({
        'conversation_id': conversationId,
        'type': type.name,
        'content': content,
        'metadata': metadata?.toJson(),
      });
      return response.data;
    } catch (e) {
      debugPrint(
        'ChatApiService sendMessage error (returning optimistic message): $e',
      );
      return newMessage;
    }
  }

  @override
  Future<bool> markAsRead(String conversationId) async {
    try {
      final response = await _apiService.markAsRead({
        'conversation_id': conversationId,
      });
      return response.data;
    } catch (e) {
      debugPrint('ChatApiService markAsRead error: $e');
      return true;
    }
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

  // --- Mock Data Fallbacks matching Stitch Designs ---

  List<ChatConversation> _getMockConversations() {
    final now = DateTime.now();
    return [
      ChatConversation(
        id: 'conv_001',
        participantId: 'user_alex',
        participantName: 'Alex Rivers',
        participantAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBBnIDXEmRc25CZ6c4iqUxGI15NGiC8_Y9AcDLc67lHezj0_nEOrlJ_7spQVz_sz5NdZyCRMZws3NX_WirY9aNNgWYFNUaVhK0_7qBYP2ZfBIOpy6S4rIgrml2zyBeS6w6oJvAZf3qjqZNnwCzlOOEc_87nxp-JKwJbPOy7jYsK_FH8m39SeXRvsS4XTTcdAw6Ose-xVyp8tdVNSY8wnFZ-1muyjBdZl-kFtpViyq4obL1d_E3FhL6Gug',
        participantRole: 'Verified Seller • 4.9 Stars',
        isOnline: true,
        lastMessage:
            'I\'d like to offer \$380 for the bag. I can pay immediately.',
        lastMessageTime: now.subtract(const Duration(minutes: 5)),
        unreadCount: 1,
        productId: 'prod_leather_bag',
        productTitle: 'Vintage Leather Messenger Bag',
        productImage:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA79RdwijKBvGEHRxJYD_v0V9vughKGtFmqG2rooyupMMWVboduiLjPcXLASCqAwDjS7FlqfZBqh2USpPc0KhjV59VsL5KQzky1L1cocYSmfSgep1aLtOBut71rNNV-UjRsqJfCNJPvk-rC7qOmqCpxGBhi_556Erbq9meDm2VNpSOcwhXLJgIrRuGmLvZ9MKVW6K-S3wtxo0N4WTsnHO7HiDQSzIcAGwzzN6sFjIZjtCU-YuCBM3bfIraDRBvQu0uVN1o',
        updatedAt: now.subtract(const Duration(minutes: 5)),
      ),
      ChatConversation(
        id: 'conv_002',
        participantId: 'user_eleanor',
        participantName: 'Eleanor Vance',
        participantAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAlzJwIkTsDAFXNeSgAuaDIIFSYRRcXJNmgaLcq7x5fL2U08yNSo_Tc5svBtca0KR9mydqyszAaPJPBRy8_Owku5VtCbNhCXGuyY6TVEUTn3xsumrJyF4kyOHSqp4dHPS0c5lnd53Xyft1IFIfnMybusIjc8Pyle0I9r0kafsHBS-_EGcsccYZb9zxCUzR-f_4PXlsaLfPbvTNUqnzMvP5DtkwYNd3EcYsf6sg3tQEOptj1Z4drnHdpAQ',
        participantRole: 'Buyer',
        isOnline: true,
        lastMessage: 'Is the vintage leather armchair still available?',
        lastMessageTime: now.subtract(const Duration(minutes: 20)),
        unreadCount: 1,
        updatedAt: now.subtract(const Duration(minutes: 20)),
      ),
      ChatConversation(
        id: 'conv_003',
        participantId: 'user_marcus',
        participantName: 'Marcus Chen',
        participantAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDoKbjAYSFIsulgFI0Yr2iOTtn8yh0Er32iy8ha_QS6QJ9nd0OBQIkBF-jibsot76QCsJ8NKD_jwGG-3E12lCEgbKDXRgaevkc8x0bE965ARXfSF4I5kUtyEmBiYNEFEtKpVbq7-NG3F71suqI6CeGxpQybH1vcOd1RvSg69vbXiEBNerUcCA1x9LiwKXAnnDxssHyUy8UwEa_XPGh4sJy7lwF-DJSGKOHHhCI7CoYllXYZyCpvTt0fVg',
        participantRole: 'Verified Seller',
        isOnline: false,
        lastMessage: 'Thanks! I\'ll ship the ceramic vase tomorrow morning.',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 0,
        updatedAt: now.subtract(const Duration(days: 1)),
      ),
      ChatConversation(
        id: 'conv_004',
        participantId: 'user_sarah',
        participantName: 'Sarah Jenkins',
        participantAvatar: null,
        participantRole: 'Buyer',
        isOnline: false,
        lastMessage: 'Could you do \$45 for the set of plates?',
        lastMessageTime: now.subtract(const Duration(days: 3)),
        unreadCount: 0,
        updatedAt: now.subtract(const Duration(days: 3)),
      ),
      ChatConversation(
        id: 'conv_005',
        participantId: 'user_coffeemug',
        participantName: 'CoffeeMug Co. (Automated)',
        participantAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCHaoLizXNur5_zZkemA_-2eSftqt-TIXARCPBt9cIzwLv95A5ZpyVVVk8EZVhRCnWebRqR0oJ7qt2L6JIrOULI8d2_kin4txIN3bq10Wj_KlU-7O603yY7YKbvm1Rjd8A8o2Azv0iVnPrExa6JAqP-6NHElULa33MyELHFj4E02XZNDmd5ipUhdBT9B3zSs1rag0TeLeCngJQMsW0ZauG0YDlSsCqtAiKrBasHg879wle6B_KxJWayow',
        participantRole: 'Official Store',
        isOnline: true,
        lastMessage: 'Your order #8923 has been delivered. Enjoy!',
        lastMessageTime: now.subtract(const Duration(days: 4)),
        unreadCount: 0,
        updatedAt: now.subtract(const Duration(days: 4)),
      ),
    ];
  }

  List<ChatMessage> _getMockMessages(String conversationId) {
    final now = DateTime.now();
    return [
      ChatMessage(
        id: 'msg_001',
        conversationId: conversationId,
        senderId: 'user_alex',
        senderName: 'Alex Rivers',
        senderAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBBnIDXEmRc25CZ6c4iqUxGI15NGiC8_Y9AcDLc67lHezj0_nEOrlJ_7spQVz_sz5NdZyCRMZws3NX_WirY9aNNgWYFNUaVhK0_7qBYP2ZfBIOpy6S4rIgrml2zyBeS6w6oJvAZf3qjqZNnwCzlOOEc_87nxp-JKwJbPOy7jYsK_FH8m39SeXRvsS4XTTcdAw6Ose-xVyp8tdVNSY8wnFZ-1muyjBdZl-kFtpViyq4obL1d_E3FhL6Gug',
        type: MessageType.text,
        content:
            'Hi there! I saw you were interested in the vintage leather satchel. It\'s still available if you\'re looking to purchase.',
        isMe: false,
        status: MessageStatus.read,
        createdAt: now.subtract(const Duration(minutes: 15)),
      ),
      ChatMessage(
        id: 'msg_002',
        conversationId: conversationId,
        senderId: 'current_user',
        senderName: 'Me',
        type: MessageType.text,
        content:
            'Yes, definitely! Could you tell me a bit more about the condition of the strap? I plan to use it daily for my laptop.',
        isMe: true,
        status: MessageStatus.read,
        createdAt: now.subtract(const Duration(minutes: 12)),
      ),
      ChatMessage(
        id: 'msg_003',
        conversationId: conversationId,
        senderId: 'user_alex',
        senderName: 'Alex Rivers',
        senderAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBBnIDXEmRc25CZ6c4iqUxGI15NGiC8_Y9AcDLc67lHezj0_nEOrlJ_7spQVz_sz5NdZyCRMZws3NX_WirY9aNNgWYFNUaVhK0_7qBYP2ZfBIOpy6S4rIgrml2zyBeS6w6oJvAZf3qjqZNnwCzlOOEc_87nxp-JKwJbPOy7jYsK_FH8m39SeXRvsS4XTTcdAw6Ose-xVyp8tdVNSY8wnFZ-1muyjBdZl-kFtpViyq4obL1d_E3FhL6Gug',
        type: MessageType.text,
        content:
            'The strap is solid brass hardware and reinforced stitching. It\'s held up incredibly well. I used it for a 15" Macbook without any issues.',
        isMe: false,
        status: MessageStatus.read,
        createdAt: now.subtract(const Duration(minutes: 8)),
      ),
      ChatMessage(
        id: 'msg_004',
        conversationId: conversationId,
        senderId: 'user_alex',
        senderName: 'Alex Rivers',
        senderAvatar:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBBnIDXEmRc25CZ6c4iqUxGI15NGiC8_Y9AcDLc67lHezj0_nEOrlJ_7spQVz_sz5NdZyCRMZws3NX_WirY9aNNgWYFNUaVhK0_7qBYP2ZfBIOpy6S4rIgrml2zyBeS6w6oJvAZf3qjqZNnwCzlOOEc_87nxp-JKwJbPOy7jYsK_FH8m39SeXRvsS4XTTcdAw6Ose-xVyp8tdVNSY8wnFZ-1muyjBdZl-kFtpViyq4obL1d_E3FhL6Gug',
        type: MessageType.offer,
        content: 'I\'d like to offer \$380 for the bag. I can pay immediately.',
        metadata: const ChatMessageMetadata(
          productId: 'prod_leather_bag',
          productTitle: 'Vintage Leather Messenger Bag',
          productImage:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuA79RdwijKBvGEHRxJYD_v0V9vughKGtFmqG2rooyupMMWVboduiLjPcXLASCqAwDjS7FlqfZBqh2USpPc0KhjV59VsL5KQzky1L1cocYSmfSgep1aLtOBut71rNNV-UjRsqJfCNJPvk-rC7qOmqCpxGBhi_556Erbq9meDm2VNpSOcwhXLJgIrRuGmLvZ9MKVW6K-S3wtxo0N4WTsnHO7HiDQSzIcAGwzzN6sFjIZjtCU-YuCBM3bfIraDRBvQu0uVN1o',
          productPrice: 420.0,
          offerPrice: 380.0,
          offerOriginalPrice: 420.0,
          offerNote:
              'I\'d like to offer \$380 for the bag. I can pay immediately.',
          offerStatus: OfferStatus.pending,
        ),
        isMe: false,
        status: MessageStatus.read,
        createdAt: now.subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        id: 'msg_005',
        conversationId: conversationId,
        senderId: 'current_user',
        senderName: 'Me',
        type: MessageType.text,
        content:
            'That looks perfect. I\'ll process the payment now through the Nexus secure checkout.',
        isMe: true,
        status: MessageStatus.sent,
        createdAt: now.subtract(const Duration(minutes: 2)),
      ),
    ];
  }
}

@riverpod
IChatRepository chatRepository(Ref ref) {
  final apiService = ref.watch(chatApiServiceProvider);
  final webSocketService = ref.watch(chatWebSocketServiceProvider);
  return ChatRepository(apiService, webSocketService);
}
