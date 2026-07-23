import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/widgets/shared_product_card.dart';
import '../../../account/presentation/providers/account_provider.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../providers/seller_provider.dart';

class SellerProfileScreen extends ConsumerStatefulWidget {
  final String vendorId;

  const SellerProfileScreen({super.key, required this.vendorId});

  @override
  ConsumerState<SellerProfileScreen> createState() =>
      _SellerProfileScreenState();
}

class _SellerProfileScreenState extends ConsumerState<SellerProfileScreen> {
  int _selectedTabIndex = 1; // Default to 'Seller Products' (tab index 1)

  @override
  Widget build(BuildContext context) {
    final sellerProfileAsync = ref.watch(
      publicProfileProvider(widget.vendorId),
    );
    final sellerProductsAsync = ref.watch(
      sellerProductsProvider(widget.vendorId),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // Stitch Background
      appBar: AppBar(
        title: const Text(
          'Seller Profile',
          style: TextStyle(
            color: Color(0xFF1A1C1B),
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1A1C1B),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: sellerProfileAsync.when(
        data: (profile) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(publicProfileProvider(widget.vendorId));
              ref.invalidate(sellerProductsProvider(widget.vendorId));
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header Info
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundColor: const Color(0xFFE2E3E0),
                          backgroundImage: profile.avatarUrl != null
                              ? CachedNetworkImageProvider(profile.avatarUrl!)
                              : null,
                          child: profile.avatarUrl == null
                              ? const Icon(
                                  Icons.storefront_rounded,
                                  size: 56,
                                  color: Color(0xFF6E7977),
                                )
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          profile.name ??
                              profile.username ??
                              'Cửa hàng đối tác',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Manrope',
                            color: Color(0xFF1A1C1B),
                          ),
                        ),
                        if (profile.description != null &&
                            profile.description!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            profile.description!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter',
                              color: Color(0xFF6E7977),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Custom Navigation Tabs
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE2E3E0), width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTabButton(0, 'About'),
                        _buildTabButton(1, 'Seller Products'),
                        _buildTabButton(2, 'All Reviews'),
                        _buildTabButton(3, 'Feedback'),
                      ],
                    ),
                  ),

                  // Tab Content Area
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildTabContent(profile, sellerProductsAsync),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => _buildShimmerProfile(),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: Color(0xFFBA1A1A),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Không thể tải hồ sơ người bán',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF6E7977),
                    fontSize: 13,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(publicProfileProvider(widget.vendorId)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF005049),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF005049) : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Inter',
            color: isSelected
                ? const Color(0xFF005049)
                : const Color(0xFF6E7977),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(
    dynamic profile,
    AsyncValue<List<TProductCard>> productsAsync,
  ) {
    switch (_selectedTabIndex) {
      case 0: // About
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E3E0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Giới thiệu cửa hàng',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: Color(0xFF1A1C1B),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                profile.description ?? 'Chưa có thông tin giới thiệu cửa hàng.',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  color: Color(0xFF3E4947),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Thông tin liên hệ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: Color(0xFF1A1C1B),
                ),
              ),
              const SizedBox(height: 12),
              if (profile.email != null)
                ListTile(
                  leading: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF6E7977),
                  ),
                  title: Text(
                    profile.email!,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                  ),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              if (profile.phone != null)
                ListTile(
                  leading: const Icon(
                    Icons.phone_outlined,
                    color: Color(0xFF6E7977),
                  ),
                  title: Text(
                    profile.phone!,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                  ),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ListTile(
                leading: const Icon(
                  Icons.public_outlined,
                  color: Color(0xFF6E7977),
                ),
                title: Text(
                  'Quốc gia: ${profile.country}',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ],
          ),
        );
      case 1: // Seller Products
        return productsAsync.when(
          data: (products) {
            if (products.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.widgets_outlined,
                        size: 48,
                        color: Color(0xFFbec9c6),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Cửa hàng này chưa đăng sản phẩm nào.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFF6E7977),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            // MASONRY LAYOUT
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

            return Row(
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
                          child: SharedProductCard(
                            product: product,
                            aspectRatio: aspect,
                            showVendor: false,
                            onTap: () {
                              context.push('/home/product/${product.id}');
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }),
            );
          },
          loading: () {
            // MASONRY SHIMMER
            final double width = MediaQuery.of(context).size.width;
            final int crossAxisCount = width >= 900
                ? 4
                : (width >= 600 ? 3 : 2);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(crossAxisCount, (colIndex) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: colIndex < crossAxisCount - 1 ? 12.0 : 0.0,
                    ),
                    child: Column(
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildShimmerProductCard(),
                        );
                      }),
                    ),
                  ),
                );
              }),
            );
          },
          error: (err, stack) => Center(
            child: Text(
              'Lỗi tải sản phẩm: $err',
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFFBA1A1A),
              ),
            ),
          ),
        );
      case 2: // All Reviews
      case 3: // Feedback
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E3E0)),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.rate_review_outlined,
                size: 48,
                color: Color(0xFFbec9c6),
              ),
              const SizedBox(height: 12),
              Text(
                _selectedTabIndex == 2
                    ? 'Chưa có đánh giá nào cho người bán này.'
                    : 'Chưa có phản hồi nào dành cho người bán này.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Color(0xFF6E7977),
                ),
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildShimmerProfile() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEEEEEC),
      highlightColor: const Color(0xFFF9F9F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                const CircleAvatar(radius: 56, backgroundColor: Colors.white),
                const SizedBox(height: 16),
                Container(height: 22, width: 160, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 14, width: 240, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                final double width = MediaQuery.of(context).size.width;
                final int crossAxisCount = width >= 900
                    ? 4
                    : (width >= 600 ? 3 : 2);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(crossAxisCount, (colIndex) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: colIndex < crossAxisCount - 1 ? 12.0 : 0.0,
                        ),
                        child: Column(
                          children: List.generate(
                            2,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: _buildShimmerProductCard(),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(height: 14, width: 60, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
