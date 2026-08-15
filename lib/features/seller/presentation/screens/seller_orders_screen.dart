import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_orders_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_status_badge.dart';
import 'package:shopnexus_flutter_app/shared/widgets/order_status_badge.dart';

/// A seller's sales, read through `GET /orders?role=seller&state=…`.
///
/// Nơi người bán *trả lời* một đơn: nhận hoặc từ chối trong 48 giờ escrow giữ
/// tiền, hủy trước khi hàng rời kho, báo sự cố, và nhắn cho người mua. Vị trí
/// kiện hàng thì không: `POST /orders/{id}/transport/checkpoints` là route của
/// nhân viên sàn, người bán thấy hàng đi sai thì mở ticket `order-issue`.
class SellerOrdersScreen extends ConsumerWidget {
  final int initialTabIndex;

  const SellerOrdersScreen({super.key, this.initialTabIndex = 0});

  static const _tabTitles = [
    'Tất cả',
    'Chờ xác nhận',
    'Đang xử lý',
    'Hoàn thành',
    'Hoàn tiền',
    'Đã hủy',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: _tabTitles.length,
      initialIndex: initialTabIndex.clamp(0, _tabTitles.length - 1),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Đơn hàng bán',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              fontFamily: 'Manrope',
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                labelColor: theme.colorScheme.onPrimary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
                tabs: [
                  for (final title in _tabTitles)
                    Tab(height: 36, child: Text(title)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            for (var i = 0; i < _tabTitles.length; i++)
              _SellerOrdersTabList(selectedTab: i),
          ],
        ),
      ),
    );
  }
}

bool _matchesSellerTab(
  OrderView view,
  int selectedTab,
  Set<String> refundedOrderIds,
) {
  final isCancelled =
      view.order.state == OrderState.cancelled ||
      view.order.cancelledAt != null;

  final isDelivered = view.order.transport?.status == TransportStatus.delivered;

  final isCompleted =
      view.order.state == OrderState.completed ||
      view.order.receivedAt != null ||
      view.order.completedAt != null ||
      isDelivered;

  switch (selectedTab) {
    case 1: // Chờ xác nhận
      return view.order.state == OrderState.awaitingConfirmation &&
          !isCancelled;
    case 2: // Đang xử lý
      return view.order.state == OrderState.open &&
          !isCompleted &&
          view.order.transport?.status != TransportStatus.returned &&
          !isCancelled;
    case 3: // Hoàn thành
      return isCompleted && !isCancelled;
    case 4: // Hoàn tiền
      return (view.order.declineReason != null ||
              view.order.transport?.status == TransportStatus.returned ||
              refundedOrderIds.contains(view.order.id)) &&
          !isCancelled;
    case 5: // Đã hủy
      return isCancelled;
    case 0: // Tất cả
    default:
      return true;
  }
}

class _SellerOrdersTabList extends ConsumerWidget {
  final int selectedTab;

  const _SellerOrdersTabList({required this.selectedTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ordersAsync = ref.watch(sellerAllOrdersProvider);
    final me = ref.watch(profileProvider).value?.id;
    final refundsAsync = ref.watch(refundListProvider);
    final sellerRefunds =
        refundsAsync.value?.where((r) => r.buyerId != me).toList() ??
        const <Refund>[];
    final sellerRefundMap = {for (final r in sellerRefunds) r.orderId: r};
    final refundedOrderIds = sellerRefundMap.keys.toSet();
    final sellerOrdersState = ref.watch(sellerOrdersProvider);
    final notifier = ref.read(sellerOrdersProvider.notifier);

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () async {
        ref.invalidate(sellerAllOrdersProvider);
        ref.invalidate(sellerOrdersProvider);
        ref.invalidate(refundListProvider);
      },
      child: ordersAsync.when(
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _buildMessage(
          context,
          Icons.error_outline_rounded,
          'Không thể tải đơn hàng',
          err.toString(),
        ),
        data: (allOrders) {
          final matchingOrders = allOrders
              .where(
                (view) =>
                    _matchesSellerTab(view, selectedTab, refundedOrderIds),
              )
              .toList();

          if (matchingOrders.isEmpty) {
            return _buildMessage(
              context,
              Icons.receipt_long_outlined,
              'Chưa có đơn hàng nào trong mục này',
              null,
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              for (final view in matchingOrders)
                _buildOrderCard(
                  context,
                  view,
                  notifier,
                  sellerOrdersState.isActionLoading,
                  ref,
                  refund: sellerRefundMap[view.order.id],
                ),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildOrderCard(
  BuildContext context,
  OrderView view,
  SellerOrdersNotifier notifier,
  bool isActionLoading,
  WidgetRef ref, {
  Refund? refund,
}) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  final order = view.order;

  final cardBgColor = isDark ? AppColors.darkSurface : Colors.white;
  final cardBorderColor = isDark
      ? AppColors.darkPrimary.withAlpha(40)
      : const Color(0xFFF1F5F9);
  final dividerColor = isDark
      ? AppColors.darkPrimary.withAlpha(30)
      : const Color(0xFFF1F5F9);

  // Cancelling is refused once the parcel has left `pending`; after that a
  // refund is the only way back, so the button is not offered.
  final canCancel =
      order.state == OrderState.open &&
      (order.transport?.status ?? TransportStatus.pending) ==
          TransportStatus.pending;

  /// Cửa sổ 48 giờ. Sau nó đơn tự hủy, nên hai nút này chỉ có nghĩa ở đây.
  final awaitingAnswer = view.isAwaitingConfirmation;

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: cardBgColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: cardBorderColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Mã đơn: #${order.id}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            OrderStatusBadge(view: view),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Khách hàng: ${order.buyer.name}',
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          view.shippingAddress,
          style: TextStyle(
            fontSize: 12,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Divider(height: 20, color: dividerColor),
        for (final line in view.lines)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${line.displayName} ×${line.item.quantity}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface,
                      decoration: line.isCancelled
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  MoneyUtils.format(
                    line.item.totalAmount,
                    currency: line.item.currency,
                  ),
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        Divider(height: 20, color: dividerColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tiền hàng:',
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              MoneyUtils.format(view.goodsTotal, currency: order.currency),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        if (order.transport != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phí vận chuyển (người mua trả):',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                MoneyUtils.format(
                  order.transport!.fee,
                  currency: order.currency,
                ),
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        if (refund != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark
                    ? AppColors.darkPrimary.withAlpha(30)
                    : const Color(0xFFE2E8F0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Trạng thái hoàn tiền',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    RefundStatusBadge(status: refund.status),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Lý do hoàn tiền: ${refund.reason}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
        // Đồng hồ đứng riêng một dòng phía trên hai nút nó nói về: một cái hạn
        // nằm cạnh nút bấm thì đọc như nhãn của nút, chứ không như thời gian
        // còn lại của cả đơn.
        if (awaitingAnswer && view.confirmationRemaining != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 14,
                color: theme.colorScheme.error,
              ),
              const SizedBox(width: 4),
              Text(
                'Còn ${view.confirmationRemaining} để trả lời',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 12),
        if (awaitingAnswer)
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: isActionLoading
                      ? null
                      : () => _confirmOrder(context, order.id, notifier, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Xác nhận'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: isActionLoading
                      ? null
                      : () => _declineOrder(context, order.id, notifier, ref),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFEF4444),
                    side: const BorderSide(color: Color(0xFFEF4444)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Từ chối'),
                ),
              ),
            ],
          ),
        if (awaitingAnswer) const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => context.push('/chat'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.onSurface,
                  side: BorderSide(color: theme.colorScheme.outline),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Chat khách'),
              ),
            ),
            // Chỗ của nút "Cập nhật vận chuyển" cũ. Người bán thấy hàng đi sai
            // báo cho sàn, chứ không tự viết lại vị trí kiện hàng.
            if (order.state == OrderState.open) ...[
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _reportIssue(context, order.id),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    side: BorderSide(color: theme.colorScheme.outline),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Báo sự cố'),
                ),
              ),
            ],
          ],
        ),
        if (refund != null) ...[
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/account/refunds/${refund.id}'),
              icon: const Icon(Icons.assignment_return_outlined, size: 16),
              label: const Text('Xem chi tiết hoàn tiền'),
            ),
          ),
        ],
        if (canCancel) ...[
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: isActionLoading
                  ? null
                  : () => _confirmCancel(context, order.id, notifier, ref),
              child: const Text(
                'Hủy đơn',
                style: TextStyle(color: Color(0xFFEF4444)),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}

Future<void> _confirmOrder(
  BuildContext context,
  String orderId,
  SellerOrdersNotifier notifier,
  WidgetRef ref,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Xác nhận đơn hàng?'),
      content: const Text(
        'Bạn nhận đơn này và sẽ giao hàng. Sau khi xác nhận, đơn chuyển sang '
        'chờ lấy hàng và chỉ hủy được khi đơn vị vận chuyển chưa lấy.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('Để sau'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Xác nhận'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;

  final ok = await notifier.confirmOrder(orderId);
  if (!context.mounted) return;
  _report(context, ref, notifier, ok, 'Đã xác nhận đơn hàng');
}

/// Lý do là bắt buộc và server từ chối chuỗi rỗng: người mua đã trả tiền, nên
/// một lời từ chối không kèm lý do là một khoản hoàn tiền không giải thích
/// được. Nút chỉ bật khi ô nhập có chữ.
Future<void> _declineOrder(
  BuildContext context,
  String orderId,
  SellerOrdersNotifier notifier,
  WidgetRef ref,
) async {
  final controller = TextEditingController();
  final reason = await showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Từ chối đơn hàng?'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Người mua được hoàn lại toàn bộ số tiền đã trả, kể cả phí vận '
              'chuyển. Hãy nói vì sao.',
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              autofocus: true,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Ví dụ: hết hàng, sai giá…',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Để sau'),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (_, value, _) => ElevatedButton(
            onPressed: value.text.trim().isEmpty
                ? null
                : () => Navigator.pop(dialogContext, value.text.trim()),
            child: const Text('Từ chối'),
          ),
        ),
      ],
    ),
  );
  controller.dispose();
  if (reason == null) return;

  final ok = await notifier.declineOrder(orderId, reason);
  if (!context.mounted) return;
  _report(context, ref, notifier, ok, 'Đã từ chối đơn hàng');
}

/// Thread của ticket là nơi việc này tiếp diễn, nên màn hình đi theo nó.
Future<void> _reportIssue(BuildContext context, String orderId) async {
  final ticket = await RaiseTicketSheet.show(
    context,
    kind: TicketKind.orderIssue,
    refId: orderId,
    subjectHint: 'Sự cố đơn hàng $orderId',
    refLabel: orderId,
  );
  if (ticket == null || !context.mounted) return;
  context.push('/account/help-center/${ticket.id}');
}

Future<void> _confirmCancel(
  BuildContext context,
  String orderId,
  SellerOrdersNotifier notifier,
  WidgetRef ref,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Hủy đơn hàng?'),
      content: const Text(
        'Tiền tạm giữ sẽ được hoàn lại cho người mua và hàng được trả về kho. '
        'Không thể hủy sau khi đơn vị vận chuyển đã lấy hàng.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('Không'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Hủy đơn'),
        ),
      ],
    ),
  );
  if (confirmed != true) return;

  final ok = await notifier.cancelOrder(orderId);
  if (!context.mounted) return;
  _report(context, ref, notifier, ok, 'Đã hủy đơn hàng');
}

/// A failure is shown as one, not swallowed: the old buttons reported success
/// whatever the server said, because the route they called did not exist.
void _report(
  BuildContext context,
  WidgetRef ref,
  SellerOrdersNotifier notifier,
  bool ok,
  String success,
) {
  if (ok) {
    ref.invalidate(sellerAllOrdersProvider);
  }
  final message = ok
      ? success
      : ref.read(sellerOrdersProvider).errorMessage ?? 'Không thực hiện được';
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: ok ? const Color(0xFF10B981) : const Color(0xFFEF4444),
    ),
  );
}

Widget _buildShimmerList(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final baseColor = isDark ? Colors.grey[800]! : const Color(0xFFE2E8F0);
  final highlightColor = isDark ? Colors.grey[700]! : const Color(0xFFF1F5F9);

  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        height: 160,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}

Widget _buildMessage(
  BuildContext context,
  IconData icon,
  String title,
  String? detail,
) {
  final theme = Theme.of(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: theme.colorScheme.onSurface,
            ),
          ),
          if (detail != null) ...[
            const SizedBox(height: 6),
            Text(
              detail,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
