import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../account/presentation/providers/account_provider.dart';
import '../providers/seller_dashboard_provider.dart';
import '../widgets/sales_performance_chart.dart';
import '../widgets/seller_menu_item_tile.dart';

class SellerDashboardScreen extends ConsumerWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final statsAsync = ref.watch(sellerDashboardProvider);
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
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
                        (profile.name ?? profile.username ?? 'S')[0]
                            .toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
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
                    'Hello, ${profile.name ?? profile.username ?? 'Seller'}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ],
          ),
          loading: () => Text(
            'Seller Dashboard',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          error: (_, _) => Text(
            'Seller Dashboard',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(sellerDashboardProvider.notifier).refresh();
        },
        child: statsAsync.when(
          data: (stats) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Sales Performance Chart ---
                SalesPerformanceChart(chartPoints: stats.effectiveChartData),
                const SizedBox(height: 24),

                // --- Orders Section ---
                _buildSectionHeader(
                  context,
                  title: 'Orders',
                  onSeeAll: () {
                    context.push('/seller/orders');
                  },
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SellerMenuItemTile(
                      title: 'Pending Orders',
                      icon: Icons.pending_actions,
                      iconColor: const Color(0xFFF59E0B),
                      iconBgColor: const Color(
                        0xFFF59E0B,
                      ).withValues(alpha: 0.12),
                      count: stats.pendingOrders,
                      onTap: () => context.push('/seller/orders?tab=0'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Shipping Orders',
                      icon: Icons.local_shipping_outlined,
                      iconColor: const Color(0xFF3B82F6),
                      iconBgColor: const Color(
                        0xFF3B82F6,
                      ).withValues(alpha: 0.12),
                      count: stats.shippingOrders,
                      onTap: () => context.push('/seller/orders?tab=2'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Completed Orders',
                      icon: Icons.check_circle_outline,
                      iconColor: const Color(0xFF10B981),
                      iconBgColor: const Color(
                        0xFF10B981,
                      ).withValues(alpha: 0.12),
                      count: stats.completedOrders,
                      onTap: () => context.push('/seller/orders?tab=3'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Disputing Orders',
                      icon: Icons.warning_amber_rounded,
                      iconColor: const Color(0xFFEF4444),
                      iconBgColor: const Color(
                        0xFFEF4444,
                      ).withValues(alpha: 0.12),
                      count: stats.disputingOrders,
                      onTap: () => context.push('/seller/orders?tab=4'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // --- Products Section ---
                _buildSectionHeader(
                  context,
                  title: 'Products',
                  onSeeAll: () {
                    context.push('/seller/products');
                  },
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SellerMenuItemTile(
                      title: 'Active Products',
                      icon: Icons.inventory_2_outlined,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      count: stats.activeProducts,
                      onTap: () =>
                          context.push('/seller/products?status=active'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Inactive Products',
                      icon: Icons.inventory_outlined,
                      iconColor: const Color(0xFF64748B),
                      iconBgColor: const Color(
                        0xFF64748B,
                      ).withValues(alpha: 0.12),
                      count: stats.inactiveProducts,
                      onTap: () =>
                          context.push('/seller/products?status=inactive'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Violated Products',
                      icon: Icons.report_problem_outlined,
                      iconColor: const Color(0xFFEF4444),
                      iconBgColor: const Color(
                        0xFFEF4444,
                      ).withValues(alpha: 0.12),
                      count: stats.violatedProducts,
                      onTap: () =>
                          context.push('/seller/products?status=violated'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // --- AI Video & Voice Description Wizard Banner ---
                _buildAiWizardBanner(context),
                const SizedBox(height: 24),

                // --- Inventory & Logistics Section ---
                _buildSectionHeader(context, title: 'Inventory & Logistics'),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SellerMenuItemTile(
                      title: 'Shipping Address',
                      icon: Icons.location_on_outlined,
                      iconColor: const Color(0xFF0EA5E9),
                      iconBgColor: const Color(
                        0xFF0EA5E9,
                      ).withValues(alpha: 0.12),
                      onTap: () => context.push('/account/addresses'),
                    ),
                    const SizedBox(height: 8),
                    SellerMenuItemTile(
                      title: 'Withdrawal & Earnings',
                      icon: Icons.payments_outlined,
                      iconColor: const Color(0xFF10B981),
                      iconBgColor: const Color(
                        0xFF10B981,
                      ).withValues(alpha: 0.12),
                      onTap: () => context.push('/seller/earnings'),
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

  Widget _buildAiWizardBanner(BuildContext context) {
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
                      'AI Product Wizard',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sinh tiêu đề & mô tả từ Image + Audio hoặc Image + Text',
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
              onPressed: () => context.push('/seller/ai-wizard'),
              icon: const Icon(Icons.auto_awesome, size: 20),
              label: const Text('Tạo sản phẩm với AI Wizard'),
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
              'Không thể tải dữ liệu Dashboard',
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
