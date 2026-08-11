import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/listing_composer_repository.dart';
import 'package:shopnexus_flutter_app/shared/widgets/upload_preview.dart';

import 'support/recording_backend.dart';
import 'support/uploader.dart';

/// Ảnh vừa chọn không bao giờ được vẽ qua `Image.file`.
///
/// `Image.file` không chạy trên Flutter Web: ở đó `XFile.path` là một
/// `blob:` URL và `dart:io` File không mở được nó. Ảnh vẫn *tải lên* bình
/// thường vì `XFile.readAsBytes()` fetch được cái blob — nên người bán thấy
/// upload trả về đủ `{id, object_key, url}` mà ô preview thì trống trơn, không
/// spinner, không lỗi: `Image.file` ném FileSystemException và không chỗ nào
/// đặt `errorBuilder`. Cùng triệu chứng với content:// URI mà Android Photo
/// Picker trả về, nơi `readAsBytes` cũng chạy còn `File(path)` thì không.
///
/// Bytes đã nằm trong tay từ lúc upload đọc chúng, nên preview vẽ thẳng từ đó.
void main() {
  // 1x1 PNG — đủ để `Image.memory` có thứ thật để giải mã.
  final png = base64Decode(
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
  );

  Widget host(Widget child) => MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(width: 92, height: 92, child: child),
      ),
    ),
  );

  ImageProvider providerIn(WidgetTester tester) =>
      tester.widget<Image>(find.byType(Image)).image;

  group('UploadPreview vẽ được trên mọi nền tảng', () {
    testWidgets('bytes vẽ thẳng từ bộ nhớ, không đi qua file', (tester) async {
      await tester.pumpWidget(host(UploadPreview(bytes: png)));

      expect(providerIn(tester), isA<MemoryImage>());
      expect(tester.takeException(), isNull);
    });

    testWidgets('hết bytes thì rơi về link đã ký', (tester) async {
      await tester.pumpWidget(
        host(const UploadPreview(url: 'https://cdn.example/signed?sig=abc')),
      );

      expect(providerIn(tester), isA<NetworkImage>());
      // Test binding trả 400 cho mọi request ảnh; cái đang xét là widget chọn
      // đường nào, không phải mạng có tới không.
      tester.takeException();
    });

    testWidgets('bytes thắng link — có sẵn ngay, không hết hạn', (
      tester,
    ) async {
      await tester.pumpWidget(
        host(UploadPreview(bytes: png, url: 'https://cdn.example/signed')),
      );

      expect(providerIn(tester), isA<MemoryImage>());
    });

    testWidgets('không có gì thì vẽ ô trống có nghĩa, không ném', (
      tester,
    ) async {
      await tester.pumpWidget(host(const UploadPreview()));

      expect(find.byType(Image), findsNothing);
      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('url rỗng là "chưa có link", đúng như hợp đồng Resource', (
      tester,
    ) async {
      // `Resource.url` là chuỗi rỗng khi module không ký được link.
      await tester.pumpWidget(host(const UploadPreview(url: '')));

      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('video vẽ ra thứ khác ảnh', () {
    testWidgets('video đã có link dựng khung hình đầu, không dựng Image', (
      tester,
    ) async {
      await tester.pumpWidget(
        host(
          const UploadPreview(
            mime: 'video/mp4',
            url: 'https://cdn.example/clip.mp4',
          ),
        ),
      );
      await tester.pump();

      // Không có plugin trong test binding nên `initialize()` hỏng — và một ô
      // hỏng vẫn phải là một ô đọc được, không phải một exception đỏ.
      expect(find.byType(Image), findsNothing);
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('video chưa có link nói là đang tải lên', (tester) async {
      await tester.pumpWidget(
        host(const UploadPreview(mime: 'video/mp4')),
      );
      await tester.pump();

      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('bytes không biến một video thành ảnh', (tester) async {
      // Bytes của một mp4 mà đưa cho `Image.memory` thì ra ô lỗi. Loại quyết
      // định cách vẽ, không phải sự có mặt của bytes.
      await tester.pumpWidget(
        host(UploadPreview(bytes: png, mime: 'video/mp4')),
      );
      await tester.pump();

      expect(find.byType(Image), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('mime ảnh vẫn đi đường cũ', (tester) async {
      await tester.pumpWidget(
        host(UploadPreview(bytes: png, mime: 'image/png')),
      );

      expect(providerIn(tester), isA<MemoryImage>());
    });
  });

  group('màn đăng sản phẩm giữ lại được link đã ký', () {
    test('uploadPhoto trả về cả Resource, không chỉ mỗi id', () async {
      final backend = RecordingBackend(
        (request) => request.path.endsWith('/confirmation')
            ? {'data': _resource}
            : {'data': _slot},
      );
      final repository = ListingComposerRepository(
        CatalogApi(backend.dio),
        AccountApi(backend.dio),
        // Bước PUT cũng đi qua dio đã ghi âm, thay vì ra mạng thật.
        uploaderOn(backend.dio),
      );

      final resource = await repository.uploadPhoto(
        bytes: png,
        filename: 'a.png',
        mime: 'image/png',
      );

      // Lần duy nhất server đưa ra signed url là ở bước confirm. Vứt nó đi thì
      // không route nào đổi id trần lấy được ảnh.
      expect(resource.id, 'res_1');
      expect(resource.url, 'https://cdn.example/signed?sig=abc');
    });
  });
}

const _slot = {
  'resource_id': 'res_1',
  'url': 'https://store.example/put?sig=xyz',
  'headers': {'Content-Type': 'image/png'},
  'expires_at': '2026-08-11T13:00:00Z',
};

const _resource = {
  'id': 'res_1',
  'provider': 'local',
  'object_key': 'catalog/listing/abc.png',
  'mime': 'image/png',
  'size': 3,
  'checksum': '',
  'url': 'https://cdn.example/signed?sig=abc',
  'url_expires_at': '2026-08-11T14:00:00Z',
};
