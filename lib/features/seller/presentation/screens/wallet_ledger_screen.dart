import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_kind.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Sổ ví đầy đủ của một loại tiền, lọc được theo loại giao dịch.
///
/// Màn Thu nhập chỉ đọc 20 dòng đầu và không lọc được, nên "khoản phí hôm nọ là
/// bao nhiêu" không trả lời được ở đó. Mỗi dòng hiện cả hai chiều: `available` là
/// tiền tiêu được, `held` là escrow chưa tới hạn, và một lần giải ngân đổi cả hai.
class WalletLedgerScreen extends ConsumerStatefulWidget {
  const WalletLedgerScreen({super.key, required this.currency});

  final String currency;

  @override
  ConsumerState<WalletLedgerScreen> createState() => _WalletLedgerScreenState();
}

class _WalletLedgerScreenState extends ConsumerState<WalletLedgerScreen> {
  late Future<WalletLedgerPage> _future;
  WalletTransactionKind? _kind;

  @override
  void initState() {
    super.initState();
    _future = _read();
  }

  Future<WalletLedgerPage> _read() => ref
      .read(sellerRepositoryProvider)
      .ledgerPage(widget.currency, kind: _kind);

  void _reload() {
    setState(() {
      _future = _read();
    });
  }

  void _select(WalletTransactionKind? kind) {
    if (_kind == kind) return;
    _kind = kind;
    _reload();
  }

  /// Tám giá trị `kind` của hợp đồng — cùng bộ nhãn màn Thu nhập dùng.
  static const _kindLabels = {
    WalletTransactionKind.topup: 'Nạp tiền',
    WalletTransactionKind.escrowHold: 'Tạm giữ',
    WalletTransactionKind.escrowRelease: 'Giải ngân',
    WalletTransactionKind.payout: 'Doanh thu đơn hàng',
    WalletTransactionKind.refund: 'Hoàn tiền',
    WalletTransactionKind.withdrawal: 'Rút tiền',
    WalletTransactionKind.fee: 'Phí',
    WalletTransactionKind.adjustment: 'Điều chỉnh',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sổ quỹ')),
      body: Column(
        children: [
          _filters(),
          const Divider(height: 1),
          Expanded(
            child: FutureBuilder<WalletLedgerPage>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return _message(
                    ErrorHandler.getErrorMessage(snapshot.error),
                    retry: true,
                  );
                }

                final page = snapshot.data;
                final entries = page?.entries ?? const <WalletTransaction>[];
                if (entries.isEmpty) {
                  // Ví chỉ được mở khi có khoản đầu tiên, nên rỗng là chuyện
                  // bình thường chứ không phải một lần đọc hỏng.
                  return _message(
                    _kind == null
                        ? 'Chưa có giao dịch nào'
                        : 'Không có giao dịch nào thuộc loại này',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => _reload(),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount:
                        entries.length + ((page?.truncated ?? false) ? 1 : 0),
                    separatorBuilder: (_, _) => Divider(
                      height: 1,
                      indent: 16,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    itemBuilder: (context, index) => index < entries.length
                        ? _row(entries[index])
                        : _truncationNote(page!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filters() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Row(
      children: [
        ChoiceChip(
          label: const Text('Tất cả'),
          selected: _kind == null,
          onSelected: (_) => _select(null),
        ),
        for (final kind in WalletTransactionKind.values)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ChoiceChip(
              label: Text(_kindLabels[kind] ?? kind.value),
              selected: _kind == kind,
              onSelected: (_) => _select(kind),
            ),
          ),
      ],
    ),
  );

  Widget _message(String text, {bool retry = false}) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (retry) ...[
              const SizedBox(height: 12),
              TextButton(onPressed: _reload, child: const Text('Thử lại')),
            ],
          ],
        ),
      ),
    );
  }

  /// Route trả tối đa 100 dòng và không có tham số nào nhảy trang được, nên một
  /// sổ dài hơn thế bị cắt — nói ra còn hơn để người bán tưởng đã xem hết.
  Widget _truncationNote(WalletLedgerPage page) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        'Đang hiện ${page.entries.length} giao dịch gần nhất '
        'trong tổng số ${page.totalCount}.',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _row(WalletTransaction entry) {
    final theme = Theme.of(context);
    final isCredit = entry.availableDelta >= 0;

    return ListTile(
      title: Text(
        _kindLabels[entry.kind] ?? entry.kind.value,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (entry.note.isNotEmpty)
            Text(
              entry.note,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          Text(
            _dateTime(entry.createdAt),
            style: TextStyle(
              fontSize: 11,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          // Chỉ hiện khi khoản này động vào escrow: phần lớn dòng không, và một
          // con số 0 lặp ở mọi dòng che mất những dòng thật sự đổi.
          if (entry.heldDelta != 0)
            Text(
              'Tạm giữ ${entry.heldDelta > 0 ? '+' : '-'}'
              '${MoneyUtils.format(entry.heldDelta.abs(), currency: entry.currency)}'
              ' · còn ${MoneyUtils.format(entry.heldAfter, currency: entry.currency)}',
              style: TextStyle(
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${isCredit ? '+' : '-'}'
            '${MoneyUtils.format(entry.availableDelta.abs(), currency: entry.currency)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isCredit
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
            ),
          ),
          Text(
            'Còn: ${MoneyUtils.format(entry.availableAfter, currency: entry.currency)}',
            style: TextStyle(
              fontSize: 10,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  static String _dateTime(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year} '
        '${two(local.hour)}:${two(local.minute)}';
  }
}
