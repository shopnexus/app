# Khôi phục giao diện cũ: Chat/Thông báo và khu vực Seller

Ngày: 2026-08-08
Mốc tham chiếu: `6c7dbe3e92232aeaeb7b1b81a88df1d1201a6b5e`

## Vấn đề

Từ `6c7dbe3` tới `HEAD` có 285 file thay đổi, phần lớn là tích hợp API mới. Trong
quá trình đó hai vùng giao diện bị xấu đi:

- **Chat / Thông báo**: `/chat` trỏ vào `InboxScreen`, nhưng screen này bỏ qua
  hoàn toàn tham số `initialTab` và chỉ render `ChatListScreen` — tab "Thông báo"
  chưa từng hiện ra được. `NotificationsScreen` thì mất tab bar
  `[Tin nhắn | Hoạt động]` và mất nút back.
- **Seller**: `/seller` redirect sang `/seller/products`; `SellerDashboardScreen`
  (586 dòng), `SellerOrdersScreen` (603 dòng), `seller_stat_card`,
  `sales_performance_chart`, `seller_menu_item_tile` bị xoá hẳn.

## Mục tiêu

Trả bố cục cũ về cho hai vùng này, giữ nguyên mọi tính năng mới đã tích hợp, và
không sửa bất kỳ file nào của khu vực account.

## Ngoài phạm vi

- Toàn bộ `lib/features/account/**` — Profile, Đơn hàng gộp, `orders_list`,
  settings, security, địa chỉ. Không sửa một dòng nào.
- Catalog, chi tiết sản phẩm, checkout, refund, help center. Diff của chúng không
  bỏ đi giao diện nào.
- `seller_products_screen.dart` và `seller_earnings_screen.dart`. Diff của chúng
  thuần là thêm tính năng (thông tin thuế, lịch sử thanh toán, huỷ lệnh rút).

## Phần A — Chat / Inbox / Thông báo

Xoá lớp "Hộp thư" và trả về hai màn hình độc lập như bản cũ.

| File | Việc |
|---|---|
| `lib/features/chat/presentation/screens/inbox_screen.dart` | Xoá |
| `lib/features/chat/presentation/screens/chat_list_screen.dart` | Gộp `MessagesTab` ngược vào `ChatListScreen`; AppBar dùng `theme.textTheme.headlineMedium` màu primary, `elevation: 0`, không `backgroundColor` riêng |
| `lib/features/account/presentation/screens/notifications_screen.dart` | Về `ConsumerStatefulWidget`: Scaffold + AppBar có nút back (`arrow_back_ios_new_rounded`, size 20), `centerTitle: true`, `fontSize: 18`, action "Đọc tất cả"; tab bar `[Tin nhắn \| Hoạt động]` gạch dưới 3px; state `_showingChat` lọc feed theo `NotificationCategory.chat` |
| `lib/core/routing/app_router.dart` | `/chat` builder trả `const ChatListScreen()`; gỡ import `inbox_screen.dart` |
| `test/inbox_screen_test.dart` | Xoá |

Điều hướng khi chạm một thông báo loại `chat` quay về `context.push('/chat')`
(bỏ callback `onOpenMessages`).

### Giữ nguyên

- Ảnh đính kèm trong composer của `chat_detail_screen` (`_ComposerState`,
  `image_picker`, hàng preview 72px).
- Badge chưa đọc trên thanh nav (`inboxUnreadProvider`, `badgeLabel`).
- Đồng hồ đếm ngược `_OfferCountdown` và nút "Thương lượng lại" trên
  `chat_offer_card`.
- Chuông ở `product_list_screen` vốn đã trỏ `/account/notifications`, giữ nguyên.

### Quyết định về chuỗi hiển thị

Bản cũ có chuỗi tiếng Anh (`'Messages'`, `'Search chats...'`). Khôi phục **chỉ bố
cục và kiểu chữ**, giữ chuỗi tiếng Việt hiện tại (`'Tin nhắn'`,
`'Tìm cuộc trò chuyện...'`). Tiếng Anh lẫn vào một app tiếng Việt không phải cái
mà yêu cầu này gọi là "xấu".

## Phần B — Seller

### Khôi phục nguyên trạng từ `6c7dbe3`

- `lib/features/seller/presentation/screens/seller_dashboard_screen.dart`
- `lib/features/seller/presentation/screens/seller_orders_screen.dart`
- `lib/features/seller/presentation/widgets/seller_stat_card.dart`
- `lib/features/seller/presentation/widgets/sales_performance_chart.dart`
- `lib/features/seller/presentation/widgets/seller_menu_item_tile.dart`
- `lib/features/seller/presentation/providers/seller_dashboard_provider.dart`
- `lib/features/seller/presentation/providers/seller_orders_provider.dart`

### Sửa kèm

**`pubspec.yaml`** — thêm lại `fl_chart: ^0.66.0` (bị gỡ ở commit `132e7e9`).
`sales_performance_chart` phụ thuộc trực tiếp vào nó.

**`lib/features/seller/data/repositories/seller_repository.dart`**
- Thêm lại `salesSummary({required String tz, DateTime? from, DateTime? to})`.
  `ordersSummaryGet` giữ nguyên signature (`role`, `from`, `to`, `tz` →
  `OrdersSummaryGet200Response.data`), nên code cũ biên dịch nguyên trạng.
- **Không** thêm lại `reportCheckpoint`.
  `POST /orders/{id}/transport/checkpoints` nay là staff-only; người bán thấy sai
  trạng thái thì mở ticket `order-issue`. Khôi phục hàm đó là khôi phục một nút
  chắc chắn trả 403.

**`lib/features/seller/presentation/providers/seller_orders_provider.dart`**
- Bỏ `reportCheckpoint` khỏi notifier.
- Thêm `confirmOrder` / `declineOrder` gọi các hàm đã có sẵn trong repository.
- Giữ `cancelOrder`, `setState`, `refresh` và `SellerOrdersState` như cũ.

**`lib/features/seller/presentation/screens/seller_orders_screen.dart`**
- Giữ nguyên bố cục cũ: tab chip *Đang xử lý / Hoàn thành / Đã huỷ*, order card,
  khối `_buildUnsettledNotice`, shimmer, `_buildMessage`.
- Thay nút cập nhật trạng thái vận chuyển bằng: **Xác nhận đơn**, **Từ chối đơn**
  (kèm ô nhập lý do), **Báo sự cố** (mở `raise_ticket_sheet` với
  `TicketKind.orderIssue`).
- Giữ nút Huỷ đơn cũ.

**`lib/core/routing/app_router.dart`**
- `/seller`: bỏ `redirect`, dựng `const SellerDashboardScreen()`.
- `/seller/orders`: bỏ `redirect`, dựng `SellerOrdersScreen(initialState: …)` đọc
  `?state=` qua `_enumByValue(OrderState.values, …)` như cũ.

**`lib/shared/widgets/main_layout.dart`**
- Tab index 2 về `context.go('/seller')`.
  Đây là cửa duy nhất vào dashboard: `profile_screen` chỉ link tới
  `/seller/products`, `/seller/orders`, `/seller/earnings`, và file đó nằm trong
  vùng cấm sửa. Form đăng tin vào qua mục Sản phẩm / banner AI trên dashboard, y
  như bản cũ.

**Codegen** — chạy `build_runner` cho freezed + riverpod của hai provider khôi
phục (`seller_dashboard_provider`, `seller_orders_provider`).

**Test cần cập nhật** — `test/main_layout_tabs_test.dart`,
`test/seller_prefix_route_test.dart`, `test/seller_routes_test.dart`.

### Giữ nguyên

`listing_edit_screen`, `tax_info_screen`, `wallet_ledger_screen`,
`edit_variant_sheet`, `listing_edit_provider`, `selling_gate_provider`, và toàn bộ
phần thêm mới trong `seller_repository`.

## Ảnh hưởng chấp nhận

Sau khi khôi phục, đơn bán xem được ở hai nơi: màn Đơn bán này và màn Đơn hàng
gộp trong account (lọc theo lượt, cả hai vai). Trùng lặp này là lựa chọn có ý
thức — người dùng muốn màn Đơn bán cũ trở lại, và màn Đơn hàng gộp nằm trong vùng
cấm sửa.

## Thứ tự thực hiện

Từng phần một, dừng lại cho người dùng xem giữa các phần.

1. **Chat / Thông báo** — độc lập, không cần codegen.
2. **Widget + provider seller** — `fl_chart`, `seller_stat_card`,
   `sales_performance_chart`, `seller_menu_item_tile`, `salesSummary`, hai
   provider, chạy codegen.
3. **Dashboard** — dựng `/seller`.
4. **Đơn bán** — dựng `/seller/orders` với bộ hành động mới.
5. **Nav + test** — tab 2 và cập nhật ba file test.

## Kiểm chứng

Mỗi bước kết thúc bằng `flutter analyze` sạch. Sau bước 5 chạy `flutter test`
toàn bộ và báo cáo kết quả thật, kể cả khi có test đỏ.
