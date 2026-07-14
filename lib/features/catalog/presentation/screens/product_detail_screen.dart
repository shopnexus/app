import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/money_utils.dart';
import '../../../../shared/models/resource_model.dart';
import '../../../../shared/widgets/shared_product_card.dart';
import '../../data/models/catalog_model.dart';
import '../providers/catalog_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;
  bool _isDescriptionExpanded = false;

  // Lưu trữ các thuộc tính biến thể đã chọn, ví dụ: {'Màu sắc': 'Đỏ', 'Kích cỡ': 'L'}
  final Map<String, String> _selectedAttributes = {};
  ProductSku? _selectedSku;
  int _quantity = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Lấy các tùy chọn thuộc tính độc nhất từ danh sách SKUs
  Map<String, List<String>> _getAttributeOptions(List<ProductSku> skus) {
    final options = <String, Set<String>>{};
    for (final sku in skus) {
      if (sku.attributes != null) {
        for (final attr in sku.attributes!) {
          options.putIfAbsent(attr.key, () => <String>{}).add(attr.value);
        }
      }
    }
    return options.map((key, val) => MapEntry(key, val.toList()));
  }

  // Tìm SKU khớp với các thuộc tính đang chọn
  ProductSku? _getSelectedSku(List<ProductSku> skus) {
    for (final sku in skus) {
      if (sku.attributes == null) continue;
      bool matches = true;
      for (final attr in sku.attributes!) {
        if (_selectedAttributes[attr.key] != attr.value) {
          matches = false;
          break;
        }
      }
      if (matches && _selectedAttributes.length == sku.attributes!.length) {
        return sku;
      }
    }
    return null;
  }

  // Tự động chọn các giá trị đầu tiên của SKU khi mới tải trang
  void _initializeDefaultSelection(List<ProductSku> skus) {
    if (_selectedAttributes.isNotEmpty || skus.isEmpty) return;

    final options = _getAttributeOptions(skus);
    options.forEach((key, values) {
      if (values.isNotEmpty) {
        _selectedAttributes[key] = values.first;
      }
    });
    _selectedSku = _getSelectedSku(skus);
  }

  @override
  Widget build(BuildContext context) {
    final detailState = ref.watch(productDetailProvider(id: widget.productId));
    final commentsState = ref.watch(
      productCommentsProvider(spuId: widget.productId),
    );
    final recentlyViewedState = ref.watch(recentlyViewedProductsProvider);

    return detailState.when(
      data: (detail) {
        // Tự động khởi tạo lựa chọn thuộc tính mặc định nếu có SKUs
        if (detail.skus != null && detail.skus!.isNotEmpty) {
          _initializeDefaultSelection(detail.skus!);
        }

        // Lấy danh sách ảnh hiển thị trong Gallery (Ưu tiên ảnh biến thể nếu được chọn)
        List<ResourceModel> galleryItems = detail.images ?? [];
        if (_selectedSku != null &&
            _selectedSku!.images != null &&
            _selectedSku!.images!.isNotEmpty) {
          galleryItems = _selectedSku!.images!;
        }

        // Xác định tổng lượng tồn kho hiển thị
        final int totalStock =
            _selectedSku?.stock ??
            detail.skus?.fold<int>(0, (prev, s) => prev + s.stock) ??
            0;

        // Tính toán khoảng giá hiển thị
        String priceText = MoneyUtils.format(detail.price);
        String? originalPriceText;
        if (detail.originalPrice != null) {
          originalPriceText = MoneyUtils.format(detail.originalPrice!);
        }

        if (_selectedSku != null) {
          priceText = MoneyUtils.format(_selectedSku!.price);
          if (_selectedSku!.originalPrice != null) {
            originalPriceText = MoneyUtils.format(_selectedSku!.originalPrice!);
          }
        } else if (detail.skus != null && detail.skus!.isNotEmpty) {
          final prices = detail.skus!.map((s) => s.price).toList();
          final minPrice = prices.reduce((a, b) => a < b ? a : b);
          final maxPrice = prices.reduce((a, b) => a > b ? a : b);
          if (minPrice == maxPrice) {
            priceText = MoneyUtils.format(minPrice);
          } else {
            priceText =
                '${MoneyUtils.format(minPrice)} - ${MoneyUtils.format(maxPrice)}';
          }
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7), // Nền trắng sữa Nexus
          body: Stack(
            children: [
              // Nội dung cuộn chính của màn hình chi tiết
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Gallery ảnh & video sản phẩm dạng PageView
                      _buildGallerySection(galleryItems),

                      // 2. Thông tin chính SPU (Giá cả, Tên sản phẩm, Đánh giá)
                      _buildProductPrimaryInfo(
                        detail,
                        priceText,
                        originalPriceText,
                      ),

                      const SizedBox(height: 8.0),

                      // 3. Bộ chọn biến thể (SKU Selector) & Số lượng
                      if (detail.skus != null && detail.skus!.isNotEmpty)
                        _buildSkuSelectorSection(detail.skus!, totalStock),

                      const SizedBox(height: 8.0),

                      // 4. Thông tin người bán (Vendor Info)
                      _buildVendorSection(detail),

                      const SizedBox(height: 8.0),

                      // 5. Bảng thông số kỹ thuật (Specifications) & Mô tả (Description)
                      _buildSpecsAndDescSection(detail),

                      const SizedBox(height: 8.0),

                      // 6. Khu vực Đánh giá (Review & Comments Section)
                      _buildReviewsSection(commentsState),

                      const SizedBox(height: 8.0),

                      // 7. Sản phẩm vừa xem gần đây (Recently Viewed)
                      _buildRecentlyViewedSection(recentlyViewedState),

                      // Khoảng trống đệm cho bottom bar
                      const SizedBox(height: 100.0),
                    ],
                  ),
                ),
              ),

              // Nút Back & Trực quan các phím điều hướng góc trên
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withAlpha(100),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withAlpha(100),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Đã thêm sản phẩm này vào danh mục yêu thích!',
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // 8. Sticky Bottom Bar đặt hàng dưới cùng
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildStickyBottomBar(detail, totalStock),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF005049)),
        ),
      ),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Chi tiết sản phẩm')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Lỗi tải thông tin sản phẩm: $err',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    productDetailProvider(id: widget.productId),
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

  // 1. Gallery ảnh & video sản phẩm dạng PageView
  Widget _buildGallerySection(List<ResourceModel> items) {
    if (items.isEmpty) {
      return Container(
        height: 360.0,
        color: const Color(0xFFEEEEEB),
        child: const Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 64,
            color: Color(0xFF6D7A77),
          ),
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: 380.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final media = items[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: media.url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(color: Colors.white),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: const Color(0xFFEEEEEB),
                      child: const Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: Color(0xFF6D7A77),
                      ),
                    ),
                  ),
                  if (media.type.toLowerCase() == 'video')
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Xem Video: Đang khởi tạo trình phát AI Wizard...',
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.black.withAlpha(150),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        // Bộ đếm ảnh dạng chỉ mục góc phải (Index overlay)
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(120),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              '${_currentImageIndex + 1}/${items.length}',
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 2. Thông tin chính SPU (Giá cả, Tên sản phẩm, Đánh giá)
  Widget _buildProductPrimaryInfo(
    TProductDetail detail,
    String priceText,
    String? originalPriceText,
  ) {
    // Tính toán phần trăm giảm giá nếu có
    int? discountPercent;
    if (_selectedSku != null &&
        _selectedSku!.originalPrice != null &&
        _selectedSku!.originalPrice! > _selectedSku!.price) {
      discountPercent =
          ((_selectedSku!.originalPrice! - _selectedSku!.price) /
                  _selectedSku!.originalPrice! *
                  100)
              .round();
    } else if (detail.originalPrice != null &&
        detail.originalPrice! > detail.price) {
      discountPercent =
          ((detail.originalPrice! - detail.price) / detail.originalPrice! * 100)
              .round();
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Khu vực hiển thị giá bán
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                priceText,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF005049), // Trustworthy Teal
                ),
              ),
              if (originalPriceText != null) ...[
                const SizedBox(width: 8.0),
                Text(
                  originalPriceText,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xFF6D7A77),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
              if (discountPercent != null && discountPercent > 0) ...[
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF773115).withAlpha(26),
                    // 10% opacity Warm Rust
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '-$discountPercent%',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF773115), // Warm Rust
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12.0),

          // Tên sản phẩm
          Text(
            detail.name,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1C1B),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12.0),

          // Điểm đánh giá sao và số lượng đã bán
          Row(
            children: [
              if (detail.rating != null && detail.rating!.count > 0) ...[
                Row(
                  children: List.generate(5, (index) {
                    final isFilled = index < detail.rating!.score.floor();
                    return Icon(
                      isFilled ? Icons.star_rounded : Icons.star_border_rounded,
                      color: const Color(0xFF773115), // Warm Rust
                      size: 16,
                    );
                  }),
                ),
                const SizedBox(width: 6.0),
                Text(
                  '${detail.rating!.score} (${detail.rating!.count} đánh giá)',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF3E4947),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('|', style: TextStyle(color: Color(0xFFBCC9C6))),
                ),
              ],
              Text(
                'Đã bán ${detail.soldCount ?? 0}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color(0xFF6D7A77),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 3. Bộ chọn biến thể (SKU Selector) & Số lượng
  Widget _buildSkuSelectorSection(List<ProductSku> skus, int totalStock) {
    final options = _getAttributeOptions(skus);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hiển thị trạng thái phân loại đã chọn
          Row(
            children: [
              const Text(
                'Phân loại sản phẩm',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1B),
                ),
              ),
              const Spacer(),
              if (_selectedSku != null)
                Text(
                  'Đã chọn: ${_selectedSku!.name}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF005049),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Lặp qua từng thuộc tính (như Màu sắc, Kích thước)
          ...options.entries.map((entry) {
            final attrKey = entry.key;
            final attrValues = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attrKey.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6D7A77),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: attrValues.map((val) {
                      final isSelected = _selectedAttributes[attrKey] == val;
                      return ChoiceChip(
                        label: Text(val),
                        selected: isSelected,
                        labelStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF3E4947),
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        selectedColor: const Color(0xFF005049),
                        // Trustworthy Teal
                        backgroundColor: const Color(0xFFEEEEEB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: isSelected
                                ? const Color(0xFF005049)
                                : const Color(0xFFBCC9C6),
                            width: 0.5,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedAttributes[attrKey] = val;
                            } else {
                              _selectedAttributes.remove(attrKey);
                            }
                            // Cập nhật SKU mới tương ứng sau khi đổi lựa chọn
                            _selectedSku = _getSelectedSku(skus);
                            // Reset lại số lượng đặt nếu vượt quá tồn kho mới
                            if (_selectedSku != null &&
                                _quantity > _selectedSku!.stock) {
                              _quantity = _selectedSku!.stock > 0 ? 1 : 0;
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }),

          const Divider(color: Color(0xFFEEEEEB), height: 24.0),

          // Bộ chỉnh số lượng đặt mua
          Row(
            children: [
              const Text(
                'Số lượng đặt mua',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1C1B),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFBCC9C6),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 16),
                      onPressed: _quantity > 1
                          ? () => setState(() => _quantity--)
                          : null,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '$_quantity',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 16),
                      onPressed: _quantity < totalStock
                          ? () => setState(() => _quantity++)
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                'Tồn kho: $totalStock',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color(0xFF6D7A77),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 4. Thông tin người bán (Vendor Info)
  Widget _buildVendorSection(TProductDetail detail) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: detail.vendorAvatar != null
                ? CachedNetworkImageProvider(detail.vendorAvatar!)
                : null,
            backgroundColor: const Color(0xFFEEEEEB),
            child: detail.vendorAvatar == null
                ? const Icon(Icons.storefront_rounded, color: Color(0xFF6D7A77))
                : null,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.vendorName ?? 'Shop đối tác',
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1B),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Đối tác uy tín | Phản hồi 99%',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF6D7A77),
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
            label: const Text('Chat ngay'),
            onPressed: () {
              // Chuyển hướng sang tab Chat
              context.go('/chat');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF005049),
              side: const BorderSide(color: Color(0xFF005049)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 5. Bảng thông số kỹ thuật (Specifications) & Mô tả (Description)
  Widget _buildSpecsAndDescSection(TProductDetail detail) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bảng thông số kỹ thuật
          if (detail.specifications != null &&
              detail.specifications!.isNotEmpty) ...[
            const Text(
              'Thông số kỹ thuật',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C1B),
              ),
            ),
            const SizedBox(height: 10.0),
            ...detail.specifications!.map((spec) {
              final isEven = detail.specifications!.indexOf(spec).isEven;
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: isEven ? const Color(0xFFF9F9F7) : Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        spec.key,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFF6D7A77),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        spec.value,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1C1B),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Divider(color: Color(0xFFEEEEEB), height: 32.0),
          ],

          // Mô tả sản phẩm
          const Text(
            'Mô tả sản phẩm',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1C1B),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            detail.description ?? 'Sản phẩm chưa cập nhật mô tả chi tiết.',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF3E4947),
              height: 1.5,
            ),
            maxLines: _isDescriptionExpanded ? null : 4,
            overflow: _isDescriptionExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          Center(
            child: TextButton.icon(
              icon: Icon(
                _isDescriptionExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: const Color(0xFF005049),
              ),
              label: Text(
                _isDescriptionExpanded ? 'Thu gọn' : 'Xem thêm',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF005049),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                setState(() {
                  _isDescriptionExpanded = !_isDescriptionExpanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // 6. Khu vực Đánh giá (Review & Comments Section)
  Widget _buildReviewsSection(AsyncValue<List<ProductComment>> commentsState) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Đánh giá từ người mua',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1C1B),
            ),
          ),
          const SizedBox(height: 12.0),

          commentsState.when(
            data: (comments) {
              if (comments.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text(
                      'Sản phẩm chưa có lượt đánh giá nào.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF6D7A77),
                      ),
                    ),
                  ),
                );
              }

              // Tính toán phân tích điểm sao
              final double avgScore =
                  comments.map((c) => c.score).reduce((a, b) => a + b) /
                  comments.length;

              return Column(
                children: [
                  // Breakdown Tóm tắt sao
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F7),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              avgScore.toStringAsFixed(1),
                              style: const TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF773115),
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < avgScore.floor()
                                      ? Icons.star_rounded
                                      : Icons.star_border_rounded,
                                  color: const Color(0xFF773115),
                                  size: 14,
                                );
                              }),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '${comments.length} đánh giá',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: Color(0xFF6D7A77),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24.0),
                        // Thanh phân phối sao đơn giản
                        Expanded(
                          child: Column(
                            children: List.generate(5, (starIdx) {
                              final int starVal = 5 - starIdx;
                              final int count = comments
                                  .where((c) => c.score.round() == starVal)
                                  .length;
                              final double pct = comments.isEmpty
                                  ? 0
                                  : count / comments.length;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '$starVal',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 10,
                                      color: Color(0xFF773115),
                                    ),
                                    const SizedBox(width: 6.0),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        child: LinearProgressIndicator(
                                          value: pct,
                                          backgroundColor: const Color(
                                            0xFFEEEEEB,
                                          ),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(Color(0xFF773115)),
                                          minHeight: 4,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '${(pct * 100).round()}%',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        color: Color(0xFF6D7A77),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Danh sách các comment của người dùng
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comments.take(3).length,
                    // Hiển thị tối đa 3 đánh giá nổi bật
                    separatorBuilder: (context, index) =>
                        const Divider(color: Color(0xFFEEEEEB), height: 24),
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundImage:
                                    comment.profile?.avatarUrl != null
                                    ? CachedNetworkImageProvider(
                                        comment.profile!.avatarUrl!,
                                      )
                                    : null,
                                backgroundColor: const Color(0xFFEEEEEB),
                                child: comment.profile?.avatarUrl == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 14,
                                        color: Color(0xFF6D7A77),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                comment.profile?.name ??
                                    comment.profile?.username ??
                                    'Người dùng ẩn danh',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                comment.dateCreated?.split('T').first ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  color: Color(0xFF6D7A77),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6.0),
                          Row(
                            children: List.generate(5, (sIdx) {
                              return Icon(
                                sIdx < comment.score.floor()
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: const Color(0xFF773115),
                                size: 12,
                              );
                            }),
                          ),
                          if (comment.attributes != null &&
                              comment.attributes!.isNotEmpty) ...[
                            const SizedBox(height: 4.0),
                            Text(
                              'Phân loại: ${comment.attributes!.map((a) => '${a.key}: ${a.value}').join(', ')}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: Color(0xFF6D7A77),
                              ),
                            ),
                          ],
                          if (comment.body != null &&
                              comment.body!.isNotEmpty) ...[
                            const SizedBox(height: 6.0),
                            Text(
                              comment.body!,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Color(0xFF3E4947),
                                height: 1.4,
                              ),
                            ),
                          ],
                          // Hình ảnh đính kèm nhận định của đánh giá
                          if (comment.attachments != null &&
                              comment.attachments!.isNotEmpty) ...[
                            const SizedBox(height: 8.0),
                            SizedBox(
                              height: 60.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: comment.attachments!.length,
                                itemBuilder: (context, aIdx) {
                                  final attach = comment.attachments![aIdx];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Phóng to ảnh
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: CachedNetworkImage(
                                              imageUrl: attach.url,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          6.0,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: attach.url,
                                          width: 60.0,
                                          height: 60.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => const Text('Lỗi tải lượt đánh giá.'),
          ),
        ],
      ),
    );
  }

  // 7. Sản phẩm vừa xem gần nhất (Recently Viewed)
  Widget _buildRecentlyViewedSection(
    AsyncValue<List<TProductCard>> recentlyViewedState,
  ) {
    return recentlyViewedState.when(
      data: (products) {
        // Lọc bỏ sản phẩm hiện tại ra khỏi danh mục gợi ý
        final filteredList = products
            .where((p) => p.id != widget.productId)
            .toList();

        if (filteredList.isEmpty) {
          return const SizedBox();
        }

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sản phẩm vừa xem gần đây',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1B),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final product = filteredList[index];
                    return Container(
                      width: 150.0,
                      margin: const EdgeInsets.only(right: 12.0),
                      child: SharedProductCard(
                        product: product,
                        aspectRatio: 1.0,
                        onTap: () {
                          // Điều hướng sang sản phẩm khác
                          context.push('/home/product/${product.id}');
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox(),
      error: (err, stack) => const SizedBox(),
    );
  }

  // 8. Sticky Bottom Bar đặt hàng dưới cùng
  Widget _buildStickyBottomBar(TProductDetail detail, int totalStock) {
    final bool isOutOfStock = totalStock <= 0;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16.0,
        12.0,
        16.0,
        MediaQuery.of(context).padding.bottom + 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Nút Icon Chat
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEB),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Color(0xFF1A1C1B),
              ),
              onPressed: () => context.go('/chat'),
            ),
          ),
          const SizedBox(width: 10.0),

          // Nút Icon Thêm vào giỏ hàng
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEB),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Color(0xFF1A1C1B),
              ),
              onPressed: isOutOfStock
                  ? null
                  : () {
                      final skuName = _selectedSku != null
                          ? ' (${_selectedSku!.name})'
                          : '';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Đã thêm $_quantity x ${detail.name}$skuName vào giỏ hàng!',
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
            ),
          ),
          const SizedBox(width: 12.0),

          // Nút Mua Ngay lớn
          Expanded(
            child: SizedBox(
              height: 48.0,
              child: ElevatedButton(
                onPressed: isOutOfStock
                    ? null
                    : () {
                        final skuName = _selectedSku != null
                            ? ' (${_selectedSku!.name})'
                            : '';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Mua ngay $_quantity x ${detail.name}$skuName! Chuyển hướng thanh toán...',
                            ),
                            backgroundColor: const Color(0xFF005049),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF005049), // Trustworthy Teal
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Bo góc 8px
                  ),
                  elevation: 0,
                ),
                child: Text(
                  isOutOfStock ? 'HẾT HÀNG' : 'MUA NGAY',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
