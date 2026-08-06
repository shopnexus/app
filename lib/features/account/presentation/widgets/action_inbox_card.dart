import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';

/// Phần trình bày thuần: không đọc provider, không điều hướng. Đây là chỗ chứa
/// quy tắc "rỗng thì biến mất", nên nó phải test được mà không cần dựng container.
class ActionInboxView extends StatelessWidget {
  const ActionInboxView({
    super.key,
    required this.inbox,
    required this.onTapRoute,
  });

  final ActionInbox inbox;
  final void Function(String route) onTapRoute;

  @override
  Widget build(BuildContext context) {
    if (inbox.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                'Việc cần làm',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (final entry in inbox.entries)
            InkWell(
              onTap: () => onTapRoute(entry.route),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        entry.count > 99 ? '99+' : '${entry.count}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        entry.label,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Lớp bọc đọc provider. Đang tải hoặc hỏng thì không vẽ gì: khối này là phần
/// thêm, không phải phần chính, nên nó không được nhấp nháy hay chiếm chỗ bằng
/// một shimmer trong lúc chờ.
class ActionInboxCard extends ConsumerWidget {
  const ActionInboxCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inbox = ref.watch(actionInboxProvider).value;
    if (inbox == null) return const SizedBox.shrink();

    return ActionInboxView(
      inbox: inbox,
      onTapRoute: (route) => context.push(route),
    );
  }
}
