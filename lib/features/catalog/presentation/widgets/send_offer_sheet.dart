import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_offer_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';

/// Opens a negotiation on a variant: `POST /offers`. Agreeing charges nothing —
/// the buyer still checks out afterwards — so this sheet takes terms, not money.
void showSendOfferSheet(
  BuildContext context, {
  required ListingDetail detail,
  required Variant variant,
  required int quantity,
}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
      ),
      child: SendOfferSheet(
        detail: detail,
        variant: variant,
        quantity: quantity,
      ),
    ),
  );
}

class SendOfferSheet extends ConsumerStatefulWidget {
  final ListingDetail detail;
  final Variant variant;
  final int quantity;

  const SendOfferSheet({
    super.key,
    required this.detail,
    required this.variant,
    required this.quantity,
  });

  @override
  ConsumerState<SendOfferSheet> createState() => _SendOfferSheetState();
}

class _SendOfferSheetState extends ConsumerState<SendOfferSheet> {
  late final TextEditingController _priceController;
  final TextEditingController _reasonController = TextEditingController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController(
      text: widget.variant.price.toString(),
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  int? get _unitPrice {
    final parsed = int.tryParse(_priceController.text.trim());
    if (parsed == null || parsed <= 0) return null;
    return parsed;
  }

  /// Vì sao mức giá đang gõ chưa gửi được, hoặc null nếu gửi được.
  ///
  /// Thương lượng chỉ đi xuống: giá niêm yết vốn đã là lời đề nghị bán ở mức đó,
  /// nên đề xuất cao hơn là thứ không ai làm — người mua chỉ việc bấm mua. Server
  /// trả 422 `offer_above_asking` cho đúng chuyện này; hỏi ở đây để người ta biết
  /// ngay lúc gõ chứ không phải sau khi bấm gửi.
  String? get _priceError {
    final unitPrice = _unitPrice;
    if (unitPrice == null) return null;
    if (unitPrice > widget.variant.price) {
      return 'Không cao hơn giá niêm yết '
          '(${MoneyUtils.format(widget.variant.price)}).';
    }
    return null;
  }

  Future<void> _send() async {
    final unitPrice = _unitPrice;
    if (unitPrice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nhập mức giá bạn muốn đề xuất.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    // Nút đã bị vô hiệu hoá ở trạng thái này; đây là chốt chặn cho đường vào còn
    // lại — bàn phím gửi đi trong lúc `errorText` đang hiện.
    if (_priceError != null) return;

    setState(() => _isSending = true);
    final reason = _reasonController.text.trim();
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final theme = Theme.of(context);

    try {
      final currentUserId = ref.read(profileProvider).value?.id;
      final sellerId = widget.detail.seller.id;

      if (currentUserId != null && sellerId == currentUserId) {
        messenger.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            backgroundColor: theme.colorScheme.surfaceContainerHigh,
            elevation: 4,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            content: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.orange,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Không thể thương lượng',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Bạn không thể thương lượng sản phẩm của chính mình.',
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
            duration: const Duration(seconds: 3),
          ),
        );
        setState(() => _isSending = false);
        return;
      }

      await ref
          .read(orderApiProvider)
          .offersPost(
            createOfferRequest: CreateOfferRequest(
              variantId: widget.variant.id,
              quantity: widget.quantity,
              // The API takes the total for the whole quantity, not a unit price.
              total: unitPrice * widget.quantity,
              reason: reason.isEmpty ? null : reason,
            ),
          );

      if (!mounted) return;

      // Start/fetch conversation with the seller
      final conversation = await ref
          .read(chatRepositoryProvider)
          .startConversation(sellerId);

      if (!mounted) return;
      Navigator.pop(context);

      // Chuyển hướng trực tiếp sang màn hình chat detail của cuộc trò chuyện này
      router.go('/chat/${conversation.id}');

      // Hiển thị thông báo SnackBar thiết kế chuẩn theo Theme của ứng dụng
      messenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: theme.colorScheme.surfaceContainerHigh,
          elevation: 4,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          content: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Đã gửi thương lượng thành công!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Đề xuất ${MoneyUtils.format(unitPrice * widget.quantity)} đã được gửi đến người bán.',
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
          duration: const Duration(seconds: 4),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _isSending = false);
      messenger.showSnackBar(
        SnackBar(
          content: Text(ErrorHandler.getErrorMessage(error)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final unitPrice = _unitPrice;
    final askingPrice = widget.variant.price;
    final priceError = _priceError;
    final label = variantLabel(widget.variant);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withAlpha(60),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.handshake_outlined,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Thương lượng giá',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${widget.detail.name}${label.isNotEmpty ? " • $label" : ""}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Giá niêm yết: ${MoneyUtils.format(askingPrice)} • Số lượng: ${widget.quantity}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Mức giá bạn đề xuất (mỗi sản phẩm)',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.sell_outlined),
                hintText: 'Nhập số tiền...',
                errorText: priceError,
                filled: true,
                fillColor: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Lời nhắn cho người bán (không bắt buộc)',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reasonController,
              maxLines: 2,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Ví dụ: mình lấy ngay hôm nay được không?',
                filled: true,
                fillColor: isDarkMode
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (unitPrice != null && priceError == null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng đề xuất',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      MoneyUtils.format(unitPrice * widget.quantity),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isSending || priceError != null ? null : _send,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isSending
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'GỬI ĐỀ XUẤT',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Gửi đề xuất chưa trừ tiền. Khi hai bên đồng ý, bạn bấm tạo đơn để thanh toán ở giá đã chốt.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
