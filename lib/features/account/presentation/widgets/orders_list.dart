import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_actions_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/confirm_receipt_sheet.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/waiting_group.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/rate_order_sheet.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/widgets/refund_status_badge.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/widgets/resume_payment_sheet.dart';

/// Đơn của cả hai chiều, ba nhóm theo lượt, không tab và không segment vai.
///
/// Chín cái tab trước đây lọc trung bình năm dòng dữ liệu, rồi một segment
/// "Tôi mua | Tôi bán" chia đôi cái còn lại. Nhưng vai chưa bao giờ là câu hỏi —
/// nó nằm sẵn trong câu mô tả việc ("Xác nhận đơn của Minh" chỉ có thể là mình
/// bán) — còn câu hỏi thật là "cái gì đang chờ tôi", và nó vắt qua cả hai vai.
/// Xem [WaitingSide].
class OrdersList extends ConsumerStatefulWidget {
  final int selectedTab;

  const OrdersList({super.key, this.selectedTab = 0});

  @override
  ConsumerState<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends ConsumerState<OrdersList> {
  /// Tab "Chờ xác nhận" trong [OrdersScreen].
  static const _awaitingTab = 1;

  bool _matchesTab(
    OrderView view,
    int selectedTab,
    Set<String> refundedOrderIds,
  ) {
    final isCancelled =
        view.order.state == OrderState.cancelled ||
        view.order.cancelledAt != null;

    final isDelivered =
        view.order.transport?.status == TransportStatus.delivered;

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

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(ordersProvider);
    final unsettled = ref.watch(unsettledItemsProvider);
    final me = ref.watch(profileProvider).value?.id;
    final refundsAsync = ref.watch(refundListProvider);
    final buyerRefunds =
        refundsAsync.value?.where((r) => r.buyerId == me).toList() ??
        const <Refund>[];
    final buyerRefundMap = {for (final r in buyerRefunds) r.orderId: r};
    final refundedOrderIds = buyerRefundMap.keys.toSet();

    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primary,
      onRefresh: () async {
        ref.invalidate(ordersProvider);
        ref.invalidate(unsettledItemsProvider);
        ref.invalidate(refundListProvider);
      },
      child: switch (feed) {
        AsyncError(:final error) => _Retry(
          error: error,
          onRetry: () => ref.invalidate(ordersProvider),
        ),
        AsyncValue(:final value?) => _body(
          value,
          unsettled.value ?? const [],
          me,
          refundedOrderIds,
          buyerRefundMap,
        ),
        _ => const _OrdersShimmer(),
      },
    );
  }

  Widget _body(
    OrdersFeed feed,
    List<OrderLineView> unsettled,
    String? me,
    Set<String> refundedOrderIds,
    Map<String, Refund> refundMap,
  ) {
    final matchingOrders = feed.orders
        .where(
          (view) =>
              _matchesTab(view, widget.selectedTab, refundedOrderIds) &&
              (view.order.seller.id != me || view.order.buyer.id == me),
        )
        .toList();

    // Dòng chưa thành đơn thuộc cả hai tab, và không phải vì tiện: nó chưa có
    // `Order` nên không lọt qua `_matchesTab` được, mà việc nó mô tả — trả nốt
    // tiền, hoặc chờ hệ thống tạo đơn — đúng là thứ người ta mở tab "Chờ xác
    // nhận" để tìm. Bỏ nó khỏi đó thì tab ấy trống trong khi vẫn còn việc.
    final showsUnsettled =
        widget.selectedTab == 0 || widget.selectedTab == _awaitingTab;

    if (matchingOrders.isEmpty && (!showsUnsettled || unsettled.isEmpty)) {
      return const _Empty();
    }

    final selling = matchingOrders.any((view) => view.order.seller.id == me);

    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        if (showsUnsettled && unsettled.isNotEmpty) ...[
          _UnsettledBlock(lines: unsettled, me: me),
          const SizedBox(height: 20),
        ],
        if (selling) const _CarrierNote(),
        for (final view in matchingOrders) ...[
          _OrderRow(
            view: view,
            me: me,
            isFinished: view.isFinished,
            refund: refundMap[view.order.id],
          ),
          const SizedBox(height: 12),
        ],
        if (widget.selectedTab == 0 && feed.hasMore)
          _LoadMoreButton(
            isLoading: feed.isLoadingMore,
            error: feed.loadMoreError,
            onTap: () => ref.read(ordersProvider.notifier).loadMore(),
          ),
      ],
    );
  }
}

/// Một đơn, một dòng: ảnh, tên, chuyện đang xảy ra, số tiền.
///
/// Chuyện đang xảy ra được viết theo vai đang xem, và vai đọc trên chính dòng —
/// `order.seller.id == me`. Cùng một đơn chờ xác nhận, bên bán đọc "cần bạn xác
/// nhận" còn bên mua đọc ai đang giữ tiền của mình; một cái nhãn trung tính cho
/// cả hai thì không nói được cả hai điều đó. Ở một danh sách gộp hai chiều thì
/// vai phải là thuộc tính của dòng, không của màn hình.
class _OrderRow extends ConsumerWidget {
  const _OrderRow({
    required this.view,
    required this.me,
    required this.isFinished,
    this.refund,
  });

  final OrderView view;
  final String? me;
  final Refund? refund;

  /// Mình là bên bán của đơn này. Một đơn tự mua tự bán thì `true` — bên bán có
  /// nhiều việc hơn, nên hiện nó là phía đúng để nghiêng về.
  bool get _selling => view.order.seller.id == me;
  final bool isFinished;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final order = view.order;
    final first = view.lines.isEmpty ? null : view.lines.first;

    // Tiền của mỗi bên là số khác nhau: người mua trả cả phí giao, người bán
    // không bao giờ nhận phí đó — nó là tiền của đơn vị vận chuyển.
    final amount = _selling ? view.goodsTotal : order.total;
    final actions = _actions(context, ref);

    return Opacity(
      // Nhóm đã xong vẫn đọc được, chỉ nhẹ hơn — nó là lịch sử, không phải việc.
      opacity: isFinished ? 0.72 : 1,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark
                ? AppColors.darkPrimary.withAlpha(40)
                : const Color(0xFFE2E8F0),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            if (refund != null) {
              context.push('/account/refunds/${refund!.id}');
            } else {
              context.push('/account/order-detail/${order.id}');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Thumbnail(url: first?.imageUrl),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            first?.displayName ?? 'Đơn #${order.id}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          if (view.lines.length > 1)
                            Text(
                              'và ${view.lines.length - 1} sản phẩm khác',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            orderStatusLine(view, selling: _selling),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              height: 1.4,
                              fontWeight: (view.isAwaitingConfirmation ||
                                      view.order.state == OrderState.cancelled ||
                                      view.order.transport?.status == TransportStatus.failed)
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: (view.order.state == OrderState.cancelled ||
                                      view.order.transport?.status == TransportStatus.failed ||
                                      view.order.transport?.status == TransportStatus.cancelled)
                                  ? (isDark
                                      ? const Color(0xFFF87171)
                                      : const Color(0xFFDC2626))
                                  : view.isAwaitingConfirmation
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      MoneyUtils.format(amount, currency: order.currency),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                if (refund != null) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurface
                          : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10),
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
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            RefundStatusBadge(status: refund!.status),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Lý do hoàn tiền: ${refund!.reason}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (actions.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Row(children: actions),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Chỉ những việc **quyết định tiền hoặc có đồng hồ**, tối đa hai nút.
  ///
  /// Danh sách là chỗ để không bỏ sót một việc, không phải chỗ để làm mọi việc:
  /// xem hành trình kiện hàng, yêu cầu hoàn tiền, báo sự cố đều sống trong màn chi
  /// tiết, nơi có đủ thông tin để viết một yêu cầu. Nút "Hành trình" từng ở đây và
  /// đã bỏ vì đúng lý do đó — chạm vào đơn là đã tới chỗ xem được rồi.
  ///
  /// Bảng đầy đủ, để cái gì hiện lúc nào là một câu trả lời được chứ không phải
  /// một chuỗi `if` chồng nhau:
  ///
  /// | Trạng thái            | Người bán          | Người mua      |
  /// |-----------------------|--------------------|----------------|
  /// | chờ xác nhận          | Xác nhận / Từ chối | Hủy đơn        |
  /// | đang mở, chưa lấy hàng| Hủy đơn            | Hủy đơn        |
  /// | đang mở, đang đi      | —                  | —              |
  /// | đang mở, đã giao      | —                  | Đã nhận hàng   |
  /// | hoàn thành            | —                  | Đánh giá       |
  /// | đã hủy                | —                  | —              |
  List<Widget> _actions(BuildContext context, WidgetRef ref) {
    // Đơn đã xong còn đúng một việc, và chỉ của người mua: chấm điểm. Nó ở đây chứ
    // không ở một màn "Đánh giá của tôi" riêng, vì câu hỏi thật không phải "xem lại
    // những gì tôi từng viết" mà là "đơn này tôi đánh giá chưa" — câu đó chỉ trả
    // lời được cạnh chính cái đơn.
    if (view.order.state == OrderState.completed && !_selling) {
      return [
        Expanded(
          child: OutlinedButton(
            onPressed: () => _rate(context, ref),
            child: const Text('Đánh giá'),
          ),
        ),
      ];
    }
    if (isFinished) return const [];

    final isActing = ref.watch(ordersActionsProvider).isLoading;

    if (_selling) {
      if (view.isAwaitingConfirmation) {
        return [
          Expanded(
            child: ElevatedButton(
              onPressed: isActing ? null : () => _confirm(context, ref),
              child: const Text('Xác nhận'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextButton(
              onPressed: isActing ? null : () => _decline(context, ref),
              child: const Text(
                'Từ chối',
                style: TextStyle(color: Color(0xFFEF4444)),
              ),
            ),
          ),
        ];
      }
      // Đã xác nhận rồi thì việc của người bán là giao hàng, và vị trí kiện hàng
      // không phải thứ họ ghi được — nên không có nút nào cho tới lúc hủy được.
      return [if (view.canCancel) _cancelButton(context, ref, isActing)];
    }

    // Cái đồng hồ đắt nhất trên sàn: `received_at` là điều kiện trong câu truy vấn
    // payout, nên tới khi người mua chạm thì tiền người bán vẫn nằm trong escrow.
    if (view.canConfirmReceipt) {
      return [
        Expanded(
          child: ElevatedButton(
            onPressed: isActing ? null : () => _confirmReceipt(context, ref),
            child: const Text('Đã nhận hàng'),
          ),
        ),
      ];
    }
    // Người mua cũng hủy được khi hàng chưa đi — kể cả lúc người bán chưa xác
    // nhận, và lúc đó tiền về đủ cả phí giao hàng.
    return [if (view.canCancel) _cancelButton(context, ref, isActing)];
  }

  Widget _cancelButton(BuildContext context, WidgetRef ref, bool isActing) =>
      Expanded(
        child: OutlinedButton(
          onPressed: isActing ? null : () => _cancel(context, ref),
          child: const Text(
            'Hủy đơn',
            style: TextStyle(color: Color(0xFFEF4444)),
          ),
        ),
      );

  /// Nhận đơn là lúc kiện hàng được đặt cho đơn vị vận chuyển, nên nó được hỏi
  /// lại một lần chứ không đi luôn từ một cái chạm — và hộp thoại nói ra điều
  /// sắp xảy ra, vì tới đây vẫn chưa có gì được gửi.
  Future<void> _confirm(BuildContext context, WidgetRef ref) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận đơn hàng?'),
        content: const Text(
          'Đơn sẽ được đặt vận chuyển ngay sau khi bạn xác nhận. Hãy chắc là '
          'bạn còn hàng.',
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
    if (accepted != true || !context.mounted) return;

    await _run(
      context,
      ref,
      (actions) => actions.confirmOrder(view.order.id),
      'Đã xác nhận đơn, đang đặt vận chuyển',
    );
  }

  /// Từ chối cần một lý do và server từ chối lý do rỗng: người mua được hoàn
  /// toàn bộ, và "đã hủy" không kèm gì thì không nói cho họ biết vì sao.
  Future<void> _decline(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Từ chối đơn hàng?'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Người mua được hoàn lại toàn bộ, gồm cả phí vận chuyển. Cho họ '
                'biết vì sao.',
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
    if (reason == null || reason.isEmpty || !context.mounted) return;

    await _run(
      context,
      ref,
      (actions) => actions.declineOrder(view.order.id, reason),
      'Đã từ chối đơn và hoàn tiền cho người mua',
    );
  }

  Future<void> _cancel(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hủy đơn hàng?'),
        content: const Text(
          'Tiền tạm giữ sẽ được hoàn lại cho người mua. Không thể hủy sau khi '
          'đơn vị vận chuyển đã lấy hàng.',
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
    if (confirmed != true || !context.mounted) return;

    await _run(
      context,
      ref,
      (actions) => actions.cancelOrder(view.order.id),
      'Đã hủy đơn hàng',
    );
  }

  Future<void> _confirmReceipt(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmReceiptSheet.show(
      context,
      orderId: view.order.id,
    );
    if (confirmed != true) return;
    // Sheet đã báo lỗi của chính nó, nên ở đây chỉ còn việc nạp lại — cùng hai
    // provider mà `_run` nạp, vì dòng vừa đổi trạng thái.
    ref.invalidate(ordersProvider);
    ref.invalidate(unsettledItemsProvider);
  }

  /// Một nút, một biểu mẫu hai phần. Đánh giá sản phẩm chỉ được hỏi khi đơn có
  /// đúng một tin: nó gắn với **một** tin, và với đơn nhiều dòng thì bắt người
  /// dùng chọn hộ là hỏi một câu họ không có lý do trả lời.
  Future<void> _rate(BuildContext context, WidgetRef ref) async {
    final single = view.lines.length == 1 ? view.lines.first : null;
    final sent = await RateOrderSheet.show(
      context,
      orderId: view.order.id,
      sellerName: view.order.seller.name,
      listingId: single?.listing?.id,
      listingName: single?.name,
    );
    if (sent != true) return;
    ref.invalidate(ordersProvider);
  }

  /// Hành động ở một provider, danh sách ở một provider khác: cái nào xong thì
  /// cái kia phải nạp lại, và chỉ chỗ này biết đang mở vai nào.
  Future<void> _run(
    BuildContext context,
    WidgetRef ref,
    Future<bool> Function(OrdersActions) action,
    String success,
  ) async {
    final ok = await action(ref.read(ordersActionsProvider.notifier));
    if (ok) {
      ref.invalidate(ordersProvider);
      ref.invalidate(unsettledItemsProvider);
    }
    if (!context.mounted) return;

    // Hỏng thì nói ra: bộ nút cũ báo thành công bất kể server trả gì.
    final message = ok
        ? success
        : ref.read(ordersActionsProvider).errorMessage ??
              'Không thực hiện được';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ok ? const Color(0xFF10B981) : const Color(0xFFEF4444),
      ),
    );
  }
}

/// Vì sao người bán không có nút "cập nhật vận chuyển".
class _CarrierNote extends StatelessWidget {
  const _CarrierNote();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        'Trạng thái vận chuyển do đơn vị giao hàng cập nhật. Nếu bạn thấy sai, '
        'hãy báo để ShopNexus kiểm tra.',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          height: 1.4,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// Chuyện đang xảy ra với đơn này, viết cho người đang đọc.
///
/// Với bên mua ở cửa sổ chờ xác nhận, câu này thay cho cả khối EscrowNotice: nó
/// nói đúng một điều đáng nói — tiền chưa sang tay người bán — và nói được trong
/// một dòng của một danh sách.
String orderStatusLine(OrderView view, {required bool selling}) {
  if (!view.isAwaitingConfirmation) return view.statusLabel;

  final left = view.confirmationRemaining;
  if (selling) {
    return left == null ? 'Cần bạn xác nhận' : 'Cần bạn xác nhận · còn $left';
  }
  final held = MoneyUtils.format(
    view.order.total,
    currency: view.order.currency,
  );
  return 'ShopNexus đang giữ $held · chờ người bán xác nhận';
}

/// Dòng đã trả tiền mà hệ thống chưa gom thành đơn.
///
/// Bên mua còn bỏ được, nên mỗi dòng có nút của nó. Bên bán không có gì phải
/// làm — đây là hàng đợi thử lại của hệ thống, nên nó là một câu thông báo chứ
/// không phải một hộp thư việc.
class _UnsettledBlock extends ConsumerWidget {
  const _UnsettledBlock({required this.lines, required this.me});

  final List<OrderLineView> lines;
  final String? me;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Chia theo dòng, không theo màn: một danh sách gộp hai chiều có thể chứa cả
    // dòng mình mua lẫn dòng mình bán, và hai bên có hai việc khác nhau.
    final selling = [
      for (final line in lines)
        if (line.item.sellerId == me) line,
    ];
    final buying = [
      for (final line in lines)
        if (line.item.sellerId != me) line,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selling.isNotEmpty)
          Container(
            margin: EdgeInsets.only(bottom: buying.isEmpty ? 0 : 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF422006) : const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.hourglass_top,
                  size: 18,
                  color: Color(0xFFD97706),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${selling.length} sản phẩm bạn bán đã được thanh toán và '
                    'đang chờ hệ thống tạo đơn. Bạn không cần làm gì.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      height: 1.4,
                      color: isDark
                          ? const Color(0xFFFDE68A)
                          : const Color(0xFF92400E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (buying.isNotEmpty) ..._buyerLines(context, ref, theme, isDark),
      ],
    );
  }

  /// Dòng mình đã trả tiền mà chưa thành đơn — cái duy nhất còn bỏ được.
  List<Widget> _buyerLines(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
    bool isDark,
  ) {
    final lines = [
      for (final line in this.lines)
        if (line.item.sellerId != me) line,
    ];
    return [
      const _SectionHeader('CHỜ THANH TOÁN'),
      for (final line in lines)
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark
                  ? AppColors.darkPrimary.withAlpha(40)
                  : const Color(0xFFE2E8F0),
            ),
          ),
          // Hai nút xếp xuống dòng riêng, không chen cùng hàng với tên: ở màn
          // hẹp thì tên sản phẩm bị bóp còn vài chữ, mà tên mới là thứ nói
          // đang trả cho cái gì.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  _Thumbnail(url: line.imageUrl),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.displayName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Chờ hoàn tất thanh toán · '
                          '${MoneyUtils.format(line.item.totalAmount, currency: line.item.currency)}',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _confirmCancel(context, ref, line),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFE11D48),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      textStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('Hủy'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      ResumePaymentSheet.show(
                        context,
                        paymentSessionId: line.item.paymentSessionId,
                        title: line.displayName,
                        amount: line.item.totalAmount,
                        currency: line.item.currency,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Thanh toán'),
                  ),
                ],
              ),
            ],
          ),
        ),
    ];
  }

  Future<void> _confirmCancel(
    BuildContext context,
    WidgetRef ref,
    OrderLineView line,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hủy sản phẩm này?'),
        content: const Text(
          'Chỉ sản phẩm chưa thanh toán xong mới hủy được; số lượng sẽ trả lại '
          'kho.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Hủy sản phẩm'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final ok = await ref
        .read(ordersActionsProvider.notifier)
        .cancelItem(line.item.id);
    if (ok) ref.invalidate(unsettledItemsProvider);
    if (!context.mounted) return;

    final message = ok
        ? 'Đã hủy sản phẩm, số lượng được trả lại kho.'
        : ref.read(ordersActionsProvider).errorMessage ??
              'Không hủy được sản phẩm';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ok ? const Color(0xFF10B981) : const Color(0xFFEF4444),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 52,
        height: 52,
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF1F5F9),
        child: url != null && url!.isNotEmpty
            ? Image.network(url!, fit: BoxFit.cover)
            : Icon(
                Icons.image_rounded,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant,
              ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 4, bottom: 10),
    child: Text(
      title,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.6,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    ),
  );
}

class _LoadMoreButton extends StatelessWidget {
  const _LoadMoreButton({
    required this.isLoading,
    required this.error,
    required this.onTap,
  });

  final bool isLoading;
  final String? error;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Không tải được thêm đơn. Thử lại?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: theme.colorScheme.error,
              ),
            ),
          ),
        TextButton(
          onPressed: isLoading ? null : onTap,
          child: Text(isLoading ? 'Đang tải…' : 'Xem thêm'),
        ),
      ],
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 96),
        Icon(
          Icons.receipt_long_outlined,
          size: 48,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(height: 14),
        Text(
          'Chưa có đơn nào',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _Retry extends StatelessWidget {
  const _Retry({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 72),
        Icon(
          Icons.error_outline_rounded,
          size: 44,
          color: theme.colorScheme.error,
        ),
        const SizedBox(height: 12),
        Text(
          'Không tải được đơn hàng',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '$error',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: onRetry,
            child: const Text('Thử lại'),
          ),
        ),
      ],
    );
  }
}

class _OrdersShimmer extends StatelessWidget {
  const _OrdersShimmer();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDark ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          height: 76,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
