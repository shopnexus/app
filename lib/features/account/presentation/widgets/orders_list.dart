import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_actions_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/confirm_receipt_sheet.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';

/// Đơn của một vai, hai nhóm, không tab.
///
/// Chín cái tab trước đây lọc trung bình năm dòng dữ liệu — bộ máy lọc lớn hơn
/// thứ nó lọc. Cái người dùng thật sự hỏi chỉ có hai: "còn gì phải trông" và
/// "cái xong rồi đâu", và cả hai nằm trong một lượt đọc.
class OrdersList extends ConsumerStatefulWidget {
  const OrdersList({super.key, required this.role});

  final OrderRole role;

  @override
  ConsumerState<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends ConsumerState<OrdersList> {
  /// Bao nhiêu dòng "đã xong" đang hiện. Không gập nhóm này lại: một nút gập là
  /// thêm một thứ phải học, còn cuộn thì miễn phí — nên chỉ cắt bớt phần đuôi.
  int _finishedShown = _pageSize;

  static const _pageSize = 10;

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(ordersProvider(widget.role));
    final unsettled = ref.watch(unsettledItemsProvider(widget.role));

    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primary,
      onRefresh: () async {
        setState(() => _finishedShown = _pageSize);
        ref.invalidate(ordersProvider(widget.role));
        ref.invalidate(unsettledItemsProvider(widget.role));
      },
      child: switch (feed) {
        AsyncError(:final error) => _Retry(
          error: error,
          onRetry: () => ref.invalidate(ordersProvider(widget.role)),
        ),
        // `unsettled` không được chặn danh sách: nó là một endpoint khác, và một
        // dòng chờ gom hỏng không đáng để giấu hết đơn hàng.
        AsyncValue(:final value?) => _body(value, unsettled.value ?? const []),
        _ => const _OrdersShimmer(),
      },
    );
  }

  Widget _body(OrdersFeed feed, List<OrderLineView> unsettled) {
    final ongoing = feed.ongoing;
    final finished = feed.finished;

    if (ongoing.isEmpty && finished.isEmpty && unsettled.isEmpty) {
      return const _Empty();
    }

    final shown = finished.take(_finishedShown).toList();
    // Một nút, một nghĩa: "cho tôi xem thêm đơn đã xong". Còn dòng đã nạp thì
    // hiện thêm, hết rồi thì mới đi xin trang sau — người dùng không cần biết
    // ranh giới đó ở đâu.
    final hasMore = finished.length > shown.length || feed.hasMore;

    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        if (unsettled.isNotEmpty) ...[
          _UnsettledBlock(role: widget.role, lines: unsettled),
          const SizedBox(height: 20),
        ],
        if (ongoing.isNotEmpty) ...[
          const _SectionHeader('ĐANG DIỄN RA'),
          // Một lần cho cả nhóm, không một lần mỗi dòng: câu này giải thích vì
          // sao người bán không tự sửa được vị trí kiện hàng, và nó không đổi
          // theo từng đơn.
          if (widget.role == OrderRole.seller) const _CarrierNote(),
          for (final view in ongoing)
            _OrderRow(view: view, role: widget.role, isFinished: false),
          const SizedBox(height: 20),
        ],
        if (finished.isNotEmpty) ...[
          const _SectionHeader('ĐÃ XONG'),
          for (final view in shown)
            _OrderRow(view: view, role: widget.role, isFinished: true),
          if (hasMore)
            _LoadMoreButton(
              isLoading: feed.isLoadingMore,
              error: feed.loadMoreError,
              onTap: () {
                if (finished.length > _finishedShown) {
                  setState(() => _finishedShown += _pageSize);
                } else {
                  ref.read(ordersProvider(widget.role).notifier).loadMore();
                }
              },
            ),
        ],
      ],
    );
  }
}

/// Một đơn, một dòng: ảnh, tên, chuyện đang xảy ra, số tiền.
///
/// Chuyện đang xảy ra được viết theo vai đang xem. Cùng một đơn chờ xác nhận,
/// bên bán đọc "cần bạn xác nhận" còn bên mua đọc ai đang giữ tiền của mình —
/// một cái nhãn trung tính cho cả hai thì không nói được cả hai điều đó.
class _OrderRow extends ConsumerWidget {
  const _OrderRow({
    required this.view,
    required this.role,
    required this.isFinished,
  });

  final OrderView view;
  final OrderRole role;
  final bool isFinished;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final order = view.order;
    final first = view.lines.isEmpty ? null : view.lines.first;

    // Tiền của mỗi bên là số khác nhau: người mua trả cả phí giao, người bán
    // không bao giờ nhận phí đó — nó là tiền của đơn vị vận chuyển.
    final amount = role == OrderRole.seller ? view.goodsTotal : order.total;
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
          onTap: () => context.push('/account/order-detail/${order.id}'),
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
                            orderStatusLine(view, role),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              height: 1.4,
                              fontWeight: view.isAwaitingConfirmation
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: view.isAwaitingConfirmation
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

  /// Chỉ những gì vai này thật sự làm được với đơn này, tối đa hai nút.
  ///
  /// Người mua có đúng **một** nút, và chỉ khi kiện hàng đã tới: xác nhận đã nhận.
  /// Mọi việc khác của họ — xin hoàn tiền, báo sự cố — sống trong màn chi tiết,
  /// nơi có đủ thông tin để viết một yêu cầu. Cái này ra ngoài vì nó không phải
  /// việc của người mua: `received_at` là điều kiện trong câu truy vấn payout, nên
  /// tới khi họ chạm thì **tiền của người bán vẫn nằm trong escrow**. Chôn nó sau
  /// một menu là để một khoản tiền chờ một người không biết mình đang giữ nó.
  List<Widget> _actions(BuildContext context, WidgetRef ref) {
    if (isFinished) return const [];

    final isActing = ref.watch(ordersActionsProvider).isLoading;
    final order = view.order;

    if (role == OrderRole.buyer) {
      if (!view.canConfirmReceipt) return const [];
      return [
        Expanded(
          child: ElevatedButton(
            onPressed: isActing ? null : () => _confirmReceipt(context, ref),
            child: const Text('Đã nhận hàng'),
          ),
        ),
      ];
    }

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

    // Hủy bị từ chối khi kiện hàng đã rời `pending`, nên nút chỉ hiện khi nó còn
    // là một việc làm được.
    final canCancel =
        (order.transport?.status ?? TransportStatus.pending) ==
        TransportStatus.pending;

    return [
      Expanded(
        child: OutlinedButton(
          onPressed: () => _reportIssue(context),
          child: const Text('Báo vấn đề'),
        ),
      ),
      if (canCancel) ...[
        const SizedBox(width: 8),
        Expanded(
          child: TextButton(
            onPressed: isActing ? null : () => _cancel(context, ref),
            child: const Text(
              'Hủy đơn',
              style: TextStyle(color: Color(0xFFEF4444)),
            ),
          ),
        ),
      ],
    ];
  }

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
        content: Column(
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

  /// Nơi một người bán nói "chỗ này sai". Vị trí kiện hàng là báo cáo của đơn vị
  /// giao hàng và chỉ ShopNexus sửa được, nên đường của người bán là mở một yêu
  /// cầu `order-issue` để có người xem, chứ không phải tự ghi lại trạng thái.
  /// Ảnh là bắt buộc nên đây là một sheet, không phải hộp thoại — và nó nói ra
  /// hai điều không hoàn tác được trước khi người mua chạm.
  Future<void> _confirmReceipt(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmReceiptSheet.show(
      context,
      orderId: view.order.id,
    );
    if (confirmed != true) return;
    // Sheet đã báo lỗi của chính nó, nên ở đây chỉ còn việc nạp lại — cùng hai
    // provider mà `_run` nạp, vì dòng vừa đổi trạng thái.
    ref.invalidate(ordersProvider(role));
    ref.invalidate(unsettledItemsProvider(role));
  }

  Future<void> _reportIssue(BuildContext context) async {
    final orderId = view.order.id;
    final ticket = await RaiseTicketSheet.show(
      context,
      kind: TicketKind.orderIssue,
      refId: orderId,
      subjectHint: 'Sự cố vận chuyển đơn $orderId',
      refLabel: orderId,
    );
    if (ticket == null || !context.mounted) return;
    context.push('/account/help-center/${ticket.id}');
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
      ref.invalidate(ordersProvider(role));
      ref.invalidate(unsettledItemsProvider(role));
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
String orderStatusLine(OrderView view, OrderRole role) {
  if (!view.isAwaitingConfirmation) return view.statusLabel;

  final left = view.confirmationRemaining;
  if (role == OrderRole.seller) {
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
  const _UnsettledBlock({required this.role, required this.lines});

  final OrderRole role;
  final List<OrderLineView> lines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (role == OrderRole.seller) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF422006) : const Color(0xFFFEF3C7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.hourglass_top, size: 18, color: Color(0xFFD97706)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${lines.length} sản phẩm đã thanh toán đang chờ hệ thống tạo '
                'đơn. Bạn không cần làm gì.',
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
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            child: Row(
              children: [
                _Thumbnail(url: line.imageUrl),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        line.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
                TextButton(
                  onPressed: () => _confirmCancel(context, ref, line),
                  child: const Text(
                    'Hủy',
                    style: TextStyle(color: Color(0xFFE11D48)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
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
    if (ok) ref.invalidate(unsettledItemsProvider(role));
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
