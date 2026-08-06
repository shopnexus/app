import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart'
    as wire;
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';

/// A row's own view of itself. `payload` is free-form structured content, so
/// reading it is the widget's job and none of it pretends to be a declared field.
extension on wire.Notification {
  bool get isRead => readAt != null;

  String? get body => (payload['content'] ?? payload['body'])?.toString();

  String? get orderId => payload['order_id']?.toString();

  String? get ticketId => payload['ticket_id']?.toString();

  String? get redirectUrl => payload['redirect_url']?.toString();
}

/// Dòng thời gian thông báo, không có `Scaffold` và không có `AppBar`: nó là một
/// tab của Hộp thư (`InboxScreen`).
///
/// Feed không còn tự chia `[Tin nhắn | Hoạt động]` như khi nó là một màn hình
/// riêng. Hộp thư đã có đúng cái phân đôi đó ở ngoài, nên tab trong tên "Tin
/// nhắn" sẽ là chữ "Tin nhắn" thứ hai, cách chữ thứ nhất một lần chạm và có
/// nghĩa khác: một cái là cuộc trò chuyện, một cái là thông báo *về* cuộc trò
/// chuyện. Một danh sách không lọc không mất dòng nào.
class NotificationsTab extends ConsumerStatefulWidget {
  /// Một thông báo hạng `chat` không có id nào để mở thì việc đúng là chuyển
  /// sang tab Tin nhắn, chứ không phải `push('/chat')` — đẩy như thế xếp thêm
  /// một Hộp thư nữa lên trên chính Hộp thư đang mở.
  final VoidCallback onOpenMessages;

  const NotificationsTab({super.key, required this.onOpenMessages});

  @override
  ConsumerState<NotificationsTab> createState() => NotificationsTabState();
}

class NotificationsTabState extends ConsumerState<NotificationsTab> {
  /// Đánh dấu đã đọc cả feed. Public vì nút "Đọc tất cả" nằm trên `AppBar` của
  /// Hộp thư, ngoài tab này.
  Future<void> markAllAsRead() =>
      ref.read(notificationsControllerProvider.notifier).markRead();

  /// The route takes a bound, never an id, so a tap marks this row and everything
  /// older — which is what "read" means in a feed ordered by time.
  Future<void> _markReadUpTo(wire.Notification item) => ref
      .read(notificationsControllerProvider.notifier)
      .markRead(upTo: item.createdAt);

  Future<void> _loadMore() async {
    try {
      await ref.read(notificationsControllerProvider.notifier).loadMore();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không tải thêm được: $error')));
    }
  }

  void _navigateToTarget(BuildContext context, wire.Notification item) {
    final redirectUrl = item.redirectUrl;
    final orderId = item.orderId;
    final ticketId = item.ticketId;

    if (redirectUrl != null && redirectUrl.isNotEmpty) {
      context.push(redirectUrl);
    } else if (orderId != null && orderId.isNotEmpty) {
      context.push('/account/order-detail/$orderId');
    } else if (ticketId != null && ticketId.isNotEmpty) {
      context.push('/account/help-center/$ticketId');
    } else if (item.category == NotificationCategory.chat) {
      widget.onOpenMessages();
    } else if (item.category == NotificationCategory.order) {
      context.push('/account/orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final feedAsync = ref.watch(notificationsControllerProvider);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () async {
        ref.invalidate(notificationsControllerProvider);
        await ref.read(notificationsControllerProvider.future);
      },
      child: feedAsync.when(
        data: (feed) {
          final items = feed.items;
          if (items.isEmpty) return const _EmptyNotifications();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length + (feed.nextCursor == null ? 0 : 1),
            itemBuilder: (context, index) => index == items.length
                ? _buildLoadMore(feed.loadingMore)
                : _buildNotificationCard(context, items[index]),
          );
        },
        loading: () => _buildShimmerList(),
        error: (err, _) => _buildError(err),
      ),
    );
  }

  Widget _buildLoadMore(bool loading) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Center(
      child: loading
          ? const CircularProgressIndicator()
          : TextButton(onPressed: _loadMore, child: const Text('Tải thêm')),
    ),
  );

  Widget _buildError(Object error) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 44,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(
              'Không tải được thông báo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$error',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, wire.Notification item) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final isUnread = !item.isRead;

    final unreadBg = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF4F4F1);
    final readBg = isDarkMode ? AppColors.darkSurface : Colors.transparent;
    final borderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFE1E3E1).withValues(alpha: 0.5);
    final body = item.body;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: isUnread ? unreadBg : readBg,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isUnread) _markReadUpTo(item);
            _navigateToTarget(context, item);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: isUnread
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: borderColor),
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconBadge(_categoryIcon(item.category)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          if (body != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              body,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                          const SizedBox(height: 8),
                          Text(
                            _formatDate(item.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (isUnread)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconBadge(IconData iconData) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final badgeBg = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFA8ECE4);
    final iconColor = isDarkMode
        ? AppColors.darkPrimary
        : const Color(0xFF266D67);

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(color: badgeBg, shape: BoxShape.circle),
      child: Icon(iconData, color: iconColor, size: 26),
    );
  }

  IconData _categoryIcon(NotificationCategory category) => switch (category) {
    NotificationCategory.order => Icons.local_shipping_outlined,
    NotificationCategory.promotion => Icons.loyalty_rounded,
    NotificationCategory.chat => Icons.chat_bubble_outline_rounded,
    NotificationCategory.social => Icons.people_outline_rounded,
    NotificationCategory.system => Icons.notifications_none_rounded,
  };

  String _formatDate(DateTime instant) {
    final date = instant.toLocal();
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}  ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Widget _buildShimmerList() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFEEEEEC),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF9F9F7),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 88,
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

/// Đường vào cũ của Thông báo, `/account/notifications`. Hộp thư đã là nhà mới
/// của feed này; màn hình rời vẫn còn ở đây cho tới khi mọi caller đã chuyển
/// sang `/chat?tab=notifications` — xoá route cùng lúc đổi caller là cách làm
/// vỡ một cái nút mà `dart analyze` không hề nhìn thấy.
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  final _tab = GlobalKey<NotificationsTabState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Thông báo',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _tab.currentState?.markAllAsRead(),
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
      body: NotificationsTab(
        key: _tab,
        onOpenMessages: () => context.push('/chat'),
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF4F4F1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_off_outlined,
                size: 48,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Không có thông báo mới',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
                fontFamily: 'Manrope',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mọi cập nhật quan trọng về đơn hàng và tin nhắn của bạn sẽ được hiển thị tại đây.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
