import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_status_badge.dart';

/// The caller's refund cases, as buyer and as seller. `role` is required by the
/// backend because a refund row only records the buyer — the seller side is
/// resolved through the order.
class RefundListScreen extends ConsumerStatefulWidget {
  const RefundListScreen({
    super.key,
    this.initialRole = RefundRole.buyer,
    this.showAppBar = true,
  });

  final RefundRole initialRole;

  /// False when the screen is a tab inside the order history, which already has
  /// its own app bar.
  final bool showAppBar;

  @override
  ConsumerState<RefundListScreen> createState() => _RefundListScreenState();
}

class _RefundListScreenState extends ConsumerState<RefundListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: 2,
    vsync: this,
    initialIndex: widget.initialRole == RefundRole.buyer ? 0 : 1,
  );

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = TabBar(
      controller: _tabs,
      tabs: const [
        Tab(text: 'Tôi mua'),
        Tab(text: 'Tôi bán'),
      ],
    );
    final body = TabBarView(
      controller: _tabs,
      children: const [
        _RefundTab(role: RefundRole.buyer),
        _RefundTab(role: RefundRole.seller),
      ],
    );

    if (!widget.showAppBar) {
      return Column(
        children: [
          tabs,
          Expanded(child: body),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Yêu cầu hoàn tiền'), bottom: tabs),
      body: body,
    );
  }
}

class _RefundTab extends ConsumerWidget {
  const _RefundTab({required this.role});

  final RefundRole role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refunds = ref.watch(refundListProvider(role: role));

    return refunds.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Không tải được danh sách.'),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => ref.invalidate(refundListProvider(role: role)),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('Chưa có yêu cầu hoàn tiền nào.'));
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(refundListProvider(role: role)),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, index) => _RefundCard(refund: data[index]),
          ),
        );
      },
    );
  }
}

class _RefundCard extends StatelessWidget {
  const _RefundCard({required this.refund});

  final Refund refund;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push('/account/refunds/${refund.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Đơn ${refund.orderId}',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  RefundStatusBadge(status: refund.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(refund.reason, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),
              Text(
                dateFormat.format(refund.createdAt.toLocal()),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
