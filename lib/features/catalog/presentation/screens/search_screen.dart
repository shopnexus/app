import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/catalog_model.dart';
import '../providers/catalog_provider.dart';
import '../widgets/location_filter_section.dart';
import '../widgets/product_card.dart';
import '../widgets/sort_options_sheet.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Temporary controller for bottom sheet filter
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  final List<String> _recentSearches = [
    'Đồng hồ thông minh',
    'Tai nghe không dây',
    'Balo da cao cấp',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final activeFilters = ref.read(activeSearchFiltersProvider);
      _searchController.text = activeFilters.keyword ?? '';
    });
  }

  void _onSearchChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
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

  void _triggerSearch(String keyword) {
    _searchController.text = keyword;
    FocusScope.of(context).unfocus();

    // Lưu vào lịch sử tìm kiếm gần đây
    if (keyword.trim().isNotEmpty) {
      setState(() {
        _recentSearches.remove(keyword);
        _recentSearches.insert(0, keyword);
        if (_recentSearches.length > 5) {
          _recentSearches.removeLast();
        }
      });
    }

    ref
        .read(activeSearchFiltersProvider.notifier)
        .setKeyword(keyword.trim().isEmpty ? null : keyword.trim());
  }

  bool _isSearchActive(CatalogSearchFilters filters) {
    return (filters.keyword != null && filters.keyword!.trim().isNotEmpty) ||
        filters.categoryId != null ||
        filters.priceMin != null ||
        filters.priceMax != null ||
        filters.hasArea ||
        filters.hasPosition ||
        filters.sort != null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final activeFilters = ref.watch(activeSearchFiltersProvider);
    final productsState = ref.watch(catalogProductsProvider(activeFilters));
    final categoriesState = ref.watch(categoriesProvider);

    final showDiscovery = !_isSearchActive(activeFilters);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_isSearchActive(activeFilters)) {
          ref.read(activeSearchFiltersProvider.notifier).reset();
          _searchController.clear();
        } else if (context.canPop()) {
          context.pop();
        } else {
          context.go('/home');
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: theme.colorScheme.onSurface,
              size: 20,
            ),
            onPressed: () {
              if (_isSearchActive(activeFilters)) {
                // Reset filters instead of popping if search was active
                ref.read(activeSearchFiltersProvider.notifier).reset();
                _searchController.clear();
              } else if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
          ),
          title: Container(
            height: 48.0,
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
            child: Center(
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onSubmitted: (val) => _triggerSearch(val),
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.transparent,
                  isDense: true,
                  hintText: 'Tìm sản phẩm, đồ công nghệ, thời trang...',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: theme.colorScheme.onSurfaceVariant,
                            size: 18,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            ref
                                .read(activeSearchFiltersProvider.notifier)
                                .setKeyword(null);
                          },
                        )
                      : Icon(
                          Icons.mic_none_rounded,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: theme.colorScheme.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => _triggerSearch(_searchController.text),
              child: Text(
                'Tìm',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        body: showDiscovery
            ? _buildDiscoveryCanvas(categoriesState)
            : _buildSearchResultsCanvas(
                activeFilters,
                productsState,
                categoriesState,
              ),
      ),
    );
  }

  // Canvas 1: Màn hình khám phá lúc trống (Recent Searches, Trending Categories, Recommended)
  Widget _buildDiscoveryCanvas(AsyncValue<List<Category>> categoriesState) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Tải danh sách mặc định để làm "Recommended for you"
    final recommendedState = ref.watch(
      catalogProductsProvider(const CatalogSearchFilters(page: 1, size: 10)),
    );

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),

          // 1. Recent Searches
          if (_recentSearches.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tìm kiếm gần đây',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _recentSearches.clear();
                      });
                    },
                    child: Text(
                      'Xóa lịch sử',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _recentSearches.map((search) {
                  return ActionChip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    avatar: Icon(
                      Icons.history_rounded,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    label: Text(search),
                    onPressed: () => _triggerSearch(search),
                    backgroundColor: isDarkMode
                        ? AppColors.darkSurface
                        : const Color(0xFFEEEEEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999.0),
                      side: BorderSide(
                        color: isDarkMode
                            ? AppColors.darkPrimary.withAlpha(40)
                            : const Color(0xFFBCC9C6),
                        width: 0.5,
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: theme.colorScheme.onSurface,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24.0),
          ],

          // 2. Trending Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Danh mục nổi bật',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            height: 96.0,
            child: categoriesState.when(
              data: (categories) {
                final list = categories.take(6).toList();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final cat = list[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(activeSearchFiltersProvider.notifier)
                              .setCategory(cat.id);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 56.0,
                              width: 56.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDarkMode
                                    ? AppColors.darkSurface
                                    : const Color(0xFFEEEEEB),
                                border: Border.all(
                                  color: isDarkMode
                                      ? AppColors.darkPrimary.withAlpha(40)
                                      : const Color(0xFFBCC9C6).withAlpha(128),
                                  width: 1.0,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.star_border_rounded,
                                  color: theme.colorScheme.primary,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              cat.name,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const SizedBox(),
              error: (err, stack) => const SizedBox(),
            ),
          ),
          const SizedBox(height: 24.0),

          // 3. Recommended for you (Masonry Grid)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Gợi ý dành cho bạn',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          recommendedState.when(
            data: (stateData) {
              final products = stateData.products;
              if (products.isEmpty) return const SizedBox();

              // Tính toán số cột thích ứng dựa trên độ rộng màn hình thực tế
              final double width = MediaQuery.of(context).size.width;
              final int crossAxisCount = width >= 900
                  ? 4
                  : (width >= 600 ? 3 : 2);

              final columns = List.generate(
                crossAxisCount,
                (_) => <TProductCard>[],
              );
              for (int i = 0; i < products.length; i++) {
                columns[i % crossAxisCount].add(products[i]);
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(crossAxisCount, (colIndex) {
                    final colProducts = columns[colIndex];
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: colIndex < crossAxisCount - 1 ? 12.0 : 0.0,
                        ),
                        child: Column(
                          children: List.generate(colProducts.length, (index) {
                            final product = colProducts[index];
                            final double aspect = ((index + colIndex) % 2 == 0)
                                ? 0.8
                                : 1.0;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: CatalogProductCard(
                                product: product,
                                aspectRatio: aspect,
                                onTap: () =>
                                    context.push('/home/product/${product.id}'),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
            loading: () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                ),
              ),
            ),
            error: (err, stack) => const SizedBox(),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }

  // Canvas 2: Màn hình kết quả tìm kiếm kèm bộ lọc
  Widget _buildSearchResultsCanvas(
    CatalogSearchFilters activeFilters,
    AsyncValue<CatalogProductsState> productsState,
    AsyncValue<List<Category>> categoriesState,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // Dòng thanh công cụ bộ lọc
        _buildFilterBar(context, activeFilters, categoriesState),

        // Vùng danh sách sản phẩm kết quả
        Expanded(
          child: productsState.when(
            data: (stateData) {
              final products = stateData.products;
              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Không tìm thấy sản phẩm phù hợp',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Tính toán số cột thích ứng dựa trên độ rộng màn hình thực tế
              final double width = MediaQuery.of(context).size.width;
              final int crossAxisCount = width >= 900
                  ? 4
                  : (width >= 600 ? 3 : 2);

              final columns = List.generate(
                crossAxisCount,
                (_) => <TProductCard>[],
              );
              for (int i = 0; i < products.length; i++) {
                columns[i % crossAxisCount].add(products[i]);
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
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
                                      ((index + colIndex) % 2 == 0) ? 0.8 : 1.0;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: CatalogProductCard(
                                      product: product,
                                      aspectRatio: aspect,
                                      onTap: () => context.push(
                                        '/home/product/${product.id}',
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  if (stateData.isLoadingMore)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                  const SliverToBoxAdapter(child: SizedBox(height: 80.0)),
                ],
              );
            },
            loading: () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                  highlightColor: isDarkMode
                      ? Colors.grey[700]!
                      : Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? AppColors.darkSurface : Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            error: (err, stack) => Center(child: Text('Lỗi: $err')),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterBar(
    BuildContext context,
    CatalogSearchFilters activeFilters,
    AsyncValue<List<Category>> categoriesState,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final sortText = sortLabel(activeFilters.sort);

    final chipBgColor = isDarkMode
        ? AppColors.darkSurface
        : const Color(0xFFF1F1EF);
    final chipTextColor = theme.colorScheme.onSurface;

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterChip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              avatar: Icon(
                Icons.tune_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              label: const Text('Bộ lọc'),
              labelStyle: TextStyle(
                fontFamily: 'Inter',
                color: chipTextColor,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: chipBgColor,
              selected:
                  activeFilters.priceMin != null ||
                  activeFilters.priceMax != null ||
                  activeFilters.categoryId != null ||
                  activeFilters.hasArea ||
                  activeFilters.hasPosition,
              selectedColor: theme.colorScheme.primary.withAlpha(40),
              onSelected: (_) => _showFilterBottomSheet(
                context,
                activeFilters,
                categoriesState,
              ),
            ),
            if (activeFilters.hasArea) ...[
              const SizedBox(width: 8.0),
              Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                avatar: Icon(
                  Icons.location_on_rounded,
                  size: 14,
                  color: theme.colorScheme.primary,
                ),
                label: Text(
                  activeFilters.areaLabel ?? 'Khu vực đã chọn',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onDeleted: () {
                  ref.read(activeSearchFiltersProvider.notifier).setArea();
                },
              ),
            ],
            if (activeFilters.hasPosition) ...[
              const SizedBox(width: 8.0),
              Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                avatar: Icon(
                  Icons.near_me_rounded,
                  size: 14,
                  color: theme.colorScheme.primary,
                ),
                label: Text(
                  activeFilters.radiusKm != null
                      ? 'Quanh ${activeFilters.nearLabel ?? "vị trí của tôi"} • ${activeFilters.radiusKm!.round()} km'
                      : 'Quanh ${activeFilters.nearLabel ?? "vị trí của tôi"}',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onDeleted: () {
                  ref.read(activeSearchFiltersProvider.notifier).setNearby();
                },
              ),
            ],
            const SizedBox(width: 8.0),
            ActionChip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              avatar: Icon(
                Icons.sort_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              label: Text(sortText),
              labelStyle: TextStyle(
                fontFamily: 'Inter',
                color: chipTextColor,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: chipBgColor,
              onPressed: () => showSortOptionsSheet(
                context,
                filters: activeFilters,
                onSelected: (sort) => ref
                    .read(activeSearchFiltersProvider.notifier)
                    .setSort(sort),
              ),
            ),
            if (activeFilters.categoryId != null) ...[
              const SizedBox(width: 8.0),
              Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                label: const Text('Danh mục đã chọn'),
                labelStyle: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                onDeleted: () {
                  ref
                      .read(activeSearchFiltersProvider.notifier)
                      .setCategory(null);
                },
              ),
            ],
            if (activeFilters.priceMin != null ||
                activeFilters.priceMax != null) ...[
              const SizedBox(width: 8.0),
              Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                label: Text(
                  'Giá: ${activeFilters.priceMin ?? 0}đ - ${activeFilters.priceMax ?? "∞"}đ',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onDeleted: () {
                  ref
                      .read(activeSearchFiltersProvider.notifier)
                      .setPriceRange(null, null);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

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
                              fontFamily: 'Inter',
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
                      LocationFilterSection(
                        filters: draft,
                        onChanged: (updated) =>
                            setModalState(() => draft = updated),
                      ),
                      const SizedBox(height: 20.0),
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
                      const SizedBox(height: 24.0),
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
}
