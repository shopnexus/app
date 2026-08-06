import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/inbox_unread_provider.dart';

/// Badge trên tab Hộp thư là kênh thông báo duy nhất của app này — không push,
/// không SMS. Nên hai điều phải đúng: nó đếm *đúng phạm vi* Hộp thư (tin nhắn +
/// thông báo, không phải `ActionInbox.total`, thứ còn cộng đơn chờ giao và hoàn
/// tiền), và một nguồn hỏng chỉ mất phần của nó chứ không xoá cả badge.
void main() {
  /// `null` cho một nguồn nghĩa là nguồn đó ném lỗi.
  ProviderContainer containerWith({int? messages, int? notifications}) =>
      ProviderContainer(
        overrides: [
          chatRepositoryProvider.overrideWithValue(
            _FakeChatRepository(messages),
          ),
          unreadNotificationsCountProvider.overrideWith((ref) async {
            if (notifications == null) throw StateError('thông báo hỏng');
            return notifications;
          }),
        ],
      );

  test('cộng tin nhắn chưa đọc với thông báo chưa đọc', () async {
    final container = containerWith(messages: 3, notifications: 4);
    addTearDown(container.dispose);

    expect(await container.read(inboxUnreadProvider.future), 7);
  });

  test('không có gì chưa đọc thì ra 0', () async {
    final container = containerWith(messages: 0, notifications: 0);
    addTearDown(container.dispose);

    expect(await container.read(inboxUnreadProvider.future), 0);
  });

  /// Cái hỏng phải chặn: một `Future.wait` trần ở đây sẽ để chat hỏng xoá luôn số
  /// thông báo, và một badge biến mất trông giống một badge bằng 0.
  test('chat hỏng thì vẫn ra số thông báo', () async {
    final container = containerWith(messages: null, notifications: 5);
    addTearDown(container.dispose);

    expect(await container.read(inboxUnreadProvider.future), 5);
  });

  test('thông báo hỏng thì vẫn ra số tin nhắn', () async {
    final container = containerWith(messages: 2, notifications: null);
    addTearDown(container.dispose);

    expect(await container.read(inboxUnreadProvider.future), 2);
  });

  test('cả hai nguồn hỏng thì ra 0, không ném', () async {
    final container = containerWith(messages: null, notifications: null);
    addTearDown(container.dispose);

    expect(await container.read(inboxUnreadProvider.future), 0);
  });
}

class _FakeChatRepository extends ChatRepository {
  _FakeChatRepository(this.unread) : super(ChatApi(Dio()), OrderApi(Dio()));

  /// Null nghĩa là lời gọi ném lỗi.
  final int? unread;

  @override
  Future<ChatUnreadCount> unreadCount() async {
    final value = unread;
    if (value == null) throw StateError('chat hỏng');
    return ChatUnreadCount(conversations: 1, unread: value);
  }
}
