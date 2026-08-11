import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/shared/widgets/image_upload_field.dart';

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

  /// Resource đã xác nhận. Ảnh đi lên ngay lúc chọn — route đính kèm chỉ nhận
  /// resource *đã* confirm, và một ảnh hỏng phải hỏng một mình chứ không kéo cả
  /// lần nộp theo.
  List<Resource> _photos = const [];
  bool _submitting = false;

  Future<void> _submit() async {
    setState(() => _submitting = true);
    try {
      await ref
          .read(refundActionsProvider.notifier)
          .addAttachments(widget.refundId, [
            for (final photo in _photos) photo.id,
          ]);
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
            ImageUploadField(
              target: UploadTarget.order,
              maxPhotos: _maxPhotos,
              enabled: !_submitting,
              onChanged: (photos) => setState(() => _photos = photos),
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
