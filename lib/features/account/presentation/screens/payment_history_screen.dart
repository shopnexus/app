import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/option_category_name.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:shopnexus_flutter_app/core/providers/option_names_provider.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Mọi lần tiền đi qua tài khoản này — cả hai chiều.
///
/// Server trả *một* danh sách cho cả hai vai (`buyer-checkout`, `seller-payout`,
/// `withdrawal`), nên đây cũng là một màn: chia theo vai sẽ bắt người dùng đoán
/// trước mình đang hỏi ở vai nào, mà câu hỏi thật thì không có vai — "cái
/// 64.000đ này là gì".
///
/// Hoàn tiền **không** là một phiên riêng: nó là một chặng đảo (`reverses_id`)
/// nằm trong phiên đã trả. Nên phải mở phiên ra mới thấy — và đó cũng là thứ giải
/// thích một đơn "chờ thanh toán" mà đã trả một lần: lần bị từ chối vẫn nằm đó.
class PaymentHistoryScreen extends ConsumerStatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  ConsumerState<PaymentHistoryScreen> createState() =>
      _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends ConsumerState<PaymentHistoryScreen> {
  late Future<List<PaymentSession>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(sellerRepositoryProvider).paymentSessions(limit: 50);
  }

  Future<void> _reload() async {
    final next = ref.read(sellerRepositoryProvider).paymentSessions(limit: 50);
    setState(() => _future = next);
    await next;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Lịch sử thanh toán')),
      body: RefreshIndicator(
        onRefresh: _reload,
        child: FutureBuilder<List<PaymentSession>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return _Centered(
                icon: Icons.wifi_off_rounded,
                title: 'Không tải được lịch sử',
                action: TextButton(
                  onPressed: _reload,
                  child: const Text('Thử lại'),
                ),
              );
            }

            final sessions = snapshot.data ?? const <PaymentSession>[];
            if (sessions.isEmpty) {
              return const _Centered(
                icon: Icons.receipt_long_outlined,
                title: 'Chưa có giao dịch nào',
                note:
                    'Mỗi lần bạn thanh toán hoặc nhận tiền, nó sẽ hiện ở đây.',
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: sessions.length,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: theme.colorScheme.outlineVariant),
              itemBuilder: (context, index) =>
                  _SessionRow(session: sessions[index]),
            );
          },
        ),
      ),
    );
  }
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({required this.session});

  final PaymentSession session;

  static const _kindLabels = {
    PaymentSessionKind.buyerCheckout: 'Thanh toán đơn hàng',
    PaymentSessionKind.sellerPayout: 'Tiền bán hàng',
    PaymentSessionKind.withdrawal: 'Rút về ngân hàng',
  };

  /// Chiều của tiền quyết định dấu: mua và rút là tiền đi, bán là tiền về.
  static bool _outgoing(PaymentSessionKind kind) =>
      kind == PaymentSessionKind.buyerCheckout ||
      kind == PaymentSessionKind.withdrawal;

  static const _statusLabels = {
    PaymentSessionStatus.pending: 'Chờ thanh toán',
    PaymentSessionStatus.processing: 'Đang xử lý',
    PaymentSessionStatus.success: 'Xong',
    PaymentSessionStatus.cancelled: 'Đã hủy',
    PaymentSessionStatus.failed: 'Thất bại',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final outgoing = _outgoing(session.kind);
    final unfinished =
        session.status == PaymentSessionStatus.pending ||
        session.status == PaymentSessionStatus.processing;
    // Một phiên chưa xong mà đã qua hạn thì sẽ không bao giờ xong: một job dọn nó.
    // Nói ra, vì "Đang xử lý" trên một phiên chết là câu làm người ta chờ mãi.
    final lapsed = unfinished && session.expiredAt.isBefore(DateTime.now());

    return ExpansionTile(
      leading: Icon(
        outgoing ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
        color: outgoing ? theme.colorScheme.error : const Color(0xFF10B981),
      ),
      title: Text(
        '${outgoing ? '−' : '+'}'
        '${MoneyUtils.format(session.totalAmount, currency: session.currency)}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_kindLabels[session.kind] ?? session.kind.value),
          Text(
            lapsed
                ? 'Đã quá hạn thanh toán'
                : '${_statusLabels[session.status] ?? session.status.value}'
                      ' · ${_date(session.createdAt)}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: lapsed ? FontWeight.w600 : FontWeight.normal,
              color: lapsed
                  ? theme.colorScheme.error
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (session.note.isNotEmpty)
            Text(
              session.note,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
      // Các chặng chỉ nạp khi người dùng mở ra: một trang 50 phiên mà nạp sẵn
      // chặng là 50 request cho thứ hầu như không ai bấm vào.
      children: [_Legs(sessionId: session.id, currency: session.currency)],
    );
  }

  static String _date(DateTime at) {
    final local = at.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '${local.day}/${local.month} $hour:$minute';
  }
}

class _Legs extends ConsumerStatefulWidget {
  const _Legs({required this.sessionId, required this.currency});

  final String sessionId;
  final String currency;

  @override
  ConsumerState<_Legs> createState() => _LegsState();
}

class _LegsState extends ConsumerState<_Legs> {
  late final Future<List<Transaction>> _future = ref
      .read(sellerRepositoryProvider)
      .paymentTransactions(widget.sessionId);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<List<Transaction>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Không tải được các chặng'),
          );
        }

        final legs = snapshot.data ?? const <Transaction>[];
        if (legs.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              // Có thật: một phiên vừa mở, chưa ai chọn cách trả.
              'Chưa có lần trả nào cho phiên này.',
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final leg in legs)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref
                                  .watch(
                                    optionNamesProvider(
                                      OptionCategoryName.payment,
                                    ),
                                  )
                                  .nameOf(leg.paymentOption),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              // `reverses_id` là dấu của một chặng đảo: nói ra,
                              // vì nếu không thì hai dòng cùng số tiền trông
                              // như bị tính hai lần.
                              leg.reversesId != null
                                  ? 'Đảo lại một chặng trước'
                                  : leg.status.value,
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (leg.error.isNotEmpty)
                              Text(
                                leg.error,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.error,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Text(
                        MoneyUtils.format(
                          leg.amount,
                          currency: widget.currency,
                        ),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
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

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 32, right: 32),
          child: Column(
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
      ],
    );
  }
}
