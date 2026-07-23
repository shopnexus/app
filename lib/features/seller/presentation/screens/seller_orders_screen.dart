import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../data/models/seller_model.dart';
import '../providers/seller_orders_provider.dart';

class SellerOrdersScreen extends ConsumerStatefulWidget {
  final int initialTab;

  const SellerOrdersScreen({super.key, this.initialTab = 0});

  @override
  ConsumerState<SellerOrdersScreen> createState() => _SellerOrdersScreenState();
}

class _SellerOrdersScreenState extends ConsumerState<SellerOrdersScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.initialTab != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(sellerOrdersProvider.notifier).setTab(widget.initialTab);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(sellerOrdersProvider);
    final notifier = ref.read(sellerOrdersProvider.notifier);

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Đơn hàng bán',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          const SizedBox(width: 4),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.refresh();
        },
        child: Column(
          children: [
            // Status Tabs Filter Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildTabChip(
                    context,
                    label: 'Chờ xác nhận',
                    count: state.pendingItems.length,
                    isSelected: state.selectedTab == 0,
                    onTap: () => notifier.setTab(0),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Đang xử lý',
                    count: state.confirmedOrders
                        .where((o) => o.status == 'processing')
                        .length,
                    isSelected: state.selectedTab == 1,
                    onTap: () => notifier.setTab(1),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Đang giao',
                    count: state.confirmedOrders
                        .where((o) => o.status == 'shipping')
                        .length,
                    isSelected: state.selectedTab == 2,
                    onTap: () => notifier.setTab(2),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Đã giao',
                    count: state.confirmedOrders
                        .where((o) => o.status == 'completed')
                        .length,
                    isSelected: state.selectedTab == 3,
                    onTap: () => notifier.setTab(3),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Khiếu nại / Hủy',
                    count: state.confirmedOrders
                        .where(
                          (o) =>
                              o.status == 'disputing' ||
                              o.status == 'cancelled',
                        )
                        .length,
                    isSelected: state.selectedTab == 4,
                    onTap: () => notifier.setTab(4),
                  ),
                ],
              ),
            ),

            // Orders / Items List
            Expanded(
              child: state.isLoading
                  ? _buildShimmerList(isDark)
                  : (state.selectedTab == 0
                        ? _buildPendingItemsList(context, state, notifier)
                        : _buildConfirmedOrdersList(context, state)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabChip(
    BuildContext context, {
    required String label,
    int? count,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isDark ? const Color(0xFF1E293B) : const Color(0xFFECEEED)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : (isDark
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF3F4947)),
              ),
            ),
            if (count != null && count > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.primary : Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // --- TAB 0: PENDING ITEMS LIST ---
  Widget _buildPendingItemsList(
    BuildContext context,
    SellerOrdersState state,
    SellerOrdersNotifier notifier,
  ) {
    if (state.pendingItems.isEmpty) {
      return _buildEmptyView(context, 'Không có sản phẩm nào chờ xác nhận');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.pendingItems.length,
      itemBuilder: (context, index) {
        final item = state.pendingItems[index];
        return _buildPendingItemCard(
          context,
          item,
          notifier,
          state.isActionLoading,
        );
      },
    );
  }

  Widget _buildPendingItemCard(
    BuildContext context,
    SellerPendingItem item,
    SellerOrdersNotifier notifier,
    bool isActionLoading,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : const Color(0xFFF1F5F9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Buyer Info & Order ID & Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                    child: Text(
                      (item.buyerName ?? 'B')[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.buyerName ?? 'Khách hàng',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  item.orderId != null ? '#${item.orderId}' : 'Chờ gom đơn',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF92400E),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          // Item Product Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF1F5F9),
                  image: item.thumbnail != null
                      ? DecorationImage(
                          image: NetworkImage(item.thumbnail!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: item.thumbnail == null
                    ? const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF94A3B8),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName ?? 'Sản phẩm gom đơn',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    if (item.skuName != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Phân loại: ${item.skuName}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'x${item.quantity}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          MoneyUtils.format(item.price * item.quantity),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Total & Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: isActionLoading
                      ? null
                      : () async {
                          await notifier.rejectPendingItem(item.id);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Đã từ chối đơn gom'),
                              ),
                            );
                          }
                        },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Từ chối'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: isActionLoading
                      ? null
                      : () async {
                          await notifier.confirmPendingItem(item.id);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Đã xác nhận đơn gom thành công!',
                                ),
                                backgroundColor: Color(0xFF10B981),
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Xác nhận gom đơn'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- TABS 1-4: CONFIRMED ORDERS LIST ---
  Widget _buildConfirmedOrdersList(
    BuildContext context,
    SellerOrdersState state,
  ) {
    String? targetStatus;
    switch (state.selectedTab) {
      case 1:
        targetStatus = 'processing';
        break;
      case 2:
        targetStatus = 'shipping';
        break;
      case 3:
        targetStatus = 'completed';
        break;
      case 4:
        targetStatus = 'disputing';
        break;
    }

    final filtered = state.confirmedOrders.where((order) {
      if (targetStatus == null) return true;
      if (targetStatus == 'disputing') {
        return order.status == 'disputing' || order.status == 'cancelled';
      }
      return order.status == targetStatus;
    }).toList();

    if (filtered.isEmpty) {
      return _buildEmptyView(context, 'Không có đơn hàng nào trong mục này');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final order = filtered[index];
        return _buildConfirmedOrderCard(context, order);
      },
    );
  }

  Widget _buildConfirmedOrderCard(BuildContext context, SellerOrder order) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : const Color(0xFFF1F5F9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mã đơn: #${order.id}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  order.status == 'shipping' ? 'Đang giao' : 'Đã xác nhận',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF065F46),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Khách hàng: ${order.buyerName ?? "Minh Anh"}',
            style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
          ),
          if (order.shippingAddress != null)
            Text(
              'Địa chỉ: ${order.shippingAddress}',
              style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tổng thanh toán:'),
              Text(
                MoneyUtils.format(order.totalAmount),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.push('/chat'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Chat khách'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('In vận đơn'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList(bool isDark) {
    final baseColor = isDark
        ? const Color(0xFF1E293B)
        : const Color(0xFFE2E8F0);
    final highlightColor = isDark
        ? const Color(0xFF334155)
        : const Color(0xFFF1F5F9);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          height: 160,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.receipt_long_outlined,
            size: 48,
            color: Color(0xFF94A3B8),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
