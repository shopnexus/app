import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_payment_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/repositories/checkout_repository.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/screens/payment_webview_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Modal sheet hỗ trợ người dùng tiếp tục / thực hiện lại thanh toán cho
/// một phiên thanh toán dở dang (`PaymentSession` ở trạng thái pending/processing).
class ResumePaymentSheet extends ConsumerStatefulWidget {
  final String paymentSessionId;
  final String? title;
  final int? amount;
  final String? currency;

  const ResumePaymentSheet({
    super.key,
    required this.paymentSessionId,
    this.title,
    this.amount,
    this.currency,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String paymentSessionId,
    String? title,
    int? amount,
    String? currency,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ResumePaymentSheet(
        paymentSessionId: paymentSessionId,
        title: title,
        amount: amount,
        currency: currency,
      ),
    );
  }

  @override
  ConsumerState<ResumePaymentSheet> createState() => _ResumePaymentSheetState();
}

class _ResumePaymentSheetState extends ConsumerState<ResumePaymentSheet> {
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _errorMessage;

  PaymentSession? _session;
  List<Option> _paymentOptions = [];
  String? _selectedPaymentOption;
  Transaction? _pendingTransaction;

  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(checkoutRepositoryProvider);
      final sellerRepo = ref.read(sellerRepositoryProvider);

      final session = await repo.paymentSession(widget.paymentSessionId);
      final options = await repo.paymentOptions();
      List<Transaction> txns = [];
      try {
        txns = await sellerRepo.paymentTransactions(widget.paymentSessionId);
      } catch (_) {}

      Transaction? pendingTxn;
      for (final t in txns) {
        if (t.status.value == 'pending' && t.checkoutUrl.isNotEmpty) {
          pendingTxn = t;
          break;
        }
      }

      if (!mounted) return;
      setState(() {
        _session = session;
        _paymentOptions = options;
        if (pendingTxn != null) {
          _selectedPaymentOption = pendingTxn.paymentOption;
        } else if (options.isNotEmpty) {
          _selectedPaymentOption = options.first.id;
        }
        _pendingTransaction = pendingTxn;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = ErrorHandler.getErrorMessage(e);
      });
    }
  }

  Future<void> _openExistingWebview() async {
    if (_pendingTransaction == null || _pendingTransaction!.checkoutUrl.isEmpty) return;
    await PaymentWebViewScreen.show(
      context,
      checkoutUrl: _pendingTransaction!.checkoutUrl,
      returnUrl: paymentReturnUrl(widget.paymentSessionId),
    );
    _startPolling();
  }

  Future<void> _submitPayment() async {
    if (_selectedPaymentOption == null || _session == null) return;

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(checkoutRepositoryProvider);

      final transaction = await repo.startPayment(
        widget.paymentSessionId,
        StartPaymentRequest(
          paymentOption: _selectedPaymentOption!,
          amount: _session!.outstanding > 0 ? _session!.outstanding : null,
          returnUrl: paymentReturnUrl(widget.paymentSessionId),
        ),
      );

      if (!mounted) return;

      if (transaction.checkoutUrl.isNotEmpty) {
        await PaymentWebViewScreen.show(
          context,
          checkoutUrl: transaction.checkoutUrl,
          returnUrl: paymentReturnUrl(widget.paymentSessionId),
        );
      }

      _startPolling();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _errorMessage = ErrorHandler.getErrorMessage(e);
      });
    }
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      try {
        final repo = ref.read(checkoutRepositoryProvider);
        final session = await repo.paymentSession(widget.paymentSessionId);

        if (!mounted) {
          timer.cancel();
          return;
        }

        if (session.status == PaymentSessionStatus.success) {
          timer.cancel();
          ref.invalidate(ordersProvider);
          ref.invalidate(unsettledItemsProvider);
          if (mounted) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Thanh toán thành công! Đơn hàng đã được ghi nhận.'),
                backgroundColor: Color(0xFF10B981),
              ),
            );
          }
        } else if (session.status == PaymentSessionStatus.failed ||
            session.status == PaymentSessionStatus.cancelled) {
          timer.cancel();
          setState(() {
            _isSubmitting = false;
            _errorMessage = 'Thanh toán thất bại hoặc phiên đã bị hủy.';
          });
        }
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final displayTitle = _session?.note.isNotEmpty == true
        ? _session!.note
        : (widget.title ?? 'Thanh toán đơn hàng');
    final displayAmount = _session?.totalAmount ?? widget.amount ?? 0;
    final displayCurrency = _session?.currency ?? widget.currency ?? 'VND';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[700] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tiếp tục thanh toán',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                )
              else ...[
                // Informational Card
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkSurface
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? AppColors.darkPrimary.withAlpha(40)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng thanh toán:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            MoneyUtils.format(displayAmount, currency: displayCurrency),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                if (_pendingTransaction != null &&
                    _pendingTransaction!.checkoutUrl.isNotEmpty) ...[
                  ElevatedButton.icon(
                    onPressed: _isSubmitting ? null : _openExistingWebview,
                    icon: const Icon(Icons.open_in_new_rounded),
                    label: const Text('Mở trang thanh toán đang chờ'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      foregroundColor: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Hoặc chọn phương thức khác',
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                Text(
                  'Phương thức thanh toán',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                for (final option in _paymentOptions)
                  InkWell(
                    onTap: _isSubmitting
                        ? null
                        : () => setState(() => _selectedPaymentOption = option.id),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedPaymentOption == option.id
                              ? theme.colorScheme.primary
                              : (isDark
                                  ? AppColors.darkPrimary.withAlpha(30)
                                  : const Color(0xFFE2E8F0)),
                          width: _selectedPaymentOption == option.id ? 1.5 : 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          // ignore: deprecated_member_use
                          Radio<String>(
                            value: option.id,
                            // ignore: deprecated_member_use
                            groupValue: _selectedPaymentOption,
                            // ignore: deprecated_member_use
                            onChanged: _isSubmitting
                                ? null
                                : (v) => setState(() => _selectedPaymentOption = v),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  option.name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (option.description.isNotEmpty)
                                  Text(
                                    option.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                if (_errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitPayment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        )
                      : const Text(
                          'Thanh toán ngay',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
