import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_actions_provider.dart';

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

  final _picker = ImagePicker();
  final List<File> _photos = [];
  bool _submitting = false;

  Future<void> _pickPhotos() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isEmpty) return;
    setState(() {
      for (final file in picked) {
        if (_photos.length >= _maxPhotos) break;
        _photos.add(File(file.path));
      }
    });
  }

  Future<void> _submit() async {
    setState(() => _submitting = true);
    final ok = await ref
        .read(ordersActionsProvider.notifier)
        .confirmReceipt(widget.orderId, [
          for (final photo in _photos)
            ReceiptPhoto(
              bytes: await photo.readAsBytes(),
              filename: photo.uri.pathSegments.last,
              mime: 'image/jpeg',
            ),
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
    final canSubmit = _photos.isNotEmpty && !_submitting;

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
            _PhotoStrip(
              photos: _photos,
              onAdd: _submitting || _photos.length >= _maxPhotos
                  ? null
                  : _pickPhotos,
              onRemove: _submitting
                  ? null
                  : (index) => setState(() => _photos.removeAt(index)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canSubmit ? _submit : null,
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

/// Ảnh đã chọn, cộng một ô "thêm" ở cuối — cùng hình dạng với chỗ đính kèm của
/// ticket, để hai nơi chụp ảnh trong app không trông như hai sản phẩm.
class _PhotoStrip extends StatelessWidget {
  const _PhotoStrip({
    required this.photos,
    required this.onAdd,
    required this.onRemove,
  });

  final List<File> photos;
  final VoidCallback? onAdd;
  final void Function(int index)? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var index = 0; index < photos.length; index++)
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(photos[index], fit: BoxFit.cover),
                ),
                if (onRemove != null)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: IconButton(
                      iconSize: 18,
                      icon: const Icon(Icons.cancel_rounded),
                      color: theme.colorScheme.error,
                      onPressed: () => onRemove!(index),
                    ),
                  ),
              ],
            ),
          ),
        if (onAdd != null)
          InkWell(
            onTap: onAdd,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Icon(
                Icons.add_a_photo_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}
