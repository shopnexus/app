import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_vote_tally.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/rating_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';

/// Đánh giá sản phẩm của một tin đăng: lọc theo sao, đổi thứ tự, và bình chọn
/// "hữu ích" trên từng đánh giá.
///
/// Tách khỏi màn hình chi tiết vì nó có state riêng — lá phiếu vừa bấm — mà
/// màn hình kia không cần biết.
class ProductReviewsSection extends ConsumerStatefulWidget {
  const ProductReviewsSection({super.key, required this.detail});

  final ListingDetail detail;

  @override
  ConsumerState<ProductReviewsSection> createState() =>
      _ProductReviewsSectionState();
}

class _ProductReviewsSectionState extends ConsumerState<ProductReviewsSection> {
  /// Kết quả lá phiếu của chính mình, đè lên con số server gửi kèm trang.
  ///
  /// `PUT /reviews/{id}/vote` trả về bảng đếm mới, nên không phải đoán; giữ ở
  /// đây thay vì tải lại cả trang, vì tải lại theo `sort=helpful` sẽ làm đúng
  /// cái đánh giá vừa bấm nhảy đi chỗ khác ngay dưới ngón tay.
  final Map<String, ReviewVoteTally> _votes = {};

  /// Chặn bấm liên tiếp trên cùng một đánh giá: hai request đua nhau thì cái về
  /// sau thắng, và nó có thể là cái cũ hơn.
  final Set<String> _voting = {};

  String get _listingId => widget.detail.id;

  /// Sửa lại đánh giá của chính mình. `PATCH` bỏ trống field nào thì giữ nguyên
  /// field đó, nên ảnh đã đính kèm không mất khi chỉ sửa chữ.
  Future<void> _editReview(Review review) async {
    final result = await showModalBottomSheet<({int rating, String body})>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _EditReviewSheet(review: review),
    );
    if (result == null || !mounted) return;

    try {
      await ref
          .read(ratingRepositoryProvider)
          .updateReview(review.id, rating: result.rating, body: result.body);
      // Điểm trung bình của tin đăng cũng đổi theo, nên đọc lại cả hai.
      ref.invalidate(productReviewsProvider(_listingId));
      ref.invalidate(productDetailProvider(id: _listingId));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  Future<void> _deleteReview(Review review) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xoá đánh giá?'),
        content: const Text('Đánh giá này sẽ bị gỡ khỏi trang sản phẩm.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Huỷ'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Xoá'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      await ref.read(ratingRepositoryProvider).deleteReview(review.id);
      ref.invalidate(productReviewsProvider(_listingId));
      ref.invalidate(productDetailProvider(id: _listingId));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  /// Trả lời của người bán — một lần cho mỗi đánh giá, và server giữ luật đó.
  Future<void> _reply(Review review) async {
    final body = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _ReplySheet(),
    );
    if (body == null || !mounted) return;

    try {
      await ref.read(ratingRepositoryProvider).replyToReview(review.id, body);
      ref.invalidate(productReviewsProvider(_listingId));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  Future<void> _deleteReply(ReviewReply reply) async {
    try {
      await ref.read(ratingRepositoryProvider).deleteReply(reply.id);
      ref.invalidate(productReviewsProvider(_listingId));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  Future<void> _vote(Review review, bool helpful) async {
    if (_voting.contains(review.id)) return;
    final tally = _votes[review.id] ?? review.votes;
    // Bấm lại đúng phía đang chọn là bỏ phiếu, không phải bầu thêm lần nữa.
    final current = tally.myVote;
    final wanted = helpful
        ? ReviewVoteTallyMyVoteEnum.number1
        : ReviewVoteTallyMyVoteEnum.numberNegative1;
    final clearing = current == wanted;

    setState(() => _voting.add(review.id));
    try {
      final repository = ref.read(ratingRepositoryProvider);
      final next = clearing
          ? await repository.clearVote(review.id)
          : await repository.voteReview(review.id, helpful: helpful);
      if (!mounted) return;
      setState(() {
        _votes[review.id] = next;
        _voting.remove(review.id);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _voting.remove(review.id));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final reviewsState = ref.watch(productReviewsProvider(_listingId));
    final query = ref.watch(reviewQueryProvider(_listingId));
    // Ai đang đọc quyết định họ thấy nút gì: tác giả sửa được đánh giá của mình,
    // người bán trả lời được. Chưa đăng nhập thì không thấy nút nào.
    final myId = ref.watch(profileProvider).value?.id;
    final isSeller = myId != null && myId == widget.detail.seller.id;

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
          const SizedBox(height: 8.0),

          // Điểm trung bình và số lượt lấy từ chính tin đăng: trang chỉ tải một
          // trang đánh giá, nên tính lại từ đó sẽ sai ngay khi có nhiều hơn một
          // trang — và sai hẳn khi đang lọc theo sao.
          _RatingLine(detail: widget.detail, accent: accentStarColor),
          const SizedBox(height: 12.0),

          _FilterBar(listingId: _listingId, query: query),
          const SizedBox(height: 12.0),

          reviewsState.when(
            data: (state) {
              final reviews = state.reviews;
              if (reviews.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text(
                      query.rating == null
                          ? 'Sản phẩm chưa có lượt đánh giá nào.'
                          : 'Không có đánh giá ${query.rating} sao nào.',
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
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return _ReviewTile(
                        review: review,
                        accent: accentStarColor,
                        tally: _votes[review.id] ?? review.votes,
                        busy: _voting.contains(review.id),
                        onVote: (helpful) => _vote(review, helpful),
                        onEdit: review.author.id == myId
                            ? () => _editReview(review)
                            : null,
                        onDelete: review.author.id == myId
                            ? () => _deleteReview(review)
                            : null,
                        // Một đánh giá chỉ nhận một trả lời của người bán, nên
                        // nút biến mất khi đã có một cái.
                        onReply:
                            isSeller &&
                                !review.replies.any((r) => r.isSeller) &&
                                review.replyCount == 0
                            ? () => _reply(review)
                            : null,
                        myAccountId: myId,
                        onDeleteReply: _deleteReply,
                      );
                    },
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
                                    productReviewsProvider(_listingId).notifier,
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
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) => const Text('Lỗi tải lượt đánh giá.'),
          ),
        ],
      ),
    );
  }
}

/// Một dòng, không phải histogram năm sao.
///
/// Form đăng bán mặc định số lượng là 1, nên một tin hàng cũ độc bản thường có
/// 0–1 đánh giá: cái biểu đồ phân phối trước đây vẽ "100% năm sao" trên đúng một
/// điểm dữ liệu. Điểm trung bình và số lượt là hai con số server tính trên toàn
/// bộ, và là tất cả những gì một dòng cần nói.
class _RatingLine extends StatelessWidget {
  const _RatingLine({required this.detail, required this.accent});

  final ListingDetail detail;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (detail.reviewCount == 0) {
      return Text(
        'Chưa có đánh giá',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      );
    }

    return Row(
      children: [
        Icon(Icons.star_rounded, size: 18, color: accent),
        const SizedBox(width: 6),
        Text(
          detail.rating.toStringAsFixed(1),
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '· ${detail.reviewCount} đánh giá',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Lọc theo sao và đổi thứ tự. Đổi cái nào cũng đọc lại từ đầu: con trỏ trang
/// thuộc về đúng thứ tự đã phát ra nó.
class _FilterBar extends ConsumerWidget {
  const _FilterBar({required this.listingId, required this.query});

  final String listingId;
  final ReviewQuery query;

  static const _sortLabels = <String, String>{
    ReviewSort.newest: 'Mới nhất',
    ReviewSort.helpful: 'Hữu ích nhất',
    ReviewSort.ratingDesc: 'Điểm cao nhất',
    ReviewSort.ratingAsc: 'Điểm thấp nhất',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(reviewQueryProvider(listingId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 34,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _Chip(
                label: 'Tất cả',
                selected: query.rating == null,
                onTap: () => notifier.setRating(null),
              ),
              for (var star = 5; star >= 1; star--)
                _Chip(
                  label: '$star ★',
                  selected: query.rating == star,
                  onTap: () => notifier.setRating(star),
                ),
            ],
          ),
        ),
        const SizedBox(height: 4.0),
        Align(
          alignment: Alignment.centerLeft,
          child: PopupMenuButton<String>(
            initialValue: query.sort,
            onSelected: notifier.setSort,
            itemBuilder: (context) => [
              for (final entry in _sortLabels.entries)
                PopupMenuItem(value: entry.key, child: Text(entry.value)),
            ],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.swap_vert_rounded,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  _sortLabels[query.sort] ?? _sortLabels[ReviewSort.newest]!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: selected
              ? theme.colorScheme.onPrimaryContainer
              : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({
    required this.review,
    required this.accent,
    required this.tally,
    required this.busy,
    required this.onVote,
    required this.myAccountId,
    required this.onEdit,
    required this.onDelete,
    required this.onReply,
    required this.onDeleteReply,
  });

  final Review review;
  final Color accent;
  final ReviewVoteTally tally;
  final bool busy;
  final void Function(bool helpful) onVote;

  /// Null khi chưa đăng nhập — không có gì là "của tôi" để mà sửa.
  final String? myAccountId;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onReply;
  final void Function(ReviewReply reply) onDeleteReply;

  @override
  Widget build(BuildContext context) {
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
            if (onEdit != null || onDelete != null)
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_horiz_rounded,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                padding: EdgeInsets.zero,
                onSelected: (value) {
                  if (value == 'edit') onEdit?.call();
                  if (value == 'delete') onDelete?.call();
                },
                itemBuilder: (context) => [
                  if (onEdit != null)
                    const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                  if (onDelete != null)
                    const PopupMenuItem(value: 'delete', child: Text('Xoá')),
                ],
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
                color: accent,
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
                  _ReviewAttachment(attachment: review.attachments[aIdx]),
            ),
          ),
        ],
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: _VoteRow(tally: tally, busy: busy, onVote: onVote),
            ),
            if (onReply != null)
              TextButton.icon(
                onPressed: onReply,
                icon: const Icon(Icons.reply_rounded, size: 14),
                label: const Text(
                  'Trả lời',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 12),
                ),
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
          ],
        ),
        // Phần trả lời của người bán: trang chỉ nhận vài trả lời đầu tiên, phần
        // còn lại nằm ở `GET /reviews/{id}`, nên chỉ hiện số còn thiếu.
        if (review.replies.isNotEmpty) ...[
          const SizedBox(height: 8.0),
          ...review.replies.map(
            (reply) => _ReviewReply(
              reply: reply,
              onDelete: reply.author.id == myAccountId
                  ? () => onDeleteReply(reply)
                  : null,
            ),
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
}

/// "Đánh giá này có hữu ích không". Hai nút, mỗi nút mang con số của phía nó,
/// và phía đang chọn được tô — bấm lại chính nó là rút phiếu.
class _VoteRow extends StatelessWidget {
  const _VoteRow({
    required this.tally,
    required this.busy,
    required this.onVote,
  });

  final ReviewVoteTally tally;
  final bool busy;
  final void Function(bool helpful) onVote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mine = tally.myVote;

    return Row(
      children: [
        _VoteButton(
          icon: Icons.thumb_up_outlined,
          filledIcon: Icons.thumb_up_rounded,
          count: tally.helpful,
          active: mine == ReviewVoteTallyMyVoteEnum.number1,
          enabled: !busy,
          onTap: () => onVote(true),
        ),
        const SizedBox(width: 12.0),
        _VoteButton(
          icon: Icons.thumb_down_outlined,
          filledIcon: Icons.thumb_down_rounded,
          count: tally.notHelpful,
          active: mine == ReviewVoteTallyMyVoteEnum.numberNegative1,
          enabled: !busy,
          onTap: () => onVote(false),
        ),
        const Spacer(),
        if (busy)
          SizedBox(
            height: 12,
            width: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}

class _VoteButton extends StatelessWidget {
  const _VoteButton({
    required this.icon,
    required this.filledIcon,
    required this.count,
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final IconData filledIcon;
  final int count;
  final bool active;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = active
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(6.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(active ? filledIcon : icon, size: 14, color: color),
            const SizedBox(width: 4.0),
            Text(
              '$count',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewReply extends StatelessWidget {
  const _ReviewReply({required this.reply, this.onDelete});

  final ReviewReply reply;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
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
              if (onDelete != null)
                IconButton(
                  onPressed: onDelete,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    size: 14,
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
}

class _ReviewAttachment extends StatelessWidget {
  const _ReviewAttachment({required this.attachment});

  final Resource attachment;

  @override
  Widget build(BuildContext context) {
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
}

String _formatDate(DateTime at) =>
    '${at.day.toString().padLeft(2, '0')}/'
    '${at.month.toString().padLeft(2, '0')}/${at.year}';

/// Sửa đánh giá của chính mình: sao và chữ.
///
/// Không đụng vào ảnh — `PATCH` bỏ trống `attachments` là giữ nguyên, còn gửi
/// một danh sách mới là thay cả bộ, nên "sửa chữ" không được phép làm mất ảnh.
class _EditReviewSheet extends StatefulWidget {
  const _EditReviewSheet({required this.review});

  final Review review;

  @override
  State<_EditReviewSheet> createState() => _EditReviewSheetState();
}

class _EditReviewSheetState extends State<_EditReviewSheet> {
  late int _rating = widget.review.rating;
  late final TextEditingController _body = TextEditingController(
    text: widget.review.body,
  );

  @override
  void dispose() {
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sửa đánh giá', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              for (var star = 1; star <= 5; star++)
                IconButton(
                  onPressed: () => setState(() => _rating = star),
                  icon: Icon(
                    star <= _rating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: const Color(0xFFF59E0B),
                  ),
                ),
            ],
          ),
          TextField(
            controller: _body,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Bạn thấy sản phẩm thế nào?',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.of(
                context,
              ).pop((rating: _rating, body: _body.text.trim())),
              child: const Text('Lưu'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Trả lời của người bán cho một đánh giá.
class _ReplySheet extends StatefulWidget {
  const _ReplySheet();

  @override
  State<_ReplySheet> createState() => _ReplySheetState();
}

class _ReplySheetState extends State<_ReplySheet> {
  final TextEditingController _body = TextEditingController();

  @override
  void dispose() {
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trả lời đánh giá', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          TextField(
            controller: _body,
            maxLines: 4,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Phản hồi của bạn với người mua...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              // Một trả lời rỗng không phải là một trả lời.
              onPressed: () {
                final body = _body.text.trim();
                if (body.isEmpty) return;
                Navigator.of(context).pop(body);
              },
              child: const Text('Gửi'),
            ),
          ),
        ],
      ),
    );
  }
}
