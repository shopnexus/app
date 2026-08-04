import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/notifications_provider.dart';
import '../../data/models/account_model.dart' as model;

/// Mock Notification Item representation for UI testing & fallback
class _MockNotification {
  final int id;
  final String title;
  final String content;
  final String dateCreated;
  final String category; // 'message' | 'activity'
  final String? imageUrl;
  final IconData? iconData;
  final String? targetRoute;
  bool isRead;

  _MockNotification({
    required this.id,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.category,
    this.imageUrl,
    this.iconData,
    this.targetRoute,
    this.isRead = false,
  });
}

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  int _selectedTabIndex = 0; // 0: Tin nhắn mới, 1: Hoạt động

  // Initial Mock Data matching Stitch Ethos minimal e-commerce design
  late List<_MockNotification> _mockItems;

  @override
  void initState() {
    super.initState();
    _initMockData();
  }

  void _initMockData() {
    _mockItems = [
      _MockNotification(
        id: 1,
        title: 'Đơn hàng của bạn đã được giao!',
        content:
            'Đơn hàng #SN-98241 đã giao thành công. Vui lòng kiểm tra và xác nhận.',
        dateCreated: '2 phút trước',
        category: 'activity',
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=150&q=80',
        targetRoute: '/account/orders',
        isRead: false,
      ),
      _MockNotification(
        id: 2,
        title: 'Bạn có tin nhắn mới từ Alex Shop',
        content: 'Sản phẩm Áo thun nam Polo vẫn còn sẵn size L nhé bạn!',
        dateCreated: '1 giờ trước',
        category: 'message',
        imageUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&q=80',
        targetRoute: '/chat',
        isRead: false,
      ),
      _MockNotification(
        id: 3,
        title: 'Giảm giá 20% cho các sản phẩm yêu thích',
        content: 'Áp dụng ưu đãi cho tất cả danh mục thời trang trong hôm nay.',
        dateCreated: '3 giờ trước',
        category: 'activity',
        iconData: Icons.loyalty_rounded,
        targetRoute: '/home',
        isRead: true,
      ),
      _MockNotification(
        id: 4,
        title: 'Yêu cầu hoàn tiền đã được phê duyệt',
        content: 'Hệ thống đã hoàn ₫299,000 vào Ví ShopNexus của bạn.',
        dateCreated: '1 ngày trước',
        category: 'activity',
        iconData: Icons.account_balance_wallet_rounded,
        targetRoute: '/account/orders',
        isRead: true,
      ),
      _MockNotification(
        id: 5,
        title: 'ShopNexus Store vừa gửi cho bạn một tin nhắn',
        content: 'Cảm ơn bạn đã mua sắm tại cửa hàng. Hãy để lại đánh giá nhé!',
        dateCreated: '2 ngày trước',
        category: 'message',
        iconData: Icons.chat_bubble_outline_rounded,
        targetRoute: '/chat',
        isRead: true,
      ),
    ];
  }

  void _markAllAsRead() {
    setState(() {
      for (var item in _mockItems) {
        item.isRead = true;
      }
    });
    ref.read(notificationsControllerProvider.notifier).markAllAsRead();
  }

  void _markItemAsRead(int id) {
    setState(() {
      final item = _mockItems.firstWhere((element) => element.id == id);
      item.isRead = true;
    });
    ref.read(notificationsControllerProvider.notifier).markAsRead([id]);
  }

  void _navigateToTarget(BuildContext context, model.Notification item) {
    final redirectUrl = item.metadata?.redirectUrl;
    final orderId = item.metadata?.orderId;
    final ticketId = item.metadata?.ticketId;

    if (redirectUrl != null && redirectUrl.isNotEmpty) {
      context.push(redirectUrl);
    } else if (orderId != null && orderId.isNotEmpty) {
      context.push('/account/order-detail/$orderId');
    } else if (ticketId != null && ticketId.isNotEmpty) {
      context.push('/account/help-center/$ticketId');
    } else {
      final lowerTitle = item.title.toLowerCase();
      if (lowerTitle.contains('tin nhắn') || lowerTitle.contains('chat')) {
        context.push('/chat');
      } else if (lowerTitle.contains('đơn hàng') ||
          lowerTitle.contains('giao') ||
          lowerTitle.contains('vận chuyển')) {
        context.push('/account/orders');
      } else if (lowerTitle.contains('giảm giá') ||
          lowerTitle.contains('ưu đãi') ||
          lowerTitle.contains('khuyến mãi')) {
        context.push('/home');
      } else if (lowerTitle.contains('ví') ||
          lowerTitle.contains('hoàn tiền')) {
        context.push('/account/orders');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final notificationsAsync = ref.watch(
      notificationsProvider(page: 1, limit: 100),
    );

    // Filter mock list based on selected tab index
    final filteredMockItems = _mockItems.where((item) {
      if (_selectedTabIndex == 0) {
        return item.category == 'message';
      } else {
        return item.category == 'activity';
      }
    }).toList();

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
      body: Column(
        children: [
          // Sticky Stitch Tab Bar
          Container(
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton(title: 'Tin nhắn mới', index: 0),
                _buildTabButton(title: 'Hoạt động', index: 1),
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

          // Main Content View
          Expanded(
            child: RefreshIndicator(
              color: theme.colorScheme.primary,
              onRefresh: () async {
                ref.invalidate(notificationsProvider(page: 1, limit: 100));
                setState(() {
                  _initMockData();
                });
              },
              child: notificationsAsync.when(
                data: (apiList) {
                  if (apiList.isNotEmpty) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: apiList.length,
                      itemBuilder: (context, index) {
                        final item = apiList[index];
                        return _buildApiNotificationCard(context, item);
                      },
                    );
                  }

                  if (filteredMockItems.isEmpty) {
                    return const _EmptyNotifications();
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredMockItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredMockItems[index];
                      return _buildMockNotificationCard(context, item);
                    },
                  );
                },
                loading: () => _buildShimmerList(),
                error: (err, stack) {
                  if (filteredMockItems.isEmpty) {
                    return const _EmptyNotifications();
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredMockItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredMockItems[index];
                      return _buildMockNotificationCard(context, item);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({required String title, required int index}) {
    final theme = Theme.of(context);
    final isSelected = _selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.only(top: 14, bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
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
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMockNotificationCard(
    BuildContext context,
    _MockNotification item,
  ) {
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

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: isUnread ? unreadBg : readBg,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _markItemAsRead(item.id);
            if (item.targetRoute != null && item.targetRoute!.isNotEmpty) {
              context.push(item.targetRoute!);
            }
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
                    _buildLeadingWidget(item.imageUrl, item.iconData),
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
                          const SizedBox(height: 4),
                          Text(
                            item.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.dateCreated,
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

  Widget _buildApiNotificationCard(
    BuildContext context,
    model.Notification item,
  ) {
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

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: isUnread ? unreadBg : readBg,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isUnread) {
              ref.read(notificationsControllerProvider.notifier).markAsRead([
                item.id,
              ]);
            }
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
                    _buildLeadingWidget(null, _getNotificationIcon(item.title)),
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
                          const SizedBox(height: 4),
                          Text(
                            item.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatDate(item.dateCreated),
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

  Widget _buildLeadingWidget(String? imageUrl, IconData? iconData) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildIconBadge(iconData),
        ),
      );
    }
    return _buildIconBadge(iconData);
  }

  Widget _buildIconBadge(IconData? iconData) {
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
      child: Icon(
        iconData ?? Icons.notifications_none_rounded,
        color: iconColor,
        size: 26,
      ),
    );
  }

  IconData _getNotificationIcon(String title) {
    final lowerTitle = title.toLowerCase();
    if (lowerTitle.contains('hủy') || lowerTitle.contains('refund')) {
      return Icons.cancel_outlined;
    } else if (lowerTitle.contains('giao') ||
        lowerTitle.contains('vận chuyển')) {
      return Icons.local_shipping_outlined;
    } else if (lowerTitle.contains('thanh toán') || lowerTitle.contains('ví')) {
      return Icons.account_balance_wallet_outlined;
    }
    return Icons.notifications_none_rounded;
  }

  String _formatDate(String isoString) {
    try {
      final date = DateTime.parse(isoString);
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}  ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (_) {
      return isoString;
    }
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
