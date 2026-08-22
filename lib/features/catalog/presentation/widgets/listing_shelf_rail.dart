import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shelf.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shelf_reason.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/widgets/product_card.dart';

/// Tiêu đề của một kệ.
///
/// Server không gửi câu này, chỉ gửi `reason` và `subject`: mọi enum khác của API
/// cũng được dịch ở client, và một tiêu đề do server viết là đúng cái chuỗi mà
/// ngôn ngữ thứ hai không dịch nổi.
///
/// Lý do cần chủ ngữ mà lại không có chủ ngữ thì rơi về câu chung, thay vì hiện
/// "Vì bạn thích null" — server đã bỏ những kệ như thế, nên đây là lớp phòng thủ
/// thứ hai chứ không phải thứ nhất.
String shelfTitle(ShelfReason reason, String? subject) {
  final needsSubject =
      reason == ShelfReason.interest || reason == ShelfReason.becauseYouViewed;
  if (needsSubject && (subject == null || subject.isEmpty)) {
    return 'Gợi ý cho bạn';
  }
  return switch (reason) {
    ShelfReason.interest => 'Vì bạn thích $subject',
    ShelfReason.becauseYouViewed => 'Tương tự “$subject”',
    ShelfReason.trending => 'Đang được quan tâm',
    ShelfReason.bestSelling => 'Bán chạy nhất',
    ShelfReason.topRated => 'Được đánh giá cao',
    ShelfReason.newest => 'Vừa lên sàn',
  };
}

/// Một kệ, nằm ngang.
///
/// Bốn hàng "Vì bạn thích …" là bốn hướng sở thích mà `sort=recommended` vẫn trộn
/// vào một thứ hạng duy nhất; tách ra thành hàng riêng là cách duy nhất để người
/// đọc thấy được cái nào ra cái nào — và bỏ qua cái họ không muốn hôm nay.
class ListingShelfRail extends ConsumerWidget {
  const ListingShelfRail({super.key, required this.shelf});

  final Shelf shelf;

  /// Kệ *của người đọc* — thứ hạng của nó dựng từ chính hành vi của họ, nên một
  /// cú chạm ở đây là tín hiệu mà thứ hạng ấy được đo bằng. Hàng của cả sàn không
  /// là gợi ý của riêng ai, nên không ghi gì.
  bool get _isPersonal =>
      shelf.reason == ShelfReason.interest ||
      shelf.reason == ShelfReason.becauseYouViewed;

  /// Chỗ mà "xem tất cả" mở ra, và chữ trên nó.
  ///
  /// Server gửi *tham số* để mở rộng một kệ chứ không gửi URL, nên đây là chỗ
  /// tham số thành đường đi: client giữ router của mình.
  ///
  /// `similar_to` là ngoại lệ, và cố ý: màn tìm kiếm của app chưa nhận tham số ấy,
  /// mà một liên kết dẫn tới bộ lọc không tồn tại còn tệ hơn không có liên kết —
  /// nên hàng "tương tự" trỏ về đúng tin đăng mà nó nói *về*.
  void _openWiderPage(BuildContext context, WidgetRef ref) {
    final browse = shelf.browse;

    final similarTo = browse.similarTo;
    if (similarTo != null && similarTo.isNotEmpty) {
      context.push('/home/product/$similarTo');
      return;
    }

    // Bộ lọc được đặt ở màn này và đọc ở màn kia — cùng đường mà trang Danh mục
    // đi: reset trước để không mang theo bộ lọc của lần tìm trước.
    final filters = ref.read(activeSearchFiltersProvider.notifier);
    filters.reset();
    if (browse.categoryId != null && browse.categoryId!.isNotEmpty) {
      filters.setCategory(browse.categoryId);
    }
    if (browse.sort != null && browse.sort!.isNotEmpty) {
      filters.setSort(browse.sort);
    }
    context.push('/search?autofocus=false');
  }

  bool get _canWiden {
    final browse = shelf.browse;
    return (browse.similarTo?.isNotEmpty ?? false) ||
        (browse.categoryId?.isNotEmpty ?? false) ||
        (browse.sort?.isNotEmpty ?? false);
  }

  String get _widenLabel =>
      (shelf.browse.similarTo?.isNotEmpty ?? false) ? 'Xem lại' : 'Xem tất cả';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 4.0, 8.0, 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  shelfTitle(shelf.reason, shelf.subject?.name),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                    fontSize: 17.0,
                  ),
                ),
              ),
              if (_canWiden)
                TextButton(
                  onPressed: () => _openWiderPage(context, ref),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    minimumSize: const Size(0, 36),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    _widenLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        // Không SizedBox chiều cao cố định: thẻ tự cao bằng nội dung của nó, và
        // một hàng bị đóng khung theo chiều cao đoán trước là hàng tràn chữ ở cỡ
        // phông lớn.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final listing in shelf.listings)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 150.0,
                    child: CatalogProductCard(
                      product: listing,
                      onTap: () {
                        if (_isPersonal) {
                          ref
                              .read(accountRepositoryProvider)
                              .recordInteraction(
                                listing.id,
                                'click-from-recommended',
                              );
                        }
                        context.push('/home/product/${listing.id}');
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Mọi kệ của trang chủ, xếp dọc.
///
/// Có bao nhiêu hàng và hàng nào trước là câu trả lời của server: chỉ nó giữ các
/// tín hiệu đằng sau. Chỗ này chỉ xếp chúng ra.
///
/// Không có kệ nào thì không phải lỗi, cũng không phải trạng thái rỗng: đó là một
/// sàn chưa đủ tin sống để lấp một hàng, và cái lưới bên dưới đã là câu trả lời
/// cho chuyện đó rồi.
class HomeShelvesSection extends ConsumerWidget {
  const HomeShelvesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(homeShelvesProvider)
        .when(
          data: (shelves) {
            if (shelves.isEmpty) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final shelf in shelves)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ListingShelfRail(shelf: shelf),
                  ),
              ],
            );
          },
          // Một hàng hỏng không được kéo cả trang chủ theo: cái lưới bên dưới vẫn là
          // đường vào toàn bộ sàn.
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const _ShelvesShimmer(),
        );
  }
}

class _ShelvesShimmer extends StatelessWidget {
  const _ShelvesShimmer();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final block = isDarkMode ? AppColors.darkSurface : Colors.white;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFEEEEEC),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF9F9F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var row = 0; row < 2; row++)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
                    child: Container(
                      width: 180.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: block,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        for (var card = 0; card < 3; card++)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                              width: 150.0,
                              height: 210.0,
                              decoration: BoxDecoration(
                                color: block,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
