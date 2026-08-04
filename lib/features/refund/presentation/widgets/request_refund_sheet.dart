import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/generated/model/refund.dart';
import '../../../../core/utils/error_handler.dart';
import '../../data/repositories/refund_repository.dart';
import '../providers/refund_provider.dart';

/// A refund is for one entire order and carries no amount: what is owed is the
/// order's checkout total, so this asks only for the reason.
class RequestRefundSheet extends ConsumerStatefulWidget {
  const RequestRefundSheet({super.key, required this.orderId});

  final String orderId;

  static Future<Refund?> show(BuildContext context, String orderId) {
    return showModalBottomSheet<Refund>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RequestRefundSheet(orderId: orderId),
    );
  }

  @override
  ConsumerState<RequestRefundSheet> createState() => _RequestRefundSheetState();
}

class _RequestRefundSheetState extends ConsumerState<RequestRefundSheet> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _submitting = true);
    try {
      final refund = await ref.read(refundRepositoryProvider).request(
        orderId: widget.orderId,
        reason: _reasonController.text.trim(),
      );
      ref.invalidate(refundListProvider);
      if (!mounted) return;
      Navigator.of(context).pop(refund);
    } catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ErrorHandler.getErrorMessage(e))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Yêu cầu hoàn tiền', style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              'Yêu cầu áp dụng cho toàn bộ đơn hàng. Người bán sẽ phản hồi trước; '
              'nếu không đồng ý, bạn có thể nhờ ShopNexus xử lý.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonController,
              maxLines: 4,
              minLines: 3,
              decoration: const InputDecoration(
                labelText: 'Lý do',
                hintText: 'Ví dụ: Hàng không đúng mô tả',
                alignLabelWithHint: true,
              ),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Vui lòng nhập lý do'
                  : null,
            ),
            const SizedBox(height: 8),
            Text(
              'Bạn có thể bổ sung ảnh bằng chứng ở trang chi tiết sau khi gửi.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Gửi yêu cầu'),
            ),
          ],
        ),
      ),
    );
  }
}
