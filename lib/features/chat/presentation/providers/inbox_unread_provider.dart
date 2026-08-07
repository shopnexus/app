import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';

part 'inbox_unread_provider.g.dart';

/// Số tin nhắn Chat chưa đọc.
@riverpod
Future<int> inboxUnread(Ref ref) async {
  // Lắng nghe chatListProvider để tự động cập nhật badge ngay khi đọc tin nhắn
  final chatListState = ref.watch(chatListProvider).value;
  if (chatListState != null) {
    return chatListState.conversations.fold<int>(
      0,
      (int sum, Conversation conv) => sum + conv.unread,
    );
  }

  final chat = ref.watch(chatRepositoryProvider);
  return countOrZero(() async => (await chat.unreadCount()).unread);
}
