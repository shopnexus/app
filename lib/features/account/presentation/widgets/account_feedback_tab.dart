import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// `Feedback` cũng là một class của Flutter Material (haptic feedback), nên tên
// trần ở đây là mơ hồ.
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart' as api;
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/public_reputation_provider.dart';

/// Đánh giá một tài khoản đã **nhận được** ở một vai, kèm bảng uy tín của vai
/// đó — dùng cho trang công khai của bất kỳ ai.
///
/// Hai vai là hai thứ khác nhau và cố tình không cộng lại: điểm người bán và
/// điểm người mua trả lời hai câu hỏi khác nhau về cùng một người.
class AccountFeedbackTab extends ConsumerWidget {
  const AccountFeedbackTab({
    super.key,
    required this.accountId,
    required this.role,
    required this.emptyMessage,
  });

  final String accountId;
  final ReputationRole role;
  final String emptyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = (accountId: accountId, role: role);
    final reputationState = ref.watch(accountReputationProvider(query));
    final feedbackState = ref.watch(accountFeedbackProvider(query));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reputationState.maybeWhen(
          data: (reputation) =>
              _ReputationSummary(reputation: reputation, role: role),
          // Bảng số liệu hỏng không nên chặn danh sách bên dưới: đó là hai lần
          // đọc khác nhau và cái quan trọng hơn là cái ở dưới.
          orElse: () => const SizedBox.shrink(),
        ),
        const SizedBox(height: 12),
        feedbackState.when(
          data: (items) {
            if (items.isEmpty) {
              return _Placeholder(message: emptyMessage);
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) =>
                  _FeedbackCard(item: items[index]),
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (err, _) => _Placeholder(
            message: 'Không tải được đánh giá: $err',
            onRetry: () => ref.invalidate(accountFeedbackProvider(query)),
          ),
        ),
      ],
    );
  }
}

/// Điểm giao dịch và điểm sản phẩm nằm ở hai cặp cột riêng trên server: một đơn
/// có thể sinh ra cả hai, nên cộng chung là tính đơn đó hai lần. Người mua thì
/// không có điểm sản phẩm để mà hiện.
class _ReputationSummary extends StatelessWidget {
  const _ReputationSummary({required this.reputation, required this.role});

  final Reputation reputation;
  final ReputationRole role;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppColors.darkPrimary.withAlpha(50)
              : const Color(0xFFE2E3E0),
        ),
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        children: [
          _Stat(
            label: 'Điểm giao dịch',
            value: reputation.ratingCount == 0
                ? '—'
                : '${reputation.ratingAverage.toStringAsFixed(1)} ★',
            caption: '${reputation.ratingCount} lượt',
          ),
          if (role == ReputationRole.seller)
            _Stat(
              label: 'Điểm sản phẩm',
              value: reputation.reviewRatingCount == 0
                  ? '—'
                  : '${reputation.reviewRatingAverage.toStringAsFixed(1)} ★',
              caption: '${reputation.reviewRatingCount} đánh giá',
            ),
          _Stat(
            label: 'Đơn hoàn tất',
            value: '${reputation.completedOrders}',
            caption: '${reputation.cancelledOrders} đơn huỷ',
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    required this.caption,
  });

  final String label;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        Text(
          caption,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
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
              ? AppColors.darkPrimary.withAlpha(50)
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

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
            const SizedBox(height: 12),
            OutlinedButton(onPressed: onRetry, child: const Text('Thử lại')),
          ],
        ],
      ),
    );
  }
}
