import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:shopnexus_flutter_app/core/upload/upload_media.dart';
import 'package:shopnexus_flutter_app/shared/widgets/video_preview.dart';

/// Tấm ảnh người dùng vừa chọn, vẽ được ở mọi nơi app chạy.
///
/// Không có đường nào đi qua `Image.file` ở đây, và đó là cả mục đích của
/// widget này. `Image.file` không vẽ được trên Flutter Web — `XFile.path` ở đó
/// là một `blob:` URL mà `dart:io` File không mở nổi — còn trên Android thì
/// Photo Picker trả về `content://` URI, cũng không phải đường dẫn file. Cả hai
/// chỗ, `XFile.readAsBytes()` vẫn đọc được: ảnh tải lên trót lọt và ô preview
/// thì trống trơn, im lặng, vì `Image.file` ném rồi không ai bắt.
///
/// [bytes] đứng trước [url] vì nó đã nằm sẵn trong bộ nhớ từ lúc upload đọc
/// chúng: có ngay, không cần mạng, không hết hạn. [url] là signed link từ bước
/// confirm, dùng khi màn hình đã buông bytes ra để khỏi giữ mười tấm ảnh trong
/// RAM. Hết cả hai thì vẽ một ô trống có nghĩa — ô trống *im lặng* mới là thứ
/// nói dối rằng không có ảnh nào.
class UploadPreview extends StatelessWidget {
  const UploadPreview({
    super.key,
    this.bytes,
    this.url,
    this.mime,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  /// Bytes của ảnh, thường là thứ vừa được gửi lên.
  final Uint8List? bytes;

  /// Signed url từ `Resource.url`. Rỗng nghĩa là module không ký được link —
  /// theo hợp đồng thì khoá luôn có mặt, giá trị mới là thứ vắng.
  final String? url;

  /// Loại file. Nó quyết định cách vẽ, không phải sự có mặt của [bytes]: bytes
  /// của một `.mp4` đưa cho `Image.memory` chỉ ra một ô lỗi.
  final String? mime;

  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final mime = this.mime;
    final url = this.url;
    final bytes = this.bytes;

    if (mime != null && UploadMedia.isVideo(mime)) {
      return VideoPreview(
        url: url ?? '',
        width: width,
        height: height,
        fit: fit,
      );
    }

    if (bytes != null && bytes.isNotEmpty) {
      return Image.memory(
        bytes,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, _, _) => _blank(context),
      );
    }

    if (url != null && url.isNotEmpty) {
      return Image.network(
        url,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, _, _) => _blank(context),
      );
    }

    return _blank(context);
  }

  Widget _blank(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_outlined,
        size: 18,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
