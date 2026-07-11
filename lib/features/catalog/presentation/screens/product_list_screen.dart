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
  final CatalogSearchFilters _defaultFilters = const CatalogSearchFilters(page: 1, size: 20);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(catalogProductsProvider(_defaultFilters).notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoriesProvider);
    final productsState = ref.watch(catalogProductsProvider(_defaultFilters));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F6), // Màu nền sáng sữa mới của Stitch
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(categoriesProvider);
            ref.invalidate(catalogProductsProvider(_defaultFilters));
          },
          color: const Color(0xFF006A61), // Tông màu xanh mòng két (primary) mới
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // 1. Mobile Header (Menu, Title, Cart) theo Stitch
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu_rounded, color: Color(0xFF1A1C1B), size: 24),
                        onPressed: () {},
                      ),
                      const Text(
                        'ShopNexus',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 24,
                          fontWeight: FontWeight.w800, // ExtraBold từ Stitch Display
                          color: Color(0xFF006A61), // Primary brand color mới
                          letterSpacing: -0.5,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF1A1C1B), size: 24),
                        onPressed: () => context.push('/cart'),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Search and Filter Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.push('/search'),
                          child: Container(
                            height: 48.0,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEB), // surface-container của Stitch
                              borderRadius: BorderRadius.circular(9999.0), // Bo tròn tối đa (rounded-full)
                              border: Border.all(
                                color: const Color(0xFFBCC9C6), // outline-variant
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
                                  'Search for vintage, tech, furniture...',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                      // Nút lọc nhanh (Tune Button)
                      GestureDetector(
                        onTap: () => context.push('/search'),
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
                          child: const Icon(
                            Icons.tune_rounded,
                            color: Color(0xFF1A1C1B),
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
                        children: [
                          // Chip vị trí địa lý
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF006A61).withAlpha(26), // 10% opacity
                              borderRadius: BorderRadius.circular(9999.0),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.location_on_rounded, size: 14, color: Color(0xFF006A61)),
                                SizedBox(width: 4.0),
                                Text(
                                  'San Francisco, CA',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF006A61),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          // Categories Chips
                          categoriesState.when(
                            data: (categories) {
                              return Row(
                                children: categories.take(6).map((category) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ActionChip(
                                      label: Text(category.name),
                                      onPressed: () {
                                        ref.read(activeSearchFiltersProvider.notifier).reset();
                                        ref.read(activeSearchFiltersProvider.notifier).setCategory(category.id);
                                        context.push('/search');
                                      },
                                      backgroundColor: const Color(0xFFEEEEEB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9999.0),
                                        side: const BorderSide(color: Color(0xFFBCC9C6), width: 0.5),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 4. Tiêu đề mục "For You"
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Text(
                    'For You',
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
                          'Không có sản phẩm nào phù hợp',
                          style: TextStyle(fontFamily: 'Inter', color: Color(0xFF6D7A77)),
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
                              children: List.generate(leftColumnProducts.length, (index) {
                                final product = leftColumnProducts[index];
                                // Tỷ lệ ảnh động xen kẽ
                                final double aspect = (index % 3 == 0) ? 0.8 : 1.0;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: SharedProductCard(
                                    product: product,
                                    aspectRatio: aspect,
                                    onTap: () {
                                      context.push('/home/product/${product.id}');
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          // Cột bên phải
                          Expanded(
                            child: Column(
                              children: List.generate(rightColumnProducts.length, (index) {
                                final product = rightColumnProducts[index];
                                final double aspect = (index % 3 == 0) ? 1.0 : 0.8;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: SharedProductCard(
                                    product: product,
                                    aspectRatio: aspect,
                                    onTap: () {
                                      context.push('/home/product/${product.id}');
                                    },
                                  ),
                                );
                              }),
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
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF006A61)),
                        ),
                      ),
                    ),
                  ),
                ),

              // Khoảng đệm cuối danh sách
              const SliverToBoxAdapter(
                child: SizedBox(height: 80.0),
              ),
            ],
          ),
        ),
      ),
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
