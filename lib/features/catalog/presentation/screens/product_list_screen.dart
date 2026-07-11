import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/widgets/shared_product_card.dart';
import '../../data/models/catalog_model.dart';
import '../providers/catalog_provider.dart';

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
    final activeFilters = ref.watch(activeSearchFiltersProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final productsState = ref.watch(catalogProductsProvider(activeFilters));

    final isFiltered =
        activeFilters.location != null ||
        activeFilters.categoryId != null ||
        activeFilters.priceMin != null ||
        activeFilters.priceMax != null ||
        activeFilters.sort != null ||
        (activeFilters.keyword != null &&
            activeFilters.keyword!.trim().isNotEmpty);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F6),
      // Màu nền sáng sữa mới của Stitch
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(categoriesProvider);
            ref.invalidate(catalogProductsProvider(activeFilters));
          },
          color: const Color(0xFF006A61),
          // Tông màu xanh mòng két (primary) mới
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // 1. Mobile Header (Menu, Title, Cart) theo Stitch
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Color(0xFF1A1C1B),
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      const Text(
                        'ShopNexus',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          // ExtraBold từ Stitch Display
                          color: Color(0xFF006A61),
                          // Primary brand color mới
                          letterSpacing: -0.5,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xFF1A1C1B),
                          size: 24,
                        ),
                        onPressed: () => context.push('/cart'),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Search and Filter Bar
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
                          onTap: () => context.push('/search'),
                          child: Container(
                            height: 48.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEB),
                              // surface-container của Stitch
                              borderRadius: BorderRadius.circular(9999.0),
                              // Bo tròn tối đa (rounded-full)
                              border: Border.all(
                                color: const Color(0xFFBCC9C6),
                                // outline-variant
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF6D7A77), // outline
                                  size: 20,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  activeFilters.keyword ??
                                      'Search for vintage, tech, furniture...',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF6D7A77),
                                        fontSize: 14,
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
                            color: const Color(0xFFEEEEEB),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFBCC9C6),
                              width: 1.0,
                            ),
                          ),
                          child: Icon(
                            Icons.tune_rounded,
                            color: isFiltered
                                ? const Color(0xFF006A61)
                                : const Color(0xFF1A1C1B),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Location and Categories Horizontal scroll chips
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SizedBox(
                    height: 32.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: isFiltered
                            ? _buildActiveFilterChips(
                                activeFilters,
                                categoriesState,
                              )
                            : _buildDefaultCategoriesChips(categoriesState),
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
                    isFiltered ? 'Kết quả lọc' : 'For You',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1C1B),
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
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          'Không có sản phẩm nào phù hợp bộ lọc',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF6D7A77),
                          ),
                        ),
                      ),
                    );
                  }

                  // Chia đôi danh sách cho 2 cột để tạo hiệu ứng Masonry
                  final leftColumnProducts = <TProductCard>[];
                  final rightColumnProducts = <TProductCard>[];
                  for (int i = 0; i < products.length; i++) {
                    if (i.isEven) {
                      leftColumnProducts.add(products[i]);
                    } else {
                      rightColumnProducts.add(products[i]);
                    }
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cột bên trái
                          Expanded(
                            child: Column(
                              children: List.generate(
                                leftColumnProducts.length,
                                (index) {
                                  final product = leftColumnProducts[index];
                                  final double aspect = (index % 3 == 0)
                                      ? 0.8
                                      : 1.0;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: SharedProductCard(
                                      product: product,
                                      aspectRatio: aspect,
                                      onTap: () {
                                        context.push(
                                          '/home/product/${product.id}',
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          // Cột bên phải
                          Expanded(
                            child: Column(
                              children: List.generate(
                                rightColumnProducts.length,
                                (index) {
                                  final product = rightColumnProducts[index];
                                  final double aspect = (index % 3 == 0)
                                      ? 1.0
                                      : 0.8;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: SharedProductCard(
                                      product: product,
                                      aspectRatio: aspect,
                                      onTap: () {
                                        context.push(
                                          '/home/product/${product.id}',
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: _buildProductShimmers(),
                ),
                error: (err, stack) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Lỗi tải sản phẩm: $err')),
                ),
              ),

              // Chỉ báo loading khi kéo tải thêm (Infinite Scroll)
              if (productsState.asData?.value.isLoadingMore ?? false)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF006A61),
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
    );
  }

  // Danh sách các chip mặc định của danh mục để hiển thị lúc trống lọc
  List<Widget> _buildDefaultCategoriesChips(
    AsyncValue<List<Category>> categoriesState,
  ) {
    return [
      categoriesState.when(
        data: (categories) {
          return Row(
            children: categories.take(6).map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ActionChip(
                  label: Text(category.name),
                  onPressed: () {
                    ref
                        .read(activeSearchFiltersProvider.notifier)
                        .setCategory(category.id);
                  },
                  backgroundColor: const Color(0xFFEEEEEB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999.0),
                    side: const BorderSide(
                      color: Color(0xFFBCC9C6),
                      width: 0.5,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF3D4947),
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.zero,
                ),
              );
            }).toList(),
          );
        },
        loading: () => const SizedBox(),
        error: (err, stack) => const SizedBox(),
      ),
    ];
  }

  // Tạo động danh sách các chip đang kích hoạt bộ lọc
  List<Widget> _buildActiveFilterChips(
    CatalogSearchFilters activeFilters,
    AsyncValue<List<Category>> categoriesState,
  ) {
    final chips = <Widget>[];

    // Nút xóa toàn bộ lọc (Clear All)
    chips.add(
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ActionChip(
          avatar: const Icon(
            Icons.clear_all_rounded,
            size: 14,
            color: Colors.white,
          ),
          label: const Text('Xóa hết bộ lọc'),
          onPressed: () =>
              ref.read(activeSearchFiltersProvider.notifier).reset(),
          backgroundColor: const Color(0xFFBA1A1A),
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

    // Chip địa điểm (chỉ hiển thị khi có bộ lọc địa điểm)
    if (activeFilters.location != null) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            avatar: const Icon(
              Icons.location_on_rounded,
              size: 14,
              color: Color(0xFF006A61),
            ),
            label: Text(activeFilters.location!),
            onDeleted: () => ref
                .read(activeSearchFiltersProvider.notifier)
                .setLocation(null),
            backgroundColor: const Color(0xFF006A61).withAlpha(26),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: const BorderSide(color: Color(0xFF006A61), width: 0.5),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF006A61),
            ),
            deleteIconColor: const Color(0xFF006A61),
          ),
        ),
      );
    }

    // Chip danh mục
    if (activeFilters.categoryId != null) {
      final catName = categoriesState.maybeWhen(
        data: (cats) => cats
            .firstWhere(
              (c) => c.id == activeFilters.categoryId,
              orElse: () => Category(id: '', name: '', slug: ''),
            )
            .name,
        orElse: () => '',
      );
      if (catName.isNotEmpty) {
        chips.add(
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InputChip(
              label: Text(catName),
              onDeleted: () => ref
                  .read(activeSearchFiltersProvider.notifier)
                  .setCategory(null),
              backgroundColor: const Color(0xFFEEEEEB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999.0),
                side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
              ),
              labelStyle: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: Color(0xFF3D4947),
              ),
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
            label: Text('Từ khóa: "${activeFilters.keyword}"'),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setKeyword(null),
            backgroundColor: const Color(0xFFEEEEEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Color(0xFF3D4947),
            ),
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
            label: Text(
              'Giá: ${activeFilters.priceMin ?? 0}đ - ${activeFilters.priceMax ?? "∞"}đ',
            ),
            onDeleted: () => ref
                .read(activeSearchFiltersProvider.notifier)
                .setPriceRange(null, null),
            backgroundColor: const Color(0xFFEEEEEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Color(0xFF3D4947),
            ),
          ),
        ),
      );
    }

    // Chip sắp xếp
    if (activeFilters.sort != null) {
      String sortLbl = 'Mới nhất';
      if (activeFilters.sort == 'price_asc') sortLbl = 'Giá thấp - cao';
      if (activeFilters.sort == 'price_desc') sortLbl = 'Giá cao - thấp';
      if (activeFilters.sort == 'sold_count_desc') sortLbl = 'Bán chạy';
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InputChip(
            label: Text('Sắp xếp: $sortLbl'),
            onDeleted: () =>
                ref.read(activeSearchFiltersProvider.notifier).setSort(null),
            backgroundColor: const Color(0xFFEEEEEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999.0),
              side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Color(0xFF3D4947),
            ),
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
    String? localSelectedLocation = activeFilters.location;

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
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setModalState(() {
                                _minPriceController.clear();
                                _maxPriceController.clear();
                                localSelectedCategory = null;
                                localSelectedLocation = null;
                              });
                            },
                            child: const Text(
                              'Đặt lại',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                      // Phần chọn Vị trí / Địa chỉ như yêu cầu của người dùng
                      const Text(
                        'Khu vực / Địa điểm',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: 40.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              [
                                'Hà Nội',
                                'TP. Hồ Chí Minh',
                                'Đà Nẵng',
                                'San Francisco',
                                'New York',
                              ].map((loc) {
                                final isSelected = localSelectedLocation == loc;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ChoiceChip(
                                    label: Text(loc),
                                    selected: isSelected,
                                    labelStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFF3E4947),
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    selectedColor: const Color(0xFF005049),
                                    onSelected: (selected) {
                                      setModalState(() {
                                        localSelectedLocation = selected
                                            ? loc
                                            : null;
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // Phần chọn Danh mục sản phẩm
                      const Text(
                        'Danh mục sản phẩm',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
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
                                          ? Colors.white
                                          : const Color(0xFF3E4947),
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    selectedColor: const Color(0xFF005049),
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
                      const Text(
                        'Khoảng giá (VND)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
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
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6D7A77),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '—',
                              style: TextStyle(color: Color(0xFF6D7A77)),
                            ),
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
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6D7A77),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
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
                                .setCategory(localSelectedCategory);
                            ref
                                .read(activeSearchFiltersProvider.notifier)
                                .setLocation(localSelectedLocation);
                            ref
                                .read(activeSearchFiltersProvider.notifier)
                                .setPriceRange(minVal, maxVal);
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

  Widget _buildProductShimmers() {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: index == 0 ? 240.0 : 180.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: index == 0 ? 180.0 : 240.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
