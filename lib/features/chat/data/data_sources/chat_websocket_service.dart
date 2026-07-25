import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/chat_model.dart';

part 'chat_websocket_service.g.dart';

class ChatWebSocketService {
  WebSocketChannel? _channel;
  final StreamController<ChatMessage> _messageStreamController =
      StreamController<ChatMessage>.broadcast();
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Stream<ChatMessage> get messageStream => _messageStreamController.stream;

  /// Kết nối tới WebSocket server với Token và conversationId
  void connect({required String conversationId, String? token}) {
    if (_isConnected) {
      disconnect();
    }

    try {
      final uri = Uri.parse(
        '${ApiEndpoints.webSocketUrl}?conversation_id=$conversationId${token != null ? '&token=$token' : ''}',
      );

      _channel = WebSocketChannel.connect(uri);
      _isConnected = true;

      _channel?.stream.listen(
        (data) {
          try {
            if (data is String) {
              final Map<String, dynamic> json = jsonDecode(data);
              final message = ChatMessage.fromJson(json);
              _messageStreamController.add(message);
            }
          } catch (e) {
            debugPrint('Error parsing WebSocket message: $e');
          }
        },
        onError: (error) {
          debugPrint('WebSocket error: $error');
          _isConnected = false;
        },
        onDone: () {
          debugPrint('WebSocket connection closed');
          _isConnected = false;
        },
      );
    } catch (e) {
      debugPrint('Failed to connect to WebSocket: $e');
      _isConnected = false;
    }
  }

  /// Gửi tin nhắn qua WebSocket
  bool sendMessage(ChatMessage message) {
    if (!_isConnected || _channel == null) {
      debugPrint('Cannot send message: WebSocket is not connected');
      return false;
    }

    try {
      final jsonPayload = jsonEncode(message.toJson());
      _channel?.sink.add(jsonPayload);
      return true;
    } catch (e) {
      debugPrint('Error sending message via WebSocket: $e');
      return false;
    }
  }

  /// Ngắt kết nối WebSocket và giải phóng tài nguyên
  void disconnect() {
    try {
      _channel?.sink.close();
    } catch (e) {
      debugPrint('Error closing WebSocket sink: $e');
    } finally {
      _channel = null;
      _isConnected = false;
    }
  }

  /// Hủy service (được gọi trong ref.onDispose)
  void dispose() {
    disconnect();
    _messageStreamController.close();
  }
}

@riverpod
ChatWebSocketService chatWebSocketService(Ref ref) {
  final service = ChatWebSocketService();
  ref.onDispose(() {
    service.dispose();
  });
  return service;
}
