import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chat_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default([]) List<ChatConversation> conversations,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ChatListState;

  const ChatListState._();

  List<ChatConversation> get filteredConversations {
    if (searchQuery.trim().isEmpty) {
      return conversations;
    }
    final query = searchQuery.toLowerCase();
    return conversations.where((conv) {
      final name = conv.participantName.toLowerCase();
      final lastMsg = (conv.lastMessageText ?? '').toLowerCase();
      final product = (conv.productTitle ?? '').toLowerCase();
      return name.contains(query) ||
          lastMsg.contains(query) ||
          product.contains(query);
    }).toList();
  }
}

@freezed
abstract class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState({
    String? conversationId,
    ChatConversation? conversation,
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    @Default('') String draftText,
    String? errorMessage,
  }) = _ChatDetailState;
}
