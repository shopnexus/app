import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';

/// Bổ sung ảnh cho một vụ việc đang mở.
///
/// Màn tạo yêu cầu vẫn hứa "bạn có thể bổ sung ảnh bằng chứng ở trang chi tiết
/// sau khi gửi", nhưng trang chi tiết chưa từng có chỗ để làm việc đó —
/// `addAttachments` đã nằm sẵn trong provider mà không widget nào gọi.
///
/// Cả hai bên nộp được, không riêng người mua: server không thu hẹp route này về
/// một phía, và người bán cãi lại một khiếu nại thì cũng cần đưa ảnh của họ.
class RefundEvidenceSheet extends ConsumerStatefulWidget {
  const RefundEvidenceSheet({super.key, required this.refundId});

  final String refundId;

  /// Trả về `true` khi đã nộp được, để người gọi nạp lại vụ việc.
  static Future<bool?> show(BuildContext context, {required String refundId}) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RefundEvidenceSheet(refundId: refundId),
    );
  }

  @override
  ConsumerState<RefundEvidenceSheet> createState() =>
      _RefundEvidenceSheetState();
}

class _RefundEvidenceSheetState extends ConsumerState<RefundEvidenceSheet> {
  static const _maxPhotos = 10;

  final _picker = ImagePicker();
  final List<File> _photos = [];
  bool _submitting = false;

  Future<void> _pick() async {
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
    try {
      final repository = ref.read(accountRepositoryProvider);
      // Tải lên trước, rồi mới gắn: route đính kèm chỉ nhận resource đã confirm,
      // nên một ảnh hỏng phải làm hỏng cả lần nộp chứ không được gửi danh sách thiếu.
      final ids = <String>[];
      for (final photo in _photos) {
        ids.add(
          await repository.uploadOrderEvidence(
            bytes: await photo.readAsBytes(),
            filename: photo.uri.pathSegments.last,
            mime: 'image/jpeg',
          ),
        );
      }
      await ref
          .read(refundActionsProvider.notifier)
          .addAttachments(widget.refundId, ids);
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ErrorHandler.getErrorMessage(e))));
    }
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
              'Bổ sung bằng chứng',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ảnh bạn thêm sẽ nằm trong hồ sơ vụ việc, và là thứ ShopNexus xem '
              'khi phải ra quyết định.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var index = 0; index < _photos.length; index++)
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(_photos[index], fit: BoxFit.cover),
                        ),
                        if (!_submitting)
                          Positioned(
                            top: -6,
                            right: -6,
                            child: IconButton(
                              iconSize: 18,
                              icon: const Icon(Icons.cancel_rounded),
                              color: theme.colorScheme.error,
                              onPressed: () =>
                                  setState(() => _photos.removeAt(index)),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (!_submitting && _photos.length < _maxPhotos)
                  InkWell(
                    onTap: _pick,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: theme.colorScheme.outlineVariant,
                        ),
                      ),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _photos.isEmpty || _submitting ? null : _submit,
                child: Text(_submitting ? 'Đang gửi…' : 'Gửi bằng chứng'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
