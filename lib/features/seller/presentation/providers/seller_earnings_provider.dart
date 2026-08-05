import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

part 'seller_earnings_provider.freezed.dart';

part 'seller_earnings_provider.g.dart';

@freezed
abstract class SellerEarningsState with _$SellerEarningsState {
  const SellerEarningsState._();

  const factory SellerEarningsState({
    /// Null until the platform has credited this account once — a wallet row is
    /// created by the first movement, not by signing up.
    Wallet? wallet,
    @Default([]) List<WalletTransaction> ledger,
    @Default([]) List<Withdrawal> withdrawals,
    @Default([]) List<BankAccount> bankAccounts,
    @Default(false) bool isWithdrawing,
    String? errorMessage,
  }) = _SellerEarningsState;

  int get availableBalance => wallet?.availableBalance ?? 0;

  /// Escrow the buyer has paid but the payout window has not released. It is not
  /// spendable, which is why it is shown apart from the balance.
  int get heldBalance => wallet?.heldBalance ?? 0;

  /// VND is the platform's only currency, so an account with no wallet row yet
  /// still formats as VND.
  String get currency => wallet?.currency ?? 'VND';

  /// Where a withdrawal pays out. The server picks nothing, so without one the
  /// screen has to ask for a bank account before it can offer to withdraw.
  BankAccount? get payoutAccount {
    for (final account in bankAccounts) {
      if (account.isDefault) return account;
    }
    return bankAccounts.isEmpty ? null : bankAccounts.first;
  }

  int get totalIn => _sum((delta) => delta > 0);

  int get totalOut => -_sum((delta) => delta < 0);

  int _sum(bool Function(int) keep) => ledger.fold(
    0,
    (total, entry) =>
        keep(entry.availableDelta) ? total + entry.availableDelta : total,
  );
}

@riverpod
class SellerEarningsNotifier extends _$SellerEarningsNotifier {
  @override
  Future<SellerEarningsState> build() async {
    final repository = ref.watch(sellerRepositoryProvider);
    final (wallets, withdrawals, bankAccounts) = await (
      repository.wallets(),
      repository.withdrawals(),
      repository.bankAccounts(),
    ).wait;

    // The ledger is per currency, so there is nothing to read until a wallet says
    // which one this account holds.
    final wallet = wallets.isEmpty ? null : wallets.first;
    return SellerEarningsState(
      wallet: wallet,
      ledger: wallet == null
          ? const []
          : await repository.ledger(wallet.currency),
      withdrawals: withdrawals,
      bankAccounts: bankAccounts,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  /// Answers false with [SellerEarningsState.errorMessage] set — the amount may
  /// exceed the balance, and there may be no bank account to pay out to.
  Future<bool> withdraw(int amount) async {
    final current = state.value;
    if (current == null) return false;

    final account = current.payoutAccount;
    if (account == null) {
      state = AsyncData(
        current.copyWith(errorMessage: 'Chưa liên kết tài khoản ngân hàng'),
      );
      return false;
    }
    if (amount <= 0 || amount > current.availableBalance) {
      state = AsyncData(
        current.copyWith(errorMessage: 'Số tiền rút không hợp lệ'),
      );
      return false;
    }

    state = AsyncData(
      current.copyWith(isWithdrawing: true, errorMessage: null),
    );
    try {
      await ref
          .read(sellerRepositoryProvider)
          .requestWithdrawal(
            amount: amount,
            currency: current.currency,
            bankAccountId: account.id,
          );
      await refresh();
      return true;
    } catch (error) {
      state = AsyncData(
        current.copyWith(isWithdrawing: false, errorMessage: error.toString()),
      );
      return false;
    }
  }

  Future<bool> addBankAccount(CreateBankAccountRequest request) async {
    try {
      await ref.read(sellerRepositoryProvider).addBankAccount(request);
      await refresh();
      return true;
    } catch (error) {
      final current = state.value;
      if (current != null) {
        state = AsyncData(current.copyWith(errorMessage: error.toString()));
      }
      return false;
    }
  }

  Future<void> deleteBankAccount(String id) async {
    await ref.read(sellerRepositoryProvider).deleteBankAccount(id);
    await refresh();
  }
}
