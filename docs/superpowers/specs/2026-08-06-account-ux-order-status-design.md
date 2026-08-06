# Thiết kế lại trang Tài khoản & mô hình trạng thái đơn hàng

Ngày: 2026-08-06

## 1. Vấn đề

Trang tài khoản (`lib/features/account/presentation/screens/profile_screen.dart`) quá dài và
quá nhiều mục, còn trạng thái đơn hàng giữa phía mua và phía bán thì không khớp nhau. Hai
triệu chứng này có chung một gốc: **cấu trúc thông tin đang phản chiếu cấu trúc code chứ
không phản chiếu việc người dùng cần làm.**

### 1.1 Trang tài khoản

| # | Vấn đề | Vị trí |
|---|---|---|
| 1 | Toàn bộ khu người bán bị nhân đôi giữa Profile và tab "Đăng bán" ở bottom nav | `profile_screen.dart:371-600` vs `seller_dashboard_screen.dart:108-243` |
| 2 | Hai form sửa hồ sơ khác nhau, khác luôn tập field, cùng gọi một endpoint | `profile_screen.dart:1072` (name/phone/email/gender/dob) vs `account_center_screen.dart:437` (name/username/phone/gender) |
| 3 | Account Center — nơi chứa KYC — bị chôn 2 tầng, chỉ vào được từ Settings | `settings_screen.dart:77` |
| 4 | Nhãn "Payment" nhưng điều hướng tới thu nhập của người bán | `profile_screen.dart:598` |
| 5 | Màn hình Notifications mồ côi, không có lối vào từ trang tài khoản | chỉ link từ `product_list_screen.dart:129` |
| 6 | Hàng đợi hoàn tiền của **người bán** bị xếp làm tab 5 của **Đơn mua** | `orders_screen.dart:180` |
| 7 | Trộn tiếng Anh và tiếng Việt trong cùng một màn hình | `profile_screen.dart:294-598`, `settings_screen.dart` |
| 8 | Terms of Service và Privacy Policy chỉ hiện SnackBar; toggle Notifications không lưu | `settings_screen.dart:200-220` |
| 9 | Thiếu các mục C2C cơ bản: đánh giá, xem hồ sơ công khai | — |

### 1.2 Trạng thái đơn hàng

Gốc rễ: **ba trục độc lập bị ép bẹp vào một dãy tab.**

- `OrderState` (3 giá trị) — trục kết quả
- `TransportStatus` (7 giá trị) — trục vận chuyển
- `RefundStatus` (8 giá trị) — trục tranh chấp

Hệ quả:

| # | Vấn đề | Vị trí |
|---|---|---|
| 10 | Phía mua 6 tab, phía bán 3 tab, trên cùng một `OrderState` | `orders_screen.dart:26-33` vs `seller_orders_screen.dart:97-101` |
| 11 | Nhãn chip trên Profile không khớp tab nó mở: "Pending"→"Chờ thanh toán", "Shipping"→"Đang xử lý" | `profile_screen.dart:321-351` |
| 12 | Phía mua thiếu chip "Đã hủy" dù tab tồn tại; phía bán lại có | `profile_screen.dart:319-352` |
| 13 | Chip phía bán có badge số, chip phía mua dùng cùng widget nhưng không truyền `count` | `profile_screen.dart:422-441` |
| 14 | Deep-link phía mua dùng `?tab=<số>` không clamp → `?tab=9` làm `TabController` ném exception | `app_router.dart:193-200` |
| 15 | Từ vựng trên thẻ không trùng từ vựng trên tab: tab "Đang xử lý" chứa thẻ ghi "Đang giao" | `order_view.dart:52-65` |
| 16 | Màu badge dò bằng chuỗi con tiếng Việt: "Đã giao" và "Giao thất bại" đều chứa `'giao'` → cùng tô xanh dương | `orders_screen.dart:1107-1140` |
| 17 | Badge phía bán hardcode xanh lá bất kể trạng thái → đơn "Đã hủy" hiển thị màu thành công | `seller_orders_screen.dart:277-294` |

## 2. Nguyên tắc thiết kế

Trong marketplace C2C, cùng một người vừa mua vừa bán, và phần lớn người bán là casual
seller — vài món đồ, không phải shop chuyên nghiệp. Từ đó:

1. **Trang tài khoản là bảng điều khiển việc-cần-làm, không phải mục lục tính năng.**
2. **Mỗi trạng thái phải trả lời được "đang chờ ai".** Đây là câu hỏi trung tâm của C2C vì
   hai bên đều là người lạ và tiền đang nằm trong escrow.
3. **Enum trạng thái phải đầy đủ và chính xác; tab chỉ là cách gom nhóm thô của nó.** Lẫn
   hai thứ này là nguyên nhân của các lỗi 10–17.
4. **Mọi trạng thái chờ đều phải có deadline.** Không có deadline thì tiền người mua kẹt
   trong escrow vĩnh viễn khi gặp người bán bỏ ngang.

## 3. Thiết kế — Trang tài khoản

Profile bỏ hẳn khu người bán. Tab "Đăng bán" ở bottom nav (`main_layout.dart:35` → `/seller`)
giữ toàn quyền với đơn bán, sản phẩm, thu nhập.

```
[Header]   Avatar · Tên · ⭐4.8 (23 đánh giá) · ✓ Đã xác minh
           → chạm mở Account Center

[Việc cần làm]   chỉ hiện khi > 0
           2 đơn chờ giao · 1 yêu cầu hoàn tiền · 3 tin nhắn

─ GIAO DỊCH ─────────────────────
   Đơn mua                  (3)
   Yêu cầu hoàn tiền        (1)
   Đánh giá của tôi

─ HỒ SƠ ─────────────────────────
   Địa chỉ
   Yêu thích
   Xem shop của tôi
   → Kênh người bán           ›

─ HỖ TRỢ ────────────────────────
   Trung tâm trợ giúp
   Cài đặt
   Đăng xuất
```

Thay đổi kèm theo:

- **Xóa khỏi Profile:** My Sales + 3 chip, My Products + 3 chip, banner AI Wizard, mục
  "Payment". Thay bằng một dòng "Kênh người bán" dẫn sang `/seller`.
- **Gộp hai form sửa hồ sơ** thành một, đặt tại Account Center, tập field đầy đủ:
  name / username / phone / email / gender / dateOfBirth. Header Profile chạm vào thì điều
  hướng tới Account Center thay vì mở bottom sheet riêng.
- **Nhấc `RefundListScreen` ra khỏi tab 5 của Đơn mua** thành mục cấp 1 "Yêu cầu hoàn tiền".
  Màn hình này đã sẵn 2 tab buyer/seller (`refund_list_screen.dart:57-58`) và
  `refundList(role:)` đã hỗ trợ `RefundRole.seller` — chỉ đổi chỗ, không viết mới.
- **Thêm "Đánh giá của tôi"** — hai tab: *Đã viết* (đánh giá tôi để lại) và *Đã nhận* (đánh
  giá người khác để lại cho tôi, gồm cả với tư cách người mua lẫn người bán, phân biệt bằng
  `FeedbackDirection`). Tab *Đã viết* còn gánh danh sách đơn `completed` chưa đánh giá — đây
  là một mục trong `[Việc cần làm]`. API đã đầy đủ (`review.dart`, `feedback.dart`,
  `feedback_direction.dart`, `GET /orders/{id}/feedback`), không cần backend làm thêm.
- **Thêm "Xem shop của tôi"** → `/vendor/:id` với id của chính mình.
- **Toàn bộ nhãn chuyển sang tiếng Việt**, kể cả section header và màn hình Settings.
- **Chuông thông báo** đặt ở AppBar của Profile, có badge chưa đọc, → `/account/notifications`.

Khối `[Việc cần làm]` lấy dữ liệu từ: số đơn có `OrderStatus` mà "đang chờ" == người dùng
hiện tại (cả hai vai), số refund ở `RefundStatus.awaitingSellerReview` /
`awaitingBuyerAction`, và số hội thoại chưa đọc.

## 4. Thiết kế — Mô hình trạng thái đơn hàng

### 4.1 Tầng 1 — `OrderStatus`

Một enum duy nhất, thay `OrderState`. Tám giá trị:

| Giá trị | Nhãn phía mua | Nhãn phía bán | Đang chờ ai | Hết hạn |
|---|---|---|---|---|
| `awaiting_payment` | Chờ thanh toán | Chờ người mua trả | Người mua | 24h → `cancelled` |
| `awaiting_shipment` | Chờ người bán giao | Chờ bạn giao hàng | Người bán | 3 ngày → `cancelled` + hoàn tiền |
| `in_transit` | Đang giao | Đang giao | Đơn vị vận chuyển | — |
| `delivered` | Chờ bạn xác nhận | Chờ người mua xác nhận | Người mua | 7 ngày → `completed` |
| `completed` | Hoàn thành | Hoàn thành | — | — |
| `cancelled` | Đã hủy | Đã hủy | — | — |
| `refunding` | Đang hoàn tiền | Đang hoàn tiền | tuỳ `RefundStatus` | — |
| `refunded` | Đã hoàn tiền | Đã hoàn tiền | — | — |

**Nhãn phụ thuộc vai trò** là cố ý: nó làm "đang chờ ai" đọc được ngay trên badge mà không
cần chú giải, và làm tab "Cần xử lý" trở nên hiển nhiên.

**Không tách `awaiting_seller` khỏi `awaiting_shipment`.** Người bán còn hàng thì hành động
duy nhất có nghĩa là giao luôn; một bước "xác nhận còn hàng" riêng chỉ là nghi thức rỗng.
Người bán không còn hàng thì đơn giản là để hết hạn 3 ngày và hệ thống tự hủy.

Vai trò các enum cũ:

- `TransportStatus` **giữ nguyên**, hạ vai trò thành chi tiết vận đơn hiển thị trong timeline
  của màn hình chi tiết. Không còn được suy diễn ngược thành badge chính (bỏ
  `order_view.dart:55-64`).
- `RefundStatus` **giữ nguyên**, nhưng chiếu lên `OrderStatus` thành `refunding` / `refunded`
  để thẻ đơn hàng không bao giờ nói khác màn hình hoàn tiền.
- `OrderState` **bị xóa**.

### 4.2 Tầng 2 — Tab

Năm tab, giống hệt nhau ở cả hai phía:

| Tab | Gom các status |
|---|---|
| Tất cả | tất cả |
| **Cần xử lý** | mọi status mà "đang chờ" == người dùng hiện tại, theo vai của màn hình |
| Đang giao | `awaiting_shipment` · `in_transit` · `delivered` |
| Hoàn thành | `completed` |
| Đã hủy / hoàn tiền | `cancelled` · `refunding` · `refunded` |

Tab "Cần xử lý" phụ thuộc vai trò: phía mua nghĩa là "chờ tôi trả tiền / chờ tôi xác nhận đã
nhận", phía bán nghĩa là "chờ tôi giao hàng". Nhờ vậy hai phía dùng chung đúng một bộ tab mà
không cần dịch nghĩa. Đây cũng là nguồn dữ liệu cho khối `[Việc cần làm]` ở mục 3.

Tab "Cần xử lý" là tab duy nhất không map 1-1 sang một giá trị enum. Backend hỗ trợ bằng
`?action_required=true`; client không tự lọc, để phân trang không bị sai tổng.

**Các tab cố ý chồng lấn.** Một đơn `delivered` xuất hiện đồng thời ở "Cần xử lý" (phía mua)
và "Đang giao" (cả hai phía). Đây không phải lỗi phân loại: "Cần xử lý" là một lát cắt ngang
theo câu hỏi *ai đang bị chặn*, còn ba tab kia là lát cắt dọc theo *đơn đang ở đâu*. Chỉ có
"Tất cả" là bao trùm.

**`awaiting_payment` phía bán chỉ nằm ở "Tất cả".** Người bán không có việc gì để làm với đơn
người mua chưa trả tiền, nên nó không vào "Cần xử lý", và cũng chưa vào "Đang giao" vì chưa
có gì để giao. Đây là chủ ý, không phải lỗ hổng.

### 4.3 Màu badge

Một hàm dùng chung `orderStatusTone(OrderStatus)`, thay cho việc dò chuỗi con ở
`orders_screen.dart:1107-1140` và màu hardcode ở `seller_orders_screen.dart:277-294`:

| Tông | Status |
|---|---|
| Hổ phách — đang chờ ai đó | `awaiting_payment`, `awaiting_shipment` |
| Xanh dương — đang di chuyển | `in_transit`, `delivered` |
| Xanh lá — kết thúc tốt | `completed` |
| Xám — kết cục bình thường | `cancelled`, `refunded` |
| Đỏ — tranh chấp đang mở | `refunding` |

`cancelled` tô xám chứ không đỏ: hủy đơn là kết cục bình thường trong C2C, tô đỏ sẽ làm
người dùng tưởng có lỗi. Đỏ dành riêng cho tranh chấp đang mở — thứ thật sự cần báo động.

## 5. Thay đổi API

- `GET /orders?role=buyer|seller&status=<OrderStatus>` — một tham số dùng chung hai phía,
  thay cho `?tab=<số>` phía mua và `?state=<OrderState>` phía bán.
- `GET /orders?role=…&action_required=true` — nguồn cho tab "Cần xử lý" và khối
  `[Việc cần làm]`.
- **Đơn tồn tại ngay từ lúc đặt** với `awaiting_payment`. Bỏ khái niệm "order_item mồ côi
  chưa có `orderId`" (`order_view.dart:33`) đang phải xử lý bằng một tab riêng và một
  provider riêng (`buyerUnsettledItemsProvider`).
- Ba tác vụ hết hạn ở mục 4.1 chạy phía server, không phải client.

## 6. Thay đổi routing

- `/account/orders?status=awaiting_shipment` — có validate + fallback bằng `_enumByValue`,
  đúng như phía seller đang làm ở `app_router.dart:152-165`. Sửa lỗi 14.
- `/seller/orders?status=<OrderStatus>` — đổi tên tham số từ `state` sang `status`.
- `/account/refunds` — mục cấp 1, không còn nằm trong `orders`.
- `/account/reviews` — màn hình mới.

## 7. Files bị ảnh hưởng

**Sửa:**

- `lib/api/generated/model/order_state.dart` → sinh lại thành `order_status.dart`
- `lib/features/account/data/models/order_view.dart` — bỏ `statusLabel` suy diễn từ transport
- `lib/features/account/presentation/screens/orders_screen.dart` — 6 tab → 5, bỏ hàm badge dò chuỗi
- `lib/features/account/presentation/screens/profile_screen.dart` — viết lại IA
- `lib/features/account/presentation/screens/account_center_screen.dart` — gộp form sửa hồ sơ
- `lib/features/account/presentation/screens/settings_screen.dart` — tiếng Việt, sửa ngõ cụt
- `lib/features/seller/presentation/screens/seller_orders_screen.dart` — 3 tab → 5, bỏ màu hardcode
- `lib/features/seller/presentation/screens/seller_dashboard_screen.dart` — chip theo `OrderStatus`
- `lib/features/refund/presentation/screens/refund_list_screen.dart` — luôn có AppBar riêng
- `lib/core/routing/app_router.dart` — tham số route
- `lib/features/account/presentation/providers/buyer_orders_provider.dart`
- `lib/features/seller/presentation/providers/seller_orders_provider.dart`

**Thêm:**

- `lib/shared/widgets/order_status_badge.dart` — badge + bảng màu dùng chung hai phía
- `lib/features/account/presentation/widgets/action_required_card.dart` — khối `[Việc cần làm]`
- `lib/features/account/presentation/screens/my_reviews_screen.dart`

**Xóa:**

- `_EditProfileFormSheet` trong `profile_screen.dart` (gộp vào Account Center)
- `buyerUnsettledItemsProvider` và `_PendingItemsTab` (thay bằng `awaiting_payment`)

## 8. Ngoài phạm vi

- Người theo dõi / follow
- Phương thức thanh toán phía người mua
- Trung tâm khiếu nại tách khỏi luồng hoàn tiền
- Voucher / khuyến mãi
- Nội dung thật cho Terms of Service và Privacy Policy (spec này chỉ bỏ SnackBar giả và
  thay bằng màn hình webview hoặc trang tĩnh)

## 9. Thứ tự triển khai đề nghị

Spec này gộp hai thay đổi độc lập nhau. Bước 1–4 là **mô hình trạng thái**, bước 5–8 là
**cấu trúc trang tài khoản**. Hai nhóm không phụ thuộc nhau và ship riêng được; nếu muốn
chia thành hai kế hoạch triển khai riêng thì đây là đường cắt.

1. Backend: `OrderStatus`, ba tác vụ hết hạn, `?status=` và `?action_required=`
2. Client: enum + `order_status_badge.dart` dùng chung — sửa luôn lỗi 16, 17
3. Client: hai màn hình đơn hàng về chung 5 tab — sửa lỗi 10, 11, 12, 15
4. Client: routing `?status=` có validate — sửa lỗi 14
5. Client: viết lại IA trang tài khoản — sửa lỗi 1, 4, 5, 6, 7, 9
6. Client: gộp form sửa hồ sơ + đưa KYC lên — sửa lỗi 2, 3
7. Client: khối `[Việc cần làm]`, số đếm hai phía — sửa lỗi 13
8. Client: Settings tiếng Việt, bỏ ngõ cụt — sửa lỗi 8
