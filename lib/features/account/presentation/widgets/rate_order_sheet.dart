import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/features/account/presentation/providers/rate_order_provider.dart';

/// Một đơn xong sinh ra **hai** thứ chấm điểm, và người dùng thấy **một** việc.
///
/// Hai nút cạnh nhau ("Đánh giá người bán" / "Đánh giá sản phẩm") là chỗ người ta
/// đứng lại và bỏ đi: không ai biết mình đang được hỏi hai câu khác nhau, hay tại
/// sao. Nên một nút, một biểu mẫu, hai phần — và **nói ra phần nào ai đọc được**,
/// vì tính chất *kín* của đánh giá giao dịch là thứ khiến người ta dám chấm thật.
class RateOrderSheet extends ConsumerStatefulWidget {
  const RateOrderSheet({
    super.key,
    required this.orderId,
    required this.sellerName,
    this.listingId,
    this.listingName,
  });

  final String orderId;
  final String sellerName;

  /// Null khi đơn có nhiều tin: đánh giá sản phẩm gắn với **một** tin, nên với
  /// đơn nhiều dòng thì chỉ hỏi phần người bán chứ không bắt họ chọn hộ.
  final String? listingId;
  final String? listingName;

  static Future<bool?> show(
    BuildContext context, {
    required String orderId,
    required String sellerName,
    String? listingId,
    String? listingName,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RateOrderSheet(
        orderId: orderId,
        sellerName: sellerName,
        listingId: listingId,
        listingName: listingName,
      ),
    );
  }

  @override
  ConsumerState<RateOrderSheet> createState() => _RateOrderSheetState();
}

class _RateOrderSheetState extends ConsumerState<RateOrderSheet> {
  static const _maxPhotos = 5;

  final _picker = ImagePicker();
  final _sellerComment = TextEditingController();
  final _productBody = TextEditingController();
  final List<File> _photos = [];

  int _sellerRating = 0;
  int _productRating = 0;

  @override
  void dispose() {
    _sellerComment.dispose();
    _productBody.dispose();
    super.dispose();
  }

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
    final ok = await ref.read(rateOrderProvider.notifier).submit(
      orderId: widget.orderId,
      sellerRating: _sellerRating,
      sellerComment: _sellerComment.text.trim().isEmpty
          ? null
          : _sellerComment.text.trim(),
      listingId: _productRating > 0 ? widget.listingId : null,
      productRating: _productRating > 0 ? _productRating : null,
      productBody: _productBody.text.trim().isEmpty
          ? null
          : _productBody.text.trim(),
      photos: _photos,
    );
    if (!mounted) return;
    if (ok) {
      Navigator.pop(context, true);
      return;
    }
    final message =
        ref.read(rateOrderProvider).errorMessage ?? 'Không gửi được đánh giá';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sending = ref.watch(rateOrderProvider).isLoading;
    final canSubmit = _sellerRating > 0 && !sending;

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
              'Đánh giá đơn này',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // --- Nửa kín ---
            _SectionTitle(
              title: 'Giao dịch với ${widget.sellerName}',
              // Nói ra tính chất mù, vì đó là lý do người ta dám chấm thật: điểm
              // của hai bên chỉ hiện khi cả hai đã gửi, nên nó không thể là đòn
              // đáp trả.
              note: 'Chỉ hiện khi cả hai bên đã đánh giá. Người bán không '
                  'thấy điểm của bạn trước khi họ chấm.',
              icon: Icons.lock_outline_rounded,
            ),
            const SizedBox(height: 10),
            _Stars(
              value: _sellerRating,
              onChanged: sending
                  ? null
                  : (value) => setState(() => _sellerRating = value),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sellerComment,
              enabled: !sending,
              maxLines: 3,
              maxLength: 1000,
              decoration: const InputDecoration(
                hintText: 'Giao đúng hẹn, đóng gói kỹ… (không bắt buộc)',
                border: OutlineInputBorder(),
              ),
            ),

            // --- Nửa công khai, chỉ khi đơn có đúng một tin ---
            if (widget.listingId != null) ...[
              const SizedBox(height: 12),
              _SectionTitle(
                title: widget.listingName ?? 'Sản phẩm',
                note: 'Công khai trên trang sản phẩm. Bỏ trống nếu bạn không '
                    'muốn đánh giá món này.',
                icon: Icons.public_rounded,
              ),
              const SizedBox(height: 10),
              _Stars(
                value: _productRating,
                onChanged: sending
                    ? null
                    : (value) => setState(
                        // Chạm lại ngôi sao đang chọn để bỏ hẳn phần này —
                        // không có nút "xoá" riêng cho một thứ tuỳ chọn.
                        () => _productRating = value == _productRating
                            ? 0
                            : value,
                      ),
              ),
              if (_productRating > 0) ...[
                const SizedBox(height: 10),
                TextField(
                  controller: _productBody,
                  enabled: !sending,
                  maxLines: 3,
                  maxLength: 2000,
                  decoration: const InputDecoration(
                    hintText: 'Hàng đúng như mô tả không?',
                    border: OutlineInputBorder(),
                  ),
                ),
                _PhotoStrip(
                  photos: _photos,
                  onAdd: sending || _photos.length >= _maxPhotos
                      ? null
                      : _pickPhotos,
                  onRemove: sending
                      ? null
                      : (index) => setState(() => _photos.removeAt(index)),
                ),
              ],
            ],

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canSubmit ? _submit : null,
                child: Text(sending ? 'Đang gửi…' : 'Gửi đánh giá'),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: sending ? null : () => Navigator.pop(context, false),
                child: const Text('Để sau'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.note,
    required this.icon,
  });

  final String title;
  final String note;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          note,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.value, required this.onChanged});

  final int value;
  final void Function(int value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        for (var star = 1; star <= 5; star++)
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            onPressed: onChanged == null ? null : () => onChanged!(star),
            icon: Icon(
              star <= value ? Icons.star_rounded : Icons.star_outline_rounded,
              size: 30,
              color: star <= value
                  ? const Color(0xFFF59E0B)
                  : theme.colorScheme.outlineVariant,
            ),
          ),
      ],
    );
  }
}

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

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (var index = 0; index < photos.length; index++)
            SizedBox(
              width: 64,
              height: 64,
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
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
