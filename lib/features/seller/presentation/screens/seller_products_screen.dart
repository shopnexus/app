import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../providers/seller_products_provider.dart';

class SellerProductsScreen extends ConsumerStatefulWidget {
  final String? initialStatus;

  const SellerProductsScreen({super.key, this.initialStatus});

  @override
  ConsumerState<SellerProductsScreen> createState() =>
      _SellerProductsScreenState();
}

class _SellerProductsScreenState extends ConsumerState<SellerProductsScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialStatus != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(sellerProductsProvider.notifier)
            .setStatusFilter(widget.initialStatus);
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(sellerProductsProvider);
    final notifier = ref.read(sellerProductsProvider.notifier);

    final activeCount = state.spuList
        .where(
          (p) =>
              p.skus != null &&
              p.skus!.any((s) => s.stock > 0) &&
              !p.id.contains('violated'),
        )
        .length;
    final inactiveCount = state.spuList
        .where((p) => p.skus != null && p.skus!.every((s) => s.stock == 0))
        .length;
    final violatedCount = state.spuList
        .where(
          (p) => p.id.contains('violated') || p.skus == null || p.skus!.isEmpty,
        )
        .length;

    final filteredList = state.spuList.where((product) {
      if (state.selectedStatus == 'active') {
        final isOut =
            product.skus != null && product.skus!.every((s) => s.stock == 0);
        final isViolated =
            product.id.contains('violated') ||
            product.skus == null ||
            product.skus!.isEmpty;
        if (isOut || isViolated) return false;
      } else if (state.selectedStatus == 'inactive') {
        final isOut =
            product.skus != null && product.skus!.every((s) => s.stock == 0);
        if (!isOut) return false;
      } else if (state.selectedStatus == 'violated') {
        final isViolated =
            product.id.contains('violated') ||
            product.skus == null ||
            product.skus!.isEmpty;
        if (!isViolated) return false;
      }

      if (state.searchQuery.isEmpty) return true;
      return product.name.toLowerCase().contains(
        state.searchQuery.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: notifier.setSearchQuery,
                decoration: const InputDecoration(
                  hintText: 'Tìm kiếm tên sản phẩm...',
                  border: InputBorder.none,
                ),
              )
            : Text(
                'Sản phẩm của tôi',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchController.clear();
                  notifier.setSearchQuery('');
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/seller/ai-wizard'),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.refresh();
        },
        child: Column(
          children: [
            // Filter Chips Horizontal List matching SellerOrdersScreen UI
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildTabChip(
                    context,
                    label: 'Tất cả',
                    count: state.spuList.length,
                    isSelected: state.selectedStatus == null,
                    onTap: () => notifier.setStatusFilter(null),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Đang bán',
                    count: activeCount,
                    isSelected: state.selectedStatus == 'active',
                    onTap: () => notifier.setStatusFilter('active'),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Hết hàng',
                    count: inactiveCount,
                    isSelected: state.selectedStatus == 'inactive',
                    onTap: () => notifier.setStatusFilter('inactive'),
                  ),
                  const SizedBox(width: 8),
                  _buildTabChip(
                    context,
                    label: 'Chờ duyệt / Vi phạm',
                    count: violatedCount,
                    isSelected: state.selectedStatus == 'violated',
                    onTap: () => notifier.setStatusFilter('violated'),
                  ),
                ],
              ),
            ),

            // Product List
            Expanded(
              child: state.isLoading
                  ? _buildShimmerList(isDark)
                  : filteredList.isEmpty
                  ? _buildEmptyView(context)
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final product = filteredList[index];
                        return _buildProductCard(context, product, notifier);
                      },
                    ),
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

  Widget _buildProductCard(
    BuildContext context,
    TProductDetail product,
    SellerProductsNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Calculate total stock from SKUs
    int totalStock = 0;
    if (product.skus != null && product.skus!.isNotEmpty) {
      totalStock = product.skus!.fold(0, (sum, sku) => sum + sku.stock);
    } else {
      totalStock = 45; // Default display stock
    }

    final isOutOfStock = totalStock == 0;
    final statusText = isOutOfStock
        ? 'Hết hàng'
        : (product.skus == null ? 'Chờ duyệt' : 'Đang bán');
    final statusBgColor = isOutOfStock
        ? const Color(0xFFFEE2E2)
        : const Color(0xFFA8ECE4);
    final statusTextColor = isOutOfStock
        ? const Color(0xFF991B1B)
        : const Color(0xFF00504B);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              image: (product.images != null && product.images!.isNotEmpty)
                  ? DecorationImage(
                      image: NetworkImage(product.images!.first.url),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: (product.images == null || product.images!.isEmpty)
                ? const Icon(Icons.image_outlined, color: Color(0xFF94A3B8))
                : null,
          ),
          const SizedBox(width: 12),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: statusTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 16,
                      color: isOutOfStock
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF64748B),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Tồn kho: $totalStock',
                      style: TextStyle(
                        fontSize: 12,
                        color: isOutOfStock
                            ? const Color(0xFFEF4444)
                            : const Color(0xFF64748B),
                        fontWeight: isOutOfStock
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MoneyUtils.format(product.price),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          onPressed: () => context.push('/seller/ai-wizard'),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          icon: const Icon(Icons.more_horiz, size: 20),
                          onPressed: () =>
                              _showProductOptions(context, product, notifier),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
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

  void _showProductOptions(
    BuildContext context,
    TProductDetail product,
    SellerProductsNotifier notifier,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.visibility_outlined),
                title: const Text('Xem chi tiết sản phẩm'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/home/product/${product.id}');
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Chỉnh sửa với AI Wizard'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/seller/ai-wizard');
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text(
                  'Xóa sản phẩm',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  if (product.skus != null && product.skus!.isNotEmpty) {
                    notifier.deleteSkuVariant(product.skus!.first.id);
                  }
                },
              ),
            ],
          ),
        );
      },
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
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.inventory_2_outlined,
            size: 48,
            color: Color(0xFF94A3B8),
          ),
          const SizedBox(height: 12),
          const Text(
            'Không tìm thấy sản phẩm nào',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => context.push('/seller/ai-wizard'),
            icon: const Icon(Icons.add),
            label: const Text('Tạo sản phẩm mới'),
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
    );
  }
}
