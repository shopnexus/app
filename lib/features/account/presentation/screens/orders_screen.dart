import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../refund/presentation/screens/refund_list_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../data/models/account_model.dart';
import '../providers/buyer_orders_provider.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  final int initialTab;

  const OrdersScreen({super.key, this.initialTab = 0});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = const [
    'Tất cả',
    'Chờ duyệt',
    'Đang xử lý',
    'Hoàn thành',
    'Đã hủy',
    'Hoàn tiền',
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
              content: Text('Hủy sản phẩm thành công, tiền đã hoàn về ví!'),
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
          const RefundListScreen(showAppBar: false),
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
    final pendingItemsAsync = ref.watch(buyerPendingItemsProvider());
    final pendingOrdersAsync = ref.watch(buyerPendingOrdersProvider());
    final completedOrdersAsync = ref.watch(buyerCompletedOrdersProvider());
    final cancelledOrdersAsync = ref.watch(buyerCancelledOrdersProvider());

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
        ref.invalidate(buyerPendingItemsProvider);
        ref.invalidate(buyerPendingOrdersProvider);
        ref.invalidate(buyerCompletedOrdersProvider);
        ref.invalidate(buyerCancelledOrdersProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          if (pendingItems.isNotEmpty) ...[
            _buildSectionHeader(context, 'SẢN PHẨM CHỜ DUYỆT GOM ĐƠN'),
            ...pendingItems.map(
              (item) => _buildPendingItemCard(context, ref, item),
            ),
            const SizedBox(height: 12),
          ],
          if (pendingOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐANG XỬ LÝ / VẬN CHUYỂN'),
            ...pendingOrders.map((order) => _buildOrderCard(context, order)),
            const SizedBox(height: 12),
          ],
          if (completedOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐÃ HOÀN THÀNH'),
            ...completedOrders.map((order) => _buildOrderCard(context, order)),
            const SizedBox(height: 12),
          ],
          if (cancelledOrders.isNotEmpty) ...[
            _buildSectionHeader(context, 'ĐƠN HÀNG ĐÃ HỦY'),
            ...cancelledOrders.map((order) => _buildOrderCard(context, order)),
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
    final pendingItemsAsync = ref.watch(buyerPendingItemsProvider());
    final controllerState = ref.watch(buyerOrderControllerProvider);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
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
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerPendingItemsProvider()),
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
    final pendingOrdersAsync = ref.watch(buyerPendingOrdersProvider());

    return RefreshIndicator(
      color: theme.colorScheme.primary,
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
        loading: () => _buildShimmerList(context),
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
    final theme = Theme.of(context);
    final completedOrdersAsync = ref.watch(buyerCompletedOrdersProvider());

    return RefreshIndicator(
      color: theme.colorScheme.primary,
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
        loading: () => _buildShimmerList(context),
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cancelledOrdersAsync = ref.watch(buyerCancelledOrdersProvider());
    final cancelledItemsAsync = ref.watch(buyerCancelledItemsProvider());

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
                    final item = items[index];
                    return _buildCancelledItemCard(context, item);
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

  Widget _buildCancelledItemCard(BuildContext context, BuyerOrderItem item) {
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
                    child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                        ? Image.network(item.imageUrl!, fit: BoxFit.cover)
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
                              item.skuName,
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
                            'SL: x${item.quantity}',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Text(
                            MoneyUtils.format(item.totalAmount),
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
Widget _buildOrderCard(BuildContext context, BuyerOrder order) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  final firstItem = order.items.isNotEmpty ? order.items.first : null;
  final totalItems = order.items.fold<int>(
    0,
    (prev, element) => prev + element.quantity,
  );
  final rawStatus = order.transport?.status ?? 'Đang xử lý';

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
                _buildStatusBadge(context, rawStatus),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: dividerColor),
            const SizedBox(height: 12),

            // Item Details
            if (firstItem != null)
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
                          firstItem.imageUrl != null &&
                              firstItem.imageUrl!.isNotEmpty
                          ? Image.network(
                              firstItem.imageUrl!,
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
                          firstItem.skuName,
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
                              'SL: x${firstItem.quantity}',
                              style: TextStyle(
                                fontSize: 13,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFamily: 'Inter',
                              ),
                            ),
                            Text(
                              MoneyUtils.format(firstItem.totalAmount),
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

            if (order.items.length > 1) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Xem thêm ${order.items.length - 1} sản phẩm khác...',
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
                      TextSpan(text: '$totalItems sản phẩm: '),
                      TextSpan(
                        text: MoneyUtils.format(order.totalAmount),
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
  BuyerOrderItem item,
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
                  child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                      ? Image.network(item.imageUrl!, fit: BoxFit.cover)
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
                            item.skuName,
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
                        _buildStatusBadge(context, 'Chờ gom đơn'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SL: x${item.quantity}',
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          MoneyUtils.format(item.totalAmount),
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
                    'Chờ shop xác nhận',
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
                onTap: () => _confirmCancelItem(context, ref, item),
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
  BuyerOrderItem item,
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
        'Bạn có chắc chắn muốn hủy sản phẩm này? Tiền thanh toán sẽ được hoàn trả tự động về ví nội bộ của bạn.',
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
                .cancelPendingItem(item.id.toString());
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
