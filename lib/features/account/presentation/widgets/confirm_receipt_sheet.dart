import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_actions_provider.dart';
import 'package:shopnexus_flutter_app/shared/widgets/image_upload_field.dart';

/// Người mua nói hàng đã tới, kèm ảnh mở hộp.
///
/// Ảnh là bắt buộc và server từ chối danh sách rỗng, nên đây là một sheet chứ
/// không phải một hộp thoại xác nhận: cần chỗ để chọn ảnh và xem lại chúng.
///
/// Điều màn hình này nói ra, và là lý do nó tồn tại: xác nhận là thứ **mở đồng hồ
/// trả tiền cho người bán**, và nó không mở lại được. Cả hai chuyện đó người mua
/// phải biết trước khi chạm, chứ không phải phát hiện sau.
class ConfirmReceiptSheet extends ConsumerStatefulWidget {
  const ConfirmReceiptSheet({super.key, required this.orderId});

  final String orderId;

  /// Trả về `true` khi xác nhận đã được ghi, để người gọi nạp lại danh sách.
  static Future<bool?> show(BuildContext context, {required String orderId}) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => ConfirmReceiptSheet(orderId: orderId),
    );
  }

  @override
  ConsumerState<ConfirmReceiptSheet> createState() =>
      _ConfirmReceiptSheetState();
}

class _ConfirmReceiptSheetState extends ConsumerState<ConfirmReceiptSheet> {
  static const _maxPhotos = 10;

  /// Resource đã xác nhận, do [ImageUploadField] tải lên. Ảnh được đưa lên ngay
  /// lúc chọn chứ không đợi lúc bấm gửi: server chỉ nhận resource *đã* confirm,
  /// nên gộp hai việc vào một lần bấm biến một ảnh hỏng thành cả lần xác nhận hỏng.
  List<Resource> _photos = const [];
  bool _submitting = false;

  /// Vì sao lần bấm vừa rồi chưa gửi được. Giữ ở đây chứ không chỉ ném snackbar:
  /// câu trả lời nằm ngay trên dải ảnh, đúng chỗ phải sửa.
  String? _error;

  Future<void> _submit() async {
    // Nút không bị vô hiệu hoá khi chưa có ảnh, nó *trả lời*: một nút bấm vào
    // không xảy ra gì là cách chắc chắn nhất để người dùng kết luận app hỏng —
    // và đó đúng là chuyện đã xảy ra ở đây.
    if (_photos.isEmpty) {
      setState(() => _error = 'Cần ít nhất một ảnh mở hộp trước khi xác nhận.');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    final ok = await ref
        .read(ordersActionsProvider.notifier)
        .confirmReceipt(widget.orderId, [
          for (final photo in _photos) photo.id,
        ]);
    if (!mounted) return;
    if (ok) {
      Navigator.pop(context, true);
      return;
    }
    setState(() => _submitting = false);
    final message =
        ref.read(ordersActionsProvider).errorMessage ?? 'Không xác nhận được';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đã nhận hàng?',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Xác nhận sẽ chuyển tiền cho người bán sau 72 giờ, và không thể '
              'hoàn tác. Nếu có gì chưa đúng, hãy yêu cầu hoàn tiền trước khi xác nhận.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ảnh mở hộp',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Nói vì sao phải chụp, chứ không chỉ đòi: đây là bằng chứng một yêu
            // cầu hoàn tiền về sau được xét trên.
            Text(
              'Cần ít nhất một ảnh. Nếu sau này bạn yêu cầu hoàn tiền, đây là '
              'bằng chứng vụ việc được xét trên.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            ImageUploadField(
              target: UploadTarget.order,
              maxPhotos: _maxPhotos,
              enabled: !_submitting,
              onChanged: (photos) => setState(() {
                _photos = photos;
                if (photos.isNotEmpty) _error = null;
              }),
            ),
            if (_error case final error?) ...[
              const SizedBox(height: 8),
              Text(
                error,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitting ? null : _submit,
                child: Text(
                  _submitting ? 'Đang gửi…' : 'Xác nhận đã nhận hàng',
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _submitting
                    ? null
                    : () => Navigator.pop(context, false),
                child: const Text('Để sau'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
