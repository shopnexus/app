import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// Ai đang theo dõi một tài khoản. Công khai, như chính trang đó.
///
/// Là một sheet chứ không phải một route: nó mở ra từ đúng một con số trên đúng
/// một trang, và một deep link tới danh sách người theo dõi của người khác là
/// thứ chưa ai cần.
Future<void> showFollowersSheet(BuildContext context, String accountId) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, controller) =>
          _FollowersSheet(accountId: accountId, controller: controller),
    ),
  );
}

class _FollowersSheet extends ConsumerStatefulWidget {
  const _FollowersSheet({required this.accountId, required this.controller});

  final String accountId;
  final ScrollController controller;

  @override
  ConsumerState<_FollowersSheet> createState() => _FollowersSheetState();
}

class _FollowersSheetState extends ConsumerState<_FollowersSheet> {
  late Future<List<AccountSummary>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(accountRepositoryProvider).followers(widget.accountId);
  }

  void _reload() {
    setState(() {
      _future = ref.read(accountRepositoryProvider).followers(widget.accountId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text('Người theo dõi', style: theme.textTheme.titleMedium),
        ),
        Expanded(
          child: FutureBuilder<List<AccountSummary>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Không tải được danh sách',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: _reload,
                        child: const Text('Thử lại'),
                      ),
                    ],
                  ),
                );
              }

              final people = snapshot.data ?? const <AccountSummary>[];
              if (people.isEmpty) {
                return Center(
                  child: Text(
                    'Chưa có ai theo dõi.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }

              return ListView.separated(
                controller: widget.controller,
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
                    onTap: () {
                      // Đóng sheet trước: để lại nó trên trang mới sẽ che đúng
                      // cái trang vừa mở.
                      Navigator.of(context).pop();
                      context.push('/users/${person.id}');
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
