import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/chat_providers.dart';
import 'chat_state.dart';

part 'chat_notifier.g.dart';

/// Provider quản lý danh sách cuộc hội thoại chat
@riverpod
class ChatListNotifier extends _$ChatListNotifier {
  @override
  FutureOr<ChatListState> build() async {
    final repository = ref.watch(chatRepositoryProvider);
    final conversations = await repository.getConversations();
    return ChatListState(conversations: conversations);
  }

  /// Tải lại danh sách cuộc hội thoại
  Future<void> fetchConversations() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(chatRepositoryProvider);
      final conversations = await repository.getConversations();
      final currentSearch = state.value?.searchQuery ?? '';
      return ChatListState(
        conversations: conversations,
        searchQuery: currentSearch,
      );
    });
  }

  /// Tìm kiếm cuộc hội thoại
  void search(String query) {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState.copyWith(searchQuery: query));
    }
  }

  /// Đánh dấu cuộc hội thoại đã đọc
  Future<void> markAsRead(String conversationId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.markAsRead(conversationId);

    final currentState = state.value;
    if (currentState != null) {
      final updatedList = currentState.conversations.map((conv) {
        if (conv.id == conversationId) {
          return conv.copyWith(unreadCount: 0);
        }
        return conv;
      }).toList();
      state = AsyncValue.data(
        currentState.copyWith(conversations: updatedList),
      );
    }
  }

  /// Cập nhật tin nhắn mới nhất vào danh sách hội thoại
  void updateLastMessage(String conversationId, ChatMessage message) {
    final currentState = state.value;
    if (currentState != null) {
      final updatedList = currentState.conversations.map((conv) {
        if (conv.id == conversationId) {
          return conv.copyWith(
            lastMessage: message.content,
            lastMessageTime: message.createdAt,
            updatedAt: message.createdAt,
          );
        }
        return conv;
      }).toList();
      state = AsyncValue.data(
        currentState.copyWith(conversations: updatedList),
      );
    }
  }
}

/// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time
@riverpod
class ChatDetailNotifier extends _$ChatDetailNotifier {
  StreamSubscription<ChatMessage>? _realtimeSubscription;

  @override
  FutureOr<ChatDetailState> build(String conversationId) async {
    final repository = ref.watch(chatRepositoryProvider);

    // Kết nối real-time WebSocket cho conversationId này
    repository.connectRealtime(conversationId);

    // Đăng ký lắng nghe luồng tin nhắn mới từ WebSocket
    _realtimeSubscription = repository.getRealtimeStream().listen((message) {
      if (message.conversationId == conversationId) {
        _onRealtimeMessageReceived(message);
      }
    });

    // Đảm bảo đóng kết nối WebSocket và hủy subscription khi Provider bị dispose
    ref.onDispose(() {
      _realtimeSubscription?.cancel();
      repository.disconnectRealtime();
    });

    final conversations = await repository.getConversations();
    final conversation = conversations.firstWhere(
      (c) => c.id == conversationId,
      orElse: () => ChatConversation(
        id: conversationId,
        participantId: 'unknown',
        participantName: 'Nexus User',
      ),
    );

    final messages = await repository.getMessages(conversationId);

    return ChatDetailState(
      conversationId: conversationId,
      conversation: conversation,
      messages: messages,
    );
  }

  /// Nhận tin nhắn mới từ luồng Real-time WebSocket
  void _onRealtimeMessageReceived(ChatMessage message) {
    final currentState = state.value;
    if (currentState == null) return;

    // Tránh trùng lặp tin nhắn đã có trong danh sách
    final exists = currentState.messages.any((m) => m.id == message.id);
    if (exists) return;

    final updatedMessages = [...currentState.messages, message];
    state = AsyncValue.data(currentState.copyWith(messages: updatedMessages));

    // Cập nhật last message ở ChatListNotifier
    ref
        .read(chatListProvider.notifier)
        .updateLastMessage(currentState.conversationId ?? '', message);
  }

  /// Gửi tin nhắn văn bản
  Future<bool> sendTextMessage(String content) async {
    if (content.trim().isEmpty) return false;

    final currentState = state.value;
    if (currentState == null || currentState.conversationId == null) {
      return false;
    }

    final conversationId = currentState.conversationId!;
    final repository = ref.read(chatRepositoryProvider);

    // Cập nhật trạng thái đang gửi
    state = AsyncValue.data(
      currentState.copyWith(isSending: true, draftText: ''),
    );

    try {
      final sentMessage = await repository.sendMessage(
        conversationId: conversationId,
        content: content.trim(),
        type: MessageType.text,
      );

      final updatedState = state.value;
      if (updatedState != null) {
        final exists = updatedState.messages.any((m) => m.id == sentMessage.id);
        final updatedList = exists
            ? updatedState.messages
            : [...updatedState.messages, sentMessage];

        state = AsyncValue.data(
          updatedState.copyWith(messages: updatedList, isSending: false),
        );

        ref
            .read(chatListProvider.notifier)
            .updateLastMessage(conversationId, sentMessage);
      }
      return true;
    } catch (e) {
      final updatedState = state.value;
      if (updatedState != null) {
        state = AsyncValue.data(
          updatedState.copyWith(
            isSending: false,
            errorMessage: 'Gửi tin nhắn thất bại: ${e.toString()}',
          ),
        );
      }
      return false;
    }
  }

  /// Gửi lời đề nghị mua hàng (Offer Message)
  Future<bool> sendOfferMessage({
    required double offerPrice,
    int quantity = 1,
    String? note,
    String? productId,
    String? productTitle,
    String? productImage,
    double? productPrice,
  }) async {
    final currentState = state.value;
    if (currentState == null || currentState.conversationId == null) {
      return false;
    }

    final conversationId = currentState.conversationId!;
    final repository = ref.read(chatRepositoryProvider);

    state = AsyncValue.data(currentState.copyWith(isSending: true));

    final metadata = ChatMessageMetadata(
      productId: productId,
      productTitle: productTitle,
      productImage: productImage,
      productPrice: productPrice,
      offerPrice: offerPrice,
      offerOriginalPrice: productPrice,
      quantity: quantity,
      offerNote: note,
      offerStatus: OfferStatus.pending,
    );

    final content =
        note ??
        'I\'d like to offer \$${offerPrice.toStringAsFixed(2)}${quantity > 1 ? ' (Qty: $quantity)' : ''}';

    try {
      final sentMessage = await repository.sendMessage(
        conversationId: conversationId,
        content: content,
        type: MessageType.offer,
        metadata: metadata,
      );

      final updatedState = state.value;
      if (updatedState != null) {
        final updatedList = [...updatedState.messages, sentMessage];
        state = AsyncValue.data(
          updatedState.copyWith(messages: updatedList, isSending: false),
        );

        ref
            .read(chatListProvider.notifier)
            .updateLastMessage(conversationId, sentMessage);
      }
      return true;
    } catch (e) {
      final updatedState = state.value;
      if (updatedState != null) {
        state = AsyncValue.data(
          updatedState.copyWith(
            isSending: false,
            errorMessage: 'Gửi lời đề nghị thất bại: ${e.toString()}',
          ),
        );
      }
      return false;
    }
  }

  /// Phản hồi lời đề nghị (Chấp nhận, Thương lượng lại, Từ chối, Rút)
  Future<void> respondToOffer(String messageId, OfferStatus status) async {
    final currentState = state.value;
    if (currentState == null) return;

    final updatedMessages = currentState.messages.map((msg) {
      if (msg.id == messageId && msg.type == MessageType.offer) {
        final currentMeta = msg.metadata;
        final updatedMeta = currentMeta?.copyWith(offerStatus: status);
        return msg.copyWith(metadata: updatedMeta);
      }
      return msg;
    }).toList();

    state = AsyncValue.data(currentState.copyWith(messages: updatedMessages));
  }
}
