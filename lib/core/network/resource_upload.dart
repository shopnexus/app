import 'package:dio/dio.dart';

import 'package:shopnexus_flutter_app/api/generated/model/upload_slot.dart';

/// Đẩy bytes lên chỗ mà slot đã ký.
///
/// Phần *reserve* và *confirm* thuộc về module giữ resource — ảnh ticket ở chat,
/// ảnh mở hộp ở order, ảnh CMND ở account — nên chúng ở lại repository của từng
/// module. Nhưng bước PUT thì giống hệt nhau ở mọi nơi, và trước đây nó được
/// chép tay năm lần thành **năm biến thể khác nhau**:
///
/// - bốn chỗ đặt `Content-Type` **hai lần** — một lần trong `slot.headers` mà
///   server trả về, một lần nữa qua `Options(contentType:)` — nên request gửi đi
///   mang header trùng;
/// - hai chỗ đẩy `file.openRead()` (stream mở lười trên file) kèm content-length
///   tự đặt, hai chỗ khác đẩy bytes trong bộ nhớ.
///
/// Một hàm, một cách làm. Header lấy nguyên từ slot: đó là những gì chữ ký đã
/// bao gồm, nên thêm hay đè lên chúng là cách chắc chắn nhất để nhận 403 từ
/// object store.
Future<void> putToSlot(UploadSlot slot, List<int> bytes) async {
  // Dio trần: URL đã ký sẵn cho đúng key và đúng method, và bearer token của sàn
  // không có việc gì ở một object store không phải API này — vài store còn từ
  // chối request mang cả hai.
  await Dio().put<void>(
    slot.url,
    data: Stream<List<int>>.fromIterable([bytes]),
    options: Options(
      headers: <String, dynamic>{
        ...slot.headers,
        Headers.contentLengthHeader: bytes.length,
      },
    ),
  );
}
