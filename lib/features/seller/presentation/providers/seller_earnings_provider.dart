import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seller_earnings_provider.freezed.dart';

part 'seller_earnings_provider.g.dart';

@freezed
abstract class SellerTransaction with _$SellerTransaction {
  const factory SellerTransaction({
    required String id,
    required String title,
    required String referenceId,
    required double amount,
    required String date,
    required String time,
    required String type, // 'credit' | 'withdrawal'
    required String status, // 'settled' | 'initiated' | 'pending'
    double? processingFee,
  }) = _SellerTransaction;
}

@freezed
abstract class SellerEarningsState with _$SellerEarningsState {
  const factory SellerEarningsState({
    @Default(32450000.0) double availableBalance, // 32.450.000 VND
    @Default('MBBank Checking') String bankName,
    @Default('**** 1234') String bankAccountNumber,
    @Default('NGUYEN VAN A') String bankAccountHolder,
    @Default(4125000.0) double totalIn,
    @Default(5000000.0) double totalOut,
    @Default([]) List<SellerTransaction> transactions,
    @Default('30d') String selectedPeriod, // '30d' | '1y'
    @Default(false) bool isLoading,
    @Default(false) bool isWithdrawing,
    String? errorMessage,
  }) = _SellerEarningsState;
}

@riverpod
class SellerEarningsNotifier extends _$SellerEarningsNotifier {
  @override
  SellerEarningsState build() {
    return const SellerEarningsState(
      isLoading: false,
      transactions: [
        SellerTransaction(
          id: 'tx_1',
          title: 'Doanh thu đơn hàng #DH8472',
          referenceId: 'ID: #RC-8923-LN',
          amount: 1125000.0,
          date: '24 Tháng 10',
          time: '14:30',
          type: 'credit',
          status: 'settled',
          processingFee: 15000.0,
        ),
        SellerTransaction(
          id: 'tx_2',
          title: 'Lệnh rút tiền về ngân hàng',
          referenceId: 'Ref: ACH-449102',
          amount: -5000000.0,
          date: '23 Tháng 10',
          time: '09:00',
          type: 'withdrawal',
          status: 'initiated',
          processingFee: 0.0,
        ),
        SellerTransaction(
          id: 'tx_3',
          title: 'Doanh thu đơn hàng #DH8470',
          referenceId: 'ID: #RC-4011-MX',
          amount: 3000000.0,
          date: '12 Tháng 10',
          time: '10:00',
          type: 'credit',
          status: 'settled',
          processingFee: 30000.0,
        ),
      ],
    );
  }

  void setPeriod(String period) {
    state = state.copyWith(selectedPeriod: period);
  }

  Future<bool> withdraw(double amount) async {
    if (amount <= 0 || amount > state.availableBalance) {
      state = state.copyWith(errorMessage: 'Số tiền rút không hợp lệ');
      return false;
    }

    state = state.copyWith(isWithdrawing: true, errorMessage: null);

    // Simulate API withdrawal request
    await Future.delayed(const Duration(milliseconds: 1200));

    final newBalance = state.availableBalance - amount;
    final newTotalOut = state.totalOut + amount;
    final newTransaction = SellerTransaction(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      title: 'Lệnh rút tiền về ngân hàng',
      referenceId:
          'Ref: ACH-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      amount: -amount,
      date: 'Hôm nay',
      time:
          '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
      type: 'withdrawal',
      status: 'initiated',
      processingFee: 0.0,
    );

    state = state.copyWith(
      isWithdrawing: false,
      availableBalance: newBalance,
      totalOut: newTotalOut,
      transactions: [newTransaction, ...state.transactions],
    );

    return true;
  }
}
