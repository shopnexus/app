import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/notifications_provider.dart';
import '../../data/models/account_model.dart' as model;

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(
      notificationsProvider(page: 1, limit: 100),
    );
    final controllerState = ref.watch(notificationsControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Thông báo',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0F172A),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref
                  .read(notificationsControllerProvider.notifier)
                  .markAllAsRead();
            },
            child: const Text(
              'Đọc tất cả',
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () =>
                ref.refresh(notificationsProvider(page: 1, limit: 100).future),
            child: notificationsAsync.when(
              data: (list) {
                if (list.isEmpty) {
                  return const _EmptyNotifications();
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return _buildNotificationCard(context, ref, item);
                  },
                );
              },
              loading: () => _buildShimmerList(),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        size: 48,
                        color: Color(0xFFBA1A1A),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Không thể tải danh sách thông báo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        err.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () => ref.refresh(
                            notificationsProvider(page: 1, limit: 100),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F172A),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Thử lại',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (controllerState.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.2),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF0F172A)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    WidgetRef ref,
    model.Notification item,
  ) {
    final isUnread = !item.isRead;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xFFF8FAFC) : Colors.white,
        // Tone-on-tone highlight cho unread
        borderRadius: BorderRadius.circular(24),
        // Bo góc Card 24px
        border: Border.all(
          color: isUnread
              ? const Color(0xFF0F172A).withValues(alpha: 0.1)
              : const Color(0xFFF1F5F9),
          width: isUnread ? 1.5 : 1.0,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isUnread
                ? const Color(0xFF0F172A).withValues(alpha: 0.05)
                : const Color(0xFFF1F5F9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getNotificationIcon(item.title),
            color: isUnread ? const Color(0xFF0F172A) : const Color(0xFF64748B),
            size: 22,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xFF0F172A),
                  fontFamily: 'Inter',
                ),
              ),
            ),
            if (isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFBA1A1A), // Stitch Error color cho dot
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              item.content,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isUnread
                    ? const Color(0xFF334155)
                    : const Color(0xFF64748B),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _formatDate(item.dateCreated),
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF94A3B8),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        onTap: () {
          if (isUnread) {
            ref.read(notificationsControllerProvider.notifier).markAsRead([
              item.id,
            ]);
          }
        },
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
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF1F5F9),
      highlightColor: const Color(0xFFF8FAFC),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications_off_rounded,
              size: 64,
              color: Color(0xFF94A3B8),
            ),
            const SizedBox(height: 16),
            const Text(
              'Không có thông báo mới',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mọi cập nhật quan trọng về đơn hàng của bạn sẽ được hiển thị tại đây.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
