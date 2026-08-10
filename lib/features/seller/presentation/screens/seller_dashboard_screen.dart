import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_dashboard_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_orders_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/widgets/seller_menu_item_tile.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';

class SellerDashboardScreen extends ConsumerWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final dashboardAsync = ref.watch(sellerDashboardProvider);
    final profileAsync = ref.watch(profileProvider);
    final sellerOrders = ref.watch(sellerAllOrdersProvider).value ?? [];
    final me = ref.watch(profileProvider).value?.id;
    final refundsAsync = ref.watch(refundListProvider);
    final sellerRefunds =
        refundsAsync.value?.where((r) => r.buyerId != me).toList() ?? const [];
    final sellerRefundedOrderIds = sellerRefunds.map((r) => r.orderId).toSet();

    int getSellerOrderCount(int tabIndex) {
      return sellerOrders.where((v) {
        final isCancelled =
            v.order.state == OrderState.cancelled ||
            v.order.cancelledAt != null;
        final isDelivered =
            v.order.transport?.status == TransportStatus.delivered;
        final isCompleted =
            v.order.state == OrderState.completed ||
            v.order.receivedAt != null ||
            v.order.completedAt != null ||
            isDelivered;

        switch (tabIndex) {
          case 1: // Chờ xác nhận
            return v.order.state == OrderState.awaitingConfirmation &&
                !isCancelled;
          case 2: // Đang xử lý
            return v.order.state == OrderState.open &&
                !isCompleted &&
                v.order.transport?.status != TransportStatus.returned &&
                !isCancelled;
          case 3: // Hoàn thành
            return isCompleted && !isCancelled;
          case 4: // Hoàn tiền
            return (v.order.declineReason != null ||
                    v.order.transport?.status == TransportStatus.returned ||
                    sellerRefundedOrderIds.contains(v.order.id)) &&
                !isCancelled;
          case 5: // Đã hủy
            return isCancelled;
          default:
            return false;
        }
      }).length;
    }

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: context.canPop()
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
                onPressed: () => context.pop(),
              )
            : null,
        title: profileAsync.when(
          data: (profile) => Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                backgroundImage:
                    profile.avatarUrl != null && profile.avatarUrl!.isNotEmpty
                    ? NetworkImage(profile.avatarUrl!)
                    : null,
                child: profile.avatarUrl == null || profile.avatarUrl!.isEmpty
                    ? Text(
                        (profile.name.isNotEmpty
                                ? profile.name
                                : (profile.username ?? 'S'))[0]
                            .toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Xin chào, ${profile.name.isNotEmpty ? profile.name : (profile.username ?? 'Người bán')}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ],
          ),
          loading: () => Text(
            'Kênh Người Bán',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
            ),
          ),
          error: (_, _) => Text(
            'Kênh Người Bán',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(sellerDashboardProvider.notifier).refresh();
        },
        child: dashboardAsync.when(
          data: (dashboard) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Orders Section ---
                _buildSectionHeader(
                  context,
                  title: 'Đơn bán',
                  onSeeAll: () {
                    context.push('/seller/orders');
                  },
                ),
                const SizedBox(height: 10),
                // The contract's own three states. `processing`/`shipping`/
                // `disputing` were never states of an order: where the parcel is
                // comes off `order.transport`, and a dispute is a refund.
                Column(
                  children: [
                    SellerMenuItemTile(
                      title: 'Chờ xác nhận',
                      icon: Icons.hourglass_top_rounded,
                      iconColor: const Color(0xFF3B82F6),
                      iconBgColor: const Color(
                        0xFF3B82F6,
                      ).withValues(alpha: 0.12),
                      count: getSellerOrderCount(1),
                      onTap: () => context.push('/seller/orders?tab=1'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Đang xử lý',
                      icon: Icons.pending_actions,
                      iconColor: const Color(0xFFF59E0B),
                      iconBgColor: const Color(
                        0xFFF59E0B,
                      ).withValues(alpha: 0.12),
                      count: dashboard.summary.open,
                      onTap: () => context.push('/seller/orders?state=open'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Hoàn thành',
                      icon: Icons.check_circle_outline,
                      iconColor: const Color(0xFF10B981),
                      iconBgColor: const Color(
                        0xFF10B981,
                      ).withValues(alpha: 0.12),
                      count: dashboard.summary.completed,
                      onTap: () =>
                          context.push('/seller/orders?state=completed'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Hoàn tiền',
                      icon: Icons.assignment_return_outlined,
                      iconColor: const Color(0xFF8B5CF6),
                      iconBgColor: const Color(
                        0xFF8B5CF6,
                      ).withValues(alpha: 0.12),
                      count: getSellerOrderCount(4),
                      onTap: () => context.push('/seller/orders?tab=4'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Đã hủy',
                      icon: Icons.cancel_outlined,
                      iconColor: const Color(0xFFEF4444),
                      iconBgColor: const Color(
                        0xFFEF4444,
                      ).withValues(alpha: 0.12),
                      count: dashboard.summary.cancelled,
                      onTap: () =>
                          context.push('/seller/orders?state=cancelled'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // --- Products Section ---
                _buildSectionHeader(
                  context,
                  title: 'Sản phẩm của tôi',
                  onSeeAll: () {
                    context.push('/seller/products');
                  },
                ),
                const SizedBox(height: 10),
                // --- AI Video & Voice Description Wizard Banner ---
                _buildAiPostingBanner(context),
                const SizedBox(height: 12),
                Column(
                  children: [
                    SellerMenuItemTile(
                      title: 'Đang bán',
                      icon: Icons.inventory_2_outlined,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      count: dashboard.listingsWith(ListingStatus.active),
                      onTap: () =>
                          context.push('/seller/products?status=active'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Chờ duyệt',
                      icon: Icons.hourglass_empty,
                      iconColor: const Color(0xFFF59E0B),
                      iconBgColor: const Color(
                        0xFFF59E0B,
                      ).withValues(alpha: 0.12),
                      count: dashboard.listingsWith(ListingStatus.pending),
                      onTap: () =>
                          context.push('/seller/products?status=pending'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Đã ẩn',
                      icon: Icons.visibility_off_outlined,
                      iconColor: const Color(0xFF64748B),
                      iconBgColor: const Color(
                        0xFF64748B,
                      ).withValues(alpha: 0.12),
                      count: dashboard.listingsWith(ListingStatus.hidden),
                      onTap: () =>
                          context.push('/seller/products?status=hidden'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Nháp',
                      icon: Icons.edit_note,
                      iconColor: const Color(0xFF94A3B8),
                      iconBgColor: const Color(
                        0xFF94A3B8,
                      ).withValues(alpha: 0.12),
                      count: dashboard.listingsWith(ListingStatus.draft),
                      onTap: () =>
                          context.push('/seller/products?status=draft'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          loading: () => _buildShimmerLoading(context, isDark),
          error: (err, stack) =>
              _buildErrorWidget(context, err.toString(), ref),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    VoidCallback? onSeeAll,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        if (onSeeAll != null)
          InkWell(
            onTap: onSeeAll,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Text(
                    'Xem tất cả',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAiPostingBanner(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
              : [const Color(0xFF0F172A), const Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Đăng bán bằng AI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Chụp ảnh, nói vài câu — AI điền sẵn tin đăng để bạn sửa',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/seller/new-listing'),
              icon: const Icon(Icons.auto_awesome, size: 20),
              label: const Text('Đăng sản phẩm mới'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoading(BuildContext context, bool isDark) {
    final baseColor = isDark
        ? const Color(0xFF1E293B)
        : const Color(0xFFE2E8F0);
    final highlightColor = isDark
        ? const Color(0xFF334155)
        : const Color(0xFFF1F5F9);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: List.generate(
                4,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String error, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: Color(0xFFEF4444),
            ),
            const SizedBox(height: 16),
            const Text(
              'Không thể tải số liệu bán hàng',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(sellerDashboardProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Tải lại'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
