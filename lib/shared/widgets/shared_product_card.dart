import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/shared/widgets/condition_badge.dart';

/// The six things the card draws, derived from a `Listing` here at the widget
/// boundary. The contract sends a `cover` resource and a `seller`, not a
/// thumbnail URL and a shop name; deriving them in a DTO instead is what let the
/// card read fields — `thumbnail`, `original_price`, `sold_count`, `vendor_name`
/// — that no response has ever carried.
class ProductCardView {
  final String name;
  final int price;

  /// Null whenever the module could not presign one, which the card draws as a
  /// placeholder rather than a broken image.
  final String? coverUrl;
  final String? sellerName;
  final double rating;
  final bool negotiable;

  /// Mới / đã dùng / có lỗi. Null chỉ cho những chỗ dựng thẻ từ dữ liệu cũ
  /// không mang tình trạng — mọi `Listing` từ server đều mang, vì server bắt buộc.
  final ListingCondition? condition;

  const ProductCardView({
    required this.name,
    required this.price,
    this.coverUrl,
    this.sellerName,
    this.rating = 0.0,
    this.negotiable = false,
    this.condition,
  });

  factory ProductCardView.fromListing(Listing listing) => ProductCardView(
        name: listing.name,
        price: listing.price,
        coverUrl: listing.cover?.url,
        sellerName: listing.seller.name,
        rating: listing.rating,
        negotiable: listing.priceMode == PriceMode.negotiable,
        condition: listing.condition,
      );
}

class SharedProductCard extends StatelessWidget {
  final ProductCardView product;
  final VoidCallback? onTap;
  final double aspectRatio;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final bool showFavoriteButton;
  final bool showVendor;

  const SharedProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.aspectRatio = 1.0,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.showFavoriteButton = false,
    this.showVendor = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isDarkMode
                ? AppColors.darkPrimary.withAlpha(40)
                : const Color(0xFFE2E8F0),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withAlpha(60)
                  : const Color.fromRGBO(0, 104, 95, 0.02),
              offset: const Offset(0, 4),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container ảnh sản phẩm
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: Container(
                        color: isDarkMode
                            ? theme.colorScheme.surfaceContainerHighest
                            : const Color(0xFFF1F5F9),
                        child: product.coverUrl != null &&
                                product.coverUrl!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.coverUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
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
                                errorWidget: (context, url, error) => Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              )
                            : Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                      ),
                    ),
                  ),
                  if (showFavoriteButton)
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? theme.colorScheme.surface.withAlpha(220)
                                : Colors.white.withAlpha(230),
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 4.0),
                            ],
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: 18,
                            color: isFavorite
                                ? const Color(0xFFBA1A1A)
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Thông tin chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Cạnh giá, vì tình trạng hàng là một nửa của cái giá:
                          // 2 triệu cho hàng mới và cho hàng có lỗi là hai đề
                          // nghị khác nhau.
                          if (product.condition != null) ...[
                            ConditionBadge(
                              condition: product.condition!,
                              dense: true,
                            ),
                            const SizedBox(height: 3.0),
                          ],
                          Text(
                            MoneyUtils.format(product.price),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Inter',
                              color: isDarkMode
                                  ? AppColors.darkPrimary
                                  : const Color(0xFF005049),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: product.negotiable
                                  ? theme.colorScheme.primary.withAlpha(25)
                                  : (isDarkMode
                                        ? theme
                                              .colorScheme
                                              .surfaceContainerHighest
                                        : const Color(0xFFF1F5F9)),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: product.negotiable
                                    ? theme.colorScheme.primary.withAlpha(80)
                                    : Colors.transparent,
                                width: 0.8,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  product.negotiable
                                      ? Icons.handshake_outlined
                                      : Icons.flash_on_rounded,
                                  size: 10,
                                  color: product.negotiable
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  product.negotiable
                                      ? 'Thương lượng'
                                      : 'Mua ngay',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: product.negotiable
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (showVendor) ...[
                    const SizedBox(height: 6.0),
                    Container(
                      height: 1.0,
                      color: isDarkMode
                          ? AppColors.darkPrimary.withAlpha(25)
                          : const Color(0xFFF1F5F9),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      children: [
                        Container(
                          width: 18.0,
                          height: 18.0,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? theme.colorScheme.surfaceContainerHighest
                                : const Color(0xFFE2E8F0),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person_rounded,
                              size: 11,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Expanded(
                          child: Text(
                            '@${product.sellerName ?? "shop"} • ${product.rating.toStringAsFixed(1)} ★',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontFamily: 'Inter',
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
