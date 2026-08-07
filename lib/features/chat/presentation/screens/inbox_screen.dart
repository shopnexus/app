import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/screens/chat_list_screen.dart';

/// Hai nửa của Hộp thư. `messages` là mặc định vì `/chat` không mang tham số là
/// chuyện thường: mọi deep link cũ vào tin nhắn vẫn phải tới đúng chỗ.
enum InboxTab {
  messages('messages'),
  notifications('notifications');

  const InboxTab(this.value);

  final String value;
}

/// Một tham số query đọc theo tên tab; giá trị lạ về `messages` thay vì ném, nên
/// một link cũ mở Hộp thư chứ không mở trang lỗi.
InboxTab inboxTabFromQuery(String? raw) {
  for (final tab in InboxTab.values) {
    if (tab.value == raw) return tab;
  }
  return InboxTab.messages;
}

class InboxScreen extends StatelessWidget {
  final InboxTab initialTab;

  const InboxScreen({super.key, this.initialTab = InboxTab.messages});

  @override
  Widget build(BuildContext context) {
    return const ChatListScreen();
  }
}
