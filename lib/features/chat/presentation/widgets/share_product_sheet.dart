import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Chỉ tin đăng đang bán.
///
/// Nháp, chờ duyệt và đã ẩn đều không phải thứ gửi đi được: bên kia bấm vào chỉ
/// gặp một trang không xem được, và lúc đó cái sai đã nằm trong thread rồi.
///
/// Provider riêng chứ không dùng `sellerProductsNotifierProvider` sẵn có, vì cái
/// đó giữ bộ lọc trạng thái và ô tìm kiếm của màn Sản phẩm — chọn lọc từ đây sẽ
/// thay đổi cái người ta đang xem ở màn kia.
final _shareableListingsProvider = FutureProvider.autoDispose<List<Listing>>(
  (ref) => ref
      .watch(sellerRepositoryProvider)
      .listings(status: ListingStatus.active, limit: 50),
);

/// Chọn một sản phẩm của shop mình để gửi vào thread. Trả về tin đăng được
/// chọn, hoặc null nếu đóng sheet — việc gửi là của phía gọi.
class ShareProductSheet extends ConsumerStatefulWidget {
  const ShareProductSheet({super.key});

  static Future<Listing?> show(BuildContext context) {
    return showModalBottomSheet<Listing>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ShareProductSheet(),
    );
  }

  @override
  ConsumerState<ShareProductSheet> createState() => _ShareProductSheetState();
}

class _ShareProductSheetState extends ConsumerState<ShareProductSheet> {
  final TextEditingController _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    final listings = ref.watch(_shareableListingsProvider);

    return Container(
      constraints: BoxConstraints(maxHeight: media.size.height * 0.8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12, bottom: 14),
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 8, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Gửi sản phẩm',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 22),
                  color: theme.colorScheme.onSurfaceVariant,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          // Ô lọc chỉ hiện khi có đủ hàng để phải lọc — dưới ngưỡng đó nó là một
          // ô trống chiếm chỗ của chính danh sách nó định giúp tìm.
          if ((listings.value?.length ?? 0) > 6)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: TextField(
                controller: _search,
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.search_rounded, size: 20),
                  hintText: 'Tìm trong sản phẩm của bạn',
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          Flexible(
            child: switch (listings) {
              AsyncError(:final error) => _Notice(
                icon: Icons.wifi_off_rounded,
                text: ErrorHandler.getErrorMessage(error),
                onRetry: () => ref.invalidate(_shareableListingsProvider),
              ),
              AsyncData(:final value) => _list(theme, value),
              _ => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: CircularProgressIndicator(strokeWidth: 2.5),
              ),
            },
          ),
          SizedBox(height: 8 + media.viewInsets.bottom),
        ],
      ),
    );
  }

  Widget _list(ThemeData theme, List<Listing> all) {
    if (all.isEmpty) {
      return const _Notice(
        icon: Icons.storefront_outlined,
        text: 'Shop của bạn chưa có sản phẩm nào đang bán.',
      );
    }

    final query = _query.trim().toLowerCase();
    final listings = query.isEmpty
        ? all
        : [
            for (final listing in all)
              if (listing.name.toLowerCase().contains(query)) listing,
          ];

    if (listings.isEmpty) {
      return _Notice(
        icon: Icons.search_off_rounded,
        text: 'Không có sản phẩm nào khớp "${_search.text.trim()}".',
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: listings.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final listing = listings[index];
        final cover = listing.cover?.url;

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: cover == null
                ? Container(
                    width: 48,
                    height: 48,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 18,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: cover,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Container(
                      width: 48,
                      height: 48,
                      color: theme.colorScheme.surfaceContainerHighest,
                    ),
                    errorWidget: (_, _, _) => Container(
                      width: 48,
                      height: 48,
                      color: theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
          ),
          title: Text(
            listing.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              MoneyUtils.format(listing.price, currency: listing.currency),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          onTap: () => Navigator.of(context).pop(listing),
        );
      },
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({required this.icon, required this.text, this.onRetry});

  final IconData icon;
  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.4,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Tải lại'),
            ),
          ],
        ],
      ),
    );
  }
}
