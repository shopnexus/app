import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';

import 'support/uploader.dart';

/// Ba bước — giữ chỗ, PUT, xác nhận — một lần cho cả năm module.
///
/// Điều quan trọng nhất ở đây là **thứ trả ra**: hợp đồng nói câu trả lời của
/// bước xác nhận mang một `url` đã ký cho đúng bytes vừa lên, và đó là lần duy
/// nhất nó được đưa ra — xác nhận lần hai bị từ chối, còn một id trần thì không
/// có route nào đổi lấy ảnh. Bảy chỗ chép tay trước đây đều vứt nó đi, nên màn
/// nào muốn khoe tấm ảnh vừa tải lên đều không có gì để vẽ.
void main() {
  late List<RequestOptions> calls;
  late Dio dio;
  late ResourceUploader uploader;

  setUp(() {
    calls = [];
    dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = _FakeAdapter((options) async {
        calls.add(options);
        if (options.method == 'PUT') return _json(200, const {});
        if (options.path.endsWith('/confirmation')) {
          return _json(200, {'data': _resource});
        }
        return _json(201, {'data': _slot});
      });
    uploader = uploaderOn(dio);
  });

  /// Đường đi của từng nơi gắn. Resource của một module không đính vào module
  /// khác được, nên nơi gắn quyết định nơi tải lên.
  const routes = {
    UploadTarget.listing: '/listings/uploads',
    UploadTarget.avatar: '/me/uploads',
    UploadTarget.identityDocument: '/me/uploads',
    UploadTarget.order: '/orders/uploads',
    UploadTarget.conversation: '/conversations/uploads',
    UploadTarget.review: '/reviews/uploads',
  };

  for (final entry in routes.entries) {
    test('${entry.key.name} đi đúng hai route của module nó', () async {
      await uploader.upload(
        entry.key,
        bytes: const [1, 2, 3],
        filename: 'a.jpg',
        mime: 'image/jpeg',
      );

      final api = calls.where((c) => c.method != 'PUT').toList();
      expect(api.map((c) => c.path), [
        entry.value,
        '${entry.value}/res_1/confirmation',
      ], reason: 'giữ chỗ rồi xác nhận, đúng thứ tự');
    });
  }

  test('ảnh đại diện và ảnh định danh khác nhau ở kind, không ở route', () async {
    await uploader.upload(
      UploadTarget.avatar,
      bytes: const [1],
      filename: 'a.jpg',
      mime: 'image/jpeg',
    );
    expect(_bodyOf(calls.first)['kind'], 'avatar');

    calls.clear();
    await uploader.upload(
      UploadTarget.identityDocument,
      bytes: const [1],
      filename: 'a.jpg',
      mime: 'image/jpeg',
    );
    // Cùng một store giữ cả hai, và chỉ ảnh đại diện mới được phép resolve ra
    // link công khai — nên server phải biết loại nào trước khi ký.
    expect(_bodyOf(calls.first)['kind'], 'identity');
  });

  test('trả về Resource của bước xác nhận, có url — không phải id của slot', () async {
    final resource = await uploader.upload(
      UploadTarget.conversation,
      bytes: const [1, 2, 3],
      filename: 'a.jpg',
      mime: 'image/jpeg',
    );

    expect(resource.id, 'res_1');
    expect(resource.url, 'https://cdn.example/signed?sig=abc');
  });

  test('PUT vào đúng URL đã ký, mang nguyên header của slot', () async {
    await uploader.upload(
      UploadTarget.listing,
      bytes: const [1, 2, 3],
      filename: 'a.jpg',
      mime: 'image/jpeg',
    );

    final put = calls.singleWhere((c) => c.method == 'PUT');
    expect(put.uri.toString(), 'https://store.example/put?sig=xyz');
    // Chữ ký đã bao gồm những header này; thêm hay đè lên chúng là cách chắc
    // chắn nhất để nhận 403 từ object store.
    expect(put.headers['Content-Type'], 'image/jpeg');
  });

  test('quá ngưỡng thì từ chối trước khi có request nào', () async {
    await expectLater(
      uploader.upload(
        UploadTarget.listing,
        bytes: Uint8List(10 * 1024 * 1024 + 1),
        filename: 'a.jpg',
        mime: 'image/jpeg',
      ),
      throwsA(isA<UploadTooLarge>()),
    );
    // Một vòng lên xuống 10 MB để nhận về một lỗi biết trước là thứ trả bằng
    // pin và 4G của người dùng.
    expect(calls, isEmpty);
  });

  test('video được nới tới 100 MB, ảnh thì không', () async {
    expect(ResourceUploader.limitFor('video/mp4'), 100 * 1024 * 1024);
    expect(ResourceUploader.limitFor('image/jpeg'), 10 * 1024 * 1024);
  });

  test('422 lúc giữ chỗ thành một lỗi gọi được tên', () async {
    dio.httpClientAdapter = _FakeAdapter(
      (options) async => _json(422, {
        'error': {'code': 'unsupported_media_type', 'message': 'no'},
      }),
    );

    await expectLater(
      uploader.upload(
        UploadTarget.listing,
        bytes: const [1],
        filename: 'a.tiff',
        mime: 'image/tiff',
      ),
      throwsA(isA<UploadTypeRejected>()),
    );
  });
}

const _slot = {
  'resource_id': 'res_1',
  'url': 'https://store.example/put?sig=xyz',
  'headers': {'Content-Type': 'image/jpeg'},
  'expires_at': '2026-08-11T13:00:00Z',
};

const _resource = {
  'id': 'res_1',
  'provider': 'local',
  'object_key': 'catalog/listing/abc.jpg',
  'mime': 'image/jpeg',
  'size': 3,
  'checksum': '',
  'url': 'https://cdn.example/signed?sig=abc',
  'url_expires_at': '2026-08-11T14:00:00Z',
};

Map<String, dynamic> _bodyOf(RequestOptions options) {
  final data = options.data;
  if (data is Map<String, dynamic>) return data;
  return jsonDecode(data as String) as Map<String, dynamic>;
}

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this._responder);

  final Future<ResponseBody> Function(RequestOptions) _responder;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) => _responder(options);

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(int status, Map<String, dynamic> body) =>
    ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
