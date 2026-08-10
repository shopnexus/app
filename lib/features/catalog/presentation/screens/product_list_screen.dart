import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/notifications_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/location_filter_section.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/product_card.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/sort_options_sheet.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final activeFilters = ref.read(activeSearchFiltersProvider);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(catalogProductsProvider(activeFilters).notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final activeFilters = ref.watch(activeSearchFiltersProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final productsState = ref.watch(catalogProductsProvider(activeFilters));

    final isFiltered =
        activeFilters.hasArea ||
        activeFilters.hasPosition ||
        activeFilters.categoryId != null ||
        activeFilters.priceMin != null ||
        activeFilters.priceMax != null ||
        activeFilters.sort != null ||
        (activeFilters.keyword != null &&
            activeFilters.keyword!.trim().isNotEmpty);

    final unreadNotifs = ref.watch(unreadNotificationsCountProvider).value ?? 0;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(categoriesProvider);
            ref.invalidate(catalogProductsProvider(activeFilters));
            ref.invalidate(unreadNotificationsCountProvider);
          },
          color: theme.colorScheme.primary,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 300) {
                ref
                    .read(catalogProductsProvider(activeFilters).notifier)
                    .loadNextPage();
              }
              return false;
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // 1. Mobile Header (Menu, Title, Cart & Notification Bell)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ShopNexus',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: isDarkMode
                                ? AppColors.darkPrimary
                                : const Color(0xFF006A61),
                            letterSpacing: -0.5,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: theme.colorScheme.onSurface,
                                size: 24,
                              ),
                              onPressed: () => context.push('/cart'),
                            ),
                            const SizedBox(width: 4.0),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.notifications_none_rounded,
                                    color: theme.colorScheme.onSurface,
                                    size: 24,
                                  ),
                                  onPressed: () =>
                                      context.push('/account/notifications'),
                                ),
                                if (unreadNotifs > 0)
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: IgnorePointer(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 1,
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.error,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: theme.colorScheme.surface,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Text(
                                          unreadNotifs > 99
                                              ? '99+'
                                              : '$unreadNotifs',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 9,
                                            height: 1.2,
                                            fontWeight: FontWeight.bold,
                                            color: theme.colorScheme.onError,
                                          ),
                                        ),
                                      ),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.go('/search'),
                            child: Container(
                              height: 48.0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? AppColors.darkSurface
                                    : const Color(0xFFEEEEEB),
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                  color: isDarkMode
                                      ? AppColors.darkPrimary.withAlpha(60)
                                      : const Color(0xFF94A3B8),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    color: theme.colorScheme.onSurfaceVariant,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Text(
                                      activeFilters.keyword ??
                                          'Tìm sản phẩm, đồ công nghệ, thời trang...',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Inter',
                                            color: theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // Nút lọc nhanh (Tune Button) - Mở bộ lọc ngay tại trang chủ
                        GestureDetector(
                          onTap: () => _showFilterBottomSheet(
                            context,
                            activeFilters,
                            categoriesState,
                          ),
                          child: Container(
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? AppColors.darkSurface
                                  : const Color(0xFFEEEEEB),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDarkMode
                                    ? AppColors.darkPrimary.withAlpha(40)
                                    : const Color(0xFFBCC9C6),
                                width: 1.0,
                              ),
                            ),
                            child: Icon(
                              Icons.tune_rounded,
                              color: isFiltered
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Location and Categories Horizontal scroll chips
                if (isFiltered)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 40.0,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: _buildActiveFilterChips(
                              context,
                              activeFilters,
                              categoriesState,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // 4. Tiêu đề mục
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Text(
                      isFiltered ? 'Kết quả lọc' : 'Dành cho bạn',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                // 5. Masonry Grid cho danh sách sản phẩm
                productsState.when(
                  data: (stateData) {
                    final products = stateData.products;
                    if (products.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'Không có sản phẩm nào phù hợp bộ lọc',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }

                    // Tính toán số cột thích ứng dựa trên độ rộng màn hình thực tế
                    final double width = MediaQuery.of(context).size.width;
                    final int crossAxisCount = width >= 900
                        ? 4
                        : (width >= 600 ? 3 : 2);

                    // Chia danh sách sản phẩm thành các cột tương ứng
                    final columns = List.generate(
                      crossAxisCount,
                      (_) => <Listing>[],
                    );
                    for (int i = 0; i < products.length; i++) {
                      columns[i % crossAxisCount].add(products[i]);
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(crossAxisCount, (colIndex) {
                            final colProducts = columns[colIndex];
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: colIndex < crossAxisCount - 1
                                      ? 12.0
                                      : 0.0,
                                ),
                                child: Column(
                                  children: List.generate(colProducts.length, (
                                    index,
                                  ) {
                                    final product = colProducts[index];
                                    final double aspect =
                                        ((index + colIndex) % 2 == 0)
                                        ? 0.8
                                        : 1.0;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12.0,
                                      ),
                                      child: CatalogProductCard(
                                        product: product,
                                        aspectRatio: aspect,
                                        onTap: () {
                                          context.push(
                                            '/home/product/${product.id}',
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                  loading: () => SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: _buildProductShimmers(context),
                  ),
                  error: (err, stack) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('Lỗi tải sản phẩm: $err')),
                  ),
                ),

                // Chỉ báo loading khi kéo tải thêm (Infinite Scroll)
                if (productsState.asData?.value.isLoadingMore ?? false)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Khoảng đệm cuối danh sách
                const SliverToBoxAdapter(child: SizedBox(height: 80.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Tạo động danh sách các chip đang kích hoạt bộ lọc
  List<Widget> _buildActiveFilterChips(
    BuildContext context,
    CatalogSearchFilters activeFilters,
    AsyncValue<List<Category>> categoriesState,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final chips = <Widget>[];

    final chipBgColor = isDarkMode
        ? AppColors.darkSurface
        : const Color(0xFFEEEEEB);
    final chipBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFBCC9C6);
    final chipTextColor = theme.colorScheme.onSurface;

    // Nút xóa toàn bộ lọc (Clear All)
    chips.add(
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ActionChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          avatar: const Icon(
            Icons.clear_all_rounded,
            size: 14,
            color: Colors.white,
          ),
          label: const Text('Xóa hết bộ lọc'),
          onPressed: () =>
              ref.read(activeSearchFiltersProvider.notifier).reset(),
          backgroundColor: isDarkMode
              ? const Color(0xFFEF4444)
              : const Color(0xFFBA1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999.0),
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );

    // Chip khu vực hành chính đang lọc
    if (activeFilters.hasArea) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            avatar: Icon(
              Icons.location_on_rounded,
              size: 14,
              color: theme.colorScheme.primary,
            ),
            label: Text(activeFilters.areaLabel ?? 'Khu vực đã chọn'),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setArea(),
            backgroundColor: theme.colorScheme.primary.withAlpha(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: BorderSide(color: theme.colorScheme.primary, width: 0.5),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
            deleteIconColor: theme.colorScheme.primary,
          ),
        ),
      );
    }

    // Chip "quanh đây": vị trí đo khoảng cách và bán kính
    if (activeFilters.hasPosition) {
      final nearLabel = activeFilters.nearLabel ?? 'vị trí của tôi';
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            avatar: Icon(
              Icons.near_me_rounded,
              size: 14,
              color: theme.colorScheme.primary,
            ),
            label: Text(
              activeFilters.radiusKm != null
                  ? 'Quanh $nearLabel • ${activeFilters.radiusKm!.round()} km'
                  : 'Quanh $nearLabel',
            ),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setNearby(),
            backgroundColor: theme.colorScheme.primary.withAlpha(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: BorderSide(color: theme.colorScheme.primary, width: 0.5),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
            deleteIconColor: theme.colorScheme.primary,
          ),
        ),
      );
    }

    // Chip danh mục
    if (activeFilters.categoryId != null) {
      final catName = categoriesState.maybeWhen(
        data: (cats) =>
            cats
                .where((c) => c.id == activeFilters.categoryId)
                .firstOrNull
                ?.name ??
            '',
        orElse: () => '',
      );
      if (catName.isNotEmpty) {
        chips.add(
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InputChip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              label: Text(catName),
              onDeleted: () => ref
                  .read(activeSearchFiltersProvider.notifier)
                  .setCategory(null),
              backgroundColor: chipBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999.0),
                side: BorderSide(color: chipBorderColor, width: 0.5),
              ),
              labelStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: chipTextColor,
              ),
              deleteIconColor: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        );
      }
    }

    // Chip từ khóa tìm kiếm
    if (activeFilters.keyword != null &&
        activeFilters.keyword!.trim().isNotEmpty) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            label: Text('Từ khóa: "${activeFilters.keyword}"'),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setKeyword(null),
            backgroundColor: chipBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: BorderSide(color: chipBorderColor, width: 0.5),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: chipTextColor,
            ),
            deleteIconColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    // Chip khoảng giá
    if (activeFilters.priceMin != null || activeFilters.priceMax != null) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            label: Text(
              'Giá: ${activeFilters.priceMin ?? 0}đ - ${activeFilters.priceMax ?? "∞"}đ',
            ),
            onDeleted: () => ref
                .read(activeSearchFiltersProvider.notifier)
                .setPriceRange(null, null),
            backgroundColor: chipBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: BorderSide(color: chipBorderColor, width: 0.5),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: chipTextColor,
            ),
            deleteIconColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    // Chip sắp xếp
    if (activeFilters.sort != null) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            label: Text('Sắp xếp: ${sortLabel(activeFilters.sort)}'),
            onPressed: () => showSortOptionsSheet(
              context,
              filters: activeFilters,
              onSelected: (sort) =>
                  ref.read(activeSearchFiltersProvider.notifier).setSort(sort),
            ),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setSort(null),
            backgroundColor: chipBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: BorderSide(color: chipBorderColor, width: 0.5),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: chipTextColor,
            ),
            deleteIconColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return chips;
  }

  // Mở Bottom Sheet bộ lọc bao gồm cả Vùng địa lý
  void _showFilterBottomSheet(
    BuildContext context,
    CatalogSearchFilters activeFilters,
    AsyncValue<List<Category>> categoriesState,
  ) {
    _minPriceController.text = activeFilters.priceMin?.toString() ?? '';
    _maxPriceController.text = activeFilters.priceMax?.toString() ?? '';
    String? localSelectedCategory = activeFilters.categoryId;
    // The location half is edited as a draft of the whole filter set, so the
    // area, the position and the distance sort stay consistent with each other.
    CatalogSearchFilters draft = activeFilters;

    final parentTheme = Theme.of(context);
    final isParentDark = parentTheme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isParentDark ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) {
        final theme = Theme.of(context);
        final isDarkMode = theme.brightness == Brightness.dark;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bộ lọc nâng cao',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setModalState(() {
                                _minPriceController.clear();
                                _maxPriceController.clear();
                                localSelectedCategory = null;
                                draft = const CatalogSearchFilters().copyWith(
                                  keyword: draft.keyword,
                                );
                              });
                            },
                            child: Text(
                              'Đặt lại',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: isDarkMode
                                    ? const Color(0xFFEF4444)
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // Khu vực, vị trí đo khoảng cách và bán kính
                      LocationFilterSection(
                        filters: draft,
                        onChanged: (updated) =>
                            setModalState(() => draft = updated),
                      ),
                      const SizedBox(height: 20.0),

                      // Phần chọn Danh mục sản phẩm
                      Text(
                        'Danh mục sản phẩm',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      categoriesState.when(
                        data: (categories) {
                          return SizedBox(
                            height: 40.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                final isSelected =
                                    localSelectedCategory == cat.id;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ChoiceChip(
                                    label: Text(cat.name),
                                    selected: isSelected,
                                    labelStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: isSelected
                                          ? theme.colorScheme.onPrimary
                                          : theme.colorScheme.onSurface,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    selectedColor: theme.colorScheme.primary,
                                    backgroundColor: isDarkMode
                                        ? theme
                                              .colorScheme
                                              .surfaceContainerHighest
                                        : const Color(0xFFEEEEEB),
                                    onSelected: (selected) {
                                      setModalState(() {
                                        localSelectedCategory = selected
                                            ? cat.id
                                            : null;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        loading: () =>
                            Container(height: 40.0, color: Colors.transparent),
                        error: (err, stack) => const Text('Lỗi tải danh mục'),
                      ),
                      const SizedBox(height: 20.0),

                      // Phần nhập khoảng giá
                      Text(
                        'Khoảng giá (VND)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.surfaceContainerHighest
                                    : const Color(0xFFF1F1EF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: _minPriceController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Tối thiểu',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              '—',
                              style: TextStyle(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.surfaceContainerHighest
                                    : const Color(0xFFF1F1EF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: _maxPriceController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Tối đa',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),

                      // Nút áp dụng bộ lọc
                      SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: ElevatedButton(
                          onPressed: () {
                            final minVal = int.tryParse(
                              _minPriceController.text.trim(),
                            );
                            final maxVal = int.tryParse(
                              _maxPriceController.text.trim(),
                            );

                            ref
                                .read(activeSearchFiltersProvider.notifier)
                                .apply(
                                  draft.copyWith(
                                    categoryId: localSelectedCategory,
                                    priceMin: minVal,
                                    priceMax: maxVal,
                                  ),
                                );
                            context.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Áp dụng bộ lọc',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProductShimmers(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width >= 900 ? 4 : (width >= 600 ? 3 : 2);

    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(crossAxisCount, (colIndex) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: colIndex < crossAxisCount - 1 ? 12.0 : 0.0,
              ),
              child: Column(
                children: List.generate(2, (index) {
                  final double height = ((index + colIndex) % 2 == 0)
                      ? 240.0
                      : 180.0;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Shimmer.fromColors(
                      baseColor: isDarkMode
                          ? Colors.grey[800]!
                          : Colors.grey[200]!,
                      highlightColor: isDarkMode
                          ? Colors.grey[700]!
                          : Colors.grey[100]!,
                      child: Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}
