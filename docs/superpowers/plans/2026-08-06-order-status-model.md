# OrderStatus Model Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Thay ba trục trạng thái bị ép bẹp vào một dãy tab (`OrderState` 3 giá trị + `TransportStatus` 7 + `RefundStatus` 8) bằng một `OrderStatus` 8 giá trị duy nhất, và cho phía mua lẫn phía bán dùng chung đúng một bộ 5 tab.

**Architecture:** Tách enum trạng thái khỏi tab. `OrderStatus` là nguồn sự thật duy nhất, mỗi giá trị mang theo *đang chờ ai* và *nhãn theo vai*. Tab chỉ là hàm gom nhóm trên enum đó, định nghĩa một lần và dùng cho cả hai màn hình. `TransportStatus` hạ xuống thành chi tiết vận đơn trong màn hình chi tiết; `RefundStatus` chiếu lên `OrderStatus` thành `refunding`/`refunded`.

**Tech Stack:** Flutter 3.11.5+, Riverpod 3 (`@riverpod` codegen), go_router 13, freezed 3, retrofit/dio, openapi-generator.

## Global Constraints

- Spec nguồn: `docs/superpowers/specs/2026-08-06-account-ux-order-status-design.md` §4, §5, §6
- **Task 1–2 chạy được ngay. Task 3 trở đi CHẶN bởi backend** — cần `OrderStatus` trên OpenAPI spec, `GET /orders?status=`, `?action_required=`, và ba tác vụ hết hạn (§4.1). Xác nhận backend đã lên trước khi bắt đầu Task 3.
- Nhãn hiển thị **phụ thuộc vai**: cùng một `OrderStatus` đọc khác nhau ở phía mua và phía bán. Đây là chủ ý (§4.1), không phải trùng lặp cần gộp.
- **Toàn bộ chuỗi hiển thị là tiếng Việt.**
- Font: `'Manrope'` cho tiêu đề, `'Inter'` cho phần còn lại.
- Codegen sau mỗi task có `@riverpod`/`@freezed`: `dart run build_runner build --delete-conflicting-outputs`
- Test: `flutter test` · Lint: `flutter analyze` phải sạch trước mỗi commit.
- Commit message tiếng Việt, kết thúc bằng `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`

---

## File Structure

**Tạo mới:**

| File | Trách nhiệm |
|---|---|
| `lib/features/orders/domain/order_status.dart` | Enum + *đang chờ ai* + nhãn theo vai + tông màu. Thuần Dart, không phụ thuộc Flutter hay generated code. |
| `lib/features/orders/domain/order_tab.dart` | 5 tab và hàm gom nhóm. Dùng chung hai màn hình. |
| `lib/shared/widgets/order_status_badge.dart` | Badge vẽ từ `OrderStatus` + vai. Thay hai hệ màu độc lập đang sai. |
| `test/order_status_test.dart` | Enum, nhãn, tông màu, *đang chờ ai*. |
| `test/order_tab_test.dart` | Gom nhóm tab, kể cả chồng lấn có chủ ý. |

`lib/features/orders/domain/` là thư mục mới. Trạng thái đơn hàng là khái niệm dùng chung của cả `account` (phía mua) lẫn `seller` (phía bán); đặt nó trong một trong hai sẽ khiến bên kia phải import ngược qua feature boundary — đúng thứ đang gây ra hai bảng màu độc lập hiện nay.

**Sửa:**

| File | Thay đổi |
|---|---|
| `lib/features/account/data/models/order_view.dart:52-65` | Bỏ `statusLabel` suy diễn từ transport |
| `lib/features/account/data/repositories/account_repository.dart:171-207` | `state:` → `status:` |
| `lib/features/seller/data/repositories/seller_repository.dart:88-120` | `state:` → `status:` |
| `lib/features/account/presentation/providers/buyer_orders_provider.dart` | Một provider theo tab thay vì bốn provider rời |
| `lib/features/seller/presentation/providers/seller_orders_provider.dart` | Dùng `OrderTab` |
| `lib/features/account/presentation/screens/orders_screen.dart` | 5 tab, bỏ hàm badge dò chuỗi (dòng 1107-1140) |
| `lib/features/seller/presentation/screens/seller_orders_screen.dart` | 5 tab, bỏ màu hardcode (dòng 277-294) |
| `lib/features/seller/presentation/screens/seller_dashboard_screen.dart` | Chip theo `OrderStatus` |
| `lib/core/routing/app_router.dart` | `?status=` cho cả hai route |

**Xóa:** `buyerUnsettledItemsProvider`, `_PendingItemsTab`, mọi import `order_state.dart`.

---

### Task 1: `OrderStatus` — enum, *đang chờ ai*, nhãn theo vai

**Files:**
- Create: `lib/features/orders/domain/order_status.dart`
- Test: `test/order_status_test.dart`

**Interfaces:**
- Consumes: không có
- Produces:
  - `enum OrderStatus` — `awaitingPayment`, `awaitingShipment`, `inTransit`, `delivered`, `completed`, `cancelled`, `refunding`, `refunded`; mỗi giá trị có `final String value` (giá trị trên dây)
  - `enum OrderRole { buyer, seller }`
  - `enum OrderParty { buyer, seller, carrier, nobody }`
  - `enum OrderTone { waiting, moving, success, neutral, danger }`
  - `OrderParty waitingOn(OrderStatus)` — ai đang bị chặn
  - `bool needsActionFrom(OrderStatus, OrderRole)` — nguồn của tab "Cần xử lý"
  - `String orderStatusLabel(OrderStatus, OrderRole)`
  - `OrderTone orderStatusTone(OrderStatus)`
  - `OrderStatus? orderStatusFromValue(String?)`

- [ ] **Step 1: Write the failing test**

```dart
// test/order_status_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_status.dart';

/// Ba trục độc lập từng bị ép bẹp vào một dãy tab: OrderState (kết quả),
/// TransportStatus (vận chuyển), RefundStatus (tranh chấp). Hệ quả là tab tên
/// "Đang xử lý" chứa thẻ ghi "Đang giao", và badge phải tô màu bằng cách dò
/// chuỗi con tiếng Việt — nên "Đã giao" và "Giao thất bại" cùng ra xanh dương.
///
/// OrderStatus là một trục duy nhất, và mỗi giá trị trả lời được "đang chờ ai".
void main() {
  group('giá trị trên dây', () {
    test('mỗi status có một value duy nhất', () {
      final values = OrderStatus.values.map((s) => s.value).toSet();

      expect(values.length, OrderStatus.values.length);
    });

    test('đọc được từ chuỗi', () {
      expect(orderStatusFromValue('in_transit'), OrderStatus.inTransit);
      expect(
        orderStatusFromValue('awaiting_payment'),
        OrderStatus.awaitingPayment,
      );
    });

    test('chuỗi lạ hoặc null trả về null thay vì ném', () {
      expect(orderStatusFromValue('trạng-thái-tương-lai'), isNull);
      expect(orderStatusFromValue(null), isNull);
      expect(orderStatusFromValue(''), isNull);
    });
  });

  group('đang chờ ai', () {
    test('người mua bị chặn ở thanh toán và ở xác nhận nhận hàng', () {
      expect(waitingOn(OrderStatus.awaitingPayment), OrderParty.buyer);
      expect(waitingOn(OrderStatus.delivered), OrderParty.buyer);
    });

    test('người bán bị chặn ở giao hàng', () {
      expect(waitingOn(OrderStatus.awaitingShipment), OrderParty.seller);
    });

    test('đang giao thì không ai trong hai bên bị chặn', () {
      expect(waitingOn(OrderStatus.inTransit), OrderParty.carrier);
    });

    test('trạng thái kết thúc không chờ ai', () {
      expect(waitingOn(OrderStatus.completed), OrderParty.nobody);
      expect(waitingOn(OrderStatus.cancelled), OrderParty.nobody);
      expect(waitingOn(OrderStatus.refunded), OrderParty.nobody);
    });
  });

  group('needsActionFrom', () {
    test('chờ thanh toán là việc của người mua, không phải người bán', () {
      expect(
        needsActionFrom(OrderStatus.awaitingPayment, OrderRole.buyer),
        isTrue,
      );
      expect(
        needsActionFrom(OrderStatus.awaitingPayment, OrderRole.seller),
        isFalse,
      );
    });

    test('chờ giao hàng là việc của người bán, không phải người mua', () {
      expect(
        needsActionFrom(OrderStatus.awaitingShipment, OrderRole.seller),
        isTrue,
      );
      expect(
        needsActionFrom(OrderStatus.awaitingShipment, OrderRole.buyer),
        isFalse,
      );
    });

    test('đang giao không là việc của bên nào', () {
      for (final role in OrderRole.values) {
        expect(needsActionFrom(OrderStatus.inTransit, role), isFalse);
      }
    });
  });

  group('nhãn theo vai', () {
    test('cùng một status đọc khác nhau ở hai phía', () {
      expect(
        orderStatusLabel(OrderStatus.awaitingShipment, OrderRole.buyer),
        'Chờ người bán giao',
      );
      expect(
        orderStatusLabel(OrderStatus.awaitingShipment, OrderRole.seller),
        'Chờ bạn giao hàng',
      );
    });

    test('delivered nói rõ ai phải xác nhận', () {
      expect(
        orderStatusLabel(OrderStatus.delivered, OrderRole.buyer),
        'Chờ bạn xác nhận',
      );
      expect(
        orderStatusLabel(OrderStatus.delivered, OrderRole.seller),
        'Chờ người mua xác nhận',
      );
    });

    test('trạng thái không phụ thuộc vai đọc giống nhau', () {
      for (final status in [
        OrderStatus.inTransit,
        OrderStatus.completed,
        OrderStatus.cancelled,
        OrderStatus.refunding,
        OrderStatus.refunded,
      ]) {
        expect(
          orderStatusLabel(status, OrderRole.buyer),
          orderStatusLabel(status, OrderRole.seller),
          reason: '$status không nên đổi nghĩa theo vai',
        );
      }
    });

    test('mọi status đều có nhãn ở cả hai vai', () {
      for (final status in OrderStatus.values) {
        for (final role in OrderRole.values) {
          expect(orderStatusLabel(status, role), isNotEmpty);
        }
      }
    });
  });

  group('tông màu', () {
    test('đã giao là tiến trình, không phải lỗi', () {
      expect(orderStatusTone(OrderStatus.delivered), OrderTone.moving);
    });

    test('hủy là kết cục bình thường nên trung tính, không phải đỏ', () {
      expect(orderStatusTone(OrderStatus.cancelled), OrderTone.neutral);
      expect(orderStatusTone(OrderStatus.refunded), OrderTone.neutral);
    });

    test('đỏ dành riêng cho tranh chấp đang mở', () {
      final danger = OrderStatus.values
          .where((s) => orderStatusTone(s) == OrderTone.danger)
          .toList();

      expect(danger, [OrderStatus.refunding]);
    });

    test('chỉ completed là xanh lá', () {
      final success = OrderStatus.values
          .where((s) => orderStatusTone(s) == OrderTone.success)
          .toList();

      expect(success, [OrderStatus.completed]);
    });

    test('mọi status đều có tông', () {
      for (final status in OrderStatus.values) {
        expect(orderStatusTone(status), isNotNull);
      }
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/order_status_test.dart`
Expected: FAIL — `Target of URI doesn't exist: '.../order_status.dart'`

- [ ] **Step 3: Write minimal implementation**

```dart
// lib/features/orders/domain/order_status.dart

/// Trạng thái của một đơn hàng — một trục duy nhất.
///
/// Thay `OrderState` (3 giá trị) và việc suy diễn ngược từ `TransportStatus`.
/// `TransportStatus` vẫn còn, nhưng là chi tiết vận đơn trong màn hình chi tiết
/// chứ không còn quyết định badge; `RefundStatus` chiếu lên đây thành
/// [refunding] / [refunded].
///
/// Mỗi giá trị trả lời được "đang chờ ai" (xem [waitingOn]). Đó là câu hỏi trung
/// tâm của một sàn C2C: hai bên đều là người lạ và tiền đang nằm trong escrow,
/// nên thứ người dùng cần biết trước hết là ai đang giữ lượt.
enum OrderStatus {
  awaitingPayment('awaiting_payment'),
  awaitingShipment('awaiting_shipment'),
  inTransit('in_transit'),
  delivered('delivered'),
  completed('completed'),
  cancelled('cancelled'),
  refunding('refunding'),
  refunded('refunded');

  const OrderStatus(this.value);

  final String value;
}

/// Vai của người dùng trên màn hình đang mở.
enum OrderRole {
  buyer('buyer'),
  seller('seller');

  const OrderRole(this.value);

  final String value;
}

/// Bên đang giữ lượt.
enum OrderParty { buyer, seller, carrier, nobody }

/// Ý nghĩa màu, tách khỏi màu thật để phần domain không phụ thuộc Flutter.
enum OrderTone { waiting, moving, success, neutral, danger }

/// Null khi chuỗi không khớp giá trị nào — một backend mới hơn có thể gửi trạng
/// thái client này chưa biết, và đó không phải lý do để làm sập cả danh sách.
OrderStatus? orderStatusFromValue(String? value) {
  if (value == null) return null;
  for (final status in OrderStatus.values) {
    if (status.value == value) return status;
  }
  return null;
}

/// Bên đang bị chặn. `carrier` nghĩa là không bên nào trong hai người dùng phải
/// làm gì — đơn đang chạy và cả hai chỉ chờ.
OrderParty waitingOn(OrderStatus status) => switch (status) {
  OrderStatus.awaitingPayment => OrderParty.buyer,
  OrderStatus.awaitingShipment => OrderParty.seller,
  OrderStatus.inTransit => OrderParty.carrier,
  OrderStatus.delivered => OrderParty.buyer,
  OrderStatus.completed => OrderParty.nobody,
  OrderStatus.cancelled => OrderParty.nobody,
  // Lượt thuộc về ai là do RefundStatus quyết, không phải OrderStatus. Ở mức
  // này chỉ biết đơn đang trong tranh chấp; màn hình hoàn tiền mới biết lượt.
  OrderStatus.refunding => OrderParty.nobody,
  OrderStatus.refunded => OrderParty.nobody,
};

/// Nguồn duy nhất của tab "Cần xử lý" và của khối việc-cần-làm trên trang tài
/// khoản. Cùng một đơn là việc của người này và không phải việc của người kia.
bool needsActionFrom(OrderStatus status, OrderRole role) =>
    switch (waitingOn(status)) {
      OrderParty.buyer => role == OrderRole.buyer,
      OrderParty.seller => role == OrderRole.seller,
      OrderParty.carrier => false,
      OrderParty.nobody => false,
    };

/// Nhãn phụ thuộc vai là chủ ý: nó làm "đang chờ ai" đọc được ngay trên badge mà
/// không cần chú giải, và làm tab "Cần xử lý" trở nên hiển nhiên.
String orderStatusLabel(OrderStatus status, OrderRole role) =>
    switch ((status, role)) {
      (OrderStatus.awaitingPayment, OrderRole.buyer) => 'Chờ thanh toán',
      (OrderStatus.awaitingPayment, OrderRole.seller) => 'Chờ người mua trả',
      (OrderStatus.awaitingShipment, OrderRole.buyer) => 'Chờ người bán giao',
      (OrderStatus.awaitingShipment, OrderRole.seller) => 'Chờ bạn giao hàng',
      (OrderStatus.delivered, OrderRole.buyer) => 'Chờ bạn xác nhận',
      (OrderStatus.delivered, OrderRole.seller) => 'Chờ người mua xác nhận',
      (OrderStatus.inTransit, _) => 'Đang giao',
      (OrderStatus.completed, _) => 'Hoàn thành',
      (OrderStatus.cancelled, _) => 'Đã hủy',
      (OrderStatus.refunding, _) => 'Đang hoàn tiền',
      (OrderStatus.refunded, _) => 'Đã hoàn tiền',
    };

/// `cancelled` là trung tính chứ không đỏ: hủy đơn là một kết cục bình thường
/// trong C2C, tô đỏ sẽ làm người dùng tưởng có lỗi. Đỏ để dành cho tranh chấp
/// đang mở — thứ thật sự cần được nhìn thấy trước.
OrderTone orderStatusTone(OrderStatus status) => switch (status) {
  OrderStatus.awaitingPayment => OrderTone.waiting,
  OrderStatus.awaitingShipment => OrderTone.waiting,
  OrderStatus.inTransit => OrderTone.moving,
  OrderStatus.delivered => OrderTone.moving,
  OrderStatus.completed => OrderTone.success,
  OrderStatus.cancelled => OrderTone.neutral,
  OrderStatus.refunded => OrderTone.neutral,
  OrderStatus.refunding => OrderTone.danger,
};
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/order_status_test.dart && flutter analyze`
Expected: PASS — 17 tests

- [ ] **Step 5: Commit**

```bash
git add lib/features/orders/domain/order_status.dart test/order_status_test.dart
git commit -m "$(cat <<'EOF'
feat(orders): OrderStatus — một trục trạng thái duy nhất

Ba trục độc lập từng bị ép bẹp vào một dãy tab, nên tab "Đang xử lý"
chứa thẻ ghi "Đang giao" và badge phải tô màu bằng cách dò chuỗi con
tiếng Việt — "Đã giao" và "Giao thất bại" cùng ra xanh dương.

Mỗi giá trị mới trả lời được "đang chờ ai", và nhãn đổi theo vai để
điều đó đọc được ngay trên badge.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 2: `OrderTab` + `OrderStatusBadge`

**Files:**
- Create: `lib/features/orders/domain/order_tab.dart`
- Create: `lib/shared/widgets/order_status_badge.dart`
- Test: `test/order_tab_test.dart`

**Interfaces:**
- Consumes: `OrderStatus`, `OrderRole`, `OrderTone`, `needsActionFrom`, `orderStatusLabel`, `orderStatusTone` (Task 1)
- Produces:
  - `enum OrderTab { all, actionRequired, shipping, completed, closed }` với `final String value`
  - `String orderTabLabel(OrderTab)`
  - `bool orderTabContains(OrderTab, OrderStatus, OrderRole)`
  - `List<OrderStatus>? orderTabStatuses(OrderTab)` — null nghĩa là không lọc theo status được (dùng cho `all` và `actionRequired`)
  - `OrderTab orderTabFromValue(String?)` — fallback `OrderTab.all`
  - `class OrderStatusBadge extends StatelessWidget` với `({required OrderStatus status, required OrderRole role})`

- [ ] **Step 1: Write the failing test**

```dart
// test/order_tab_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_status.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_tab.dart';

/// Phía mua từng có 6 tab, phía bán 3 tab, trên cùng một OrderState. Cùng một
/// người vừa mua vừa bán trên sàn C2C, nên hai bộ tab khác nhau bắt họ học hai
/// từ vựng cho cùng một việc.
///
/// Tab giờ là hàm gom nhóm trên OrderStatus, định nghĩa một lần cho cả hai phía.
void main() {
  group('nhãn', () {
    test('đủ năm tab và mỗi tab có nhãn', () {
      expect(OrderTab.values.length, 5);
      for (final tab in OrderTab.values) {
        expect(orderTabLabel(tab), isNotEmpty);
      }
    });

    test('đọc từ query, giá trị lạ rơi về all', () {
      expect(orderTabFromValue('shipping'), OrderTab.shipping);
      expect(orderTabFromValue(null), OrderTab.all);
      expect(orderTabFromValue('tab-không-tồn-tại'), OrderTab.all);
    });
  });

  group('gom nhóm', () {
    test('all chứa mọi status ở cả hai vai', () {
      for (final status in OrderStatus.values) {
        for (final role in OrderRole.values) {
          expect(orderTabContains(OrderTab.all, status, role), isTrue);
        }
      }
    });

    test('đang giao gồm chờ giao, đang giao và đã giao', () {
      const shipping = [
        OrderStatus.awaitingShipment,
        OrderStatus.inTransit,
        OrderStatus.delivered,
      ];

      for (final status in OrderStatus.values) {
        expect(
          orderTabContains(OrderTab.shipping, status, OrderRole.buyer),
          shipping.contains(status),
          reason: '$status',
        );
      }
    });

    test('đã hủy/hoàn tiền gồm ba trạng thái kết thúc và tranh chấp', () {
      const closed = [
        OrderStatus.cancelled,
        OrderStatus.refunding,
        OrderStatus.refunded,
      ];

      for (final status in OrderStatus.values) {
        expect(
          orderTabContains(OrderTab.closed, status, OrderRole.seller),
          closed.contains(status),
          reason: '$status',
        );
      }
    });

    test('hoàn thành chỉ chứa completed', () {
      for (final status in OrderStatus.values) {
        expect(
          orderTabContains(OrderTab.completed, status, OrderRole.buyer),
          status == OrderStatus.completed,
        );
      }
    });
  });

  group('cần xử lý phụ thuộc vai', () {
    test('chờ giao là việc của người bán, không của người mua', () {
      expect(
        orderTabContains(
          OrderTab.actionRequired,
          OrderStatus.awaitingShipment,
          OrderRole.seller,
        ),
        isTrue,
      );
      expect(
        orderTabContains(
          OrderTab.actionRequired,
          OrderStatus.awaitingShipment,
          OrderRole.buyer,
        ),
        isFalse,
      );
    });

    test('chờ thanh toán phía bán không nằm ở cần xử lý lẫn đang giao', () {
      // Chủ ý: người bán không có việc gì với đơn chưa trả tiền, và cũng chưa
      // có gì để giao. Nó chỉ nằm ở "Tất cả".
      expect(
        orderTabContains(
          OrderTab.actionRequired,
          OrderStatus.awaitingPayment,
          OrderRole.seller,
        ),
        isFalse,
      );
      expect(
        orderTabContains(
          OrderTab.shipping,
          OrderStatus.awaitingPayment,
          OrderRole.seller,
        ),
        isFalse,
      );
      expect(
        orderTabContains(
          OrderTab.all,
          OrderStatus.awaitingPayment,
          OrderRole.seller,
        ),
        isTrue,
      );
    });
  });

  group('các tab cố ý chồng lấn', () {
    test('delivered nằm ở cả cần xử lý phía mua lẫn đang giao', () {
      expect(
        orderTabContains(
          OrderTab.actionRequired,
          OrderStatus.delivered,
          OrderRole.buyer,
        ),
        isTrue,
      );
      expect(
        orderTabContains(
          OrderTab.shipping,
          OrderStatus.delivered,
          OrderRole.buyer,
        ),
        isTrue,
      );
    });
  });

  group('orderTabStatuses', () {
    test('null cho tab không lọc được bằng một danh sách status', () {
      expect(orderTabStatuses(OrderTab.all), isNull);
      expect(orderTabStatuses(OrderTab.actionRequired), isNull);
    });

    test('danh sách cụ thể cho ba tab còn lại', () {
      expect(orderTabStatuses(OrderTab.completed), [OrderStatus.completed]);
      expect(orderTabStatuses(OrderTab.shipping), hasLength(3));
      expect(orderTabStatuses(OrderTab.closed), hasLength(3));
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/order_tab_test.dart`
Expected: FAIL — `Target of URI doesn't exist: '.../order_tab.dart'`

- [ ] **Step 3: Write `order_tab.dart`**

```dart
// lib/features/orders/domain/order_tab.dart
import 'package:shopnexus_flutter_app/features/orders/domain/order_status.dart';

/// Năm tab, giống hệt nhau ở phía mua và phía bán.
///
/// Tab là hàm gom nhóm trên [OrderStatus], không phải một trục trạng thái thứ
/// hai. Lẫn hai thứ này là nguyên nhân của cả loạt lỗi trước đó: 6 tab một bên,
/// 3 tab bên kia, và tên tab không trùng tên trên thẻ.
enum OrderTab {
  all('all'),
  actionRequired('action_required'),
  shipping('shipping'),
  completed('completed'),
  closed('closed');

  const OrderTab(this.value);

  final String value;
}

String orderTabLabel(OrderTab tab) => switch (tab) {
  OrderTab.all => 'Tất cả',
  OrderTab.actionRequired => 'Cần xử lý',
  OrderTab.shipping => 'Đang giao',
  OrderTab.completed => 'Hoàn thành',
  OrderTab.closed => 'Đã hủy / hoàn tiền',
};

/// Fallback `all` thay vì ném: một link cũ hay gõ sai phải mở ra một màn hình
/// dùng được. Đây là chỗ sửa lỗi `?tab=<số>` cũ — `int.tryParse` không clamp,
/// nên `?tab=9` làm TabController ném exception.
OrderTab orderTabFromValue(String? value) {
  for (final tab in OrderTab.values) {
    if (tab.value == value) return tab;
  }
  return OrderTab.all;
}

/// Danh sách status của một tab, hoặc null khi tab không lọc được bằng status.
///
/// `all` không lọc gì; `actionRequired` phụ thuộc vai nên phải hỏi backend bằng
/// `?action_required=true` — lọc phía client sẽ làm sai tổng khi có phân trang.
List<OrderStatus>? orderTabStatuses(OrderTab tab) => switch (tab) {
  OrderTab.all => null,
  OrderTab.actionRequired => null,
  OrderTab.shipping => const [
    OrderStatus.awaitingShipment,
    OrderStatus.inTransit,
    OrderStatus.delivered,
  ],
  OrderTab.completed => const [OrderStatus.completed],
  OrderTab.closed => const [
    OrderStatus.cancelled,
    OrderStatus.refunding,
    OrderStatus.refunded,
  ],
};

/// Các tab cố ý chồng lấn. Một đơn `delivered` nằm cùng lúc ở "Cần xử lý" (phía
/// mua) và "Đang giao" (cả hai phía): "Cần xử lý" là lát cắt ngang theo *ai đang
/// bị chặn*, ba tab kia là lát cắt dọc theo *đơn đang ở đâu*.
bool orderTabContains(OrderTab tab, OrderStatus status, OrderRole role) =>
    switch (tab) {
      OrderTab.all => true,
      OrderTab.actionRequired => needsActionFrom(status, role),
      _ => orderTabStatuses(tab)!.contains(status),
    };
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/order_tab_test.dart`
Expected: PASS — 11 tests

- [ ] **Step 5: Write `order_status_badge.dart`**

```dart
// lib/shared/widgets/order_status_badge.dart
import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_status.dart';

/// Badge trạng thái, dùng chung cho cả hai phía.
///
/// Thay hai hệ màu độc lập và đều sai: phía mua dò chuỗi con tiếng Việt nên
/// "Đã giao" và "Giao thất bại" cùng ra xanh dương; phía bán hardcode xanh lá
/// nên đơn "Đã hủy" hiển thị bằng màu thành công.
class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    super.key,
    required this.status,
    required this.role,
  });

  final OrderStatus status;
  final OrderRole role;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final (background, foreground) = _colors(orderStatusTone(status), isDark);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        orderStatusLabel(status, role),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: foreground,
        ),
      ),
    );
  }

  (Color, Color) _colors(OrderTone tone, bool isDark) => switch (tone) {
    OrderTone.waiting => isDark
        ? (const Color(0xFFD97706).withAlpha(40), const Color(0xFFFBBF24))
        : (const Color(0xFFFEF3C7), const Color(0xFFD97706)),
    OrderTone.moving => isDark
        ? (const Color(0xFF0284C7).withAlpha(40), const Color(0xFF38BDF8))
        : (const Color(0xFFDBEAFE), const Color(0xFF0284C7)),
    OrderTone.success => isDark
        ? (const Color(0xFF059669).withAlpha(40), const Color(0xFF34D399))
        : (const Color(0xFFD1FAE5), const Color(0xFF059669)),
    OrderTone.neutral => isDark
        ? (Colors.grey.shade800, Colors.grey.shade300)
        : (const Color(0xFFF1F5F9), const Color(0xFF475569)),
    OrderTone.danger => isDark
        ? (const Color(0xFFDC2626).withAlpha(40), const Color(0xFFF87171))
        : (const Color(0xFFFEE2E2), const Color(0xFFDC2626)),
  };
}
```

- [ ] **Step 6: Verify**

Run: `flutter test && flutter analyze`
Expected: mọi test xanh, analyze sạch

- [ ] **Step 7: Commit**

```bash
git add lib/features/orders/domain/order_tab.dart \
        lib/shared/widgets/order_status_badge.dart \
        test/order_tab_test.dart
git commit -m "$(cat <<'EOF'
feat(orders): năm tab dùng chung và badge một hệ màu

Phía mua từng có 6 tab, phía bán 3 tab, trên cùng một OrderState — cùng
một người vừa mua vừa bán phải học hai từ vựng cho một việc.

Badge thay hai hệ màu độc lập và đều sai: phía mua dò chuỗi con nên
"Đã giao" và "Giao thất bại" cùng ra xanh dương, phía bán hardcode xanh
lá nên đơn "Đã hủy" hiển thị bằng màu thành công.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

> ### ⛔ CHẶN: các task dưới đây cần backend
>
> Trước khi bắt đầu Task 3, xác nhận backend đã lên:
>
> ```bash
> grep -rn "awaiting_shipment" lib/api/generated/model/ | head
> ```
>
> Nếu không có kết quả, chạy lại openapi generator. Nếu vẫn không có, backend
> chưa ship `OrderStatus` — **dừng ở đây**. Task 1–2 đã ship được độc lập và
> không phụ thuộc gì; chúng chỉ chưa có ai gọi.

---

### Task 3: Repository và provider đổi sang `?status=`

**Files:**
- Modify: `lib/features/account/data/repositories/account_repository.dart:169-207`
- Modify: `lib/features/seller/data/repositories/seller_repository.dart:88-120`
- Modify: `lib/features/account/presentation/providers/buyer_orders_provider.dart`
- Modify: `lib/features/seller/presentation/providers/seller_orders_provider.dart`
- Test: `test/order_status_query_test.dart`

**Interfaces:**
- Consumes: `OrderStatus`, `OrderRole`, `OrderTab`, `orderTabStatuses` (Task 1–2); `RecordingBackend` từ `test/support/recording_backend.dart`
- Produces: `AccountRepository.buyerOrders({OrderTab tab})`, `SellerRepository.orders({OrderTab tab, int limit})`; `buyerOrdersProvider(OrderTab)`, thay bốn provider rời

- [ ] **Step 1: Đọc hình dạng API sinh ra**

```bash
grep -n "ordersGet" -A 25 lib/api/generated/api/order_api.dart | head -40
```

Ghi lại tên tham số thật cho status và action_required. Các bước sau dùng đúng tên đó.

- [ ] **Step 2: Write the failing test**

```dart
// test/order_status_query_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_tab.dart';

import 'support/recording_backend.dart';

/// Phía mua deep-link bằng `?tab=<số thứ tự>` không clamp, nên `?tab=9` làm
/// TabController ném exception; và vì là chỉ số vị trí, chỉ cần đảo thứ tự tab
/// là mọi link cũ trỏ sai. Phía bán đã làm đúng với `?state=<enum>` có validate.
/// Giờ cả hai dùng `?status=`, và tab "Cần xử lý" hỏi `?action_required=true`.
void main() {
  Map<String, dynamic> emptyPage(request) => {
    'data': <Map<String, dynamic>>[],
    'meta': const {'next_cursor': null},
  };

  test('tab Tất cả không gửi bộ lọc status', () async {
    final backend = RecordingBackend(emptyPage);

    await backend.repository.buyerOrders(tab: OrderTab.all);

    expect(backend.only.queryParameters['status'], isNull);
    expect(backend.only.queryParameters['action_required'], isNull);
    expect(backend.only.queryParameters['role'], 'buyer');
  });

  test('tab Cần xử lý hỏi action_required, không hỏi status', () async {
    final backend = RecordingBackend(emptyPage);

    await backend.repository.buyerOrders(tab: OrderTab.actionRequired);

    expect(backend.only.queryParameters['action_required'], isNotNull);
    expect(backend.only.queryParameters['status'], isNull);
  });

  test('tab Hoàn thành gửi đúng một status', () async {
    final backend = RecordingBackend(emptyPage);

    await backend.repository.buyerOrders(tab: OrderTab.completed);

    expect(
      backend.only.queryParameters['status'].toString(),
      contains('completed'),
    );
  });

  test('tab Đang giao gửi cả ba status', () async {
    final backend = RecordingBackend(emptyPage);

    await backend.repository.buyerOrders(tab: OrderTab.shipping);

    final sent = backend.only.queryParameters['status'].toString();
    expect(sent, contains('awaiting_shipment'));
    expect(sent, contains('in_transit'));
    expect(sent, contains('delivered'));
  });

  test('phía bán gửi role=seller với cùng bộ tab', () async {
    final backend = RecordingBackend(emptyPage);

    await backend.seller.orders(tab: OrderTab.completed);

    expect(backend.only.queryParameters['role'], 'seller');
    expect(
      backend.only.queryParameters['status'].toString(),
      contains('completed'),
    );
  });
}
```

- [ ] **Step 3: Run test to verify it fails**

Run: `flutter test test/order_status_query_test.dart`
Expected: FAIL — `No named parameter with the name 'tab'`

- [ ] **Step 4: Sửa `AccountRepository.buyerOrders`**

Thay chữ ký `buyerOrders({OrderState? state, int limit = 20})` bằng:

```dart
/// `role` là bắt buộc; `tab` quyết định bộ lọc. Ba tab lọc bằng danh sách
/// status, `actionRequired` hỏi backend vì lọc phía client sẽ làm sai tổng khi
/// có phân trang, và `all` không lọc gì.
Future<List<OrderView>> buyerOrders({
  OrderTab tab = OrderTab.all,
  int limit = 20,
}) async {
  final statuses = orderTabStatuses(tab);
  final page = await _orderApi.ordersGet(
    role: orderRoleBuyer,
    status: statuses?.map((s) => s.value).toList(),
    actionRequired: tab == OrderTab.actionRequired ? true : null,
    limit: limit,
  );
  // ... giữ nguyên phần dựng OrderView đang có bên dưới
}
```

Dùng đúng tên tham số tìm được ở Step 1. Nếu generated client nhận status là một chuỗi đơn thay vì list, nối bằng dấu phẩy và ghi chú lý do.

- [ ] **Step 5: Sửa `SellerRepository.orders` theo cùng cách**

Giống hệt, chỉ khác `role: orderRoleSeller`. Giữ nguyên phần dựng `OrderView` bên dưới.

- [ ] **Step 6: Gộp bốn provider phía mua thành một**

Xóa `buyerOpenOrders`, `buyerCompletedOrders`, `buyerCancelledOrders`, `buyerUnsettledItems` và thay bằng:

```dart
/// Một provider theo tab thay vì một provider theo status. Bốn provider rời
/// trước đây đều gọi cùng một đường dẫn với một bộ lọc khác nhau, và
/// `buyerUnsettledItems` còn đọc một route khác hẳn vì "chờ thanh toán" chưa
/// phải là một trạng thái đơn hàng. Giờ nó là `OrderStatus.awaitingPayment`.
@riverpod
Future<List<OrderView>> buyerOrders(Ref ref, OrderTab tab) =>
    ref.watch(accountRepositoryProvider).buyerOrders(tab: tab);
```

Giữ `buyerOrderDetail` và `buyerCancelledItems` nguyên trạng. `BuyerOrderController.cancelItem` đang invalidate hai provider vừa xóa — đổi thành `ref.invalidate(buyerOrdersProvider)`.

- [ ] **Step 7: Sửa provider phía bán tương tự**

Run: `cat lib/features/seller/presentation/providers/seller_orders_provider.dart`
Đổi field `OrderState selected` thành `OrderTab selected`, và `setState(OrderState)` thành `setTab(OrderTab)`. Giữ nguyên phần còn lại của state class.

- [ ] **Step 8: Codegen và chạy test**

Run: `dart run build_runner build --delete-conflicting-outputs && flutter test test/order_status_query_test.dart`
Expected: PASS — 5 tests

- [ ] **Step 9: Sửa test cũ đã hỏng**

`test/buyer_orders_test.dart` và `test/seller_routes_test.dart` import `order_state.dart` và assert `?state=`. Chạy:

Run: `flutter test`
Sửa từng test đỏ sang `OrderStatus`/`OrderTab`. **Không xóa test nào** — chúng ghim những lỗi thật đã từng xảy ra (thiếu `role` gây 400, ba tab trả cùng một danh sách). Chỉ đổi từ vựng, giữ nguyên điều đang được bảo vệ.

- [ ] **Step 10: Verify**

Run: `flutter test && flutter analyze`
Expected: mọi test xanh, analyze sạch

- [ ] **Step 11: Commit**

```bash
git add -A lib/features/account lib/features/seller test/
git commit -m "$(cat <<'EOF'
refactor(orders): repository và provider đổi sang ?status=

Bốn provider rời phía mua đều gọi cùng một đường dẫn với một bộ lọc
khác nhau, và buyerUnsettledItems còn đọc route khác vì "chờ thanh
toán" chưa phải một trạng thái đơn hàng. Giờ nó là awaiting_payment và
tất cả gom về một provider theo tab.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 4: Màn hình Đơn mua về 5 tab

**Files:**
- Modify: `lib/features/account/presentation/screens/orders_screen.dart` — `_tabs` (dòng 26-33), `TabBarView` (dòng 172-182), bốn class tab (dòng 188-410), `_buildStatusBadge` (dòng 1107-1157)
- Modify: `lib/features/account/data/models/order_view.dart:52-65`

**Interfaces:**
- Consumes: `OrderTab`, `orderTabLabel`, `OrderStatusBadge`, `buyerOrdersProvider(OrderTab)` (Task 1–3)
- Produces: không có

- [ ] **Step 1: Bỏ `statusLabel` khỏi `OrderView`**

Xóa getter `statusLabel` (dòng 52-65) khỏi `order_view.dart`. Nó suy diễn ngược badge từ `TransportStatus` và render được 10 chuỗi mà không chuỗi nào trùng tên một tab nào — chính là lỗi #15.

Thêm thay thế đọc thẳng từ đơn:

```dart
/// Trạng thái đơn, đọc thẳng từ trường server gửi. Không còn suy diễn ngược từ
/// `transport`: đơn hàng có trạng thái của nó, còn vận đơn là chi tiết bên trong.
OrderStatus get status =>
    orderStatusFromValue(order.status) ?? OrderStatus.awaitingPayment;
```

Kiểm tra tên field thật trên `Order` trước khi dùng `order.status`:
Run: `grep -n "status\|state" lib/api/generated/model/order.dart | head`

- [ ] **Step 2: Thay bốn class tab bằng một**

Xóa `_AllOrdersTab`, `_PendingItemsTab`, `_PendingOrdersTab`, `_CompletedOrdersTab`, `_CancelledOrdersTab` và thay bằng:

```dart
/// Một class cho cả năm tab. Năm class trước đây khác nhau đúng ở provider được
/// đọc và ở chữ trong empty state — mọi thứ còn lại là bản sao.
class _OrdersTab extends ConsumerWidget {
  const _OrdersTab({required this.tab});

  final OrderTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ordersAsync = ref.watch(buyerOrdersProvider(tab));

    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () => ref.refresh(buyerOrdersProvider(tab).future),
      child: ordersAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return _EmptyState(
              icon: _emptyIcon,
              title: _emptyTitle,
              subtitle: _emptySubtitle,
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) =>
                _buildOrderCard(context, orders[index]),
          );
        },
        loading: () => _buildShimmerList(context),
        error: (err, stack) => _ErrorState(
          error: err,
          onRetry: () => ref.refresh(buyerOrdersProvider(tab)),
        ),
      ),
    );
  }

  IconData get _emptyIcon => switch (tab) {
    OrderTab.all => Icons.receipt_long_rounded,
    OrderTab.actionRequired => Icons.task_alt_rounded,
    OrderTab.shipping => Icons.local_shipping_outlined,
    OrderTab.completed => Icons.check_circle_outline_rounded,
    OrderTab.closed => Icons.cancel_outlined,
  };

  String get _emptyTitle => switch (tab) {
    OrderTab.all => 'Chưa có đơn hàng nào',
    OrderTab.actionRequired => 'Không có việc gì cần bạn xử lý',
    OrderTab.shipping => 'Không có đơn đang giao',
    OrderTab.completed => 'Chưa có đơn hoàn thành',
    OrderTab.closed => 'Chưa có đơn hủy hay hoàn tiền',
  };

  String get _emptySubtitle => switch (tab) {
    OrderTab.all => 'Đơn bạn đặt sẽ xuất hiện ở đây.',
    OrderTab.actionRequired => 'Mọi đơn đang chạy đều không chờ bạn.',
    OrderTab.shipping => 'Đơn đang trên đường sẽ hiển thị tại đây.',
    OrderTab.completed => 'Đơn giao thành công sẽ lưu lịch sử tại đây.',
    OrderTab.closed => 'Đơn đã hủy và yêu cầu hoàn tiền sẽ ở đây.',
  };
}
```

- [ ] **Step 3: Đổi `_tabs` và `TabBarView`**

```dart
// Tab là hàm gom nhóm trên OrderStatus, dùng chung với phía bán.
final List<OrderTab> _tabs = OrderTab.values;
```

Chỗ render nhãn (dòng 149) đổi `_tabs[index]` thành `orderTabLabel(_tabs[index])`.

```dart
body: TabBarView(
  controller: _tabController,
  children: [for (final tab in _tabs) _OrdersTab(tab: tab)],
),
```

- [ ] **Step 4: Thay `_buildStatusBadge` bằng `OrderStatusBadge`**

Xóa hoàn toàn hàm `_buildStatusBadge` (dòng 1107-1157). Thay mọi lời gọi:

| Dòng | Cũ | Mới |
|---|---|---|
| ~599 | `_buildStatusBadge(context, 'Đã hủy')` | `const OrderStatusBadge(status: OrderStatus.cancelled, role: OrderRole.buyer)` |
| ~715 | `_buildStatusBadge(context, status)` | `OrderStatusBadge(status: view.status, role: OrderRole.buyer)` |
| ~947 | `_buildStatusBadge(context, 'Chờ thanh toán')` | `const OrderStatusBadge(status: OrderStatus.awaitingPayment, role: OrderRole.buyer)` |

Xóa luôn biến `final status = view.statusLabel;` ở dòng 649.

- [ ] **Step 5: Sửa `initialTab` thành `OrderTab`**

```dart
class OrdersScreen extends ConsumerStatefulWidget {
  final OrderTab initialTab;

  const OrdersScreen({super.key, this.initialTab = OrderTab.all});
  ...
}
```

Trong `initState`, `initialIndex: _tabs.indexOf(widget.initialTab)`. Vì `orderTabFromValue` luôn trả về một tab hợp lệ, `indexOf` không bao giờ trả `-1` — đây là chỗ lỗi `?tab=9` biến mất.

- [ ] **Step 6: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 7: Commit**

```bash
git add lib/features/account/presentation/screens/orders_screen.dart \
        lib/features/account/data/models/order_view.dart
git commit -m "$(cat <<'EOF'
refactor(orders): màn hình Đơn mua về 5 tab dùng chung

statusLabel suy diễn ngược badge từ TransportStatus và render được 10
chuỗi mà không chuỗi nào trùng tên một tab nào — người mua đứng ở tab
"Đang xử lý" nhìn thấy thẻ ghi "Đang giao" và không lọc được gì.

Năm class tab khác nhau đúng ở provider được đọc và chữ trong empty
state, giờ còn một class.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 5: Màn hình Đơn bán về 5 tab

**Files:**
- Modify: `lib/features/seller/presentation/screens/seller_orders_screen.dart` — `_tabs` (dòng 97-101), badge hardcode (dòng 277-294), `initialState` (dòng 18-32)

**Interfaces:**
- Consumes: `OrderTab`, `orderTabLabel`, `OrderStatusBadge`, `OrderRole` (Task 1–2); provider đã sửa ở Task 3
- Produces: không có

- [ ] **Step 1: Đổi `_tabs`**

```dart
/// Cùng năm tab với phía mua. Ba tab trước đây khớp OrderState, nhưng cùng một
/// người vừa mua vừa bán, và hai bộ tab khác nhau bắt họ học hai từ vựng.
static final _tabs = OrderTab.values;
```

Chỗ render (dòng 71-79) đổi từ `entry.key`/`entry.value` sang duyệt list:

```dart
for (final tab in _tabs)
  Padding(
    padding: const EdgeInsets.only(right: 8),
    child: _buildTabChip(
      context,
      label: orderTabLabel(tab),
      isSelected: state.selected == tab,
      onTap: () => notifier.setTab(tab),
    ),
  ),
```

Giữ nguyên phần padding/layout đang có — chỉ đổi nguồn dữ liệu và tên tham số.

- [ ] **Step 2: Thay badge hardcode**

Xóa toàn bộ `Container` ở dòng 277-294 và thay bằng:

```dart
OrderStatusBadge(status: view.status, role: OrderRole.seller),
```

Đây là chỗ đơn "Đã hủy" đang hiển thị bằng màu thành công.

- [ ] **Step 3: Đổi `initialState` thành `initialTab`**

```dart
class SellerOrdersScreen extends ConsumerStatefulWidget {
  final OrderTab initialTab;

  const SellerOrdersScreen({super.key, this.initialTab = OrderTab.all});
  ...
}
```

Trong `initState`:

```dart
if (widget.initialTab != OrderTab.all) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(sellerOrdersProvider.notifier).setTab(widget.initialTab);
  });
}
```

Giữ nguyên cách hoãn sang post-frame đang có ở dòng 30-33.

- [ ] **Step 4: Sửa chỗ dùng `OrderState` còn lại**

Dòng 248-250 và 404 kiểm tra `order.state == OrderState.open`. Đổi sang:

```dart
order.status == OrderStatus.awaitingShipment
```

Đây là điều kiện "người bán còn được thao tác trên đơn này", và `awaitingShipment` chính là trạng thái đó — chính xác hơn `open` cũ, vốn gồm cả đơn đang trên đường.

- [ ] **Step 5: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch

- [ ] **Step 6: Commit**

```bash
git add lib/features/seller/presentation/screens/seller_orders_screen.dart
git commit -m "$(cat <<'EOF'
refactor(orders): màn hình Đơn bán về 5 tab, bỏ badge hardcode xanh lá

Badge phía bán tô cứng màu thành công bất kể trạng thái, nên đơn "Đã
hủy" hiển thị bằng màu xanh lá. Nút thao tác của người bán giờ gắn với
awaiting_shipment thay vì OrderState.open, vốn gồm cả đơn đang trên đường.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 6: Routing `?status=` có validate

**Files:**
- Modify: `lib/core/routing/app_router.dart:152-165` (seller), `:193-200` (buyer)
- Test: `test/order_route_query_test.dart`

**Interfaces:**
- Consumes: `orderTabFromValue` (Task 2)
- Produces: không có

- [ ] **Step 1: Write the failing test**

```dart
// test/order_route_query_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/orders/domain/order_tab.dart';

/// `?tab=<số thứ tự>` chỉ đi qua `int.tryParse` mà không clamp, nên `?tab=9`
/// làm TabController ném exception; và vì là chỉ số vị trí, đảo thứ tự tab là
/// mọi link cũ trỏ sai. Phía bán đã làm đúng bằng `?state=<enum>` có validate.
void main() {
  test('mọi tab đi vòng qua query và về nguyên vẹn', () {
    for (final tab in OrderTab.values) {
      expect(orderTabFromValue(tab.value), tab);
    }
  });

  test('query lạ rơi về Tất cả thay vì ném', () {
    expect(orderTabFromValue('9'), OrderTab.all);
    expect(orderTabFromValue('999999'), OrderTab.all);
    expect(orderTabFromValue('<script>'), OrderTab.all);
    expect(orderTabFromValue(null), OrderTab.all);
  });
}
```

- [ ] **Step 2: Run test**

Run: `flutter test test/order_route_query_test.dart`
Expected: PASS ngay (hàm đã có từ Task 2). Test này khoá hành vi trước khi router phụ thuộc vào nó.

- [ ] **Step 3: Sửa route phía mua**

```dart
GoRoute(
  path: 'orders',
  name: 'buyer_orders',
  builder: (context, state) => OrdersScreen(
    initialTab: orderTabFromValue(state.uri.queryParameters['status']),
  ),
),
```

- [ ] **Step 4: Sửa route phía bán**

```dart
GoRoute(
  path: 'orders',
  name: 'seller_orders',
  builder: (context, state) => SellerOrdersScreen(
    initialTab: orderTabFromValue(state.uri.queryParameters['status']),
  ),
),
```

Xóa `_enumByValue(OrderState.values, ...)` nếu không còn ai gọi. Nếu `ListingStatus` vẫn dùng nó ở route `products`, giữ lại hàm.

- [ ] **Step 5: Sửa mọi link còn trỏ kiểu cũ**

```bash
grep -rn "orders?tab=\|orders?state=" lib --include="*.dart" | grep -v "\.g\.dart"
```

Đổi từng cái sang `?status=<OrderTab.value>`. Nếu kế hoạch IA đã chạy trước, khối việc-cần-làm trỏ `/seller/orders` không tham số — đổi thành `/seller/orders?status=action_required` để chạm vào là thấy đúng việc.

- [ ] **Step 6: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 7: Commit**

```bash
git add lib/core/routing/app_router.dart test/order_route_query_test.dart
git commit -m "$(cat <<'EOF'
fix(orders): deep-link ?status= có validate cho cả hai phía

?tab=<số> không clamp nên ?tab=9 làm TabController ném exception, và vì
là chỉ số vị trí, đảo thứ tự tab là mọi link cũ trỏ sai. Giá trị lạ giờ
rơi về "Tất cả" thay vì ném.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 7: Chip dashboard người bán và dọn `OrderState`

**Files:**
- Modify: `lib/features/seller/presentation/screens/seller_dashboard_screen.dart:108-155`
- Modify: `lib/features/seller/presentation/providers/seller_dashboard_provider.dart`
- Delete: mọi import `order_state.dart`

**Interfaces:**
- Consumes: `OrderTab`, `orderTabLabel` (Task 2)
- Produces: không có

- [ ] **Step 1: Đổi ba chip Đơn bán sang `OrderTab`**

Ba chip hiện tại là `Đang xử lý` / `Hoàn thành` / `Đã hủy` trỏ `?state=`. Đổi thành ba chip trỏ `?status=`, và **thay "Đang xử lý" bằng "Cần xử lý"** — đây là con số người bán thật sự cần thấy trên dashboard:

```dart
_buildStatCard(
  context,
  title: orderTabLabel(OrderTab.actionRequired),
  count: dashboard.summary.actionRequired,
  onTap: () => context.push('/seller/orders?status=action_required'),
),
_buildStatCard(
  context,
  title: orderTabLabel(OrderTab.completed),
  count: dashboard.summary.completed,
  onTap: () => context.push('/seller/orders?status=completed'),
),
_buildStatCard(
  context,
  title: orderTabLabel(OrderTab.closed),
  count: dashboard.summary.cancelled,
  onTap: () => context.push('/seller/orders?status=closed'),
),
```

Giữ nguyên tên và chữ ký `_buildStatCard` đang có trong file — kiểm tra bằng `grep -n "_buildStatCard" -A 8 lib/features/seller/presentation/screens/seller_dashboard_screen.dart` và dùng đúng tên tham số ở đó.

- [ ] **Step 2: Kiểm tra `OrderSummary` có `actionRequired` chưa**

Run: `grep -n "" lib/api/generated/model/order_summary.dart | grep -i "int\|required"`

Nếu backend chưa thêm field này, **dùng tạm `summary.open`** và thêm comment:

```dart
// summary.open cho tới khi backend thêm actionRequired vào /orders/summary.
// open gồm cả đơn đang trên đường, nên con số này lớn hơn số việc thật.
count: dashboard.summary.open,
```

Không bịa field không tồn tại.

- [ ] **Step 3: Dọn `OrderState` khỏi toàn bộ codebase**

```bash
grep -rn "order_state.dart\|OrderState" lib test --include="*.dart" | grep -v "\.g\.dart"
```

Xóa từng import và lời gọi còn sót. `lib/api/generated/model/order_state.dart` sẽ tự biến mất ở lần regenerate tiếp theo nếu backend đã bỏ nó khỏi spec; nếu chưa, để nguyên file generated và chỉ đảm bảo không code nào import nó.

- [ ] **Step 4: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh, grep ở Step 3 không còn kết quả ngoài file generated

- [ ] **Step 5: Commit**

```bash
git add -A lib test
git commit -m "$(cat <<'EOF'
refactor(seller): chip dashboard theo OrderTab, gỡ OrderState

Chip đầu đổi từ "Đang xử lý" sang "Cần xử lý" — con số người bán thật
sự cần thấy là số đơn đang chờ chính họ, không phải mọi đơn còn mở.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 8: Nối khối việc-cần-làm vào `?action_required=`

**Files:**
- Modify: `lib/features/account/presentation/providers/action_inbox_provider.dart`

**Interfaces:**
- Consumes: `buyerOrdersProvider(OrderTab.actionRequired)` (Task 3); `ActionInbox` từ kế hoạch IA
- Produces: không có

Task này chỉ chạy được nếu **kế hoạch IA đã xong**. Nếu chưa, bỏ qua và làm sau — nó chỉ nâng chất lượng một con số đã hoạt động.

- [ ] **Step 1: Đổi nguồn `ordersToShip`**

Thay khối `countOrZero` đầu tiên:

```dart
countOrZero(() async {
  final orders = await ref.watch(
    buyerOrdersProvider(OrderTab.actionRequired).future,
  );
  return orders.length;
}),
```

Xóa comment "bản tạm" đã ghi ở đó, vì con số giờ đúng nghĩa.

- [ ] **Step 2: Thêm số phía bán**

`ActionInbox.ordersToShip` giờ nên đếm cả hai vai. Thêm field và cập nhật `entries`:

```dart
/// Việc đang chờ chính mình ở vai người bán.
final int ordersToShip;

/// Việc đang chờ chính mình ở vai người mua — trả tiền, hoặc xác nhận đã nhận.
final int ordersToConfirm;
```

Trong `entries`, thêm dòng cho `ordersToConfirm`:

```dart
if (ordersToConfirm > 0)
  ActionInboxEntry(
    label: 'đơn chờ bạn xác nhận',
    count: ordersToConfirm,
    route: '/account/orders?status=action_required',
  ),
```

Cập nhật `total` cộng thêm field mới, và cập nhật `test/action_inbox_test.dart` cho khớp.

- [ ] **Step 3: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 4: Commit**

```bash
git add lib/features/account/ test/action_inbox_test.dart
git commit -m "$(cat <<'EOF'
feat(account): khối việc-cần-làm đếm đúng cả hai vai

Con số trước đây lấy từ summary.open, vốn gồm cả đơn đang trên đường
nên lớn hơn số việc thật. Giờ hỏi ?action_required= và tách riêng việc
ở vai người mua với việc ở vai người bán.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

## Kiểm tra cuối

- [ ] `flutter analyze` sạch
- [ ] `flutter test` toàn bộ xanh
- [ ] `grep -rn "OrderState" lib test --include="*.dart" | grep -v "\.g\.dart"` không còn kết quả
- [ ] `grep -rn "orders?tab=" lib --include="*.dart"` không còn kết quả
- [ ] Mở app: Đơn mua và Đơn bán có cùng 5 tab, cùng nhãn
- [ ] Tab "Cần xử lý" phía mua và phía bán cho ra hai danh sách khác nhau trên cùng một tài khoản
- [ ] Đơn "Đã hủy" hiển thị xám ở cả hai phía, không còn xanh lá phía bán
- [ ] Đơn "Đã giao" hiển thị xanh dương, không lẫn với "Hoàn thành" xanh lá
- [ ] `/account/orders?status=9` mở ra tab "Tất cả", không crash

## Phụ thuộc backend

Task 3–8 chặn bởi các thay đổi sau, tất cả đã mô tả ở §5 của spec:

- `OrderStatus` 8 giá trị trên OpenAPI spec, thay `OrderState`
- `GET /orders?role=…&status=<danh sách>` và `?action_required=true`
- Đơn tồn tại từ lúc đặt với `awaiting_payment` (bỏ order_item mồ côi)
- Ba tác vụ hết hạn: 24h thanh toán, 3 ngày giao hàng, 7 ngày xác nhận nhận hàng
- Tùy chọn: `actionRequired` trên `GET /orders/summary` (Task 7 có đường lui nếu chưa có)
