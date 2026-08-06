import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// Những người tôi theo dõi.
///
/// Một danh sách người, không danh sách shop — và mỗi dòng dẫn tới trang công khai
/// của họ, nơi có bằng chứng tin cậy thật và nút bỏ theo dõi. Không nhân đôi cái
/// nút đó ở đây: hai chỗ cùng đổi một trạng thái là hai chỗ có thể lệch nhau.
class FollowingScreen extends ConsumerStatefulWidget {
  const FollowingScreen({super.key});

  @override
  ConsumerState<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends ConsumerState<FollowingScreen> {
  late Future<List<AccountSummary>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(accountRepositoryProvider).following();
  }

  Future<void> _reload() async {
    final next = ref.read(accountRepositoryProvider).following();
    setState(() => _future = next);
    await next;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Đang theo dõi')),
      body: RefreshIndicator(
        onRefresh: _reload,
        child: FutureBuilder<List<AccountSummary>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return _Centered(
                icon: Icons.wifi_off_rounded,
                title: 'Không tải được danh sách',
                action: TextButton(
                  onPressed: _reload,
                  child: const Text('Thử lại'),
                ),
              );
            }

            final people = snapshot.data ?? const <AccountSummary>[];
            if (people.isEmpty) {
              return const _Centered(
                icon: Icons.person_search_rounded,
                title: 'Bạn chưa theo dõi ai',
                // Nói ra *vì sao* nên theo dõi, chứ không chỉ nói là chưa có gì.
                note: 'Theo dõi một người bán để thấy khi họ đăng tin mới.',
              );
            }

            return ListView.separated(
              // Luôn cuộn được, để RefreshIndicator dùng được cả khi danh sách ngắn.
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: people.length,
              separatorBuilder: (_, _) => Divider(
                height: 1,
                indent: 72,
                color: theme.colorScheme.outlineVariant,
              ),
              itemBuilder: (context, index) {
                final person = people[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundImage: person.avatar?.url == null
                        ? null
                        : NetworkImage(person.avatar!.url),
                    child: person.avatar?.url == null
                        ? const Icon(Icons.person_rounded)
                        : null,
                  ),
                  title: Text(person.name),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push('/users/${person.id}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _Centered extends StatelessWidget {
  const _Centered({
    required this.icon,
    required this.title,
    this.note,
    this.action,
  });

  final IconData icon;
  final String title;
  final String? note;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            if (note != null) ...[
              const SizedBox(height: 4),
              Text(
                note!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (action != null) ...[const SizedBox(height: 12), action!],
          ],
        ),
      ),
    );
  }
}
