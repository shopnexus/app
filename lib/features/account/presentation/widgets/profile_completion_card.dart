import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/addresses_provider.dart';

/// Một việc còn thiếu trong hồ sơ, và chỗ làm nó.
///
/// Mỗi dòng phải trả lời được "làm cái này thì được gì": một danh sách kiểm tra
/// mà mọi dòng đều chỉ nói "chưa điền" là một danh sách người ta bỏ qua. Nên
/// [why] là hệ quả thật của việc thiếu nó, đọc ra từ chính hệ thống — không phải
/// một lời hối.
class ProfileTask {
  const ProfileTask({
    required this.label,
    required this.why,
    required this.route,
    required this.done,
  });

  final String label;
  final String why;
  final String route;
  final bool done;
}

/// Hồ sơ còn thiếu gì, và điền vào thì mở ra được gì.
///
/// Không phải một thanh phần trăm cho vui: mỗi mục là một cánh cửa mà thiếu nó
/// thì đóng — không có địa chỉ thì không đặt được hàng, chưa xác minh danh tính
/// thì không đăng bán và không rút được tiền, không có số điện thoại thì đơn vị
/// vận chuyển không gọi được. Thanh tiến độ chỉ là cách nói "còn mấy cửa nữa".
///
/// Đủ hết thì thẻ **biến mất** thay vì đứng đó khoe 100%: không còn việc gì thì
/// không cần một dòng nào trên màn hình nữa.
class ProfileCompletionCard extends ConsumerWidget {
  const ProfileCompletionCard({super.key});

  static List<ProfileTask> tasksFor(Me me, {required bool hasAddress}) => [
    ProfileTask(
      label: 'Số điện thoại',
      why: 'Đơn vị vận chuyển gọi số này khi giao hàng.',
      route: '/account/center',
      done: (me.phone ?? '').isNotEmpty,
    ),
    ProfileTask(
      label: 'Địa chỉ nhận hàng',
      why: 'Chưa có địa chỉ thì không đặt hàng được.',
      route: '/account/addresses',
      done: hasAddress,
    ),
    ProfileTask(
      label: 'Email đã xác minh',
      why: 'Email đã xác minh là đường lấy lại mật khẩu.',
      route: '/account/security',
      done: me.emailVerified,
    ),
    ProfileTask(
      label: 'Ảnh đại diện',
      why: 'Người mua thấy ảnh này trong mọi cuộc trò chuyện.',
      route: '/account/center',
      done: (me.avatarUrl ?? '').isNotEmpty,
    ),
    ProfileTask(
      label: 'Xác minh danh tính',
      why: 'Cần có để đăng bán và để rút tiền.',
      route: '/account/kyc',
      done: me.identityVerified,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(profileProvider).value;
    if (me == null) return const SizedBox.shrink();

    // Địa chỉ đọc hỏng hoặc chưa xong thì coi như *chưa biết*, và mục đó không bị
    // đánh là thiếu: một thẻ đòi người dùng thêm địa chỉ họ đã có là một thẻ họ
    // học được cách bỏ qua.
    final contacts = ref.watch(buyerContactsProvider);
    final hasAddress = contacts.value?.isNotEmpty ?? true;

    final tasks = tasksFor(me, hasAddress: hasAddress);
    final remaining = [
      for (final task in tasks)
        if (!task.done) task,
    ];
    if (remaining.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final done = tasks.length - remaining.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hoàn thiện hồ sơ',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$done/${tasks.length}',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: done / tasks.length,
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (final task in remaining)
            InkWell(
              onTap: () => context.push(task.route),
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, right: 10),
                      child: Icon(
                        Icons.radio_button_unchecked_rounded,
                        size: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.label,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            task.why,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                        ],
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
