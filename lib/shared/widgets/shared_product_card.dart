import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/utils/money_utils.dart';
import '../../features/catalog/data/models/catalog_model.dart';

class SharedProductCard extends StatelessWidget {
  final TProductCard product;
  final VoidCallback? onTap;
  final double aspectRatio; // Tỷ lệ ảnh động để phục vụ Masonry layout

  const SharedProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.aspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0), // Cấu hình bo góc 16px (1rem) từ Nexus Card
          border: Border.all(
            color: const Color(0xFFE2E8F0), // Viền nhạt từ Stitch (surface-variant)
            width: 1.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 104, 95, 0.02), // Shadow nhạt từ thiết kế mới
              offset: Offset(0, 4),
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
                        color: const Color(0xFFF1F5F9), // Nền xám nhạt normalize ảnh
                        child: product.thumbnail != null && product.thumbnail!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.thumbnail!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[200]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(color: Colors.white),
                                ),
                                errorWidget: (context, url, error) => const Center(
                                  child: Icon(Icons.broken_image_outlined, color: Colors.grey),
                                ),
                              )
                            : const Center(
                                child: Icon(Icons.image_outlined, color: Colors.grey),
                              ),
                      ),
                    ),
                  ),
                  // Nút thả tim yêu thích (Favorite Button)
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        // Logic yêu thích sẽ xử lý sau
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                  // Nhãn giảm giá (nếu có)
                  if (product.originalPrice != null && product.originalPrice! > product.price)
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Text(
                          'SALE',
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
                            color: const Color(0xFF0F172A),
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
                          color: const Color(0xFF0F172A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  // Giá gốc hiển thị mờ có gạch ngang (nếu giảm giá)
                  if (product.originalPrice != null && product.originalPrice! > product.price) ...[
                    const SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        MoneyUtils.format(product.originalPrice!),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: 'Inter',
                          color: const Color(0xFF94A3B8),
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 10.0),
                  // Đường kẻ phân cách mờ nhẹ
                  Container(
                    height: 1.0,
                    color: const Color(0xFFF1F5F9),
                  ),
                  const SizedBox(height: 8.0),

                  // Thông tin nhà bán hàng
                  Row(
                    children: [
                      // Avatar tròn của Vendor
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE2E8F0),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person_rounded,
                            size: 12,
                            color: Color(0xFF64748B),
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
                            color: const Color(0xFF64748B),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
