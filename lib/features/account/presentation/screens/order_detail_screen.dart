import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/transport_journey.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/request_refund_sheet.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/buyer_orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/confirm_receipt_sheet.dart';
import 'package:shopnexus_flutter_app/shared/widgets/order_status_badge.dart';

class OrderDetailScreen extends ConsumerWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final orderDetailAsync = ref.watch(buyerOrderDetailProvider(orderId));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          // Chỉ còn "báo sự cố": đó là câu hỏi cho support, không phải một bước
          // của đơn. Hoàn tiền đã xuống thanh dưới, nơi nó chỉ hiện khi bấm được.
          PopupMenuButton<_OrderHelpAction>(
            icon: Icon(
              Icons.more_horiz_rounded,
              color: theme.colorScheme.onSurface,
            ),
            onSelected: (action) => _handleHelpAction(context, action),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: _OrderHelpAction.reportIssue,
                child: Text('Báo sự cố đơn hàng'),
              ),
            ],
          ),
        ],
      ),
      // Việc của đơn nằm ở chỗ ngón tay đang đứng, không nằm sau ba chấm: một
      // menu là nơi để tìm, còn "đã nhận hàng" và "yêu cầu hoàn tiền" là hai
      // việc người ta mở màn này ra để làm.
      bottomNavigationBar: orderDetailAsync.maybeWhen(
        data: (view) => _buildActionBar(context, ref, view),
        orElse: () => null,
      ),
      body: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: () => ref.refresh(buyerOrderDetailProvider(orderId).future),
        child: orderDetailAsync.when(
          data: (view) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Status & ID Card
                _buildStatusCard(context, view),
                const SizedBox(height: 16),

                // 2. Shipping Address Card
                _buildAddressCard(context, view),
                const SizedBox(height: 16),

                // 3. Items Card
                _buildItemsCard(context, view),
                const SizedBox(height: 16),

                // 4. Payment Breakdowns Card
                _buildPaymentCard(context, view),
                const SizedBox(height: 16),

                // 5. Shipping info details
                _buildShippingDetailsCard(context, ref, view),
                const SizedBox(height: 32),
              ],
            ),
          ),
          loading: () => _buildShimmerDetail(context),
          error: (err, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 48,
                    color: isDarkMode
                        ? const Color(0xFFEF4444)
                        : const Color(0xFFBA1A1A),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Không thể tải chi tiết đơn hàng',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    err.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.refresh(buyerOrderDetailProvider(orderId)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Thử lại',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Thanh việc dưới cùng, hoặc không có thanh nào.
  ///
  /// Trả `null` chứ không trả một thanh rỗng: một đơn đã xong không còn việc gì,
  /// và một dải trắng cao 80px ở đáy màn hình nói rằng có.
  ///
  /// Hoàn tiền chỉ hiện khi server nhận: đã có vụ đang mở thì đường đi là *xem*
  /// nó, vì mở vụ thứ hai trên cùng đơn trả 409 — nút thứ hai chỉ để dẫn người
  /// mua tới một thông báo lỗi.
  Widget? _buildActionBar(BuildContext context, WidgetRef ref, OrderView view) {
    final theme = Theme.of(context);
    final openRefund = view.openRefund;

    final actions = <Widget>[
      if (view.canConfirmReceipt)
        FilledButton.icon(
          onPressed: () => _confirmReceipt(context, ref),
          icon: const Icon(Icons.inventory_2_outlined, size: 20),
          label: const Text('Đã nhận hàng'),
        ),
      if (openRefund != null)
        OutlinedButton.icon(
          onPressed: () =>
              context.push('/account/refunds/${openRefund.id}'),
          icon: const Icon(Icons.assignment_return_outlined, size: 20),
          label: const Text('Xem yêu cầu hoàn tiền'),
        )
      else if (view.canRequestRefund)
        OutlinedButton.icon(
          onPressed: () => _requestRefund(context, ref),
          icon: const Icon(Icons.assignment_return_outlined, size: 20),
          label: const Text('Yêu cầu hoàn tiền'),
        ),
    ];
    if (actions.isEmpty) return null;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.colorScheme.outlineVariant, width: 0.5),
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final action in actions) ...[
              if (action != actions.first) const SizedBox(height: 8),
              SizedBox(width: double.infinity, height: 48, child: action),
            ],
          ],
        ),
      ),
    );
  }

  /// Xác nhận đã nhận hàng, ngay tại màn chi tiết. Trước đây việc này chỉ có ở
  /// danh sách, nên người mở đơn ra xem rồi mới quyết định phải quay lại mới làm
  /// được — và `received_at` là thứ mở đồng hồ trả tiền cho người bán.
  Future<void> _confirmReceipt(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmReceiptSheet.show(context, orderId: orderId);
    if (confirmed != true || !context.mounted) return;
    // Sheet đã tự báo lỗi của nó; ở đây chỉ còn việc nạp lại cả chi tiết lẫn
    // danh sách phía sau, vì đơn vừa đổi trạng thái.
    ref.invalidate(buyerOrderDetailProvider(orderId));
    ref.invalidate(ordersProvider);
    ref.invalidate(unsettledItemsProvider);
  }

  Future<void> _requestRefund(BuildContext context, WidgetRef ref) async {
    final refund = await RequestRefundSheet.show(context, orderId);
    if (refund == null || !context.mounted) return;
    ref.invalidate(buyerOrderDetailProvider(orderId));
    context.push('/account/refunds/${refund.id}');
  }

  Widget _buildStatusCard(BuildContext context, OrderView view) {
    final order = view.order;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trạng thái đơn hàng',
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFamily: 'Inter',
                ),
              ),
              OrderStatusBadge(view: view),
            ],
          ),
          Divider(height: 24, color: dividerColor),
          Text(
            'Mã đơn: ${order.id}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Ngày đặt hàng: ${_formatDate(order.createdAt)}',
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context, OrderView view) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: theme.colorScheme.onSurfaceVariant,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Địa chỉ giao hàng',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Divider(height: 24, color: dividerColor),
          Text(
            view.shippingAddress,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: theme.colorScheme.onSurface,
              fontFamily: 'Inter',
            ),
          ),
          // Cạnh địa chỉ, vì người bán đọc hai thứ này trong cùng một việc: gói
          // hàng rồi ghi phiếu. Câu dặn được ghi vào đơn từ lâu mà trước đây
          // không hiện ở đâu cả.
          if (view.buyerNote.isNotEmpty) ...[
            Divider(height: 24, color: dividerColor),
            Text(
              'Ghi chú của người mua',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 6),
            Text(
              view.buyerNote,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItemsCard(BuildContext context, OrderView view) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final imageBgColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF1F5F9);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sản phẩm đã mua',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontFamily: 'Inter',
            ),
          ),
          Divider(height: 24, color: dividerColor),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: view.lines.length,
            separatorBuilder: (context, index) =>
                Divider(height: 24, color: dividerColor),
            itemBuilder: (context, index) {
              final line = view.lines[index];
              final listingId = line.listing?.id ?? line.item.listingId;
              return InkWell(
                onTap: listingId.isNotEmpty
                    ? () => context.push('/home/product/$listingId')
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 64,
                          height: 64,
                          color: imageBgColor,
                          child: line.imageUrl != null &&
                                  line.imageUrl!.isNotEmpty
                              ? Image.network(line.imageUrl!, fit: BoxFit.cover)
                              : Icon(
                                  Icons.image_rounded,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              line.displayName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'x${line.item.quantity}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.colorScheme.onSurfaceVariant,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Text(
                                  MoneyUtils.format(
                                    line.item.totalAmount,
                                    currency: line.item.currency,
                                  ),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context, OrderView view) {
    final order = view.order;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // The carriage is the transport's own `fee`, which is what the buyer was
    // quoted at checkout — not the gap between two other numbers.
    final goods = view.goodsTotal;
    final shippingCost = order.transport?.fee ?? order.total - goods;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin thanh toán',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontFamily: 'Inter',
            ),
          ),
          Divider(height: 24, color: dividerColor),
          _buildPaymentRow(
            context,
            'Tiền hàng',
            MoneyUtils.format(goods, currency: order.currency),
          ),
          const SizedBox(height: 12),
          _buildPaymentRow(
            context,
            'Phí vận chuyển',
            MoneyUtils.format(
              shippingCost > 0 ? shippingCost : 0,
              currency: order.currency,
            ),
          ),
          Divider(height: 24, color: dividerColor),
          _buildPaymentRow(
            context,
            'Tổng thanh toán',
            MoneyUtils.format(order.total, currency: order.currency),
            isBold: true,
            fontSize: 16,
            valueColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
    double fontSize = 13,
    Color? valueColor,
  }) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: isBold
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurfaceVariant,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Inter',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            color: valueColor ?? theme.colorScheme.onSurface,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }

  Widget _buildShippingDetailsCard(
    BuildContext context,
    WidgetRef ref,
    OrderView view,
  ) {
    final order = view.order;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardBgColor = isDarkMode ? AppColors.darkSurface : Colors.white;
    final cardBorderColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(40)
        : const Color(0xFFF1F5F9);
    final dividerColor = isDarkMode
        ? AppColors.darkPrimary.withAlpha(30)
        : const Color(0xFFF1F5F9);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin vận chuyển',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontFamily: 'Inter',
            ),
          ),
          Divider(height: 24, color: dividerColor),
          // Hành trình thay cho hai dòng "đơn vị" + "trạng thái": nó nói cả hai
          // thứ đó và thêm cái đã qua, ở đúng nơi người ta bấm vào để xem.
          if (order.transport case final transport?)
            TransportJourney(transport: transport)
          else
            _buildPaymentRow(
              context,
              'Đơn vị vận chuyển',
              // Chưa xác nhận thì chưa có gì được đặt — nói vậy chứ không vẽ một
              // hành trình rỗng trông như đang chờ lấy hàng.
              'Chưa đặt vận chuyển',
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime instant) {
    final date = instant.toLocal();
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}  ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Widget _buildShimmerDetail(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 140,
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Hỏi support, chứ không phải một bước của đơn: một `order-issue` ticket là
  /// câu hỏi cho người, còn hoàn tiền là máy trạng thái của chính đơn và sống ở
  /// thanh dưới.
  Future<void> _handleHelpAction(
    BuildContext context,
    _OrderHelpAction action,
  ) async {
    switch (action) {
      case _OrderHelpAction.reportIssue:
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
  }
}

enum _OrderHelpAction { reportIssue }
