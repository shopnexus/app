import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/widgets/shared_product_card.dart';
import '../../data/models/catalog_model.dart';
import '../providers/catalog_provider.dart';

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

  final List<String> _recentSearches = ['Smart Watch', 'Wireless Headphones', 'Leather Backpack'];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final activeFilters = ref.read(activeSearchFiltersProvider);
      _searchController.text = activeFilters.keyword ?? '';
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final activeFilters = ref.read(activeSearchFiltersProvider);
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
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
    
    ref.read(activeSearchFiltersProvider.notifier).setKeyword(
          keyword.trim().isEmpty ? null : keyword.trim(),
        );
  }

  bool _isSearchActive(CatalogSearchFilters filters) {
    return (filters.keyword != null && filters.keyword!.trim().isNotEmpty) ||
        filters.categoryId != null ||
        filters.priceMin != null ||
        filters.priceMax != null ||
        filters.sort != null;
  }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(activeSearchFiltersProvider);
    final productsState = ref.watch(catalogProductsProvider(activeFilters));
    final categoriesState = ref.watch(categoriesProvider);

    final showDiscovery = !_isSearchActive(activeFilters);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // Nền sáng sữa mới
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1A1C1B), size: 20),
          onPressed: () {
            if (_isSearchActive(activeFilters)) {
              // Reset filters instead of popping if search was active
              ref.read(activeSearchFiltersProvider.notifier).reset();
              _searchController.clear();
            } else {
              context.pop();
            }
          },
        ),
        title: Container(
          height: 48.0,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1EF), // surface-container-low của Stitch
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onSubmitted: (val) => _triggerSearch(val),
            decoration: InputDecoration(
              hintText: 'Search for products...',
              hintStyle: const TextStyle(fontFamily: 'Inter', color: Color(0xFF6D7A77), fontSize: 14),
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF6D7A77), size: 18),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel_rounded, color: Color(0xFF6D7A77), size: 18),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(activeSearchFiltersProvider.notifier).setKeyword(null);
                      },
                    )
                  : const Icon(Icons.mic_none_rounded, color: Color(0xFF005049), size: 18),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            style: const TextStyle(fontFamily: 'Inter', color: Color(0xFF1A1C1B), fontSize: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _triggerSearch(_searchController.text),
            child: const Text(
              'Tìm',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Color(0xFF005049),
              ),
            ),
          ),
        ],
      ),
      body: showDiscovery
          ? _buildDiscoveryCanvas(categoriesState)
          : _buildSearchResultsCanvas(activeFilters, productsState, categoriesState),
    );
  }

  // Canvas 1: Màn hình khám phá lúc trống (Recent Searches, Trending Categories, Recommended)
  Widget _buildDiscoveryCanvas(AsyncValue<List<Category>> categoriesState) {
    // Tải danh sách mặc định để làm "Recommended for you"
    final recommendedState = ref.watch(catalogProductsProvider(const CatalogSearchFilters(page: 1, size: 10)));

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
                  const Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1C1B),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _recentSearches.clear();
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(fontFamily: 'Inter', color: Color(0xFF005049), fontWeight: FontWeight.w600),
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
                    avatar: const Icon(Icons.history_rounded, size: 16, color: Color(0xFF6D7A77)),
                    label: Text(search),
                    onPressed: () => _triggerSearch(search),
                    backgroundColor: const Color(0xFFEEEEEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999.0),
                      side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
                    ),
                    labelStyle: const TextStyle(fontFamily: 'Inter', fontSize: 13, color: Color(0xFF3E4947)),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24.0),
          ],

          // 2. Trending Categories
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Trending Categories',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C1B),
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
                          ref.read(activeSearchFiltersProvider.notifier).setCategory(cat.id);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 56.0,
                              width: 56.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFEEEEEB),
                                border: Border.all(
                                  color: const Color(0xFFBCC9C6).withAlpha(128),
                                  width: 1.0,
                                ),
                              ),
                              child: const Center(
                                child: Icon(Icons.star_border_rounded, color: Color(0xFF005049), size: 20),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              cat.name,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3E4947),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recommended for You',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C1B),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          recommendedState.when(
            data: (stateData) {
              final products = stateData.products;
              if (products.isEmpty) return const SizedBox();

              final left = <TProductCard>[];
              final right = <TProductCard>[];
              for (int i = 0; i < products.length; i++) {
                if (i.isEven) {
                  left.add(products[i]);
                } else {
                  right.add(products[i]);
                }
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: List.generate(left.length, (idx) {
                          final double aspect = (idx % 3 == 0) ? 0.8 : 1.0;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: SharedProductCard(
                              product: left[idx],
                              aspectRatio: aspect,
                              onTap: () => context.push('/home/product/${left[idx].id}'),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        children: List.generate(right.length, (idx) {
                          final double aspect = (idx % 3 == 0) ? 1.0 : 0.8;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: SharedProductCard(
                              product: right[idx],
                              aspectRatio: aspect,
                              onTap: () => context.push('/home/product/${right[idx].id}'),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color(0xFF005049))),
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
                    children: const [
                      Icon(Icons.search_off_rounded, size: 64, color: Color(0xFFBCC9C6)),
                      SizedBox(height: 16.0),
                      Text(
                        'Không tìm thấy sản phẩm phù hợp',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFF6D7A77),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              final left = <TProductCard>[];
              final right = <TProductCard>[];
              for (int i = 0; i < products.length; i++) {
                if (i.isEven) {
                  left.add(products[i]);
                } else {
                  right.add(products[i]);
                }
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: List.generate(left.length, (idx) {
                                final double aspect = (idx % 3 == 0) ? 0.8 : 1.0;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: SharedProductCard(
                                    product: left[idx],
                                    aspectRatio: aspect,
                                    onTap: () => context.push('/home/product/${left[idx].id}'),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              children: List.generate(right.length, (idx) {
                                final double aspect = (idx % 3 == 0) ? 1.0 : 0.8;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: SharedProductCard(
                                    product: right[idx],
                                    aspectRatio: aspect,
                                    onTap: () => context.push('/home/product/${right[idx].id}'),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (stateData.isLoadingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF005049)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 80.0),
                  ),
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
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
    String sortText = 'Mới nhất';
    if (activeFilters.sort == 'price_asc') sortText = 'Giá: Thấp đến Cao';
    if (activeFilters.sort == 'price_desc') sortText = 'Giá: Cao đến Thấp';
    if (activeFilters.sort == 'sold_count_desc') sortText = 'Bán chạy nhất';

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterChip(
              avatar: const Icon(Icons.tune_rounded, size: 16, color: Color(0xFF005049)),
              label: const Text('Bộ lọc'),
              labelStyle: const TextStyle(fontFamily: 'Inter', color: Color(0xFF1A1C1B), fontWeight: FontWeight.bold),
              backgroundColor: const Color(0xFFF1F1EF),
              selected: activeFilters.priceMin != null || activeFilters.priceMax != null || activeFilters.categoryId != null,
              selectedColor: const Color(0xFFEEEEEB),
              onSelected: (_) => _showFilterBottomSheet(context, activeFilters, categoriesState),
            ),
            const SizedBox(width: 8.0),
            ActionChip(
              avatar: const Icon(Icons.sort_rounded, size: 16, color: Color(0xFF005049)),
              label: Text(sortText),
              labelStyle: const TextStyle(fontFamily: 'Inter', color: Color(0xFF1A1C1B), fontWeight: FontWeight.w600),
              backgroundColor: const Color(0xFFF1F1EF),
              onPressed: () => _showSortOptions(context, activeFilters),
            ),
            if (activeFilters.categoryId != null) ...[
              const SizedBox(width: 8.0),
              Chip(
                label: const Text('Danh mục đã chọn'),
                labelStyle: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                onDeleted: () {
                  ref.read(activeSearchFiltersProvider.notifier).setCategory(null);
                },
              ),
            ],
            if (activeFilters.priceMin != null || activeFilters.priceMax != null) ...[
              const SizedBox(width: 8.0),
              Chip(
                label: Text(
                  'Giá: ${activeFilters.priceMin ?? 0}đ - ${activeFilters.priceMax ?? "∞"}đ',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onDeleted: () {
                  ref.read(activeSearchFiltersProvider.notifier).setPriceRange(null, null);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showSortOptions(BuildContext context, CatalogSearchFilters activeFilters) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Sắp xếp theo',
                  style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Divider(),
              _buildSortTile(context, 'Mới nhất', null, activeFilters.sort),
              _buildSortTile(context, 'Bán chạy nhất', 'sold_count_desc', activeFilters.sort),
              _buildSortTile(context, 'Giá: Thấp đến Cao', 'price_asc', activeFilters.sort),
              _buildSortTile(context, 'Giá: Cao đến Thấp', 'price_desc', activeFilters.sort),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortTile(BuildContext context, String label, String? value, String? currentValue) {
    final isSelected = value == currentValue;
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          color: isSelected ? const Color(0xFF005049) : const Color(0xFF3E4947),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected ? const Icon(Icons.check_rounded, color: Color(0xFF005049)) : null,
      onTap: () {
        ref.read(activeSearchFiltersProvider.notifier).setSort(value);
        context.pop();
      },
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

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) {
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
                          const Text(
                            'Bộ lọc nâng cao',
                            style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              setModalState(() {
                                _minPriceController.clear();
                                _maxPriceController.clear();
                                localSelectedCategory = null;
                              });
                            },
                            child: const Text('Đặt lại', style: TextStyle(fontFamily: 'Inter', color: Colors.red)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Danh mục sản phẩm',
                        style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 14),
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
                                final isSelected = localSelectedCategory == cat.id;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ChoiceChip(
                                    label: Text(cat.name),
                                    selected: isSelected,
                                    labelStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: isSelected ? Colors.white : const Color(0xFF3E4947),
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                    selectedColor: const Color(0xFF005049),
                                    onSelected: (selected) {
                                      setModalState(() {
                                        localSelectedCategory = selected ? cat.id : null;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        loading: () => Container(height: 40.0, color: Colors.transparent),
                        error: (err, stack) => const Text('Lỗi tải danh mục'),
                      ),
                      const SizedBox(height: 24.0),
                      const Text(
                        'Khoảng giá (VND)',
                        style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1EF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: _minPriceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Tối thiểu',
                                  hintStyle: TextStyle(fontFamily: 'Inter', color: Color(0xFF6D7A77)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('—', style: TextStyle(color: Color(0xFF6D7A77))),
                          ),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1EF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: _maxPriceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Tối đa',
                                  hintStyle: TextStyle(fontFamily: 'Inter', color: Color(0xFF6D7A77)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
                            final minVal = int.tryParse(_minPriceController.text.trim());
                            final maxVal = int.tryParse(_maxPriceController.text.trim());
                            
                            ref.read(activeSearchFiltersProvider.notifier).setCategory(localSelectedCategory);
                            ref.read(activeSearchFiltersProvider.notifier).setPriceRange(minVal, maxVal);
                            context.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF005049),
                            foregroundColor: Colors.white,
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
