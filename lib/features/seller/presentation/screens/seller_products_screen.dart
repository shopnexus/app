import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_products_provider.dart';

/// The seller's own listings, read through `GET /listings?mine=true`. SPU/SKU is
/// gone: a listing has variants, and `mine=true` is what makes a `status` filter
/// legal at all — a seller may see their drafts, nobody else may.
class SellerProductsScreen extends ConsumerStatefulWidget {
  final ListingStatus? initialStatus;

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

  /// `ListingStatus` and nothing else. `inactive` and `violated` were never
  /// values of this column, so every chip that named one matched no listing.
  static const _statusLabels = {
    ListingStatus.active: 'Đang bán',
    ListingStatus.pending: 'Chờ duyệt',
    ListingStatus.hidden: 'Đã ẩn',
    ListingStatus.draft: 'Nháp',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(sellerProductsProvider);
    final notifier = ref.read(sellerProductsProvider.notifier);
    final counts = ref.watch(sellerListingCountsProvider);

    final query = state.searchQuery.toLowerCase();
    final filtered = query.isEmpty
        ? state.listings
        : state.listings
              .where((l) => l.name.toLowerCase().contains(query))
              .toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: TextStyle(color: theme.colorScheme.onSurface),
                onChanged: notifier.setSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm tên sản phẩm...',
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  border: InputBorder.none,
                ),
              )
            : Text(
                'Sản phẩm của tôi',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: theme.colorScheme.onSurface,
            ),
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
        onPressed: () => context.push('/seller/new-listing'),
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.add, color: theme.colorScheme.onPrimary, size: 28),
      ),
      body: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: notifier.refresh,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildTabChip(
                    context,
                    label: 'Tất cả',
                    // The sum of the four, not the page's length: a page count
                    // would cap the chip at the page size and call it a total.
                    count: counts.value?.values.fold(
                      0,
                      (total, n) => total! + n,
                    ),
                    isSelected: state.status == null,
                    onTap: () => notifier.setStatusFilter(null),
                  ),
                  const SizedBox(width: 8),
                  for (final entry in _statusLabels.entries) ...[
                    _buildTabChip(
                      context,
                      label: entry.value,
                      count: counts.value?[entry.key],
                      isSelected: state.status == entry.key,
                      onTap: () => notifier.setStatusFilter(entry.key),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            Expanded(
              child: state.isLoading
                  ? _buildShimmerList(context)
                  : state.errorMessage != null
                  ? _buildErrorView(context, state.errorMessage!)
                  : filtered.isEmpty
                  ? _buildEmptyView(context)
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) =>
                          _buildProductCard(context, filtered[index], notifier),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final unselectedBg = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFECEEED);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : unselectedBg,
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
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
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
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.white,
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
    Listing listing,
    SellerProductsNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final isHidden = listing.status == ListingStatus.hidden;
    final statusText = _statusLabels[listing.status] ?? listing.status.value;
    final statusBgColor = switch (listing.status) {
      ListingStatus.active =>
        isDark ? AppColors.darkPrimary.withAlpha(40) : const Color(0xFFA8ECE4),
      ListingStatus.pending =>
        isDark
            ? const Color(0xFFD97706).withAlpha(40)
            : const Color(0xFFFEF3C7),
      ListingStatus.hidden || ListingStatus.draft =>
        isDark
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFE2E8F0),
    };
    final statusTextColor = switch (listing.status) {
      ListingStatus.active =>
        isDark ? AppColors.darkPrimary : const Color(0xFF00504B),
      ListingStatus.pending =>
        isDark ? const Color(0xFFFBBF24) : const Color(0xFF92400E),
      ListingStatus.hidden ||
      ListingStatus.draft => theme.colorScheme.onSurfaceVariant,
    };

    final cardBgColor = isDark ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDark
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final imageBgColor = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF1F5F9);
    // A resource carries no `url` until its module can presign one, so "no
    // picture to show" is the same case as "no picture uploaded".
    final coverUrl = listing.cover?.url;
    final hasCover = coverUrl != null && coverUrl.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => context.push('/home/product/${listing.id}'),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: imageBgColor,
                image: hasCover
                    ? DecorationImage(
                        image: NetworkImage(coverUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: hasCover
                  ? null
                  : Icon(
                      Icons.image_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            context.push('/home/product/${listing.id}'),
                        child: Text(
                          listing.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
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
                // Stock lives on the variants, which the card feed does not
                // carry; `sold` is what a `Listing` states about itself.
                Row(
                  children: [
                    Icon(
                      Icons.local_mall_outlined,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Đã bán: ${listing.sold}',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MoneyUtils.format(
                        listing.price,
                        currency: listing.currency,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // A draft has never been published, so there is no
                        // publication to take down and nothing to toggle.
                        if (listing.status != ListingStatus.draft) ...[
                          GestureDetector(
                            onTap: () => _showToggleConfirmDialog(
                              context,
                              listing,
                              notifier,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: isHidden
                                    ? (isDark
                                          ? theme
                                                .colorScheme
                                                .surfaceContainerHighest
                                          : const Color(0xFFE2E8F0))
                                    : theme.colorScheme.primary.withAlpha(30),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isHidden
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 14,
                                    color: isHidden
                                        ? theme.colorScheme.onSurfaceVariant
                                        : theme.colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    isHidden ? 'Đã ẩn' : 'Hiện',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: isHidden
                                          ? theme.colorScheme.onSurfaceVariant
                                          : theme.colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Transform.scale(
                                    scale: 0.65,
                                    child: SizedBox(
                                      height: 20,
                                      width: 32,
                                      child: Switch(
                                        value: !isHidden,
                                        activeThumbColor:
                                            theme.colorScheme.primary,
                                        onChanged: (_) =>
                                            _showToggleConfirmDialog(
                                              context,
                                              listing,
                                              notifier,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () =>
                              _showProductOptions(context, listing, notifier),
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
    Listing listing,
    SellerProductsNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.visibility_outlined,
                  color: theme.colorScheme.onSurface,
                ),
                title: Text(
                  'Xem chi tiết sản phẩm',
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push('/home/product/${listing.id}');
                },
              ),
              // No "edit with AI" entry: the AI flow fills in a *new* listing and
              // `POST /listings` is the only thing it can end in. Editing a live
              // listing is `PATCH /listings/{id}`, a screen that does not exist yet.
              ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: isDark ? const Color(0xFFEF4444) : Colors.red,
                ),
                title: Text(
                  'Xóa sản phẩm',
                  style: TextStyle(
                    color: isDark ? const Color(0xFFEF4444) : Colors.red,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(sheetContext);
                  // The listing, not one of its variants: the old button deleted
                  // `skus.first` through a route that answered 404 either way.
                  await notifier.deleteListing(listing.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showToggleConfirmDialog(
    BuildContext context,
    Listing listing,
    SellerProductsNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isHidden = listing.status == ListingStatus.hidden;
    final actionText = isHidden ? 'hiển thị lại' : 'ẩn';

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              isHidden
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Xác nhận $actionText',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          isHidden
              // Publishing re-queues moderation, so it comes back as `pending`.
              ? 'Sản phẩm "${listing.name}" sẽ được gửi duyệt lại trước khi hiển thị công khai.'
              : 'Sản phẩm "${listing.name}" sẽ không còn hiển thị với người mua.',
          style: TextStyle(
            fontSize: 14,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Hủy',
              style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await notifier.toggleVisibility(listing);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[800]! : const Color(0xFFE2E8F0);
    final highlightColor = isDark ? Colors.grey[700]! : const Color(0xFFF1F5F9);

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
            color: isDark ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String message) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: Color(0xFFEF4444),
            ),
            const SizedBox(height: 12),
            Text(
              'Không thể tải danh sách sản phẩm',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 48,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 12),
          Text(
            'Không tìm thấy sản phẩm nào',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => context.push('/seller/new-listing'),
            icon: const Icon(Icons.add),
            label: const Text('Tạo sản phẩm mới'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
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
