import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal_outcome.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_earnings_provider.dart';

/// The seller's money: the wallet balance, its ledger, the linked bank accounts
/// and the withdrawals paid out to them. Cards and e-wallets are gone — a payout
/// goes to a bank account and there is no other payout method in the contract.
class SellerEarningsScreen extends ConsumerStatefulWidget {
  const SellerEarningsScreen({super.key});

  @override
  ConsumerState<SellerEarningsScreen> createState() =>
      _SellerEarningsScreenState();
}

class _SellerEarningsScreenState extends ConsumerState<SellerEarningsScreen> {
  final TextEditingController _withdrawAmountController =
      TextEditingController();

  @override
  void dispose() {
    _withdrawAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final async = ref.watch(sellerEarningsProvider);

    return DefaultTabController(
      length: 2,
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
            'Thu nhập',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: theme.colorScheme.primary,
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            tabs: const [
              Tab(text: 'Tài khoản nhận tiền'),
              Tab(text: 'Số dư & rút tiền'),
            ],
          ),
        ),
        body: async.when(
          loading: () => _buildShimmer(context),
          error: (error, _) => _buildError(context, error.toString()),
          data: (state) => TabBarView(
            children: [
              _buildBankAccountsTab(context, state, isDark),
              _buildBalanceTab(context, state, isDark),
            ],
          ),
        ),
      ),
    );
  }

  // --- Tab 1: payout accounts ---

  Widget _buildBankAccountsTab(
    BuildContext context,
    SellerEarningsState state,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final notifier = ref.read(sellerEarningsProvider.notifier);

    return RefreshIndicator(
      onRefresh: notifier.refresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Tiền rút sẽ được chuyển về tài khoản mặc định',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          if (state.bankAccounts.isEmpty)
            _buildCard(
              context,
              isDark,
              child: Text(
                'Chưa liên kết tài khoản ngân hàng nào. Bạn cần thêm một tài khoản '
                'trước khi có thể rút tiền.',
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            for (final account in state.bankAccounts)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildBankAccountCard(context, account, isDark),
              ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showAddBankAccountSheet(context),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Thêm tài khoản ngân hàng'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
                side: BorderSide(color: theme.colorScheme.primary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Cùng tab với tài khoản nhận tiền vì cùng một câu hỏi: tiền ra khỏi
          // sàn dưới tên ai, và vào số tài khoản nào.
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.receipt_outlined),
            title: const Text('Thông tin thuế'),
            subtitle: const Text('Mã số thuế dùng khi sàn chi trả doanh thu'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/account/tax-info'),
          ),
        ],
      ),
    );
  }

  Widget _buildBankAccountCard(
    BuildContext context,
    BankAccount account,
    bool isDark,
  ) {
    final theme = Theme.of(context);

    return _buildCard(
      context,
      isDark,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(40),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_rounded,
              color: theme.colorScheme.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      account.bankCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    if (account.isDefault) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withAlpha(40),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Mặc định',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  account.accountHolder,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                // The server only ever sends the masked number back.
                Text(
                  account.accountNumberMasked,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // Chỉ hiện trên tài khoản chưa phải mặc định: một ngôi sao đã sáng mà
          // bấm được nữa là mời người ta bấm để không có gì xảy ra.
          if (!account.isDefault)
            IconButton(
              tooltip: 'Đặt làm mặc định',
              icon: Icon(
                Icons.star_outline_rounded,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              onPressed: () => ref
                  .read(sellerEarningsProvider.notifier)
                  .setDefaultBankAccount(account.id),
            ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              size: 20,
              color: Color(0xFFEF4444),
            ),
            onPressed: () => _confirmDeleteBankAccount(context, account),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddBankAccountSheet(BuildContext context) async {
    final theme = Theme.of(context);
    final bankCode = TextEditingController();
    final accountNumber = TextEditingController();
    final accountHolder = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final request = await showModalBottomSheet<CreateBankAccountRequest>(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 24,
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thêm tài khoản ngân hàng',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildField(bankCode, 'Mã ngân hàng (ví dụ: VCB)'),
              const SizedBox(height: 12),
              _buildField(accountNumber, 'Số tài khoản'),
              const SizedBox(height: 12),
              _buildField(accountHolder, 'Tên chủ tài khoản'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() != true) return;
                    Navigator.pop(
                      sheetContext,
                      CreateBankAccountRequest(
                        bankCode: bankCode.text.trim(),
                        accountNumber: accountNumber.text.trim(),
                        accountHolder: accountHolder.text.trim(),
                        // The first one linked is where a payout goes.
                        isDefault: true,
                      ),
                    );
                  },
                  child: const Text('Lưu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    bankCode.dispose();
    accountNumber.dispose();
    accountHolder.dispose();
    if (request == null) return;

    final ok = await ref
        .read(sellerEarningsProvider.notifier)
        .addBankAccount(request);
    if (!context.mounted) return;
    _report(context, ok, 'Đã thêm tài khoản ngân hàng');
  }

  Widget _buildField(TextEditingController controller, String label) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            (value == null || value.trim().isEmpty) ? 'Bắt buộc' : null,
      );

  Future<void> _confirmDeleteBankAccount(
    BuildContext context,
    BankAccount account,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xóa tài khoản ngân hàng?'),
        content: Text(
          '${account.bankCode} • ${account.accountNumberMasked} sẽ không còn '
          'được dùng để nhận tiền.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref
        .read(sellerEarningsProvider.notifier)
        .deleteBankAccount(account.id);
  }

  // --- Tab 2: balance, ledger and withdrawals ---

  Widget _buildBalanceTab(
    BuildContext context,
    SellerEarningsState state,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final notifier = ref.read(sellerEarningsProvider.notifier);

    return RefreshIndicator(
      onRefresh: notifier.refresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            isDark,
            child: Column(
              children: [
                Text(
                  'Số dư khả dụng',
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  MoneyUtils.format(
                    state.availableBalance,
                    currency: state.currency,
                  ),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                    fontSize: 32,
                  ),
                ),
                if (state.heldBalance > 0) ...[
                  const SizedBox(height: 6),
                  // Escrow the buyer paid but the payout window has not released.
                  Text(
                    'Đang tạm giữ: ${MoneyUtils.format(state.heldBalance, currency: state.currency)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: state.availableBalance <= 0
                        ? null
                        : () => _showWithdrawSheet(context, state),
                    icon: const Icon(Icons.account_balance_wallet, size: 20),
                    label: const Text('Rút tiền'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Ở đây chứ không ở một dòng menu riêng: "cái 64.000đ này là gì" là câu
          // hỏi người ta đặt khi đang nhìn số dư, và lịch sử trả lời cả hai chiều
          // tiền — cả lần mình mua, không chỉ lần mình bán.
          OutlinedButton.icon(
            onPressed: () => context.push('/account/payments'),
            icon: const Icon(Icons.receipt_long_outlined, size: 18),
            label: const Text('Lịch sử thanh toán'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 24),
          if (state.withdrawals.isNotEmpty) ...[
            _buildSectionTitle(context, 'Lệnh rút tiền'),
            const SizedBox(height: 10),
            for (final withdrawal in state.withdrawals)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildWithdrawalRow(context, withdrawal, isDark),
              ),
            const SizedBox(height: 24),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionTitle(context, 'Sổ quỹ'),
              // Danh sách dưới đây là trang đầu và không có cursor, nên nó dừng
              // ở giao dịch thứ hai mươi; đây là đường đọc hết sổ.
              TextButton(
                onPressed: () => context.push(
                  '/account/wallet-ledger?currency=${state.currency}',
                ),
                child: const Text('Xem tất cả'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTotalsBar(context, state, isDark),
          const SizedBox(height: 12),
          if (state.ledger.isEmpty)
            _buildCard(
              context,
              isDark,
              child: Text(
                'Chưa có giao dịch nào',
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            for (final entry in state.ledger)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildLedgerRow(context, entry, isDark),
              ),
        ],
      ),
    );
  }

  Widget _buildTotalsBar(
    BuildContext context,
    SellerEarningsState state,
    bool isDark,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF2F4F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tiền vào',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '+${MoneyUtils.format(state.totalIn, currency: state.currency)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Tiền ra',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '-${MoneyUtils.format(state.totalOut, currency: state.currency)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// The ledger's own vocabulary — the eight `kind` values the contract sends.
  /// The old screen only knew `credit`/`withdrawal`, neither of which is one.
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

  Widget _buildLedgerRow(
    BuildContext context,
    WalletTransaction entry,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final isCredit = entry.availableDelta >= 0;

    return _buildCard(
      context,
      isDark,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _kindLabels[entry.kind] ?? entry.kind.value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                if (entry.note.isNotEmpty)
                  Text(
                    entry.note,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
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
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isCredit ? '+' : '-'}${MoneyUtils.format(entry.availableDelta.abs(), currency: entry.currency)}',
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
        ],
      ),
    );
  }

  static const _outcomeLabels = {
    WithdrawalOutcome.awaitingReview: 'Chờ duyệt',
    WithdrawalOutcome.approved: 'Đã duyệt',
    WithdrawalOutcome.rejected: 'Bị từ chối',
    WithdrawalOutcome.cancelled: 'Đã hủy',
  };

  Widget _buildWithdrawalRow(
    BuildContext context,
    Withdrawal withdrawal,
    bool isDark,
  ) {
    final theme = Theme.of(context);

    return _buildCard(
      context,
      isDark,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${withdrawal.bankAccount.bankCode} • ${withdrawal.bankAccount.accountNumberMasked}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  '${_outcomeLabels[withdrawal.outcome] ?? withdrawal.outcome.value} · ${_dateTime(withdrawal.createdAt)}',
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (withdrawal.resolutionNote != null)
                  Text(
                    withdrawal.resolutionNote!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFEF4444),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                MoneyUtils.format(
                  withdrawal.amount,
                  currency: withdrawal.currency,
                ),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              // Chỉ khi chưa ai duyệt: sau đó tiền đã đi (hoặc đã quay về) và
              // không còn gì để huỷ.
              if (withdrawal.outcome == WithdrawalOutcome.awaitingReview)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(0, 32),
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () =>
                      _confirmCancelWithdrawal(context, withdrawal),
                  child: const Text(
                    'Huỷ lệnh',
                    style: TextStyle(fontSize: 12, color: Color(0xFFEF4444)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// Huỷ trả tiền về ví ngay, nên hộp thoại nói ra điều đó — người bán đang nhìn
  /// một số dư thiếu đúng số tiền này và cần biết nó quay lại.
  Future<void> _confirmCancelWithdrawal(
    BuildContext context,
    Withdrawal withdrawal,
  ) async {
    final amount = MoneyUtils.format(
      withdrawal.amount,
      currency: withdrawal.currency,
    );
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Huỷ lệnh rút?'),
        content: Text('$amount sẽ quay lại số dư khả dụng của bạn ngay.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Huỷ lệnh'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final ok = await ref
        .read(sellerEarningsProvider.notifier)
        .cancelWithdrawal(withdrawal.id);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok
              ? 'Đã huỷ lệnh rút, $amount đã về ví'
              : 'Không huỷ được — lệnh này vừa được xử lý',
        ),
      ),
    );
  }

  Future<void> _showWithdrawSheet(
    BuildContext context,
    SellerEarningsState state,
  ) async {
    final theme = Theme.of(context);
    final account = state.payoutAccount;
    if (account == null) {
      // A withdrawal names its bank account, so there is nothing to ask for yet.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Hãy thêm tài khoản ngân hàng ở tab "Tài khoản nhận tiền" trước',
          ),
        ),
      );
      return;
    }

    _withdrawAmountController.text = state.availableBalance.toString();

    final amount = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 24,
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rút tiền về ngân hàng',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${account.bankCode} • ${account.accountNumberMasked}\n'
              'Chủ tài khoản: ${account.accountHolder}',
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Số dư khả dụng: ${MoneyUtils.format(state.availableBalance, currency: state.currency)}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _withdrawAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Số tiền muốn rút (${state.currency})',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(
                  sheetContext,
                  int.tryParse(_withdrawAmountController.text.trim()) ?? 0,
                ),
                child: const Text('Xác nhận rút tiền'),
              ),
            ),
          ],
        ),
      ),
    );
    if (amount == null) return;

    final ok = await ref.read(sellerEarningsProvider.notifier).withdraw(amount);
    if (!context.mounted) return;
    _report(context, ok, 'Đã gửi yêu cầu rút tiền, chờ quản trị viên duyệt');
  }

  // --- Shared bits ---

  void _report(BuildContext context, bool ok, String success) {
    final message = ok
        ? success
        : ref.read(sellerEarningsProvider).value?.errorMessage ??
              'Không thực hiện được';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ok ? const Color(0xFF10B981) : const Color(0xFFEF4444),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) => Text(
    title,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );

  Widget _buildCard(
    BuildContext context,
    bool isDark, {
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppColors.darkPrimary.withAlpha(40)
              : const Color(0xFFF1F5F9),
        ),
      ),
      child: child,
    );
  }

  static String _dateTime(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year} '
        '${two(local.hour)}:${two(local.minute)}';
  }

  Widget _buildError(BuildContext context, String message) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 48,
            color: Color(0xFFEF4444),
          ),
          const SizedBox(height: 12),
          const Text(
            'Không thể tải thông tin thu nhập',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => ref.invalidate(sellerEarningsProvider),
            icon: const Icon(Icons.refresh),
            label: const Text('Tải lại'),
          ),
        ],
      ),
    ),
  );

  Widget _buildShimmer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[800]! : const Color(0xFFE2E8F0);
    final highlightColor = isDark ? Colors.grey[700]! : const Color(0xFFF1F5F9);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (final height in [180.0, 70.0, 240.0]) ...[
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
