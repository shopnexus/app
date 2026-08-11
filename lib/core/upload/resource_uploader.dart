import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upload_slot.dart';
import 'package:shopnexus_flutter_app/core/network/resource_upload.dart';

part 'resource_uploader.g.dart';

/// Chỗ tấm ảnh sẽ được gắn vào, và cũng là module giữ nó.
///
/// Bytes không bao giờ đi qua API: mọi upload đều là giữ chỗ, PUT vào một URL đã
/// ký, rồi xác nhận. Chỉ *prefix* là khác nhau theo module — resource của một
/// module không đính vào module khác được, nên nơi gắn quyết định nơi tải lên.
///
/// [avatar] và [identityDocument] cùng đi qua `POST /me/uploads` mà vẫn là hai giá
/// trị: server phải biết nó đang ký cho loại nào **trước khi** một byte di chuyển,
/// vì chỉ ảnh đại diện mới được phép resolve ra một link công khai.
enum UploadTarget {
  listing,
  avatar,
  identityDocument,
  order,
  conversation,
  review,
}

/// Tấm ảnh lớn hơn ngưỡng của loại nó. Ném trước khi có request nào: một vòng
/// lên xuống 10 MB để nhận về một lỗi biết trước là thứ trả bằng pin và 4G của
/// người dùng.
class UploadTooLarge implements Exception {
  const UploadTooLarge({required this.bytes, required this.limit});

  final int bytes;
  final int limit;

  @override
  String toString() =>
      'Ảnh lớn hơn ${limit ~/ (1024 * 1024)} MB (${bytes ~/ (1024 * 1024)} MB).';
}

/// Loại file sàn không lưu. Đây là 422 của server, đặt tên lại để phía gọi không
/// phải đọc mã lỗi trong một `DioException`.
class UploadTypeRejected implements Exception {
  const UploadTypeRejected(this.mime);

  final String mime;

  @override
  String toString() => 'Định dạng $mime không được nhận.';
}

/// Ba bước của một upload, một lần, cho cả năm module.
///
/// Trả về **`Resource` đã xác nhận**, không phải mỗi id — và đó là lý do lớp này
/// tồn tại. Hợp đồng nói: câu trả lời của bước xác nhận mang một `url` đã ký cho
/// đúng những bytes vừa lên, *và đó là lần duy nhất nó được đưa ra*; xác nhận lần
/// hai bị từ chối, còn một id trần thì không có route nào đổi lấy ảnh. Bảy chỗ
/// chép tay trước đây đều vứt câu trả lời đó đi, nên màn nào muốn khoe tấm ảnh vừa
/// tải lên đều không có gì để vẽ.
class ResourceUploader {
  ResourceUploader({
    required AccountApi account,
    required CatalogApi catalog,
    required ChatApi chat,
    required OrderApi order,
    required TrustApi trust,
    Dio? storeClient,
  }) : _storeClient = storeClient,
       _account = account,
       _catalog = catalog,
       _chat = chat,
       _order = order,
       _trust = trust;

  final AccountApi _account;
  final CatalogApi _catalog;
  final ChatApi _chat;
  final OrderApi _order;
  final TrustApi _trust;

  /// Client dùng cho bước PUT. Null là một Dio trần dựng tại chỗ — đúng thứ cần
  /// khi chạy thật, vì object store không phải API này; test thì đưa vào một
  /// client giả để bước PUT cũng được nhìn thấy.
  final Dio? _storeClient;

  /// Ngưỡng của server, kiểm ở đây để khỏi phải đi hỏi. Một giới hạn phụ thuộc
  /// vào loại file thì không viết thành một con số được.
  static const _videoLimit = 100 * 1024 * 1024;
  static const _otherLimit = 10 * 1024 * 1024;

  static int limitFor(String mime) =>
      mime.startsWith('video/') ? _videoLimit : _otherLimit;

  Future<Resource> upload(
    UploadTarget target, {
    required List<int> bytes,
    required String filename,
    required String mime,
  }) async {
    final limit = limitFor(mime);
    if (bytes.length > limit) {
      throw UploadTooLarge(bytes: bytes.length, limit: limit);
    }

    final UploadSlot slot;
    try {
      slot = await _reserve(target, filename: filename, mime: mime, size: bytes.length);
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) throw UploadTypeRejected(mime);
      rethrow;
    }

    await putToSlot(slot, bytes, client: _storeClient);

    return _confirm(target, slot.resourceId);
  }

  Future<UploadSlot> _reserve(
    UploadTarget target, {
    required String filename,
    required String mime,
    required int size,
  }) async {
    // `/me/uploads` nhận thêm `kind`; bốn route kia dùng chung một request body.
    if (target == UploadTarget.avatar ||
        target == UploadTarget.identityDocument) {
      final response = await _account.meUploadsPost(
        accountCreateUploadRequest: AccountCreateUploadRequest(
          filename: filename,
          mime: mime,
          size: size,
          kind: target == UploadTarget.avatar
              ? AccountCreateUploadRequestKindEnum.avatar
              : AccountCreateUploadRequestKindEnum.identity,
        ),
      );
      return _slotOf(response.data?.data);
    }

    final request = CreateUploadRequest(
      filename: filename,
      mime: mime,
      size: size,
    );
    final response = switch (target) {
      UploadTarget.listing => await _catalog.listingsUploadsPost(
        createUploadRequest: request,
      ),
      UploadTarget.order => await _order.ordersUploadsPost(
        createUploadRequest: request,
      ),
      UploadTarget.conversation => await _chat.conversationsUploadsPost(
        createUploadRequest: request,
      ),
      UploadTarget.review => await _trust.reviewsUploadsPost(
        createUploadRequest: request,
      ),
      // Đã xử lý ở trên; nhánh này giữ cho `switch` là exhaustive.
      UploadTarget.avatar || UploadTarget.identityDocument => throw StateError(
        'unreachable',
      ),
    };
    return _slotOf(response.data?.data);
  }

  Future<Resource> _confirm(UploadTarget target, String resourceId) async {
    final response = switch (target) {
      UploadTarget.listing => await _catalog.listingsUploadsIdConfirmationPost(
        id: resourceId,
      ),
      UploadTarget.avatar ||
      UploadTarget.identityDocument => await _account
          .meUploadsIdConfirmationPost(id: resourceId),
      UploadTarget.order => await _order.ordersUploadsIdConfirmationPost(
        id: resourceId,
      ),
      UploadTarget.conversation => await _chat
          .conversationsUploadsIdConfirmationPost(id: resourceId),
      UploadTarget.review => await _trust.reviewsUploadsIdConfirmationPost(
        id: resourceId,
      ),
    };
    final resource = response.data?.data;
    if (resource == null) {
      throw StateError('empty confirmation response');
    }
    return resource;
  }

  static UploadSlot _slotOf(UploadSlot? slot) {
    if (slot == null) throw StateError('empty upload slot');
    return slot;
  }
}

@riverpod
ResourceUploader resourceUploader(Ref ref) => ResourceUploader(
  account: ref.watch(accountApiProvider),
  catalog: ref.watch(catalogApiProvider),
  chat: ref.watch(chatApiProvider),
  order: ref.watch(orderApiProvider),
  trust: ref.watch(trustApiProvider),
);
