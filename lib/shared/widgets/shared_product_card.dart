import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/money_utils.dart';
import '../../features/catalog/data/models/catalog_model.dart';

class SharedProductCard extends StatelessWidget {
  final TProductCard product;
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
          // Cấu hình bo góc 16px (1rem) từ Nexus Card
          border: Border.all(
            color: isDarkMode
                ? AppColors.darkPrimary.withAlpha(40)
                : const Color(0xFFE2E8F0),
            // Viền nhạt từ Stitch (surface-variant)
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
                        // Nền xám nhạt normalize ảnh
                        child:
                            product.thumbnail != null &&
                                product.thumbnail!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.thumbnail!,
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
                  // Nút thả tim yêu thích (Favorite Button)
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
                  // Nhãn giảm giá (nếu có)
                  if (product.originalPrice != null &&
                      product.originalPrice! > product.price)
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Text(
                          'GIẢM GIÁ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Thông tin chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hàng Tiêu đề & Giá
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
                    ],
                  ),

                  // Giá gốc hiển thị mờ có gạch ngang (nếu giảm giá)
                  if (product.originalPrice != null &&
                      product.originalPrice! > product.price) ...[
                    const SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        MoneyUtils.format(product.originalPrice!),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurfaceVariant,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],

                  if (showVendor) ...[
                    const SizedBox(height: 10.0),
                    // Đường kẻ phân cách mờ nhẹ
                    Container(
                      height: 1.0,
                      color: isDarkMode
                          ? AppColors.darkPrimary.withAlpha(25)
                          : const Color(0xFFF1F5F9),
                    ),
                    const SizedBox(height: 8.0),

                    // Thông tin nhà bán hàng
                    Row(
                      children: [
                        // Avatar tròn của Vendor
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? theme.colorScheme.surfaceContainerHighest
                                : const Color(0xFFE2E8F0),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person_rounded,
                              size: 12,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        // Tên và Đánh giá sao của Vendor
                        Expanded(
                          child: Text(
                            '@${product.vendorName ?? "shop"} • ${product.rating?.score.toStringAsFixed(1) ?? "5.0"} ★',
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
