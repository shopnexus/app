import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Một ảnh đã lên tới nơi: file cục bộ để vẽ, và id của resource đã confirm.
class Attachment {
  const Attachment({required this.file, required this.resourceId});

  final File file;
  final String resourceId;
}

/// Chọn ảnh, tải lên ngay, rồi mới hiện ra.
///
/// Trước đây ba màn của app đều gom ảnh lại rồi tải hết lúc bấm Gửi. Hệ quả:
/// chọn ảnh xong **không có gì xảy ra** — không request, không tiến trình — rồi
/// lúc gửi thì đứng chờ n lần tải liên tiếp sau một cái spinner duy nhất, và một
/// ảnh hỏng làm hỏng cả yêu cầu chứ không phải chỉ mình nó.
///
/// Tải ngay lúc chọn đổi cả hai: tới lúc bấm Gửi thì mọi thứ đã là resource đã
/// confirm, còn ảnh nào hỏng thì đơn giản là không vào danh sách.
class AttachmentPicker extends StatefulWidget {
  const AttachmentPicker({
    super.key,
    required this.attachments,
    required this.onChanged,
    required this.upload,
    this.max = 10,
    this.enabled = true,
  });

  final List<Attachment> attachments;
  final ValueChanged<List<Attachment>> onChanged;

  /// Tải một ảnh lên module sở hữu nó, trả về resource id đã confirm. Mỗi màn
  /// truyền route của module mình — một ảnh của ticket không resolve được ở
  /// module order, và ngược lại.
  final Future<String> Function(File file, String mime) upload;

  final int max;
  final bool enabled;

  @override
  State<AttachmentPicker> createState() => _AttachmentPickerState();
}

class _AttachmentPickerState extends State<AttachmentPicker> {
  final _picker = ImagePicker();
  int _uploading = 0;

  Future<void> _pick() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isEmpty) return;

    final room = widget.max - widget.attachments.length;
    for (final file in picked.take(room)) {
      setState(() => _uploading++);
      try {
        final id = await widget.upload(File(file.path), 'image/jpeg');
        if (!mounted) return;
        widget.onChanged([
          ...widget.attachments,
          Attachment(file: File(file.path), resourceId: id),
        ]);
      } catch (_) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Không tải được ${file.name}')));
      } finally {
        if (mounted) setState(() => _uploading--);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final busy = _uploading > 0;
    final full = widget.attachments.length + _uploading >= widget.max;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var index = 0; index < widget.attachments.length; index++)
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    widget.attachments[index].file,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.enabled)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: IconButton(
                      iconSize: 18,
                      icon: const Icon(Icons.cancel_rounded),
                      color: theme.colorScheme.error,
                      onPressed: () => widget.onChanged(
                        [...widget.attachments]..removeAt(index),
                      ),
                    ),
                  ),
              ],
            ),
          ),

        // Một ô cho mỗi ảnh đang lên, để việc "đang chạy" nhìn thấy được thay vì
        // phải tin là có.
        for (var i = 0; i < _uploading; i++)
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.colorScheme.surfaceContainerHighest,
            ),
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),

        if (widget.enabled && !full)
          InkWell(
            onTap: busy ? null : _pick,
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
