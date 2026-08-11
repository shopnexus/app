import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';
import 'package:shopnexus_flutter_app/core/upload/upload_media.dart';

/// Bốn bản `_mimeFor` chép tay, mỗi bản một allowlist tưởng tượng, và cả bốn
/// đều kết bằng `return 'image/jpeg'`. Một `.mp4` đi qua đó ra khỏi máy dưới
/// nhãn `image/jpeg` — server từ chối, và câu từ chối nói về một thứ người dùng
/// không hề chọn. `.gif` và `.heic` cũng thế: hai bản cũ trả về đúng hai chuỗi
/// đó, không chuỗi nào nằm trong danh sách store nhận.
///
/// Allowlist ở đây chép từ `openapi.gen.yaml`: nó là của object store nên mọi
/// route upload nhận đúng một tập, còn client mời cái nào là chuyện của client.
void main() {
  group('mime đọc từ tên file', () {
    test('ảnh sàn nhận', () {
      expect(UploadMedia.mimeFor('a.jpg'), 'image/jpeg');
      expect(UploadMedia.mimeFor('a.jpeg'), 'image/jpeg');
      expect(UploadMedia.mimeFor('a.png'), 'image/png');
      expect(UploadMedia.mimeFor('a.webp'), 'image/webp');
      expect(UploadMedia.mimeFor('hoa-don.pdf'), 'application/pdf');
    });

    test('video sàn nhận, gồm cả .mov của iPhone', () {
      expect(UploadMedia.mimeFor('clip.mp4'), 'video/mp4');
      expect(UploadMedia.mimeFor('IMG_0042.MOV'), 'video/quicktime');
      expect(UploadMedia.mimeFor('clip.webm'), 'video/webm');
    });

    test('đuôi lạ trả về null chứ không giả làm jpeg', () {
      // Đây là chỗ `.mp4` từng biến thành `image/jpeg`. Null để phía gọi nói
      // được "định dạng không nhận" mà không phải đi một vòng lên server.
      expect(UploadMedia.mimeFor('a.gif'), isNull);
      expect(UploadMedia.mimeFor('a.heic'), isNull);
      expect(UploadMedia.mimeFor('a.tiff'), isNull);
      expect(UploadMedia.mimeFor('khong-co-duoi'), isNull);
    });

    test('mime platform khai báo được ưu tiên, nhưng vẫn phải nằm trong list', () {
      expect(
        UploadMedia.mimeFor('blob', declared: 'video/mp4'),
        'video/mp4',
      );
      // Web hay trả 'application/octet-stream' cho blob; tên file mới là thứ
      // biết rõ hơn.
      expect(
        UploadMedia.mimeFor('clip.mp4', declared: 'application/octet-stream'),
        'video/mp4',
      );
      expect(UploadMedia.mimeFor('x.bin', declared: 'image/tiff'), isNull);
    });

    test('đuôi không phân biệt hoa thường', () {
      expect(UploadMedia.mimeFor('A.PNG'), 'image/png');
      expect(UploadMedia.mimeFor('CLIP.MP4'), 'video/mp4');
    });
  });

  group('video là một loại riêng, không phải một ngoại lệ', () {
    test('isVideo', () {
      expect(UploadMedia.isVideo('video/mp4'), isTrue);
      expect(UploadMedia.isVideo('video/quicktime'), isTrue);
      expect(UploadMedia.isVideo('image/png'), isFalse);
      expect(UploadMedia.isVideo('application/pdf'), isFalse);
    });

    test('ngưỡng dung lượng đi theo loại, đúng như hợp đồng', () {
      expect(ResourceUploader.limitFor('video/mp4'), 100 * 1024 * 1024);
      expect(ResourceUploader.limitFor('image/png'), 10 * 1024 * 1024);
    });

    test('câu báo vượt ngưỡng nói đúng ngưỡng của loại đó', () {
      // 'Ảnh lớn hơn 10 MB' cho một video 120 MB là một câu sai hai lần.
      expect(
        UploadMedia.tooLargeMessage('video/mp4'),
        'Video lớn hơn 100 MB',
      );
      expect(UploadMedia.tooLargeMessage('image/png'), 'Ảnh lớn hơn 10 MB');
    });
  });

  test('allowlist khớp openapi.gen.yaml', () {
    expect(UploadMedia.allowed, {
      'image/jpeg',
      'image/png',
      'image/webp',
      'application/pdf',
      'video/mp4',
      'video/quicktime',
      'video/webm',
    });
  });
}
