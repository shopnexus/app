import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_model.dart';
import '../repositories/chat_repository.dart';

export '../data_sources/chat_api_service.dart';
export '../data_sources/chat_websocket_service.dart';
export '../models/chat_model.dart';
export '../repositories/chat_repository.dart';

/// Provider cho luồng tin nhắn thời gian thực của 1 conversation
final chatRealtimeStreamProvider = StreamProvider.family<ChatMessage, String>((
  ref,
  conversationId,
) {
  final repository = ref.watch(chatRepositoryProvider);
  repository.connectRealtime(conversationId);
  ref.onDispose(() {
    repository.disconnectRealtime();
  });
  return repository.getRealtimeStream();
});
