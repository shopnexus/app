import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';

/// Một sản phẩm ai đó chỉ vào trong thread.
///
/// Tin nhắn chỉ mang `{"listing_id": "…"}`, nên mọi thứ trên thẻ đều đọc từ
/// catalog lúc vẽ chứ không từ tin nhắn. Đó là chủ ý: `refs` do client điền và
/// server không kiểm, nên một cái tên hay một mức giá chép sẵn vào tin nhắn là
/// lời của người gửi chứ không phải của sàn — giá sửa hôm sau vẫn nằm nguyên
/// trên màn hình, và không có gì ngăn nó sai ngay từ đầu. Đọc lại theo id thì
/// thẻ luôn nói đúng cái catalog đang nói.
///
/// Cùng khuôn với ChatOfferCard — cùng bề ngang, cùng bo góc, cùng cái nhãn
/// nhỏ ở đầu — vì hai thứ này nằm cạnh nhau trong một thread và phải đọc ra là
/// cùng một họ. Khác nhau ở chỗ thẻ thương lượng là việc đang diễn ra có nút
/// bấm, còn thẻ này chỉ là một cái trỏ tay.
class ChatProductCard extends ConsumerWidget {
  const ChatProductCard({
    super.key,
    required this.listingId,
    required this.onOpen,
  });

  final String listingId;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final detail = ref.watch(productDetailProvider(id: listingId));

    return Container(
      constraints: BoxConstraints(
        maxWidth: (screenWidth * 0.84).clamp(280.0, 350.0),
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: switch (detail) {
        AsyncData(:final value) => _loaded(theme, value),
        // Tin đăng bị gỡ hoặc ẩn sau khi gửi là chuyện thường, nên nói thẳng
        // thay vì để thẻ trống: tin nhắn vẫn còn tên sản phẩm ở dưới.
        AsyncError() => _message(
          theme,
          Icons.link_off_rounded,
          'Sản phẩm này không còn xem được',
        ),
        _ => _message(theme, null, 'Đang tải sản phẩm…'),
      },
    );
  }

  Widget _message(ThemeData theme, IconData? icon, String text) => Padding(
    padding: const EdgeInsets.all(14),
    child: Row(
      children: [
        if (icon == null)
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        else
          Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _loaded(ThemeData theme, ListingDetail detail) {
    final cover = detail.images.isEmpty ? null : detail.images.first.url;
    final price = featuredPrice(detail);
    final negotiable = detail.priceMode == PriceMode.negotiable;

    return InkWell(
      onTap: onOpen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
            child: Text(
              'SẢN PHẨM',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Cover(url: cover, theme: theme),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        MoneyUtils.format(price, currency: detail.currency),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        negotiable
                            ? 'Có thể thương lượng • Đã bán ${detail.sold}'
                            : 'Đã bán ${detail.sold}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Xem sản phẩm',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover({required this.url, required this.theme});

  final String? url;
  final ThemeData theme;

  static const _size = 64.0;

  @override
  Widget build(BuildContext context) {
    final blank = Container(
      width: _size,
      height: _size,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 18,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: url == null
          ? blank
          : CachedNetworkImage(
              imageUrl: url!,
              width: _size,
              height: _size,
              fit: BoxFit.cover,
              placeholder: (_, _) => Container(
                width: _size,
                height: _size,
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              errorWidget: (_, _, _) => blank,
            ),
    );
  }
}
