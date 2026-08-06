import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// `Feedback` cũng là một class của Flutter Material (haptic feedback), nên tên
// trần ở đây là mơ hồ. Prefix chứ không `hide`: cái bị che sẽ im lặng biến mất
// khỏi tầm với của cả file.
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart' as api;
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/my_reviews_provider.dart';

/// Uy tín của người dùng, tách theo vai đã đứng trong giao dịch.
///
/// Hai tab là hai vai chứ không phải "đã viết / đã nhận": chỉ có chiều nhận đọc
/// được từ API. Và với C2C thì tách theo vai còn đúng hơn — uy tín người bán và
/// uy tín người mua là hai thứ khác nhau, cả hai đều đáng xem.
class MyReviewsScreen extends ConsumerStatefulWidget {
  const MyReviewsScreen({super.key});

  @override
  ConsumerState<MyReviewsScreen> createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends ConsumerState<MyReviewsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Đánh giá của tôi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            color: theme.colorScheme.onSurface,
          ),
        ),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Khi tôi bán'),
            Tab(text: 'Khi tôi mua'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [
          _FeedbackList(
            role: ReputationRole.seller,
            emptyMessage: 'Chưa có ai đánh giá bạn với tư cách người bán.',
          ),
          _FeedbackList(
            role: ReputationRole.buyer,
            emptyMessage: 'Chưa có ai đánh giá bạn với tư cách người mua.',
          ),
        ],
      ),
    );
  }
}

class _FeedbackList extends ConsumerWidget {
  const _FeedbackList({required this.role, required this.emptyMessage});

  final ReputationRole role;
  final String emptyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(myFeedbackProvider(role))
        .when(
          // Cả ba nhánh nằm trong RefreshIndicator: một danh sách rỗng và một
          // lần đọc hỏng là đúng hai lúc người dùng muốn kéo để thử lại nhất,
          // và cũng là hai lúc dễ để quên mất không cho họ đường nào.
          data: (items) => RefreshIndicator(
            onRefresh: () => ref.refresh(myFeedbackProvider(role).future),
            child: items.isEmpty
                ? _ReviewsPlaceholder(message: emptyMessage)
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) =>
                        _FeedbackCard(item: items[index]),
                  ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => RefreshIndicator(
            onRefresh: () => ref.refresh(myFeedbackProvider(role).future),
            child: _ReviewsPlaceholder(
              message: 'Không tải được đánh giá: $err',
              onRetry: () => ref.invalidate(myFeedbackProvider(role)),
            ),
          ),
        );
  }
}

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({required this.item});

  final api.Feedback item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppColors.darkPrimary.withValues(alpha: 0.2)
              : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (var star = 1; star <= 5; star++)
                Icon(
                  star <= item.rating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 16,
                  color: const Color(0xFFF59E0B),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.rater.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          if (item.comment.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              item.comment,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                height: 1.4,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ReviewsPlaceholder extends StatelessWidget {
  const _ReviewsPlaceholder({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Cuộn được dù nội dung ngắn, nếu không RefreshIndicator bọc ngoài không có
    // gì để kéo và nút "Thử lại" thành đường duy nhất.
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            children: [
              Icon(
                Icons.star_outline_rounded,
                size: 48,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (onRetry != null) ...[
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh_rounded, size: 18),
                  label: const Text('Thử lại'),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
