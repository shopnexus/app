import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/money_utils.dart';
import '../../data/models/account_model.dart';
import '../providers/buyer_orders_provider.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(buyerOrderControllerProvider, (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hủy sản phẩm thất bại: $err'),
              backgroundColor: const Color(
                0xFFBA1A1A,
              ), // Đổi sang màu Error Stitch
            ),
          );
        },
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Hủy sản phẩm thành công, tiền đã hoàn về ví!'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Đơn hàng của tôi',
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
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF0F172A),
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: const Color(0xFF0F172A),
          indicatorWeight: 2,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Inter',
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13,
            fontFamily: 'Inter',
          ),
          tabs: const [
            Tab(text: 'Chờ duyệt'),
            Tab(text: 'Đang xử lý'),
            Tab(text: 'Hoàn thành'),
            Tab(text: 'Đã hủy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _PendingItemsTab(),
          _PendingOrdersTab(),
          _CompletedOrdersTab(),
          _CancelledOrdersTab(),
        ],
      ),
    );
  }
}

// ======================== TAB 1: PENDING ITEMS ========================
class _PendingItemsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingItemsAsync = ref.watch(buyerPendingItemsProvider());
    final controllerState = ref.watch(buyerOrderControllerProvider);

    return RefreshIndicator(
      onRefresh: () => ref.refresh(buyerPendingItemsProvider().future),
      child: pendingItemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const _EmptyState(
              icon: Icons.hourglass_empty_rounded,
              title: 'Không có sản phẩm chờ duyệt',
              subtitle: 'Các món lẻ chờ shop gom đơn sẽ xuất hiện ở đây.',
            );
          }
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _buildPendingItemCard(context, ref, item);
                },
              ),
              if (controllerState.isLoading) const ContainerOverlayLoading(),
            ],
          );
        },
        loading: () => _buildShimmerList(),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerPendingItemsProvider()),
        ),
      ),
    );
  }

  Widget _buildPendingItemCard(
    BuildContext context,
    WidgetRef ref,
    BuyerOrderItem item,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 72,
                    height: 72,
                    color: const Color(0xFFF1F5F9),
                    child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                        ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                        : const Icon(
                            Icons.image_rounded,
                            color: Color(0xFF94A3B8),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.skuName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SL: x${item.quantity}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                              fontFamily: 'Inter',
                            ),
                          ),
                          Text(
                            MoneyUtils.format(item.totalAmount),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xFF64748B),
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Đang chờ gom đơn',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                // Nút bấm cao 48px và bo góc 12px theo chuẩn Stitch
                SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () => _confirmCancelItem(context, ref, item),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBA1A1A)),
                      // Màu Error Stitch
                      foregroundColor: const Color(0xFFBA1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: const Text(
                      'Hủy sản phẩm',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmCancelItem(
    BuildContext context,
    WidgetRef ref,
    BuyerOrderItem item,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Hủy đơn sản phẩm',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn hủy sản phẩm này? Tiền thanh toán sẽ được hoàn trả tự động về ví nội bộ của bạn.',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Hủy bỏ',
              style: TextStyle(color: Color(0xFF64748B), fontFamily: 'Inter'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref
                  .read(buyerOrderControllerProvider.notifier)
                  .cancelPendingItem(item.id.toString());
            },
            child: const Text(
              'Đồng ý',
              style: TextStyle(color: Color(0xFFBA1A1A), fontFamily: 'Inter'),
            ), // Đổi sang màu Error Stitch
          ),
        ],
      ),
    );
  }
}

// ======================== TAB 2: PENDING ORDERS ========================
class _PendingOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingOrdersAsync = ref.watch(buyerPendingOrdersProvider());

    return RefreshIndicator(
      onRefresh: () => ref.refresh(buyerPendingOrdersProvider().future),
      child: pendingOrdersAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const _EmptyState(
              icon: Icons.local_shipping_outlined,
              title: 'Không có đơn hàng nào',
              subtitle:
                  'Đơn hàng đang xử lý hoặc vận chuyển sẽ hiển thị tại đây.',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return _buildOrderCard(context, order);
            },
          );
        },
        loading: () => _buildShimmerList(),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerPendingOrdersProvider()),
        ),
      ),
    );
  }
}

// ======================== TAB 3: COMPLETED ORDERS ========================
class _CompletedOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedOrdersAsync = ref.watch(buyerCompletedOrdersProvider());

    return RefreshIndicator(
      onRefresh: () => ref.refresh(buyerCompletedOrdersProvider().future),
      child: completedOrdersAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const _EmptyState(
              icon: Icons.task_alt_rounded,
              title: 'Chưa có đơn hoàn thành',
              subtitle: 'Đơn hàng giao thành công sẽ lưu lịch sử tại đây.',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return _buildOrderCard(context, order);
            },
          );
        },
        loading: () => _buildShimmerList(),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerCompletedOrdersProvider()),
        ),
      ),
    );
  }
}

// ======================== TAB 4: CANCELLED ORDERS / ITEMS ========================
class _CancelledOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelledOrdersAsync = ref.watch(buyerCancelledOrdersProvider());
    final cancelledItemsAsync = ref.watch(buyerCancelledItemsProvider());

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(buyerCancelledOrdersProvider);
        ref.invalidate(buyerCancelledItemsProvider);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Official Cancelled Orders
            const Text(
              'Đơn hàng chính thức bị hủy',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 12),
            cancelledOrdersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return const Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Center(
                        child: Text(
                          'Không có đơn hàng chính thức nào bị hủy',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, index) =>
                      _buildOrderCard(context, orders[index]),
                );
              },
              loading: () => const _LoadingShimmerBox(),
              error: (err, stack) => const Text('Lỗi tải danh sách đơn hủy'),
            ),
            const SizedBox(height: 24),

            // Section 2: Cancelled Pending Items
            const Text(
              'Sản phẩm chờ đã hủy / từ chối',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 12),
            cancelledItemsAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return const Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Center(
                        child: Text(
                          'Không có sản phẩm chờ gom nào bị hủy',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _buildCancelledItemCard(item);
                  },
                );
              },
              loading: () => const _LoadingShimmerBox(),
              error: (err, stack) => const Text('Lỗi tải sản phẩm hủy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelledItemCard(BuyerOrderItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Bo góc Card 24px
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 60,
              height: 60,
              color: const Color(0xFFF1F5F9),
              child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                  ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                  : const Icon(Icons.image_rounded, color: Color(0xFF94A3B8)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.skuName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SL: x${item.quantity}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      MoneyUtils.format(item.totalAmount),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBA1A1A), // Đổi sang màu Error Stitch
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================== COMMON CARD BUILDERS & WIDGETS ========================
Widget _buildOrderCard(BuildContext context, BuyerOrder order) {
  final firstItem = order.items.isNotEmpty ? order.items.first : null;
  final totalItems = order.items.fold<int>(
    0,
    (prev, element) => prev + element.quantity,
  );

  return GestureDetector(
    onTap: () => context.push('/account/order-detail/${order.id}'),
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Bo góc Card 24px
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mã đơn: #${order.id.substring(0, 8)}...',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                    fontFamily: 'Inter',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.transport?.status ?? 'Chuẩn bị hàng',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0F172A),
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24, color: Color(0xFFF1F5F9)),
            if (firstItem != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: const Color(0xFFF1F5F9),
                      child:
                          firstItem.imageUrl != null &&
                              firstItem.imageUrl!.isNotEmpty
                          ? Image.network(
                              firstItem.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.image_rounded,
                              color: Color(0xFF94A3B8),
                            ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstItem.skuName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Mã biến thể: ${firstItem.skuId.substring(0, 8)}...',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF94A3B8),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (order.items.length > 1) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Xem thêm ${order.items.length - 1} sản phẩm khác',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
            const Divider(height: 24, color: Color(0xFFF1F5F9)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng số lượng: $totalItems',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                    fontFamily: 'Inter',
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Thành tiền: ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      MoneyUtils.format(order.totalAmount),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 56, color: const Color(0xFF94A3B8)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
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

class _ErrorState extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 40,
              color: Color(0xFFBA1A1A),
            ), // Màu Error Stitch
            const SizedBox(height: 12),
            const Text(
              'Không thể tải dữ liệu đơn hàng',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 6),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            // Nút bấm cao 48px và bo góc 12px theo chuẩn Stitch
            SizedBox(
              height: 48,
              width: 120,
              child: OutlinedButton(
                onPressed: onRetry,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0F172A)),
                  foregroundColor: const Color(0xFF0F172A),
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
    );
  }
}

Widget _buildShimmerList() {
  return Shimmer.fromColors(
    baseColor: const Color(0xFFF1F5F9),
    highlightColor: const Color(0xFFF8FAFC),
    child: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24), // Bo góc 24px
        ),
      ),
    ),
  );
}

class _LoadingShimmerBox extends StatelessWidget {
  const _LoadingShimmerBox();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF1F5F9),
      highlightColor: const Color(0xFFF8FAFC),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24), // Bo góc 24px
        ),
      ),
    );
  }
}

class ContainerOverlayLoading extends StatelessWidget {
  const ContainerOverlayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.2),
      child: const Center(
        child: CircularProgressIndicator(color: Color(0xFF0F172A)),
      ),
    );
  }
}
