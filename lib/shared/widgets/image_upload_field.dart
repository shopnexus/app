import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';
import 'package:shopnexus_flutter_app/core/upload/upload_media.dart';
import 'package:shopnexus_flutter_app/shared/widgets/upload_preview.dart';
import 'package:shopnexus_flutter_app/shared/widgets/video_preview.dart';

/// Một tệp trong dải, ở một trong ba trạng thái.
///
/// [bytes] còn nguyên sau khi tải xong, và đó là chủ ý: ảnh cục bộ hiện ra ngay
/// lúc chọn, còn [resource] tới sau vài trăm mili giây — vẽ theo bytes rồi mới
/// đổi sang ảnh trên server là cách duy nhất để không có một ô trống ở giữa.
/// Vẽ theo *bytes* chứ không theo `file.path`: `Image.file` không chạy trên
/// web, nơi path là một `blob:` URL.
class UploadingPhoto {
  const UploadingPhoto({
    required this.file,
    required this.mime,
    this.bytes,
    this.resource,
    this.error,
  });

  final XFile file;

  /// Null nghĩa là sàn không lưu loại này.
  final String? mime;

  /// Bytes để vẽ. Video không dùng tới — nó cần link đã ký để dựng khung hình
  /// đầu, nên đọc cả trăm MB vào RAM là vô ích.
  final Uint8List? bytes;

  /// Có giá trị khi bytes đã tới nơi và server đã xác nhận. `url` của nó là link
  /// đã ký cho đúng những bytes vừa lên — thứ duy nhất vẽ được tấm ảnh đó từ
  /// phía server.
  final Resource? resource;

  final String? error;

  bool get isUploading => resource == null && error == null;

  bool get isVideo => mime != null && UploadMedia.isVideo(mime!);

  UploadingPhoto copyWith({Uint8List? bytes, Resource? resource, String? error}) =>
      UploadingPhoto(
        file: file,
        mime: mime,
        bytes: bytes ?? this.bytes,
        resource: resource,
        error: error,
      );
}

/// Dải ảnh dùng chung cho mọi chỗ đính kèm: ảnh mở hộp, bằng chứng hoàn tiền,
/// ảnh sản phẩm, ảnh đánh giá, ảnh giấy tờ.
///
/// Bốn màn từng tự dựng lại dải này, mỗi màn một cách báo đang tải và một cách
/// báo lỗi, và không màn nào cho thử lại một ảnh hỏng — đường duy nhất là xoá rồi
/// chọn lại từ đầu.
///
/// [onChanged] nhận **[Resource] đã xác nhận**, không phải id: phía gọi lấy `.id`
/// cho request đính kèm, và `.url` nếu muốn vẽ lại ảnh ở chỗ khác.
class ImageUploadField extends ConsumerStatefulWidget {
  const ImageUploadField({
    super.key,
    required this.target,
    required this.onChanged,
    this.maxPhotos = 10,
    this.enabled = true,
  });

  /// Chỗ ảnh sẽ được gắn vào. Resource của một module không đính vào module khác
  /// được, nên đây là thứ quyết định route tải lên.
  final UploadTarget target;

  /// Chỉ những ảnh đã xác nhận, theo đúng thứ tự người dùng chọn.
  final ValueChanged<List<Resource>> onChanged;

  final int maxPhotos;
  final bool enabled;

  @override
  ConsumerState<ImageUploadField> createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends ConsumerState<ImageUploadField> {
  final _picker = ImagePicker();
  final List<UploadingPhoto> _photos = [];

  bool get _hasRoom => _photos.length < widget.maxPhotos;

  void _publish() => widget.onChanged([
    for (final photo in _photos)
      if (photo.resource case final resource?) resource,
  ]);

  Future<void> _pick() async {
    // Ảnh và video trong cùng một lần chọn; `imageQuality` chỉ chạm vào ảnh.
    final picked = await _picker.pickMultipleMedia(
      maxWidth: 1600,
      imageQuality: 85,
    );
    if (picked.isEmpty || !mounted) return;

    final accepted = picked.take(widget.maxPhotos - _photos.length).toList();
    setState(() {
      _photos.addAll(
        accepted.map(
          (file) => UploadingPhoto(
            file: file,
            mime: UploadMedia.mimeFor(file.name, declared: file.mimeType),
          ),
        ),
      );
    });

    // Song song: mười ảnh không có lý do gì phải xếp hàng, và một cái hỏng không
    // được làm chín cái kia dừng lại.
    await Future.wait(accepted.map(_upload));
  }

  Future<void> _upload(XFile file) async {
    final mime = UploadMedia.mimeFor(file.name, declared: file.mimeType);
    if (mime == null) {
      _patch(file, (photo) => photo.copyWith(error: 'Định dạng không nhận'));
      return;
    }

    try {
      final bytes = await file.readAsBytes();
      // Ô có gì để vẽ ngay từ đây, trước khi byte nào rời máy. Video thì không:
      // nó chờ link đã ký.
      if (!UploadMedia.isVideo(mime)) {
        _patch(file, (photo) => photo.copyWith(bytes: bytes));
      }
      final resource = await ref
          .read(resourceUploaderProvider)
          .upload(
            widget.target,
            bytes: bytes,
            filename: file.name,
            mime: mime,
          );
      _patch(file, (photo) => photo.copyWith(resource: resource));
    } on UploadTooLarge catch (e) {
      _patch(file, (photo) => photo.copyWith(error: e.toString()));
    } on UploadTypeRejected {
      _patch(file, (photo) => photo.copyWith(error: 'Định dạng không nhận'));
    } catch (_) {
      // Ngắn có chủ đích: câu này nằm trong một ô 72px. Việc phải làm là bấm
      // thử lại, và nút đó ở ngay cạnh.
      _patch(file, (photo) => photo.copyWith(error: 'Tải lên thất bại'));
    }
  }

  /// Thử lại đúng một ảnh. Chín ảnh kia giữ nguyên trạng thái của chúng.
  Future<void> _retry(XFile file) async {
    setState(() {
      final index = _photos.indexWhere((p) => p.file.path == file.path);
      if (index >= 0) {
        _photos[index] = UploadingPhoto(
          file: file,
          mime: UploadMedia.mimeFor(file.name, declared: file.mimeType),
        );
      }
    });
    await _upload(file);
  }

  void _patch(XFile file, UploadingPhoto Function(UploadingPhoto) change) {
    if (!mounted) return;
    setState(() {
      final index = _photos.indexWhere((p) => p.file.path == file.path);
      if (index >= 0) _photos[index] = change(_photos[index]);
    });
    _publish();
  }

  void _remove(int index) {
    setState(() => _photos.removeAt(index));
    _publish();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var index = 0; index < _photos.length; index++)
          _Tile(
            photo: _photos[index],
            onRemove: widget.enabled ? () => _remove(index) : null,
            onRetry: widget.enabled
                ? () => _retry(_photos[index].file)
                : null,
          ),
        if (widget.enabled && _hasRoom) _AddTile(onTap: _pick),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.photo, this.onRemove, this.onRetry});

  final UploadingPhoto photo;
  final VoidCallback? onRemove;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final failed = photo.error != null;

    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              // Ô 72px không xem video được; chạm vào mở trình phát đầy đủ.
              onTap: photo.isVideo && (photo.resource?.url.isNotEmpty ?? false)
                  ? () => VideoPlayerDialog.show(context, photo.resource!.url)
                  : null,
              child: UploadPreview(
                bytes: photo.bytes,
                url: photo.resource?.url,
                mime: photo.mime,
              ),
            ),
          ),
          if (photo.isUploading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(90),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (failed)
            Positioned.fill(
              child: GestureDetector(
                onTap: onRetry,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error.withAlpha(200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh_rounded,
                        size: 18,
                        color: theme.colorScheme.onError,
                      ),
                      Text(
                        'Thử lại',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9,
                          color: theme.colorScheme.onError,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (onRemove != null)
            Positioned(
              top: -6,
              right: -6,
              child: IconButton(
                iconSize: 18,
                icon: const Icon(Icons.cancel_rounded),
                color: theme.colorScheme.error,
                onPressed: onRemove,
              ),
            ),
        ],
      ),
    );
  }
}

class _AddTile extends StatelessWidget {
  const _AddTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
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
    );
  }
}

/// `XFile.mimeType` là null cho ảnh chụp từ camera trên vài thiết bị, và
/// `CreateUploadRequest.mime` là bắt buộc.
