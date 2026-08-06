import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/notifications_screen.dart';
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

/// Tin nhắn và Thông báo là một chỗ. Chúng từng là hai màn hình ở hai nhánh
/// route khác nhau — `/chat` và `/account/notifications` — nên "có gì mới cho
/// tôi" có hai nơi phải đi xem, và cái chuông trên Trang chủ là đường duy nhất
/// tới một trong hai.
///
/// Vỏ này giữ nguyên `/chat` làm route: `MainLayout._getCurrentIndex` nhận tab
/// đang mở bằng `location.startsWith('/chat')`, nên một path mới sẽ làm thanh
/// nav dưới không sáng ở tab nào. Tab nằm trong query (`/chat?tab=notifications`).
class InboxScreen extends ConsumerStatefulWidget {
  final InboxTab initialTab;

  const InboxScreen({super.key, this.initialTab = InboxTab.messages});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  late InboxTab _tab = widget.initialTab;

  /// "Đọc tất cả" thuộc feed thông báo nhưng nút của nó nằm trên `AppBar` của vỏ,
  /// nên vỏ cần gọi được vào state của tab.
  final _notifications = GlobalKey<NotificationsTabState>();

  void _open(InboxTab tab) {
    if (_tab == tab) return;
    setState(() => _tab = tab);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final onNotifications = _tab == InboxTab.notifications;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Text(
          'Hộp thư',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
        actions: [
          // Chỉ có nghĩa với feed thông báo; tin nhắn đã đọc theo từng cuộc.
          if (onNotifications)
            TextButton(
              onPressed: () => _notifications.currentState?.markAllAsRead(),
              child: Text(
                'Đọc tất cả',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _InboxTabButton(
                  title: 'Tin nhắn',
                  selected: !onNotifications,
                  onTap: () => _open(InboxTab.messages),
                ),
                _InboxTabButton(
                  title: 'Thông báo',
                  selected: onNotifications,
                  onTap: () => _open(InboxTab.notifications),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: isDarkMode
                ? AppColors.darkPrimary.withAlpha(30)
                : const Color(0xFFE1E3E1),
          ),
          // `IndexedStack`, không phải một `if`: đổi tab giữ nguyên vị trí cuộn và
          // ô tìm kiếm đã gõ, và feed thông báo không đọc lại từ server mỗi lần
          // người dùng qua lại giữa hai tab.
          Expanded(
            child: IndexedStack(
              index: onNotifications ? 1 : 0,
              children: [
                const MessagesTab(),
                NotificationsTab(
                  key: _notifications,
                  onOpenMessages: () => _open(InboxTab.messages),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InboxTabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _InboxTabButton({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.only(top: 14, bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected
                    ? theme.colorScheme.primary
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
