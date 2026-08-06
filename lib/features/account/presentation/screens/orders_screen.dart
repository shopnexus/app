import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/buyer_orders_provider.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  final int initialTab;

  const OrdersScreen({super.key, this.initialTab = 0});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 'Chờ thanh toán' is about the *money*, not about the seller: a line sits
  // here only while the payment has not produced an order yet. Waiting for the
  // seller to confirm is a different wait and a later one — it happens on an
  // order that already exists, so it belongs in 'Đang xử lý'.
  final List<String> _tabs = const [
    'Tất cả',
    'Chờ thanh toán',
    'Đang xử lý',
    'Hoàn thành',
    'Đã hủy',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: widget.initialTab,
    );
    _tabController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant OrdersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTab != widget.initialTab) {
      _tabController.animateTo(widget.initialTab);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    ref.listen<AsyncValue<void>>(buyerOrderControllerProvider, (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hủy sản phẩm thất bại: $err'),
              backgroundColor: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFBA1A1A),
            ),
          );
        },
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã hủy sản phẩm, số lượng được trả lại kho.'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Đơn mua của tôi',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            color: theme.colorScheme.surface,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  final isSelected = _tabController.index == index;
                  final unselectedBg = isDarkMode
                      ? theme.colorScheme.surfaceContainerHighest
                      : const Color(0xFFF1F5F9);

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Material(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : unselectedBg,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            _tabController.animateTo(index);
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                color: isSelected
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const _AllOrdersTab(),
          _PendingItemsTab(),
          _PendingOrdersTab(),
          _CompletedOrdersTab(),
          _CancelledOrdersTab(),
        ],
      ),
    );
  }
}

// ======================== TAB 0: ALL ORDERS ========================
class _AllOrdersTab extends ConsumerWidget {
  const _AllOrdersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pendingItemsAsync = ref.watch(buyerUnsettledItemsProvider);
    final pendingOrdersAsync = ref.watch(buyerOpenOrdersProvider);
    final completedOrdersAsync = ref.watch(buyerCompletedOrdersProvider);
    final cancelledOrdersAsync = ref.watch(buyerCancelledOrdersProvider);

    final isLoading =
        pendingItemsAsync.isLoading ||
        pendingOrdersAsync.isLoading ||
        completedOrdersAsync.isLoading ||
        cancelledOrdersAsync.isLoading;

    if (isLoading) {
      return _buildShimmerList(context);
    }

    final pendingItems = pendingItemsAsync.value ?? [];
    final pendingOrders = pendingOrdersAsync.value ?? [];
    final completedOrders = completedOrdersAsync.value ?? [];
    final cancelledOrders = cancelledOrdersAsync.value ?? [];

    if (pendingItems.isEmpty &&
        pendingOrders.isEmpty &&
        completedOrders.isEmpty &&
        cancelledOrders.isEmpty) {
      return const _EmptyState(
        icon: Icons.assignment_turned_in_rounded,
        title: 'Chưa có đơn hàng nào',
        subtitle: 'Thông tin đơn hàng của bạn sẽ được hiển thị ở đây.',
      );
    }

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () async {
        ref.invalidate(buyerUnsettledItemsProvider);
        ref.invalidate(buyerOpenOrdersProvider);
        ref.invalidate(buyerCompletedOrdersProvider);
        ref.invalidate(buyerCancelledOrdersProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          if (pendingItems.isNotEmpty) ...[
            _buildSectionHeader(context, 'SẢN PHẨM CHỜ HOÀN TẤT THANH TOÁN'),
            ...pendingItems.map(
              (line) => _buildPendingItemCard(context, ref, line),
            ),
            const SizedBox(height: 12),
          ],
          if (pendingOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐANG XỬ LÝ / VẬN CHUYỂN'),
            ...pendingOrders.map((view) => _buildOrderCard(context, view)),
            const SizedBox(height: 12),
          ],
          if (completedOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐÃ HOÀN THÀNH'),
            ...completedOrders.map((view) => _buildOrderCard(context, view)),
            const SizedBox(height: 12),
          ],
          if (cancelledOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐÃ HỦY'),
            ...cancelledOrders.map((view) => _buildOrderCard(context, view)),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 6.0, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurfaceVariant,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

// ======================== TAB 1: PENDING ITEMS ========================
class _PendingItemsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pendingItemsAsync = ref.watch(buyerUnsettledItemsProvider);
    final controllerState = ref.watch(buyerOrderControllerProvider);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () => ref.refresh(buyerUnsettledItemsProvider.future),
      child: pendingItemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const _EmptyState(
              icon: Icons.hourglass_empty_rounded,
              title: 'Không có sản phẩm chờ thanh toán',
              subtitle: 'Sản phẩm đã đặt mà tiền chưa vào sẽ xuất hiện ở đây.',
            );
          }
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    _buildPendingItemCard(context, ref, items[index]),
              ),
              if (controllerState.isLoading) const ContainerOverlayLoading(),
            ],
          );
        },
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerUnsettledItemsProvider),
        ),
      ),
    );
  }
}

// ======================== TAB 2: PENDING ORDERS ========================
class _PendingOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pendingOrdersAsync = ref.watch(buyerOpenOrdersProvider);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () => ref.refresh(buyerOpenOrdersProvider.future),
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
              return _buildOrderCard(context, orders[index]);
            },
          );
        },
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerOpenOrdersProvider),
        ),
      ),
    );
  }
}

// ======================== TAB 3: COMPLETED ORDERS ========================
class _CompletedOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final completedOrdersAsync = ref.watch(buyerCompletedOrdersProvider);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () => ref.refresh(buyerCompletedOrdersProvider.future),
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
              return _buildOrderCard(context, orders[index]);
            },
          );
        },
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerCompletedOrdersProvider),
        ),
      ),
    );
  }
}

// ======================== TAB 4: CANCELLED ORDERS / ITEMS ========================
class _CancelledOrdersTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cancelledOrdersAsync = ref.watch(buyerCancelledOrdersProvider);
    final cancelledItemsAsync = ref.watch(buyerCancelledItemsProvider);

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E8F0);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
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
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                'ĐƠN HÀNG ĐÃ HỦY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.6,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            cancelledOrdersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: cardBorderColor),
                    ),
                    child: Center(
                      child: Text(
                        'Không có đơn hàng chính thức nào bị hủy',
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                          fontFamily: 'Inter',
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
            const SizedBox(height: 20),

            // Section 2: Cancelled Pending Items
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                'SẢN PHẨM CHỜ ĐÃ HỦY / TỪ CHỐI',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.6,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            cancelledItemsAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: cardBorderColor),
                    ),
                    child: Center(
                      child: Text(
                        'Không có sản phẩm chờ gom nào bị hủy',
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                          fontFamily: 'Inter',
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
                    return _buildCancelledItemCard(context, items[index]);
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

  Widget _buildCancelledItemCard(BuildContext context, OrderLineView line) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFE2E8F0);
    final imageBgColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF1F5F9);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 72,
                    height: 72,
                    color: imageBgColor,
                    child: line.imageUrl != null && line.imageUrl!.isNotEmpty
                        ? Image.network(line.imageUrl!, fit: BoxFit.cover)
                        : Icon(
                            Icons.image_rounded,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              line.displayName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildStatusBadge(context, 'Đã hủy'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SL: x${line.item.quantity}',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Text(
                            MoneyUtils.format(
                              line.item.totalAmount,
                              currency: line.item.currency,
                            ),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
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
          ],
        ),
      ),
    );
  }
}

// ======================== COMMON STITCH CARD BUILDERS ========================

/// Xây dựng thẻ đơn hàng chính (Order Card) theo phong cách Stitch/Seller Center
Widget _buildOrderCard(BuildContext context, OrderView view) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  final order = view.order;
  final firstLine = view.lines.isEmpty ? null : view.lines.first;
  final status = view.statusLabel;

  final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
  final cardBorderColor = isDarkMode
      ? AppColors.darkPrimary.withAlpha(40)
      : const Color(0xFFE2E8F0);
  final imageBgColor = isDarkMode
      ? theme.colorScheme.surfaceContainerHighest
      : const Color(0xFFF1F5F9);
  final dividerColor = isDarkMode
      ? AppColors.darkPrimary.withAlpha(30)
      : const Color(0xFFF1F5F9);

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: cardBgColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: cardBorderColor),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.03),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => context.push('/account/order-detail/${order.id}'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header: Shop Avatar / Order Code & Status Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: imageBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.storefront_rounded,
                        size: 18,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Mã đơn: #${order.id.length > 8 ? order.id.substring(0, 8) : order.id}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                _buildStatusBadge(context, status),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: dividerColor),
            const SizedBox(height: 12),

            // Item Details
            if (firstLine != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 76,
                      height: 76,
                      color: imageBgColor,
                      child:
                          firstLine.imageUrl != null &&
                              firstLine.imageUrl!.isNotEmpty
                          ? Image.network(
                              firstLine.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.image_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstLine.displayName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SL: x${firstLine.item.quantity}',
                              style: TextStyle(
                                fontSize: 13,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFamily: 'Inter',
                              ),
                            ),
                            Text(
                              MoneyUtils.format(
                                firstLine.item.totalAmount,
                                currency: firstLine.item.currency,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurfaceVariant,
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

            if (view.lines.length > 1) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Xem thêm ${view.lines.length - 1} sản phẩm khác...',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],

            const SizedBox(height: 12),
            Divider(height: 1, color: dividerColor),
            const SizedBox(height: 12),

            // Footer Summary & Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    children: [
                      TextSpan(text: '${view.quantity} sản phẩm: '),
                      TextSpan(
                        text: MoneyUtils.format(
                          order.total,
                          currency: order.currency,
                        ),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                // Action Pill Button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Chi tiết',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

/// Xây dựng thẻ sản phẩm chờ gom đơn lẻ (Pending Item Card)
Widget _buildPendingItemCard(
  BuildContext context,
  WidgetRef ref,
  OrderLineView line,
) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
  final cardBorderColor = isDarkMode
      ? AppColors.darkPrimary.withAlpha(40)
      : const Color(0xFFE2E8F0);
  final imageBgColor = isDarkMode
      ? theme.colorScheme.surfaceContainerHighest
      : const Color(0xFFF1F5F9);
  final dividerColor = isDarkMode
      ? AppColors.darkPrimary.withAlpha(30)
      : const Color(0xFFF1F5F9);

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: cardBgColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: cardBorderColor),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.03),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Item details row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 76,
                  height: 76,
                  color: imageBgColor,
                  child: line.imageUrl != null && line.imageUrl!.isNotEmpty
                      ? Image.network(line.imageUrl!, fit: BoxFit.cover)
                      : Icon(
                          Icons.image_rounded,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            line.displayName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildStatusBadge(context, 'Chờ thanh toán'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SL: x${line.item.quantity}',
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          MoneyUtils.format(
                            line.item.totalAmount,
                            currency: line.item.currency,
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
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
          const SizedBox(height: 12),
          Divider(height: 1, color: dividerColor),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Chờ hoàn tất thanh toán',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              // Nút bấm Hủy dạng Outlined Pill
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _confirmCancelItem(context, ref, line),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFFEF4444).withAlpha(30)
                        : const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDarkMode
                          ? const Color(0xFFEF4444).withAlpha(80)
                          : const Color(0xFFFECDD3),
                    ),
                  ),
                  child: Text(
                    'Hủy sản phẩm',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xFFEF4444)
                          : const Color(0xFFE11D48),
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

void _confirmCancelItem(
  BuildContext context,
  WidgetRef ref,
  OrderLineView line,
) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      title: Text(
        'Hủy đơn sản phẩm',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: theme.colorScheme.onSurface,
        ),
      ),
      content: Text(
        'Bạn có chắc chắn muốn hủy sản phẩm này? Chỉ sản phẩm chưa thanh toán mới hủy được; số lượng sẽ trả lại kho.',
        style: TextStyle(
          fontFamily: 'Inter',
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Hủy bỏ',
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'Inter',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            ref
                .read(buyerOrderControllerProvider.notifier)
                .cancelItem(line.item.id);
          },
          child: Text(
            'Đồng ý',
            style: TextStyle(
              color: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFBA1A1A),
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    ),
  );
}

/// Tag/Badge hiển thị trạng thái sản phẩm hay đơn hàng theo màu Stitch
Widget _buildStatusBadge(BuildContext context, String status) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  Color bgColor = isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9);
  Color textColor = isDarkMode ? Colors.grey[300]! : const Color(0xFF475569);

  if (status.contains('Chờ') || status.contains('pending')) {
    bgColor = isDarkMode
        ? const Color(0xFFD97706).withAlpha(40)
        : const Color(0xFFFEF3C7);
    textColor = isDarkMode ? const Color(0xFFFBBF24) : const Color(0xFFD97706);
  } else if (status.contains('giao') ||
      status.contains('xử lý') ||
      status.contains('Shipping')) {
    bgColor = isDarkMode
        ? const Color(0xFF0284C7).withAlpha(40)
        : const Color(0xFFDBEAFE);
    textColor = isDarkMode ? const Color(0xFF38BDF8) : const Color(0xFF0284C7);
  } else if (status.contains('thành') || status.contains('Completed')) {
    bgColor = isDarkMode
        ? const Color(0xFF059669).withAlpha(40)
        : const Color(0xFFD1FAE5);
    textColor = isDarkMode ? const Color(0xFF34D399) : const Color(0xFF059669);
  } else if (status.contains('hủy') || status.contains('Cancelled')) {
    bgColor = isDarkMode
        ? const Color(0xFFDC2626).withAlpha(40)
        : const Color(0xFFFEE2E2);
    textColor = isDarkMode ? const Color(0xFFF87171) : const Color(0xFFDC2626);
  } else if (status.contains('tiền') || status.contains('Refund')) {
    bgColor = isDarkMode
        ? const Color(0xFFEF4444).withAlpha(40)
        : const Color(0xFFFFDAD6);
    textColor = isDarkMode ? const Color(0xFFF87171) : const Color(0xFFBA1A1A);
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: 'Inter',
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 36,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
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

class _ErrorState extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 44,
              color: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFBA1A1A),
            ),
            const SizedBox(height: 14),
            Text(
              'Không thể tải dữ liệu đơn hàng',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
              width: 130,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Thử lại',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    fontSize: 14,
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

Widget _buildShimmerList(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Shimmer.fromColors(
    baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
    highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
    child: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 160,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

class _LoadingShimmerBox extends StatelessWidget {
  const _LoadingShimmerBox();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class ContainerOverlayLoading extends StatelessWidget {
  const ContainerOverlayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.black.withValues(alpha: 0.3),
      child: Center(
        child: CircularProgressIndicator(color: theme.colorScheme.primary),
      ),
    );
  }
}
