import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_orders_provider.dart';

/// A seller's sales, read through `GET /orders?role=seller&state=…`. There is no
/// confirm and no reject: the money creates the order, so the only thing a seller
/// can refuse is a price. What is left is reading it, reporting where the parcel
/// is, cancelling before it ships, and talking to the buyer.
class SellerOrdersScreen extends ConsumerStatefulWidget {
  final OrderState initialState;

  const SellerOrdersScreen({super.key, this.initialState = OrderState.open});

  @override
  ConsumerState<SellerOrdersScreen> createState() => _SellerOrdersScreenState();
}

class _SellerOrdersScreenState extends ConsumerState<SellerOrdersScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.initialState != OrderState.open) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(sellerOrdersProvider.notifier).setState(widget.initialState);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(sellerOrdersProvider);
    final notifier = ref.read(sellerOrdersProvider.notifier);

    return Scaffold(
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
          ),
        ),
      ),
      body: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: notifier.refresh,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  for (final entry in _tabs.entries)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _buildTabChip(
                        context,
                        label: entry.value,
                        isSelected: state.selected == entry.key,
                        onTap: () => notifier.setState(entry.key),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: state.isLoading
                  ? _buildShimmerList(context)
                  : _buildList(context, state, notifier),
            ),
          ],
        ),
      ),
    );
  }

  /// Exactly `OrderState`. A tab the contract has no filter for would be a tab
  /// that is always empty, which is what the previous five were.
  static const _tabs = {
    OrderState.awaitingConfirmation: 'Chờ bạn xác nhận',
    OrderState.open: 'Đang xử lý',
    OrderState.completed: 'Hoàn thành',
    OrderState.cancelled: 'Đã hủy',
  };

  Widget _buildList(
    BuildContext context,
    SellerOrdersState state,
    SellerOrdersNotifier notifier,
  ) {
    if (state.errorMessage != null) {
      return _buildMessage(
        context,
        Icons.error_outline_rounded,
        'Không thể tải đơn hàng',
        state.errorMessage,
      );
    }
    if (state.orders.isEmpty && state.unsettled.isEmpty) {
      return _buildMessage(
        context,
        Icons.receipt_long_outlined,
        'Chưa có đơn hàng nào trong mục này',
        null,
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (state.unsettled.isNotEmpty) ...[
          _buildUnsettledNotice(context, state.unsettled),
          const SizedBox(height: 16),
        ],
        for (final view in state.orders)
          _buildOrderCard(context, view, notifier, state.isActionLoading),
      ],
    );
  }

  /// Paid lines whose order the platform has not created yet. Nothing here is
  /// waiting on the seller — it is a retry list, so it says so and offers nothing.
  Widget _buildUnsettledNotice(
    BuildContext context,
    List<OrderLineView> lines,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF422006) : const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.hourglass_top,
                size: 18,
                color: Color(0xFFD97706),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${lines.length} sản phẩm đã thanh toán đang chờ hệ thống tạo đơn',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFFFBBF24)
                        : const Color(0xFF92400E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Bạn không cần làm gì — đơn sẽ xuất hiện ngay khi hệ thống xử lý xong.',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? const Color(0xFFFDE68A) : const Color(0xFF92400E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final unselectedBg = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFECEEED);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : unselectedBg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    OrderView view,
    SellerOrdersNotifier notifier,
    bool isActionLoading,
  ) {
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
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF059669).withAlpha(40)
                      : const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  view.statusLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFF34D399)
                        : const Color(0xFF065F46),
                  ),
                ),
              ),
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
          const SizedBox(height: 12),
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
              if (order.state == OrderState.awaitingConfirmation) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isActionLoading
                        ? null
                        : () => _confirmOrder(context, order.id, notifier),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Xác nhận đơn'),
                  ),
                ),
              ],
              if (order.state == OrderState.open) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isActionLoading
                        ? null
                        : () =>
                              _showCheckpointSheet(context, order.id, notifier),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cập nhật vận chuyển'),
                  ),
                ),
              ],
            ],
          ),
          if (order.state == OrderState.awaitingConfirmation) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: isActionLoading
                    ? null
                    : () => _declineOrder(context, order.id, notifier),
                child: const Text(
                  'Từ chối đơn',
                  style: TextStyle(color: Color(0xFFEF4444)),
                ),
              ),
            ),
          ] else if (canCancel) ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: isActionLoading
                    ? null
                    : () => _confirmCancel(context, order.id, notifier),
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

  /// `pending` is missing on purpose: it is where a shipment starts, not a
  /// position a checkpoint may report.
  static const _checkpointLabels = {
    TransportCheckpoint.pickedUp: 'Đã lấy hàng',
    TransportCheckpoint.inTransit: 'Đang giao',
    TransportCheckpoint.delivered: 'Đã giao',
    TransportCheckpoint.returned: 'Đã trả về',
    TransportCheckpoint.failed: 'Giao thất bại',
  };

  Future<void> _showCheckpointSheet(
    BuildContext context,
    String orderId,
    SellerOrdersNotifier notifier,
  ) async {
    final theme = Theme.of(context);
    final picked = await showModalBottomSheet<TransportCheckpoint>(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(
              'Vị trí đơn hàng',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            for (final entry in _checkpointLabels.entries)
              ListTile(
                title: Text(entry.value),
                onTap: () => Navigator.pop(sheetContext, entry.key),
              ),
          ],
        ),
      ),
    );
    if (picked == null) return;

    final ok = await notifier.reportCheckpoint(orderId, picked);
    if (!context.mounted) return;
    _report(context, ok, 'Đã cập nhật vận chuyển');
  }

  /// Accepting is what hands the parcel to the carrier, so it is confirmed rather than fired off a
  /// single tap — and the dialog says what happens next, because nothing has shipped until now.
  Future<void> _confirmOrder(
    BuildContext context,
    String orderId,
    SellerOrdersNotifier notifier,
  ) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận đơn hàng?'),
        content: const Text(
          'Đơn sẽ được đặt vận chuyển ngay sau khi bạn xác nhận. '
          'Hãy chắc là bạn còn hàng.',
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
    if (accepted != true) return;

    final ok = await notifier.confirmOrder(orderId);
    if (!context.mounted) return;
    _report(context, ok, 'Đã xác nhận đơn, đang đặt vận chuyển');
  }

  /// Refusing needs a reason and the server refuses an empty one: the buyer gets their money back
  /// in full, and "đã hủy" with no cause tells them nothing about why.
  Future<void> _declineOrder(
    BuildContext context,
    String orderId,
    SellerOrdersNotifier notifier,
  ) async {
    final controller = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Từ chối đơn hàng?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Người mua được hoàn lại toàn bộ, gồm cả phí vận chuyển. '
              'Cho họ biết vì sao.',
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              autofocus: true,
              maxLength: 500,
              decoration: const InputDecoration(
                hintText: 'Ví dụ: hết hàng',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: const Text('Từ chối'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (reason == null || reason.isEmpty) return;

    final ok = await notifier.declineOrder(orderId, reason);
    if (!context.mounted) return;
    _report(context, ok, 'Đã từ chối đơn và hoàn tiền cho người mua');
  }

  Future<void> _confirmCancel(
    BuildContext context,
    String orderId,
    SellerOrdersNotifier notifier,
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
    _report(context, ok, 'Đã hủy đơn hàng');
  }

  /// A failure is shown as one, not swallowed: the old buttons reported success
  /// whatever the server said, because the route they called did not exist.
  void _report(BuildContext context, bool ok, String success) {
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
}
