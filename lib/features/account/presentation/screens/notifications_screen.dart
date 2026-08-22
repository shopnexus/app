import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart'
    as wire;
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:shopnexus_flutter_app/core/routing/notification_href.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';

extension on wire.Notification {
  bool get isRead => readAt != null;
}

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  Future<void> _markAllAsRead() =>
      ref.read(notificationsControllerProvider.notifier).markRead();

  /// Đúng một dòng. Route nhận `ids`, nên chạm vào một thông báo không còn kéo
  /// theo mọi thông báo cũ hơn nó như hồi chỉ có mốc thời gian.
  Future<void> _markRead(wire.Notification item) => ref
      .read(notificationsControllerProvider.notifier)
      .markRead(ids: [item.id]);

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

  /// Đi tới chỗ dòng này mở ra, hoặc không đi đâu cả.
  ///
  /// `href` là câu trả lời của server cho "bấm vào đây thì ra gì" — không còn
  /// phải mò trong payload để đoán ra `order_id` hay `ticket_id` nữa. Nó viết
  /// theo router của website nên phải dịch: xem [appRouteForNotificationHref].
  void _navigateToTarget(BuildContext context, wire.Notification item) {
    final route = appRouteForNotificationHref(item.href);
    if (route != null) context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final feedAsync = ref.watch(notificationsControllerProvider);

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
          'Thông báo hệ thống',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _markAllAsRead,
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
      body: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: () async {
          ref.invalidate(notificationsControllerProvider);
          await ref.read(notificationsControllerProvider.future);
        },
        child: feedAsync.when(
          data: (feed) {
            // Loại bỏ tin nhắn chat vì chat có phân hệ màn hình Chat riêng
            final items = feed.items
                .where((item) => item.category != NotificationCategory.chat)
                .toList();
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
    final hasTarget = appRouteForNotificationHref(item.href) != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: isUnread ? unreadBg : readBg,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isUnread) _markRead(item);
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
                          // Server gửi chuỗi rỗng cho một sự việc không cần
                          // câu đỡ, nên "có body" là "không rỗng".
                          if (body.isNotEmpty) ...[
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
                          Row(
                            children: [
                              Text(
                                _formatDate(item.createdAt),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              // Dòng nào mở ra được thì nói trước: `href` rỗng
                              // là chuyện thường của một sự việc không dẫn đi
                              // đâu, và bấm vào đó chỉ nên đánh dấu đã đọc.
                              if (hasTarget) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 16,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ],
                            ],
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
