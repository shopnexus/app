/// Loại file sàn lưu, và cách gọi tên loại của một file người dùng vừa chọn.
///
/// Allowlist là của object store, không của riêng module nào: mọi route upload
/// nhận đúng một tập, còn mời cái nào là chuyện của từng màn hình. Chép từ
/// `openapi.gen.yaml` — thứ ngoài danh sách này là 422 bất kể dung lượng.
///
/// Trước đây bốn màn hình mỗi màn giữ một bản đoán mime riêng, và cả bốn đều
/// kết bằng `return 'image/jpeg'`. Một `.mp4` vì thế rời máy dưới nhãn ảnh, rồi
/// bị từ chối bằng một câu nói về định dạng người dùng không hề chọn.
library;

class UploadMedia {
  const UploadMedia._();

  static const Set<String> allowed = {
    'image/jpeg',
    'image/png',
    'image/webp',
    'application/pdf',
    'video/mp4',
    'video/quicktime',
    'video/webm',
  };

  static bool isVideo(String mime) => mime.startsWith('video/');

  /// Loại của [filename], hoặc null nếu sàn không nhận nó.
  ///
  /// [declared] là thứ platform tự khai (`XFile.mimeType`) — hay null trên
  /// Android và hay là `application/octet-stream` trên web, nên phần đuôi tên
  /// file được hỏi trước và chỉ rơi về [declared] khi đuôi không nói gì.
  ///
  /// Null chứ không phải một mặc định: đoán bừa thì lỗi rơi xuống server và
  /// quay về dưới dạng một câu nói sai tên định dạng.
  static String? mimeFor(String filename, {String? declared}) {
    final byExtension = _byExtension[_extensionOf(filename)];
    if (byExtension != null) return byExtension;

    final normalised = declared?.toLowerCase().trim();
    if (normalised != null && allowed.contains(normalised)) return normalised;

    return null;
  }

  /// Câu báo vượt ngưỡng, nói đúng ngưỡng của loại vừa chọn — "Ảnh lớn hơn
  /// 10 MB" cho một video 120 MB là một câu sai cả về loại lẫn về ngưỡng.
  static String tooLargeMessage(String mime) =>
      isVideo(mime) ? 'Video lớn hơn 100 MB' : 'Ảnh lớn hơn 10 MB';

  /// Cái người dùng gọi loại này là gì, để ghép vào câu thông báo.
  static String nounFor(String mime) => isVideo(mime) ? 'Video' : 'Ảnh';

  static String _extensionOf(String filename) {
    final dot = filename.lastIndexOf('.');
    if (dot < 0 || dot == filename.length - 1) return '';
    return filename.substring(dot + 1).toLowerCase();
  }

  static const Map<String, String> _byExtension = {
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'webp': 'image/webp',
    'pdf': 'application/pdf',
    'mp4': 'video/mp4',
    'mov': 'video/quicktime',
    'webm': 'video/webm',
  };
}
