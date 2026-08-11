import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/inbox_unread_provider.dart';

import 'support/uploader.dart';

/// Badge trên tab Tin nhắn đếm **tin nhắn chưa đọc**, và chỉ thế.
///
/// Hộp thư từng là một màn hai tab và badge này cộng cả thông báo; hai thứ đó đã
/// tách ra — thông báo có màn riêng và cái chuông riêng ở Trang chủ — nên cộng
/// chúng vào đây sẽ đưa người dùng vào Tin nhắn để tìm một thứ không nằm ở đó.
///
/// Nguồn ưu tiên là danh sách hội thoại đang mở, để badge tụt ngay khi đọc xong
/// một thread thay vì đợi một lượt đọc mới; `GET /conversations/unread` là đường
/// lùi khi danh sách chưa nạp. Một nguồn hỏng cho 0 chứ không ném: badge là kênh
/// thông báo duy nhất của app này, và làm sập cây widget vì nó là đổi một con số
/// sai lấy một màn hình trắng.
void main() {
  ProviderContainer containerWith({
    List<int>? perConversation,
    int? fallback,
  }) => ProviderContainer.test(
    overrides: [
      chatRepositoryProvider.overrideWithValue(_FakeChatRepository(fallback)),
      if (perConversation != null)
        chatListProvider.overrideWith(
          () => _FakeChatList(perConversation),
        )
      else
        chatListProvider.overrideWith(_FailingChatList.new),
    ],
  );

  /// `read(...future)` mở rồi đóng ngay một subscription tạm, và một provider
  /// autoDispose bị vứt giữa lúc đang load thì không bao giờ phát ra giá trị.
  /// Giữ một người nghe cho tới hết bài là đủ.
  Future<int> unreadOf(ProviderContainer container) {
    container.listen(inboxUnreadProvider, (_, _) {});
    return container.read(inboxUnreadProvider.future);
  }

  test('cộng số chưa đọc của từng hội thoại đang mở', () async {
    final container = containerWith(perConversation: [3, 4]);

    expect(await unreadOf(container), 7);
  });

  test('không có gì chưa đọc thì ra 0', () async {
    final container = containerWith(perConversation: [0, 0]);

    expect(await unreadOf(container), 0);
  });

  test('danh sách chưa nạp thì hỏi tổng số chưa đọc', () async {
    final container = containerWith(fallback: 5);

    expect(await unreadOf(container), 5);
  });

  test('cả hai nguồn hỏng thì ra 0, không ném', () async {
    final container = containerWith(fallback: null);

    expect(await unreadOf(container), 0);
  });
}

class _FakeChatList extends ChatListNotifier {
  _FakeChatList(this.unreadPerConversation);

  final List<int> unreadPerConversation;

  @override
  Future<ChatListState> build() async => ChatListState(
    conversations: [
      for (var i = 0; i < unreadPerConversation.length; i++)
        _conversation('cnv_$i', unreadPerConversation[i]),
    ],
  );
}

class _FailingChatList extends ChatListNotifier {
  @override
  Future<ChatListState> build() async => throw StateError('danh sách hỏng');
}

Conversation _conversation(String id, int unread) => Conversation(
  id: id,
  counterparty: AccountSummary(id: 'acc_1', name: 'Bob', avatar: null),
  counterpartyReadAt: null,
  unread: unread,
  lastMessage: null,
  lastMessageAt: DateTime(2026, 8, 10),
  readAt: null,
  ticketId: null,
  createdAt: DateTime(2026, 8, 10),
);

class _FakeChatRepository extends ChatRepository {
  _FakeChatRepository(this.unread)
    : super(ChatApi(Dio()), OrderApi(Dio()), uploaderOn());

  /// Null nghĩa là lời gọi ném lỗi.
  final int? unread;

  @override
  Future<ChatUnreadCount> unreadCount() async {
    final value = unread;
    if (value == null) throw StateError('chat hỏng');
    return ChatUnreadCount(conversations: 1, unread: value);
  }
}
