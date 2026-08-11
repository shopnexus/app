import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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

/// Modal sheet để trả nốt một phiên thanh toán dở dang (`PaymentSession` ở
/// trạng thái pending/processing).
///
/// Bố cục ba tầng — đầu cố định, thân cuộn, chân neo — vì số phương thức thanh
/// toán là do registry phía server quyết, không phải hằng số: gộp tất cả vào
/// một `SingleChildScrollView` thì thêm vài rail là nút "Thanh toán ngay" bị
/// đẩy khỏi màn hình, và người dùng phải cuộn để tìm việc duy nhất họ vào đây
/// để làm. Neo nút xuống chân thì danh sách dài bao nhiêu cũng không đổi được
/// điều đó.
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
  bool _isPolling = false;
  String? _errorMessage;

  PaymentSession? _session;
  List<Option> _paymentOptions = [];
  String? _selectedPaymentOption;
  Transaction? _pendingTransaction;

  Timer? _pollTimer;
  Timer? _expiryTicker;

  @override
  void initState() {
    super.initState();
    _loadData();
    // Hạn phiên là thông tin sống: đọc "còn 12 phút" lúc mở sheet rồi ngồi
    // chọn rail thì con số đó thành sai. Nhịp 30s đủ để nó không nói dối.
    _expiryTicker = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _expiryTicker?.cancel();
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
        // Rail của lần trả dở là mặc định đúng nhất, nhưng chỉ khi registry còn
        // offer nó — một slug đã bị tắt thì chọn sẵn cũng chỉ dẫn tới 422.
        final ids = {for (final o in options) o.id};
        final resumed = pendingTxn?.paymentOption;
        _selectedPaymentOption = (resumed != null && ids.contains(resumed))
            ? resumed
            : (options.isEmpty ? null : options.first.id);
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
    final txn = _pendingTransaction;
    if (txn == null || txn.checkoutUrl.isEmpty) return;
    await PaymentWebViewScreen.show(
      context,
      checkoutUrl: txn.checkoutUrl,
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
    if (mounted) {
      setState(() {
        _isSubmitting = true;
        _isPolling = true;
      });
    }
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
          // Lấy messenger trước khi pop: sau pop thì context này đã rời cây và
          // không tra ngược lên ScaffoldMessenger được nữa.
          final messenger = ScaffoldMessenger.of(context);
          Navigator.of(context).pop(true);
          messenger.showSnackBar(
            const SnackBar(
              content: Text(
                'Thanh toán thành công. Đơn hàng đã được ghi nhận.',
              ),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        } else if (session.status == PaymentSessionStatus.failed ||
            session.status == PaymentSessionStatus.cancelled) {
          timer.cancel();
          setState(() {
            _isSubmitting = false;
            _isPolling = false;
            _errorMessage =
                'Thanh toán không hoàn tất. Chọn phương thức và thử lại.';
          });
        }
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final media = MediaQuery.of(context);

    return Container(
      constraints: BoxConstraints(maxHeight: media.size.height * 0.88),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _grabber(isDark),
          _header(theme),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          else if (_session == null)
            _loadFailed(theme)
          else ...[
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _amountPanel(theme, isDark, _session!),
                    if (_pendingTransaction?.checkoutUrl.isNotEmpty ?? false)
                      ..._resumeCard(theme, isDark),
                    const SizedBox(height: 20),
                    _sectionLabel(theme, 'Chọn phương thức thanh toán'),
                    const SizedBox(height: 10),
                    if (_paymentOptions.isEmpty)
                      Text(
                        'Chưa có phương thức thanh toán khả dụng.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      for (final option in _paymentOptions)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _optionTile(theme, isDark, option),
                        ),
                  ],
                ),
              ),
            ),
            _footer(theme, isDark, media),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------- chrome

  Widget _grabber(bool isDark) => Container(
    width: 40,
    height: 4,
    margin: const EdgeInsets.only(top: 12, bottom: 14),
    decoration: BoxDecoration(
      color: isDark
          ? AppColors.darkPrimary.withAlpha(60)
          : const Color(0xFFD8DDDB),
      borderRadius: BorderRadius.circular(2),
    ),
  );

  Widget _header(ThemeData theme) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 8, 12),
    child: Row(
      children: [
        Expanded(
          child: Text(
            'Tiếp tục thanh toán',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close_rounded, size: 22),
          color: theme.colorScheme.onSurfaceVariant,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );

  Widget _sectionLabel(ThemeData theme, String text) => Text(
    text,
    style: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurface,
    ),
  );

  Widget _loadFailed(ThemeData theme) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
    child: Column(
      children: [
        Icon(
          Icons.wifi_off_rounded,
          size: 32,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(height: 12),
        Text(
          _errorMessage ?? 'Không tải được phiên thanh toán.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            height: 1.4,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: _loadData,
          icon: const Icon(Icons.refresh_rounded, size: 18),
          label: const Text('Tải lại'),
        ),
      ],
    ),
  );

  // ----------------------------------------------------------------- tiền

  /// Số tiền là câu trả lời cho câu hỏi duy nhất người dùng mang vào sheet —
  /// "còn phải trả bao nhiêu" — nên nó được đọc trước mọi thứ khác. Phiên trả
  /// một phần thì `outstanding` khác `totalAmount`, và cái đúng để in to là
  /// phần còn nợ, không phải tổng đơn.
  Widget _amountPanel(ThemeData theme, bool isDark, PaymentSession session) {
    final title = session.note.isNotEmpty
        ? session.note
        : (widget.title ?? 'Đơn hàng chưa thanh toán');
    final currency = session.currency.isNotEmpty
        ? session.currency
        : (widget.currency ?? 'VND');
    final outstanding = session.outstanding > 0
        ? session.outstanding
        : session.totalAmount;
    final paid = session.totalAmount - outstanding;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkPrimary.withAlpha(28)
            : const Color(0xFFE6F4EA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            paid > 0 ? 'Còn phải trả' : 'Tổng thanh toán',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              MoneyUtils.format(outstanding, currency: currency),
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 1.1,
                color: isDark
                    ? AppColors.darkPrimary
                    : theme.colorScheme.primary,
              ),
            ),
          ),
          if (paid > 0) ...[
            const SizedBox(height: 4),
            Text(
              'Đã trả ${MoneyUtils.format(paid, currency: currency)} '
              'trên tổng ${MoneyUtils.format(session.totalAmount, currency: currency)}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          ..._expiryChip(isDark, session.expiredAt),
        ],
      ),
    );
  }

  /// Phiên quá hạn bị job dọn, nên hạn là lý do thật để trả bây giờ thay vì
  /// đóng sheet lại. Hết hạn thì vẫn để bấm được: đồng hồ máy có thể lệch, và
  /// câu trả lời đúng cho việc đó là của server chứ không phải của client.
  List<Widget> _expiryChip(bool isDark, DateTime expiredAt) {
    final remaining = expiredAt.difference(DateTime.now());
    final expired = remaining.isNegative;

    final String label;
    if (expired) {
      label = 'Phiên đã hết hạn — thử lại có thể bị từ chối';
    } else if (remaining.inMinutes < 60) {
      label = 'Hết hạn sau ${remaining.inMinutes + 1} phút';
    } else if (remaining.inHours < 24) {
      label = 'Hết hạn sau ${remaining.inHours} giờ';
    } else {
      label = 'Hết hạn ${DateFormat('HH:mm dd/MM').format(expiredAt)}';
    }

    final fg = expired
        ? const Color(0xFFE11D48)
        : (isDark ? const Color(0xFFFDE68A) : const Color(0xFF92400E));

    return [
      const SizedBox(height: 12),
      Row(
        children: [
          Icon(
            expired ? Icons.error_outline_rounded : Icons.schedule_rounded,
            size: 14,
            color: fg,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: fg,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  // ------------------------------------------------------------- lần trả dở

  /// Trang thanh toán còn mở của lần trước là đường ngắn nhất về đích — mở lại
  /// nó không tạo thêm giao dịch, còn chọn rail bên dưới thì có.
  List<Widget> _resumeCard(ThemeData theme, bool isDark) => [
    const SizedBox(height: 12),
    InkWell(
      onTap: _isSubmitting ? null : _openExistingWebview,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkPrimary.withAlpha(20)
              : const Color(0xFFF9F9F7),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark
                ? AppColors.darkPrimary.withAlpha(60)
                : theme.colorScheme.primary.withAlpha(70),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.open_in_new_rounded,
              size: 20,
              color: isDark ? AppColors.darkPrimary : theme.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mở lại trang thanh toán đang chờ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Lần trả trước còn dở. Mở lại để hoàn tất, không tạo thêm '
                    'giao dịch mới.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      height: 1.35,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    ),
  ];

  // --------------------------------------------------------------- rail

  /// Một rail. Icon lấy theo `provider` chứ không theo `id`: id là slug của
  /// hàng trong registry và staff đổi được, provider mới là thứ nói rail này
  /// thực sự là gì.
  Widget _optionTile(ThemeData theme, bool isDark, Option option) {
    final isSelected = _selectedPaymentOption == option.id;

    final selectedBg = isDark
        ? AppColors.darkPrimary.withAlpha(35)
        : const Color(0xFFE6F4EA);
    final unselectedBg = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF9F9F7);
    final borderColor = isSelected
        ? theme.colorScheme.primary
        : (isDark
              ? AppColors.darkPrimary.withAlpha(30)
              : const Color(0xFFE2E3E0));
    final accent = isDark ? AppColors.darkPrimary : theme.colorScheme.primary;

    return InkWell(
      onTap: _isSubmitting
          ? null
          : () => setState(() => _selectedPaymentOption = option.id),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1.0),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark
                      ? AppColors.darkPrimary.withAlpha(30)
                      : const Color(0xFFE2E3E0),
                ),
              ),
              child: Icon(_providerIcon(option.provider), size: 19, color: accent),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  if (option.description.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      option.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        height: 1.3,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              size: 20,
              color: isSelected ? accent : theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  IconData _providerIcon(String provider) {
    final p = provider.toLowerCase();
    if (p.contains('cod') || p.contains('cash')) return Icons.payments_rounded;
    if (p.contains('wallet') || p.contains('balance')) {
      return Icons.account_balance_wallet_rounded;
    }
    if (p.contains('momo') || p.contains('zalo') || p.contains('vnpay')) {
      return Icons.qr_code_rounded;
    }
    if (p.contains('bank') || p.contains('transfer')) {
      return Icons.account_balance_rounded;
    }
    if (p.contains('card') || p.contains('stripe') || p.contains('visa')) {
      return Icons.credit_card_rounded;
    }
    return Icons.payment_rounded;
  }

  // --------------------------------------------------------------- chân

  /// Nút neo ngoài vùng cuộn: registry có bao nhiêu rail cũng không đẩy được
  /// việc chính xuống dưới màn hình.
  Widget _footer(ThemeData theme, bool isDark, MediaQueryData media) {
    final canPay =
        !_isSubmitting && _selectedPaymentOption != null && _session != null;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 12 + media.viewInsets.bottom),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppColors.darkPrimary.withAlpha(30)
                : const Color(0xFFE2E3E0),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_errorMessage != null) ...[
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withAlpha(isDark ? 40 : 20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 16,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        height: 1.35,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: canPay ? _submitPayment : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: _isSubmitting
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isPolling ? 'Đang xác nhận…' : 'Đang mở cổng…',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Thanh toán ngay',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
