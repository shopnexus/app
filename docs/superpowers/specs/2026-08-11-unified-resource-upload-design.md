# Gộp upload tài nguyên về một đường

Ngày: 2026-08-11

## Vấn đề

Sàn có đúng **một** cách đưa bytes lên: giữ chỗ (`POST /{module}/uploads`), PUT vào
signed URL, rồi xác nhận (`POST /{module}/uploads/{id}/confirmation`). Chỉ có prefix
là khác nhau theo module — `listings`, `me`, `orders`, `conversations`, `reviews`.

Trong app, ba bước đó được chép tay **bảy lần**:

| File | Method | Module |
|---|---|---|
| `features/seller/data/repositories/listing_composer_repository.dart` | `uploadPhoto` | catalog |
| `features/account/data/repositories/account_repository.dart` | `uploadAvatar` | account |
| `features/account/data/repositories/account_repository.dart` | `uploadOrderEvidence` | order |
| `features/kyc/data/repositories/kyc_repository.dart` | `uploadKycScan` | account |
| `features/chat/data/repositories/chat_repository.dart` | `uploadAttachment` | chat |
| `features/ticket/data/repositories/ticket_repository.dart` | `uploadAttachment` | chat |
| `features/account/data/repositories/rating_repository.dart` | `uploadReviewPhoto` | trust |

Bước PUT đã được gom vào `core/network/resource_upload.dart#putToSlot` từ trước —
đó là bằng chứng rằng phần còn lại cũng gom được, chứ không phải lý do để dừng ở đó.

**Và cả bảy chỗ đều vứt đi câu trả lời của bước xác nhận.** Hợp đồng nói rất rõ về
câu trả lời đó:

> The answer carries a signed `url` for the bytes just uploaded. That is the only
> time it is handed over unasked: a second confirmation is refused, and the resource
> is otherwise only seen through whatever it gets attached to.

Nên sau khi upload xong, app chỉ còn một cái id — và không có route nào đổi một id
trần lấy ảnh (`internal/gateway/router.go`: *"No /resources or /options routes"*).
Màn nào muốn khoe tấm ảnh vừa tải lên thì không có gì để vẽ. Đó là báo cáo "upload
xong show ảnh rỗng", ở cả bốn nhóm màn: chat, đăng bán, avatar/KYC, đánh giá/hoàn tiền.

Phía UI thì bốn màn tự dựng lại cùng một dải thumbnail — `listing_suggestion_screen`,
`confirm_receipt_sheet`, `refund_evidence_sheet`, `kyc_card_picker_widget` — mỗi màn
một cách báo lỗi, một cách báo đang tải, và không màn nào cho thử lại một ảnh hỏng.

## Mục tiêu

Một đường cho phần dữ liệu, một widget cho phần nhìn, và tấm ảnh vừa tải lên luôn
hiện ra được.

## Ngoài phạm vi

- Không đổi hợp đồng API. Năm prefix vẫn là năm prefix; đây là chuyện của client.
- Không đổi cách các route *đính kèm* nhận resource — chúng vẫn nhận id, và id vẫn
  là thứ caller gửi đi.
- Không đụng `putToSlot`. Nó đã đúng và đã được chia sẻ.

## Phần A — `ResourceUploader`

`lib/core/upload/resource_uploader.dart`

```dart
enum UploadTarget { listing, avatar, identityDocument, order, conversation, review }

class ResourceUploader {
  Future<Resource> upload(
    UploadTarget target, {
    required List<int> bytes,
    required String filename,
    required String mime,
  });
}
```

Một method, một enum. Mỗi `UploadTarget` biết đúng cặp gọi của module mình; năm
module trả về năm lớp wrapper khác nhau nhưng đều mang `Resource data`, nên chúng
quy về một kiểu trả về duy nhất.

`avatar` và `identityDocument` cùng đi qua `POST /me/uploads` nhưng khác `kind` —
đó là lý do chúng là hai giá trị enum chứ không phải một: server phải được cho biết
nó đang ký cho loại nào *trước khi* một byte di chuyển, vì chỉ ảnh đại diện mới được
phép resolve ra link công khai.

Trả về **`Resource` đã xác nhận**, không phải mỗi id. Đây là điểm chính của cả spec:
`Resource.url` chỉ tồn tại ở đúng câu trả lời này, và caller nào cần khoe ảnh thì
lấy ở đây, còn caller nào chỉ cần đính kèm thì đọc `.id`.

Chặn kích thước trước khi gửi byte nào — 100 MB cho video, 10 MB cho phần còn lại,
đúng ngưỡng server trả 413. Một vòng lên xuống 10 MB để nhận về một lỗi biết trước
là thứ trả bằng pin và 4G của người dùng.

## Phần B — `ImageUploadField`

`lib/shared/widgets/image_upload_field.dart`

Dải thumbnail dùng chung, thay bốn bản chép tay:

```dart
ImageUploadField(
  target: UploadTarget.order,
  maxPhotos: 10,
  onChanged: (List<Resource> uploaded) { ... },
)
```

- Đang tải thì vẽ **file local**, xong thì đổi sang `Resource.url`. Không có khoảng
  trống nào ở giữa: ảnh hiện ngay lúc chọn, và thứ thay thế nó là ảnh thật trên
  server — cũng là cách màn hình tự chứng minh bytes đã tới nơi.
- Spinner trên từng ảnh, không phải một spinner cho cả dải: mười ảnh tải song song
  và một cái hỏng không được làm chín cái kia trông như đang chờ.
- Ảnh hỏng mang câu lỗi của nó và một nút **thử lại**. Hiện tại đường duy nhất là
  xoá rồi chọn lại từ đầu.
- Nút xoá từng ảnh, và chặn ở `maxPhotos`.

## Phần C — Chuyển đổi

Hai nhịp, mỗi nhịp tự đứng được:

1. Bảy method repository giữ nguyên tên và chữ ký cũ — vẫn trả `String` id — nhưng
   bên trong chỉ còn một dòng gọi `ResourceUploader` và đọc `.id`. Không caller nào
   phải sửa, và ba bước chép tay biến mất.
2. Các màn có dải thumbnail đổi sang `ImageUploadField`. Widget này gọi thẳng
   `ResourceUploader` chứ không đi qua repository, vì nó là chỗ duy nhất cần `url`
   — nhờ vậy bảy chữ ký ở nhịp 1 không phải đổi theo.

   Đã đổi: `confirm_receipt_sheet` và `refund_evidence_sheet`. **Chưa đổi**, có lý
   do chứ không phải bỏ sót:

   - `kyc_card_picker_widget` là ba ô đơn có nhãn và mô tả riêng ("mặt trước",
     "mặt sau", "chân dung"), không phải một dải n ảnh. Nhét nó vào một widget
     dải sẽ làm méo cả hai.
   - `listing_suggestion_screen` giữ ảnh trong máy trạng thái riêng của luồng gợi
     ý AI — resource id của chúng đi vào `POST /listings/suggestions` rồi vào
     `attachments` của tin đăng, và màn còn có nút camera riêng mà dải chung chưa
     có. Nó đã dùng chung đường dữ liệu qua `ResourceUploader`.

## Luồng dữ liệu

```
chọn ảnh → bytes
  → uploader.upload(target)
      → POST /{prefix}/uploads          (giữ chỗ, nhận signed URL + resource_id)
      → PUT  <signed URL>               (putToSlot, header lấy nguyên từ slot)
      → POST /{prefix}/uploads/{id}/confirmation
  → Resource { id, url }
      → id  đi vào request đính kèm
      → url đi vào chỗ vẽ ảnh
```

## Lỗi

| Tình huống | Kết quả |
|---|---|
| Quá ngưỡng kích thước | `UploadTooLarge`, ném trước khi có HTTP nào |
| 422 — server không nhận loại file đó | `UploadTypeRejected` |
| PUT hoặc confirm hỏng | `DioException` nổi lên nguyên vẹn; dải ảnh đánh dấu đúng ảnh đó là hỏng, các ảnh khác giữ nguyên trạng thái |

## Test

Unit — `test/resource_uploader_test.dart`:

- mỗi `UploadTarget` gọi đúng hai path của module mình, đúng thứ tự
- PUT mang đúng header slot trả về, không thêm không đè
- **thứ trả ra là `Resource` của bước confirm, có `url`** — không phải id của slot
- quá ngưỡng thì bị từ chối trước khi có request nào

`ImageUploadField` **chưa có** test. Đã thử và đã bỏ: widget đọc file thật rồi đi
qua Dio, cả hai là I/O thật nên `pump` không đẩy chúng đi; chạy trong `runAsync`
thì `Image.network` lại treo trong môi trường test. Một bài test không chạy được
tệ hơn là không có bài test nào, nên nó bị xoá thay vì để đó.

Phần logic quan trọng nhất của widget — *lấy url từ đâu* — nằm ở `ResourceUploader`
và đã được phủ. Phần còn lại (dải ảnh, spinner, nút thử lại) hiện chỉ được kiểm
bằng tay. Muốn phủ nó thì phải tiêm được `ImagePicker` và bộ giải mã ảnh vào
widget; đó là một thay đổi riêng, không phải một dòng thêm vào bài test.

## Điều spec này không hứa

Nó không chứng minh được rằng "ảnh rỗng" chỉ do một nguyên nhân. Kiểm tra trên API
thật (`reserve → PUT → confirm → GET`, cho listing, avatar và chat) đều trả signed
URL hợp lệ và phục vụ đúng bytes, nên phía server lành. Việc vứt đi url của bước
confirm là một lỗi có thật và giải thích được triệu chứng ở những màn khoe ảnh ngay
sau khi tải lên; nếu sau khi làm xong vẫn còn màn nào rỗng thì đó là một nguyên nhân
khác và cần bắt riêng.
