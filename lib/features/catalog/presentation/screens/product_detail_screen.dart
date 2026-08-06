import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/buy_or_negotiate_sheet.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/send_offer_sheet.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/models/checkout_model.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:flutter/services.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/data/providers/chat_providers.dart';
import 'package:shopnexus_flutter_app/shared/widgets/shared_product_card.dart';

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
  Variant? _selectedVariant;
  int _quantity = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Lấy các tùy chọn thuộc tính độc nhất từ danh sách biến thể
  Map<String, List<String>> _getAttributeOptions(List<Variant> variants) {
    final options = <String, Set<String>>{};
    for (final variant in variants) {
      variant.attributes.forEach((key, value) {
        options.putIfAbsent(key, () => <String>{}).add(value.toString());
      });
    }
    return options.map((key, val) => MapEntry(key, val.toList()));
  }

  // Tìm biến thể khớp với các thuộc tính đang chọn
  Variant? _getSelectedVariant(List<Variant> variants) {
    for (final variant in variants) {
      if (variant.attributes.length != _selectedAttributes.length) continue;
      final matches = variant.attributes.entries.every(
        (attr) => _selectedAttributes[attr.key] == attr.value.toString(),
      );
      if (matches) return variant;
    }
    return null;
  }

  // Tự động chọn các giá trị đầu tiên khi mới tải trang
  void _initializeDefaultSelection(List<Variant> variants) {
    if (_selectedAttributes.isNotEmpty || variants.isEmpty) return;

    final options = _getAttributeOptions(variants);
    options.forEach((key, values) {
      if (values.isNotEmpty) {
        _selectedAttributes[key] = values.first;
      }
    });
    _selectedVariant = _getSelectedVariant(variants);
  }

  @override
  Widget build(BuildContext context) {
    final detailState = ref.watch(productDetailProvider(id: widget.productId));
    final reviewsState = ref.watch(productReviewsProvider(widget.productId));
    final recentlyViewedState = ref.watch(recentlyViewedProductsProvider);

    return detailState.when(
      data: (detail) {
        _initializeDefaultSelection(detail.variants);

        // Lấy danh sách ảnh hiển thị trong Gallery (Ưu tiên ảnh biến thể nếu được chọn)
        final variantImages = _selectedVariant?.images ?? const <Resource>[];
        final galleryItems = variantImages.isNotEmpty
            ? variantImages
            : detail.images;

        // Xác định tổng lượng tồn kho hiển thị
        final int totalStock =
            _selectedVariant?.stock.available ??
            detail.variants.fold<int>(0, (prev, v) => prev + v.stock.available);

        // Tính toán khoảng giá hiển thị: một biến thể đã chọn có giá của nó, còn
        // lại là khoảng giá của cả tin đăng.
        final String priceText = _selectedVariant != null
            ? MoneyUtils.format(_selectedVariant!.price)
            : _priceRangeText(detail);

        final theme = Theme.of(context);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
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
                      _buildProductPrimaryInfo(detail, priceText),

                      const SizedBox(height: 8.0),

                      // 3. Bộ chọn biến thể & Số lượng
                      if (detail.variants.isNotEmpty)
                        _buildVariantSelectorSection(
                          detail.variants,
                          totalStock,
                        ),

                      const SizedBox(height: 8.0),

                      // 4. Thông tin người bán (Vendor Info)
                      _buildVendorSection(detail),

                      const SizedBox(height: 8.0),

                      // 5. Bảng thông số kỹ thuật (Specifications) & Mô tả (Description)
                      _buildSpecsAndDescSection(detail),

                      const SizedBox(height: 8.0),

                      // 6. Khu vực Đánh giá (Review Section)
                      _buildReviewsSection(detail, reviewsState),

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
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black.withAlpha(100),
                      child: IconButton(
                        icon: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => _showShareModal(context, ref, detail),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
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
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.black.withAlpha(100),
                      child: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                        onSelected: (value) {
                          if (value == 'report') _reportListing(detail);
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'report',
                            child: Row(
                              children: [
                                Icon(Icons.flag_outlined, size: 18),
                                SizedBox(width: 10),
                                Text(
                                  'Báo cáo tin đăng',
                                  style: TextStyle(fontFamily: 'Inter'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
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
  Widget _buildGallerySection(List<Resource> items) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    if (items.isEmpty) {
      return Container(
        height: 360.0,
        color: isDarkMode ? AppColors.darkSurface : const Color(0xFFEEEEEB),
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
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
              final mediaUrl = media.url;
              return Stack(
                fit: StackFit.expand,
                children: [
                  // `url` is absent until the module can presign one, so one
                  // un-presigned photo costs a placeholder, not the gallery.
                  if (mediaUrl.isEmpty)
                    Container(
                      color: isDarkMode
                          ? AppColors.darkSurface
                          : const Color(0xFFEEEEEB),
                      child: Icon(
                        Icons.image_outlined,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    )
                  else
                    CachedNetworkImage(
                      imageUrl: mediaUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: isDarkMode
                            ? Colors.grey[800]!
                            : Colors.grey[200]!,
                        highlightColor: isDarkMode
                            ? Colors.grey[700]!
                            : Colors.grey[100]!,
                        child: Container(
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: isDarkMode
                            ? AppColors.darkSurface
                            : const Color(0xFFEEEEEB),
                        child: Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  if (media.mime.startsWith('video/'))
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
  //
  // Không còn giá gạch ngang hay phần trăm giảm: một tin đăng chỉ có một giá,
  // `original_price` là trường server chưa từng gửi.
  Widget _buildProductPrimaryInfo(ListingDetail detail, String priceText) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final accentStarColor = isDarkMode
        ? AppColors.darkPrimary
        : const Color(0xFF773115);

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
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
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.primary,
                ),
              ),
              if (detail.priceMode == PriceMode.negotiable) ...[
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: theme.colorScheme.primary.withAlpha(80),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.handshake_outlined,
                        size: 14,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Có thể thương lượng',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          if (detail.priceMode == PriceMode.negotiable) ...[
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF4F4F1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withAlpha(50),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withAlpha(25),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai cách mua',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Mua ngay ở giá ${MoneyUtils.format(_selectedVariant?.price ?? featuredPrice(detail))}, hoặc gửi đề xuất giá của bạn cho người bán.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12.0),

          // Tên sản phẩm
          Text(
            detail.name,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12.0),

          // Điểm đánh giá sao và số lượng đã bán
          Row(
            children: [
              if (detail.reviewCount > 0) ...[
                Row(
                  children: List.generate(5, (index) {
                    final isFilled = index < detail.rating.floor();
                    return Icon(
                      isFilled ? Icons.star_rounded : Icons.star_border_rounded,
                      color: accentStarColor,
                      size: 16,
                    );
                  }),
                ),
                const SizedBox(width: 6.0),
                Text(
                  '${detail.rating} (${detail.reviewCount} đánh giá)',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '|',
                    style: TextStyle(
                      color: isDarkMode
                          ? AppColors.darkPrimary.withAlpha(40)
                          : const Color(0xFFBCC9C6),
                    ),
                  ),
                ),
              ],
              Text(
                'Đã bán ${detail.sold}',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
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
  Widget _buildVariantSelectorSection(List<Variant> variants, int totalStock) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final options = _getAttributeOptions(variants);

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hiển thị trạng thái phân loại đã chọn
          Row(
            children: [
              Text(
                'Phân loại sản phẩm',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              if (_selectedVariant != null)
                Text(
                  'Đã chọn: ${variantLabel(_selectedVariant!)}',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
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
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurfaceVariant,
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        label: Text(val),
                        selected: isSelected,
                        labelStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurface,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        selectedColor: theme.colorScheme.primary,
                        backgroundColor: isDarkMode
                            ? theme.colorScheme.surfaceContainerHighest
                            : const Color(0xFFEEEEEB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : (isDarkMode
                                      ? AppColors.darkPrimary.withAlpha(40)
                                      : const Color(0xFFBCC9C6)),
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
                            _selectedVariant = _getSelectedVariant(variants);
                            // Reset lại số lượng đặt nếu vượt quá tồn kho mới
                            final available = _selectedVariant?.stock.available;
                            if (available != null && _quantity > available) {
                              _quantity = available > 0 ? 1 : 0;
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

          Divider(
            color: isDarkMode
                ? AppColors.darkPrimary.withAlpha(20)
                : const Color(0xFFEEEEEB),
            height: 24.0,
          ),

          // Bộ chỉnh số lượng đặt mua
          Row(
            children: [
              Text(
                'Số lượng đặt mua',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isDarkMode
                        ? AppColors.darkPrimary.withAlpha(40)
                        : const Color(0xFFBCC9C6),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 16,
                        color: theme.colorScheme.onSurface,
                      ),
                      onPressed: _quantity > 1
                          ? () => setState(() => _quantity--)
                          : null,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '$_quantity',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 16,
                        color: theme.colorScheme.onSurface,
                      ),
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
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 4. Thông tin người bán (Vendor Info)
  Widget _buildVendorSection(ListingDetail detail) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final seller = detail.seller;
    // The listing already names the seller, so the profile lookup only upgrades
    // what is drawn — a slow or failed one leaves the card readable.
    final sellerProfileState = ref.watch(publicProfileProvider(seller.id));

    final String name = sellerProfileState.when(
      data: (profile) => profile.name.isNotEmpty ? profile.name : seller.name,
      loading: () => seller.name,
      error: (_, _) => seller.name,
    );

    final String? avatarUrl = sellerProfileState.when(
      data: (profile) => profile.avatarUrl ?? seller.avatar?.url,
      loading: () => seller.avatar?.url,
      error: (_, _) => seller.avatar?.url,
    );

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.push('/vendor/${seller.id}'),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: avatarUrl != null
                  ? CachedNetworkImageProvider(avatarUrl)
                  : null,
              backgroundColor: isDarkMode
                  ? theme.colorScheme.surfaceContainerHighest
                  : const Color(0xFFEEEEEB),
              child: avatarUrl == null
                  ? Icon(
                      Icons.storefront_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: GestureDetector(
              onTap: () => context.push('/vendor/${seller.id}'),
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Đối tác uy tín | Phản hồi 99%',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
            label: const Text('Chat ngay'),
            onPressed: () => _navigateToChatDetail(context, ref),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
              side: BorderSide(color: theme.colorScheme.primary),
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
  Widget _buildSpecsAndDescSection(ListingDetail detail) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    // `specifications` is an open object keyed by the seller's own labels, so the
    // table is its entries in order — there is no fixed set of rows to expect.
    final specs = detail.specifications.entries.toList();

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bảng thông số kỹ thuật
          if (specs.isNotEmpty) ...[
            Text(
              'Thông số kỹ thuật',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10.0),
            ...specs.indexed.map((entry) {
              final (index, spec) = entry;
              final rowBg = index.isEven
                  ? (isDarkMode
                        ? theme.colorScheme.surfaceContainerHighest
                        : const Color(0xFFF9F9F7))
                  : (isDarkMode ? AppColors.darkSurface : Colors.white);
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: rowBg,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        spec.key,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        spec.value.toString(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Divider(
              color: isDarkMode
                  ? AppColors.darkPrimary.withAlpha(20)
                  : const Color(0xFFEEEEEB),
              height: 32.0,
            ),
          ],

          // Mô tả sản phẩm
          Text(
            'Mô tả sản phẩm',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            detail.description.isEmpty
                ? 'Sản phẩm chưa cập nhật mô tả chi tiết.'
                : detail.description,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: theme.colorScheme.onSurface,
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
                color: theme.colorScheme.primary,
              ),
              label: Text(
                _isDescriptionExpanded ? 'Thu gọn' : 'Xem thêm',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: theme.colorScheme.primary,
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

  // 6. Khu vực Đánh giá (Review Section)
  //
  // Điểm trung bình và số lượt lấy từ chính tin đăng: trang chỉ tải một trang
  // đánh giá, nên tính lại từ đó sẽ sai ngay khi có nhiều hơn một trang.
  Widget _buildReviewsSection(
    ListingDetail detail,
    AsyncValue<ProductReviewsState> reviewsState,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final accentStarColor = isDarkMode
        ? AppColors.darkPrimary
        : const Color(0xFF773115);

    return Container(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đánh giá từ người mua',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12.0),

          reviewsState.when(
            data: (state) {
              final reviews = state.reviews;
              if (reviews.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text(
                      'Sản phẩm chưa có lượt đánh giá nào.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  _buildRatingBreakdown(detail, reviews, accentStarColor),
                  const SizedBox(height: 16.0),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    separatorBuilder: (context, index) => Divider(
                      color: isDarkMode
                          ? AppColors.darkPrimary.withAlpha(20)
                          : const Color(0xFFEEEEEB),
                      height: 24,
                    ),
                    itemBuilder: (context, index) =>
                        _buildReviewTile(reviews[index], accentStarColor),
                  ),
                  if (state.hasMore) ...[
                    const SizedBox(height: 8.0),
                    Center(
                      child: state.isLoadingMore
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            )
                          : TextButton(
                              onPressed: () => ref
                                  .read(
                                    productReviewsProvider(
                                      widget.productId,
                                    ).notifier,
                                  )
                                  .loadNextPage(),
                              child: const Text(
                                'Xem thêm đánh giá',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ],
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

  /// Thanh phân phối sao chỉ tính trên các đánh giá đã tải — nhãn nói rõ như vậy.
  Widget _buildRatingBreakdown(
    ListingDetail detail,
    List<Review> loaded,
    Color accentStarColor,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF9F9F7),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                detail.rating.toStringAsFixed(1),
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: accentStarColor,
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < detail.rating.floor()
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: accentStarColor,
                    size: 14,
                  );
                }),
              ),
              const SizedBox(height: 4.0),
              Text(
                '${detail.reviewCount} đánh giá',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24.0),
          Expanded(
            child: Column(
              children: List.generate(5, (starIdx) {
                final int starVal = 5 - starIdx;
                final int count = loaded
                    .where((r) => r.rating == starVal)
                    .length;
                final double pct = loaded.isEmpty ? 0 : count / loaded.length;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Row(
                    children: [
                      Text(
                        '$starVal',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Icon(
                        Icons.star_rounded,
                        size: 10,
                        color: accentStarColor,
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            value: pct,
                            backgroundColor: isDarkMode
                                ? AppColors.darkSurface
                                : const Color(0xFFEEEEEB),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              accentStarColor,
                            ),
                            minHeight: 4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${(pct * 100).round()}%',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          color: theme.colorScheme.onSurfaceVariant,
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
    );
  }

  Widget _buildReviewTile(Review review, Color accentStarColor) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final avatarUrl = review.author.avatar?.url;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: avatarUrl != null
                  ? CachedNetworkImageProvider(avatarUrl)
                  : null,
              backgroundColor: isDarkMode
                  ? theme.colorScheme.surfaceContainerHighest
                  : const Color(0xFFEEEEEB),
              child: avatarUrl == null
                  ? Icon(
                      Icons.person,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    )
                  : null,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                review.author.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              _formatDate(review.updatedAt ?? review.createdAt),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            ...List.generate(5, (sIdx) {
              return Icon(
                sIdx < review.rating
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: accentStarColor,
                size: 12,
              );
            }),
            if (review.updatedAt != null) ...[
              const SizedBox(width: 6.0),
              Text(
                'đã sửa',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
        if (review.body.isNotEmpty) ...[
          const SizedBox(height: 6.0),
          Text(
            review.body,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: theme.colorScheme.onSurface,
              height: 1.4,
            ),
          ),
        ],
        if (review.attachments.isNotEmpty) ...[
          const SizedBox(height: 8.0),
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: review.attachments.length,
              itemBuilder: (context, aIdx) =>
                  _buildReviewAttachment(review.attachments[aIdx]),
            ),
          ),
        ],
        // Phần trả lời của người bán: trang chỉ nhận vài trả lời đầu tiên, phần
        // còn lại nằm ở `GET /reviews/{id}`, nên chỉ hiện số còn thiếu.
        if (review.replies.isNotEmpty) ...[
          const SizedBox(height: 8.0),
          ...review.replies.map(
            (reply) => _buildReviewReply(reply, accentStarColor),
          ),
          if (review.replyCount > review.replies.length)
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 4.0),
              child: Text(
                'Còn ${review.replyCount - review.replies.length} phản hồi nữa',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildReviewReply(ReviewReply reply, Color accentStarColor) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(left: 12.0, top: 6.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF4F4F1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                reply.author.name,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              if (reply.isSeller) ...[
                const SizedBox(width: 6.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Người bán',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Text(
                _formatDate(reply.createdAt),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            reply.body,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: theme.colorScheme.onSurface,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewAttachment(Resource attachment) {
    final url = attachment.url;
    if (url.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: SizedBox(
          width: 60.0,
          height: 60.0,
          child: Center(child: Icon(Icons.image_outlined)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: CachedNetworkImage(imageUrl: url, fit: BoxFit.contain),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: CachedNetworkImage(
            imageUrl: url,
            width: 60.0,
            height: 60.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // 7. Sản phẩm vừa xem gần nhất (Recently Viewed)
  Widget _buildRecentlyViewedSection(
    AsyncValue<List<RecentListing>> recentlyViewedState,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

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
          color: isDarkMode ? AppColors.darkSurface : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sản phẩm vừa xem gần đây',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 260.0,
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
                        product: ProductCardView(
                          name: product.name,
                          price: product.price,
                          coverUrl: product.coverUrl,
                          sellerName: product.sellerName,
                          rating: product.rating,
                          negotiable: product.negotiable,
                        ),
                        onTap: () {
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
  Widget _buildStickyBottomBar(ListingDetail detail, int totalStock) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final bool isOutOfStock = totalStock <= 0;

    final iconBgColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFEEEEEB);

    return Container(
      padding: EdgeInsets.fromLTRB(
        16.0,
        12.0,
        16.0,
        MediaQuery.of(context).padding.bottom + 12.0,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkSurface : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withAlpha(80)
                : Colors.black.withAlpha(20),
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
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chat_bubble_outline_rounded,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: () => _navigateToChatDetail(context, ref),
            ),
          ),
          const SizedBox(width: 10.0),

          // Nút Icon Thêm vào giỏ hàng — giá niêm yết của tin thương lượng cũng
          // là giá mua được, nên không còn chặn theo price_mode.
          Container(
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: isOutOfStock
                  ? null
                  : () async {
                      if (_selectedVariant == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Vui lòng chọn phân loại sản phẩm trước!',
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      try {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Đang thêm vào giỏ hàng...'),
                            duration: Duration(milliseconds: 500),
                          ),
                        );

                        await ref
                            .read(cartProvider.notifier)
                            .addItem(_selectedVariant!.id, _quantity);

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: isDarkMode
                                ? AppColors.darkSurface
                                : Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: isDarkMode
                                    ? AppColors.darkPrimary.withAlpha(40)
                                    : const Color(0xFFE2E3E0),
                              ),
                            ),
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            duration: const Duration(seconds: 4),
                            content: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withAlpha(
                                      30,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: theme.colorScheme.primary,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Added to Bag!',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '$_quantity x ${detail.name}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          color: theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).hideCurrentSnackBar();
                                    context.push('/cart');
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        theme.colorScheme.onPrimary,
                                    backgroundColor: theme.colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'View Bag',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Lỗi thêm giỏ hàng: ${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
            ),
          ),
          const SizedBox(width: 12.0),

          // Nút Mua Ngay / Thương Lượng lớn
          Expanded(
            child: SizedBox(
              height: 48.0,
              child: ElevatedButton(
                onPressed: isOutOfStock
                    ? null
                    : () {
                        // A negotiable listing is buyable at its asking price and
                        // negotiable — the buyer says which, nothing is refused
                        // here.
                        if (detail.priceMode == PriceMode.negotiable) {
                          showBuyOrNegotiateSheet(
                            context,
                            askingPrice:
                                _selectedVariant?.price ??
                                featuredPrice(detail),
                            onBuyNow: () => _startBuyNowCheckout(detail),
                            onNegotiate: () => _startNegotiation(detail),
                          );
                          return;
                        }

                        _startBuyNowCheckout(detail);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  isOutOfStock
                      ? 'HẾT HÀNG'
                      : (detail.priceMode == PriceMode.negotiable
                            ? 'MUA HÀNG'
                            : 'MUA NGAY'),
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

  Future<void> _navigateToChatDetail(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final page = await ref
          .read(chatRepositoryProvider)
          .conversations(limit: 1);
      if (!context.mounted) return;
      // No thread yet is the inbox, not a fabricated id: chat has one thread per
      // pair of accounts and it is opened by starting one, never by guessing.
      if (page.items.isEmpty) {
        context.push('/chat');
        return;
      }
      context.push('/chat/${page.items.first.id}');
    } catch (_) {
      if (context.mounted) context.push('/chat');
    }
  }

  /// The ordinary draft checkout: the same path a fixed-price listing takes, and
  /// what "Mua ngay" on a negotiable one opens too.
  void _startBuyNowCheckout(ListingDetail detail) {
    final variant = _selectedVariant;
    if (variant == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn phân loại sản phẩm trước!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Không có dòng giỏ hàng nào: mua ngay đi thẳng từ trang tin đăng, và tin
    // đăng đã ở trong tay nên bước thanh toán không phải tải lại.
    ref
        .read(checkoutProvider.notifier)
        .initialize(
          lines: [
            PurchaseLine(
              listingId: detail.id,
              variantId: variant.id,
              quantity: _quantity,
              listing: detail,
            ),
          ],
        );

    context.push('/checkout');
  }

  /// A report is a ticket like any other, so it is the shared sheet rather than a
  /// form of this screen's own. The thread it opens is where staff answer.
  Future<void> _reportListing(ListingDetail detail) async {
    final ticket = await RaiseTicketSheet.show(
      context,
      kind: TicketKind.reportListing,
      refId: detail.id,
      subjectHint: 'Báo cáo tin đăng',
      refLabel: detail.name,
    );
    if (ticket == null || !mounted) return;
    context.push('/account/help-center/${ticket.id}');
  }

  /// Opens a negotiation on the selected variant. It needs one, because an offer
  /// is terms for a variant rather than for the listing.
  void _startNegotiation(ListingDetail detail) {
    if (_selectedVariant == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn phân loại sản phẩm trước!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showSendOfferSheet(
      context,
      detail: detail,
      variant: _selectedVariant!,
      quantity: _quantity,
    );
  }

  void _showShareModal(
    BuildContext context,
    WidgetRef ref,
    ListingDetail detail,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withAlpha(60),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.share_rounded,
                    color: theme.colorScheme.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Chia sẻ sản phẩm',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Card preview sản phẩm
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? theme.colorScheme.surfaceContainerHighest
                      : const Color(0xFFF4F4F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    if (detail.images.firstOrNull?.url case final coverUrl?
                        when coverUrl.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: coverUrl,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            MoneyUtils.format(featuredPrice(detail)),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tùy chọn 1: Sao chép liên kết
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.link_rounded,
                    color: theme.colorScheme.primary,
                  ),
                ),
                title: Text(
                  'Sao chép liên kết',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: const Text(
                  'Copy đường dẫn sản phẩm vào bộ nhớ tạm',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onTap: () {
                  final productUrl =
                      'https://shopnexus.com/products/${detail.id}';
                  Clipboard.setData(ClipboardData(text: productUrl));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đã sao chép liên kết sản phẩm!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              // Tùy chọn 2: Chia sẻ vào cuộc trò chuyện
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: theme.colorScheme.primary,
                  ),
                ),
                title: Text(
                  'Chia sẻ vào cuộc trò chuyện',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: const Text(
                  'Gửi thông tin sản phẩm đến bạn bè qua chat',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showShareToChatModal(context, ref, detail);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  /// Khoảng giá của cả tin đăng khi người mua chưa chọn biến thể nào.
  String _priceRangeText(ListingDetail detail) {
    if (detail.variants.isEmpty) return MoneyUtils.format(0);
    final prices = detail.variants.map((v) => v.price);
    final minPrice = prices.reduce((a, b) => a < b ? a : b);
    final maxPrice = prices.reduce((a, b) => a > b ? a : b);
    return minPrice == maxPrice
        ? MoneyUtils.format(minPrice)
        : '${MoneyUtils.format(minPrice)} - ${MoneyUtils.format(maxPrice)}';
  }

  String _formatDate(DateTime at) =>
      '${at.day.toString().padLeft(2, '0')}/${at.month.toString().padLeft(2, '0')}/${at.year}';

  void _showShareToChatModal(
    BuildContext context,
    WidgetRef ref,
    ListingDetail detail,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final chatListAsync = ref.watch(chatListProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withAlpha(60),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Chọn người nhận',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: chatListAsync.when(
                  data: (chatState) {
                    final conversations = chatState.inboxConversations;
                    if (conversations.isEmpty) {
                      return const Center(
                        child: Text(
                          'Chưa có cuộc trò chuyện nào',
                          style: TextStyle(fontFamily: 'Inter'),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: conversations.length,
                      itemBuilder: (context, index) {
                        final conv = conversations[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: theme.colorScheme.primary,
                            child: Text(
                              conv.participantName.isNotEmpty
                                  ? conv.participantName[0].toUpperCase()
                                  : 'U',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            conv.participantName,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            conv.lastMessageText ?? 'Nhấp để gửi sản phẩm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontFamily: 'Inter'),
                          ),
                          trailing: Icon(
                            Icons.send_rounded,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                          onTap: () async {
                            final productUrl =
                                'https://shopnexus.com/products/${detail.id}';
                            final shareText =
                                'Xem sản phẩm này nhé: ${detail.name} - $productUrl';

                            try {
                              final repo = ref.read(chatRepositoryProvider);
                              await repo.send(
                                conversationId: conv.id,
                                body: shareText,
                                refs: {'listing_id': detail.id},
                              );

                              if (context.mounted) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Đã chia sẻ sản phẩm đến ${conv.participantName}!',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Lỗi chia sẻ: $e')),
                                );
                              }
                            }
                          },
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Lỗi: $err')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
