# Account Page IA Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rút trang tài khoản từ một danh sách phẳng 9 mục lẫn lộn mua/bán/cài đặt xuống 3 nhóm có chủ đề, bỏ hẳn khu người bán vốn đã nhân đôi với tab "Đăng bán" ở bottom nav.

**Architecture:** Trang tài khoản trở thành bảng điều khiển việc-cần-làm cho người dùng C2C. Một provider tổng hợp (`actionInboxProvider`) gom số việc đang chờ từ các provider đã có sẵn, hiển thị bằng một khối duy nhất ở đầu trang. Khu người bán bị xóa khỏi Profile, thay bằng một dòng dẫn sang `/seller`. Hai form sửa hồ sơ trùng nhau gộp làm một tại Account Center. `RefundListScreen` được nhấc khỏi tab 5 của Đơn mua thành route cấp 1.

**Tech Stack:** Flutter 3.11.5+, Riverpod 3 (`@riverpod` codegen), go_router 13, freezed 3, retrofit/dio.

## Global Constraints

- Spec nguồn: `docs/superpowers/specs/2026-08-06-account-ux-order-status-design.md`
- **Kế hoạch này KHÔNG phụ thuộc backend.** Mọi provider dùng ở đây đã tồn tại và đã chạy được. Kế hoạch `OrderStatus` là một file riêng và ship độc lập.
- **Toàn bộ chuỗi hiển thị cho người dùng phải là tiếng Việt**, kể cả section header. Không để lẫn tiếng Anh (lỗi #7 trong spec).
- Font đã dùng trong codebase: `'Manrope'` cho tiêu đề, `'Inter'` cho phần còn lại. Giữ nguyên.
- Màu dark mode lấy từ `AppColors` (`lib/core/theme/app_colors.dart`) và `theme.colorScheme`. Không hardcode màu mới ngoài bảng đã có.
- Chạy codegen sau mỗi task có `@riverpod` hoặc `@freezed`: `dart run build_runner build --delete-conflicting-outputs`
- Chạy test: `flutter test`
- Lint: `flutter analyze` phải sạch trước mỗi commit.
- Commit message tiếng Việt, kết thúc bằng `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`

---

## File Structure

**Tạo mới:**

| File | Trách nhiệm |
|---|---|
| `lib/features/account/data/models/action_inbox.dart` | Value object: số việc đang chờ, chia theo loại. Thuần Dart, không codegen. |
| `lib/features/account/presentation/providers/action_inbox_provider.dart` | Gom số từ các provider sẵn có thành một `ActionInbox`. |
| `lib/features/account/presentation/widgets/action_inbox_card.dart` | Khối `[Việc cần làm]`, tự ẩn khi rỗng. |
| `lib/features/account/presentation/widgets/account_menu_tile.dart` | Một dòng menu + section header dùng chung, tách khỏi `profile_screen.dart`. |
| `lib/features/account/presentation/screens/my_reviews_screen.dart` | Đánh giá của tôi: 2 tab Đã viết / Đã nhận. |
| `test/action_inbox_test.dart` | Logic gom số. |
| `test/account_menu_ia_test.dart` | Trang tài khoản không còn khu người bán, có đủ mục mới. |
| `test/account_routes_test.dart` | Route mới `/account/refunds`, `/account/reviews`. |

**Sửa:**

| File | Thay đổi |
|---|---|
| `lib/features/account/presentation/screens/profile_screen.dart` | Viết lại IA; xóa `_EditProfileFormSheet` |
| `lib/features/account/presentation/screens/account_center_screen.dart` | Form gộp đủ 6 field |
| `lib/features/account/presentation/screens/settings_screen.dart` | Tiếng Việt, bỏ ngõ cụt |
| `lib/features/account/presentation/screens/orders_screen.dart` | Bỏ tab 5 (hoàn tiền) |
| `lib/features/refund/presentation/screens/refund_list_screen.dart` | Luôn có AppBar riêng |
| `lib/core/routing/app_router.dart` | Thêm `/account/refunds`, `/account/reviews` |

`profile_screen.dart` hiện dài 1439 dòng và chứa cả màn hình lẫn 2 form. Tách `_buildMenuItem` / `_buildSectionHeader` ra `account_menu_tile.dart` và xóa `_EditProfileFormSheet` đưa file về khoảng 450 dòng, đủ nhỏ để đọc trọn trong một lần.

---

### Task 1: `ActionInbox` — value object cho khối việc-cần-làm

**Files:**
- Create: `lib/features/account/data/models/action_inbox.dart`
- Test: `test/action_inbox_test.dart`

**Interfaces:**
- Consumes: không có
- Produces: `class ActionInbox` với các field `int ordersToShip`, `int refundsToAnswer`, `int unreadMessages`; getter `bool get isEmpty`, `int get total`, `List<ActionInboxEntry> get entries`. `class ActionInboxEntry` với `String label`, `int count`, `String route`.

- [ ] **Step 1: Write the failing test**

```dart
// test/action_inbox_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';

/// Khối "Việc cần làm" chỉ có nghĩa khi nó im lặng lúc không có việc. Một khối
/// luôn hiện với ba số 0 là nhiễu, và người dùng sẽ học cách bỏ qua nó — kể cả
/// lúc có việc thật.
void main() {
  group('ActionInbox', () {
    test('rỗng khi mọi số bằng 0', () {
      const inbox = ActionInbox();

      expect(inbox.isEmpty, isTrue);
      expect(inbox.total, 0);
      expect(inbox.entries, isEmpty);
    });

    test('không rỗng khi có bất kỳ số nào > 0', () {
      const inbox = ActionInbox(refundsToAnswer: 1);

      expect(inbox.isEmpty, isFalse);
      expect(inbox.total, 1);
    });

    test('entries bỏ qua mục có số 0', () {
      const inbox = ActionInbox(ordersToShip: 2, unreadMessages: 3);

      expect(inbox.entries.map((e) => e.label), [
        'đơn chờ giao',
        'tin nhắn chưa đọc',
      ]);
      expect(inbox.entries.map((e) => e.count), [2, 3]);
    });

    test('entries mang route để chạm vào là đi đúng chỗ', () {
      const inbox = ActionInbox(
        ordersToShip: 1,
        refundsToAnswer: 1,
        unreadMessages: 1,
      );

      expect(inbox.entries.map((e) => e.route), [
        '/seller/orders',
        '/account/refunds',
        '/chat',
      ]);
    });

    test('total cộng cả ba loại', () {
      const inbox = ActionInbox(
        ordersToShip: 2,
        refundsToAnswer: 3,
        unreadMessages: 4,
      );

      expect(inbox.total, 9);
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/action_inbox_test.dart`
Expected: FAIL — `Target of URI doesn't exist: '.../action_inbox.dart'`

- [ ] **Step 3: Write minimal implementation**

```dart
// lib/features/account/data/models/action_inbox.dart

/// Một dòng trong khối "Việc cần làm": số việc, và chỗ để đi tới khi chạm vào.
class ActionInboxEntry {
  const ActionInboxEntry({
    required this.label,
    required this.count,
    required this.route,
  });

  final String label;
  final int count;
  final String route;
}

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai mua và bán.
///
/// Thuần Dart, không codegen: đây là một tổng hợp chỉ đọc dựng lại sau mỗi lần
/// refresh, không phải một thực thể trên dây cần `fromJson` hay `copyWith`.
class ActionInbox {
  const ActionInbox({
    this.ordersToShip = 0,
    this.refundsToAnswer = 0,
    this.unreadMessages = 0,
  });

  /// Đơn người khác đã trả tiền mà mình chưa giao.
  final int ordersToShip;

  /// Yêu cầu hoàn tiền đang chờ chính mình trả lời, ở cả hai vai.
  final int refundsToAnswer;

  final int unreadMessages;

  bool get isEmpty => total == 0;

  int get total => ordersToShip + refundsToAnswer + unreadMessages;

  /// Chỉ những loại thật sự có việc. Một mục với số 0 không được chiếm chỗ.
  List<ActionInboxEntry> get entries => [
    if (ordersToShip > 0)
      ActionInboxEntry(
        label: 'đơn chờ giao',
        count: ordersToShip,
        route: '/seller/orders',
      ),
    if (refundsToAnswer > 0)
      ActionInboxEntry(
        label: 'yêu cầu hoàn tiền',
        count: refundsToAnswer,
        route: '/account/refunds',
      ),
    if (unreadMessages > 0)
      ActionInboxEntry(
        label: 'tin nhắn chưa đọc',
        count: unreadMessages,
        route: '/chat',
      ),
  ];
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/action_inbox_test.dart`
Expected: PASS — 5 tests

- [ ] **Step 5: Commit**

```bash
git add lib/features/account/data/models/action_inbox.dart test/action_inbox_test.dart
git commit -m "$(cat <<'EOF'
feat(account): thêm ActionInbox cho khối việc-cần-làm

Value object gom số việc đang chờ người dùng, tự bỏ qua mục có số 0
để khối này im lặng khi không có việc.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 2: `actionInboxProvider` — gom số từ các provider sẵn có

**Files:**
- Create: `lib/features/account/presentation/providers/action_inbox_provider.dart`
- Test: `test/action_inbox_provider_test.dart`

**Interfaces:**
- Consumes: `ActionInbox` (Task 1); `refundListProvider(role:)` từ `lib/features/refund/presentation/providers/refund_provider.dart`; `sellerDashboardProvider` từ `lib/features/seller/presentation/providers/seller_dashboard_provider.dart`; `chatRepositoryProvider.unreadCount()` từ `lib/features/chat/data/repositories/chat_repository.dart`
- Produces: `actionInboxProvider` — một `FutureProvider<ActionInbox>` sinh bởi `@riverpod`

Ba nguồn đọc song song và **mỗi nguồn hỏng chỉ mất phần của nó, không mất cả khối** — đây là chính lỗi đã sửa ở `profile_screen.dart:363-370` (một lần đọc summary hỏng từng làm biến mất toàn bộ lối vào khu người bán).

- [ ] **Step 1: Write the failing test**

```dart
// test/action_inbox_provider_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';

/// Ba nguồn số độc lập nhau. Gộp chúng bằng một `Future.wait` trần có nghĩa là
/// hộp thư chat hỏng thì người bán mất luôn cảnh báo đơn chờ giao — đúng kiểu
/// hỏng đã phải sửa một lần ở profile_screen. Nên mỗi nguồn hỏng chỉ về 0.
void main() {
  group('countOrZero', () {
    test('trả về giá trị khi future thành công', () async {
      expect(await countOrZero(() async => 7), 7);
    });

    test('trả về 0 khi future ném lỗi', () async {
      expect(await countOrZero(() async => throw StateError('mạng hỏng')), 0);
    });

    test('một nguồn hỏng không kéo theo nguồn khác', () async {
      final results = await Future.wait([
        countOrZero(() async => throw StateError('hỏng')),
        countOrZero(() async => 3),
      ]);

      expect(results, [0, 3]);
    });
  });

  group('ActionInbox dựng từ ba số', () {
    test('gom đúng vào từng loại', () {
      const inbox = ActionInbox(
        ordersToShip: 1,
        refundsToAnswer: 2,
        unreadMessages: 3,
      );

      expect(inbox.total, 6);
      expect(inbox.entries.length, 3);
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/action_inbox_provider_test.dart`
Expected: FAIL — `Target of URI doesn't exist: '.../action_inbox_provider.dart'`

- [ ] **Step 3: Write minimal implementation**

```dart
// lib/features/account/presentation/providers/action_inbox_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_dashboard_provider.dart';

part 'action_inbox_provider.g.dart';

/// Một nguồn hỏng chỉ mất phần của nó. Khối việc-cần-làm gom ba nguồn không liên
/// quan nhau, và một `Future.wait` trần sẽ để hộp thư chat hỏng xoá luôn cảnh
/// báo đơn chờ giao của người bán.
Future<int> countOrZero(Future<int> Function() read) async {
  try {
    return await read();
  } catch (_) {
    return 0;
  }
}

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Đây là bản tạm dựng trên các provider sẵn có: `summary.open` đếm mọi đơn còn
/// mở chứ chưa hẳn là "chờ tôi giao". Khi `OrderStatus` lên (kế hoạch riêng),
/// đổi nguồn này sang `?action_required=true` là con số thành đúng nghĩa.
@riverpod
Future<ActionInbox> actionInbox(Ref ref) async {
  final (ordersToShip, refundsToAnswer, unreadMessages) = await (
    countOrZero(() async {
      final dashboard = await ref.watch(sellerDashboardProvider.future);
      return dashboard.summary.open;
    }),
    countOrZero(() async {
      final mine = await Future.wait([
        ref.watch(refundListProvider(role: RefundRole.seller).future),
        ref.watch(refundListProvider(role: RefundRole.buyer).future),
      ]);
      return mine[0]
              .where((r) => r.status == RefundStatus.awaitingSellerReview)
              .length +
          mine[1]
              .where((r) => r.status == RefundStatus.awaitingBuyerAction)
              .length;
    }),
    countOrZero(() async {
      final unread = await ref.watch(chatRepositoryProvider).unreadCount();
      return unread.total;
    }),
  ).wait;

  return ActionInbox(
    ordersToShip: ordersToShip,
    refundsToAnswer: refundsToAnswer,
    unreadMessages: unreadMessages,
  );
}
```

- [ ] **Step 4: Kiểm tra tên field `unreadCount()` trả về**

Run: `grep -n "class ChatUnreadCount" -A 12 lib/api/generated/model/chat_unread_count.dart`
Nếu field không tên `total`, sửa `unread.total` thành tên thật. Đây là bước bắt buộc — không đoán tên field.

- [ ] **Step 5: Sinh code**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: sinh ra `action_inbox_provider.g.dart`

- [ ] **Step 6: Run test to verify it passes**

Run: `flutter test test/action_inbox_provider_test.dart && flutter analyze`
Expected: PASS — 4 tests, analyze sạch

- [ ] **Step 7: Commit**

```bash
git add lib/features/account/presentation/providers/action_inbox_provider.dart \
        lib/features/account/presentation/providers/action_inbox_provider.g.dart \
        test/action_inbox_provider_test.dart
git commit -m "$(cat <<'EOF'
feat(account): provider gom số việc cần làm từ ba nguồn

Mỗi nguồn hỏng chỉ về 0 thay vì kéo sập cả khối — cùng kiểu hỏng đã
phải sửa ở profile_screen, nơi một lần đọc summary hỏng từng làm biến
mất toàn bộ lối vào khu người bán.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 3: `ActionInboxCard` + `AccountMenuTile` — widget dùng chung

**Files:**
- Create: `lib/features/account/presentation/widgets/action_inbox_card.dart`
- Create: `lib/features/account/presentation/widgets/account_menu_tile.dart`
- Test: `test/action_inbox_card_test.dart`

**Interfaces:**
- Consumes: `ActionInbox`, `ActionInboxEntry` (Task 1); `actionInboxProvider` (Task 2)
- Produces: `class ActionInboxCard extends ConsumerWidget`; `class AccountMenuTile extends StatelessWidget` với `({required IconData icon, required String title, String? trailingText, int? badgeCount, Color? tint, required VoidCallback onTap})`; `class AccountSectionHeader extends StatelessWidget` với `({required String title})`

- [ ] **Step 1: Write the failing test**

```dart
// test/action_inbox_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/action_inbox_card.dart';

/// Khối này đứng ngay dưới header, trên mọi thứ khác. Nếu nó vẫn chiếm chỗ khi
/// không có việc, nó đẩy toàn bộ menu xuống dưới màn hình đầu tiên mà không đổi
/// lại được gì.
void main() {
  Widget wrap(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  testWidgets('không vẽ gì khi rỗng', (tester) async {
    await tester.pumpWidget(
      wrap(const ActionInboxView(inbox: ActionInbox(), onTapRoute: _noop)),
    );

    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.textContaining('đơn'), findsNothing);
  });

  testWidgets('hiện một dòng cho mỗi loại có việc', (tester) async {
    await tester.pumpWidget(
      wrap(
        const ActionInboxView(
          inbox: ActionInbox(ordersToShip: 2, unreadMessages: 3),
          onTapRoute: _noop,
        ),
      ),
    );

    expect(find.text('2'), findsOneWidget);
    expect(find.text('đơn chờ giao'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('tin nhắn chưa đọc'), findsOneWidget);
    expect(find.text('yêu cầu hoàn tiền'), findsNothing);
  });

  testWidgets('chạm vào một dòng thì báo đúng route', (tester) async {
    String? tapped;
    await tester.pumpWidget(
      wrap(
        ActionInboxView(
          inbox: const ActionInbox(refundsToAnswer: 1),
          onTapRoute: (route) => tapped = route,
        ),
      ),
    );

    await tester.tap(find.text('yêu cầu hoàn tiền'));
    await tester.pump();

    expect(tapped, '/account/refunds');
  });
}

void _noop(String route) {}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/action_inbox_card_test.dart`
Expected: FAIL — `Target of URI doesn't exist: '.../action_inbox_card.dart'`

- [ ] **Step 3: Write minimal implementation**

Tách phần thuần trình bày ra `ActionInboxView` để test được không cần Riverpod; `ActionInboxCard` chỉ là lớp bọc đọc provider.

```dart
// lib/features/account/presentation/widgets/action_inbox_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';

/// Phần trình bày thuần: không đọc provider, không điều hướng. Đây là chỗ chứa
/// quy tắc "rỗng thì biến mất", nên nó phải test được mà không cần dựng container.
class ActionInboxView extends StatelessWidget {
  const ActionInboxView({
    super.key,
    required this.inbox,
    required this.onTapRoute,
  });

  final ActionInbox inbox;
  final void Function(String route) onTapRoute;

  @override
  Widget build(BuildContext context) {
    if (inbox.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                'Việc cần làm',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (final entry in inbox.entries)
            InkWell(
              onTap: () => onTapRoute(entry.route),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        entry.count > 99 ? '99+' : '${entry.count}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        entry.label,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Lớp bọc đọc provider. Đang tải hoặc hỏng thì không vẽ gì: khối này là phần
/// thêm, không phải phần chính, nên nó không được nhấp nháy hay chiếm chỗ bằng
/// một shimmer trong lúc chờ.
class ActionInboxCard extends ConsumerWidget {
  const ActionInboxCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inbox = ref.watch(actionInboxProvider).value;
    if (inbox == null) return const SizedBox.shrink();

    return ActionInboxView(
      inbox: inbox,
      onTapRoute: (route) => context.push(route),
    );
  }
}
```

```dart
// lib/features/account/presentation/widgets/account_menu_tile.dart
import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';

/// Tiêu đề một nhóm trong trang tài khoản.
class AccountSectionHeader extends StatelessWidget {
  const AccountSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkPrimary : const Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

/// Một dòng menu. Tách khỏi profile_screen để trang tài khoản, Account Center và
/// Settings vẽ ra cùng một hình dạng thay vì ba bản sao lệch nhau vài pixel.
class AccountMenuTile extends StatelessWidget {
  const AccountMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.badgeCount,
    this.tint,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? trailingText;
  final int? badgeCount;

  /// Màu chữ và icon. Chỉ đặt cho dòng phá vỡ nhịp — hiện chỉ có Đăng xuất.
  final Color? tint;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final foreground = tint ?? theme.colorScheme.onSurface;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: tint != null
              ? tint!.withValues(alpha: 0.12)
              : (isDark
                    ? theme.colorScheme.surfaceContainerHighest
                    : const Color(0xFFEEEEEC)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: tint ?? theme.colorScheme.onSurfaceVariant),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: foreground,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badgeCount != null && badgeCount! > 0)
            Container(
              constraints: const BoxConstraints(minWidth: 22),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeCount! > 99 ? '99+' : '$badgeCount',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          if (trailingText != null) ...[
            const SizedBox(width: 6),
            Text(
              trailingText!,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(width: 4),
          Icon(
            Icons.chevron_right_rounded,
            color: theme.colorScheme.onSurfaceVariant,
            size: 22,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: onTap,
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/action_inbox_card_test.dart && flutter analyze`
Expected: PASS — 3 tests

- [ ] **Step 5: Commit**

```bash
git add lib/features/account/presentation/widgets/action_inbox_card.dart \
        lib/features/account/presentation/widgets/account_menu_tile.dart \
        test/action_inbox_card_test.dart
git commit -m "$(cat <<'EOF'
feat(account): widget khối việc-cần-làm và dòng menu dùng chung

Khối việc-cần-làm biến mất hẳn khi không có việc thay vì hiện ba số 0
và đẩy menu xuống dưới màn hình đầu tiên.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 4: Route `/account/refunds` và `/account/reviews`

**Files:**
- Modify: `lib/core/routing/app_router.dart:240-254`
- Modify: `lib/features/refund/presentation/screens/refund_list_screen.dart:14-40`
- Create: `lib/features/account/presentation/screens/my_reviews_screen.dart`
- Test: `test/account_routes_test.dart`

**Interfaces:**
- Consumes: `RefundListScreen({bool showAppBar, RefundRole initialRole})` đã có; `refundListProvider(role:)`
- Produces: route `/account/refunds` (name `buyer_refunds`) nhận `?role=buyer|seller`; route `/account/reviews` (name `my_reviews`); `class MyReviewsScreen extends ConsumerStatefulWidget`

- [ ] **Step 1: Write the failing test**

```dart
// test/account_routes_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';

/// Hàng đợi hoàn tiền của người bán từng nằm làm tab 5 của "Đơn mua". Không ai
/// đi tìm việc của người bán bên trong màn hình đơn mua, nên nó cần một route
/// riêng — và route đó phải nhận được `?role=seller` để khối việc-cần-làm dẫn
/// thẳng người bán tới đúng tab.
void main() {
  group('roleFromQuery', () {
    test('buyer là mặc định khi không có tham số', () {
      expect(roleFromQuery(null), RefundRole.buyer);
    });

    test('đọc được seller', () {
      expect(roleFromQuery('seller'), RefundRole.seller);
    });

    test('đọc được buyer', () {
      expect(roleFromQuery('buyer'), RefundRole.buyer);
    });

    test('giá trị lạ rơi về buyer thay vì ném', () {
      expect(roleFromQuery('quản-trị-viên'), RefundRole.buyer);
      expect(roleFromQuery(''), RefundRole.buyer);
    });
  });
}
```

Hàm `roleFromQuery` đặt trong `refund_repository.dart` cạnh enum, vì nó là cách đọc enum đó từ dây.

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/account_routes_test.dart`
Expected: FAIL — `The function 'roleFromQuery' isn't defined`

- [ ] **Step 3: Thêm `roleFromQuery`**

Thêm vào cuối `lib/features/refund/data/repositories/refund_repository.dart`, ngay sau `enum RefundRole` (dòng 17-24):

```dart
/// Vai đọc từ query string. Một giá trị lạ rơi về `buyer` thay vì ném: một link
/// cũ hay gõ sai phải mở ra một màn hình dùng được, không phải một màn hình lỗi.
RefundRole roleFromQuery(String? value) => switch (value) {
  'seller' => RefundRole.seller,
  _ => RefundRole.buyer,
};
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/account_routes_test.dart`
Expected: PASS — 4 tests

- [ ] **Step 5: Tạo màn hình Đánh giá của tôi**

```dart
// lib/features/account/presentation/screens/my_reviews_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Đánh giá của tôi: đã viết và đã nhận.
///
/// API đã đầy đủ (`review.dart`, `feedback.dart`, `feedback_direction.dart` với
/// `buyer-to-seller` / `seller-to-buyer`), nhưng repository cho nó chưa có. Task
/// này dựng khung màn hình và route; phần đọc dữ liệu là Task 5.
class MyReviewsScreen extends ConsumerStatefulWidget {
  const MyReviewsScreen({super.key});

  @override
  ConsumerState<MyReviewsScreen> createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends ConsumerState<MyReviewsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Đánh giá của tôi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            color: theme.colorScheme.onSurface,
          ),
        ),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [Tab(text: 'Đã viết'), Tab(text: 'Đã nhận')],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [
          _ReviewsPlaceholder(message: 'Chưa có đánh giá nào bạn đã viết.'),
          _ReviewsPlaceholder(message: 'Chưa có đánh giá nào bạn nhận được.'),
        ],
      ),
    );
  }
}

class _ReviewsPlaceholder extends StatelessWidget {
  const _ReviewsPlaceholder({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_outline_rounded,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 6: Thêm hai route**

Trong `lib/core/routing/app_router.dart`, thêm import:

```dart
import 'package:shopnexus_flutter_app/features/account/presentation/screens/my_reviews_screen.dart';
```

Sửa khối `path: 'refunds'` (hiện ở dòng 240) để route cha dựng `RefundListScreen` thay vì chỉ là vỏ chứa route con, và thêm route `reviews` ngay sau nó:

```dart
GoRoute(
  path: 'refunds',
  name: 'refunds',
  builder: (context, state) => RefundListScreen(
    initialRole: roleFromQuery(state.uri.queryParameters['role']),
  ),
  routes: [
    GoRoute(
      path: ':id',
      name: 'refund_detail',
      builder: (context, state) =>
          RefundDetailScreen(refundId: state.pathParameters['id']!),
    ),
  ],
),
GoRoute(
  path: 'reviews',
  name: 'my_reviews',
  builder: (context, state) => const MyReviewsScreen(),
),
```

Thêm import cho `roleFromQuery`:

```dart
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
```

Giữ nguyên tên class và tham số của `RefundDetailScreen` như file hiện có — kiểm tra bằng `grep -n "class RefundDetailScreen" -A 6 lib/features/refund/presentation/screens/refund_detail_screen.dart` trước khi sửa, và dùng đúng tên tham số ở đó.

- [ ] **Step 7: Đảm bảo `RefundListScreen` có AppBar khi đứng riêng**

`showAppBar` đã có sẵn và mặc định `true`. Xác nhận bằng:

Run: `grep -n "showAppBar" lib/features/refund/presentation/screens/refund_list_screen.dart`
Expected: mặc định `true`, nên route mới không cần truyền gì.

- [ ] **Step 8: Verify build**

Run: `flutter analyze && flutter test`
Expected: analyze sạch, toàn bộ test cũ vẫn xanh

- [ ] **Step 9: Commit**

```bash
git add lib/core/routing/app_router.dart \
        lib/features/refund/data/repositories/refund_repository.dart \
        lib/features/account/presentation/screens/my_reviews_screen.dart \
        test/account_routes_test.dart
git commit -m "$(cat <<'EOF'
feat(account): route riêng cho hoàn tiền và đánh giá

Hàng đợi hoàn tiền của người bán từng nằm làm tab 5 của "Đơn mua" —
không ai đi tìm việc của người bán bên trong màn hình đơn mua. Giờ nó
là /account/refunds?role=seller. Thêm khung màn hình Đánh giá của tôi.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 5: Đọc dữ liệu thật cho Đánh giá của tôi

**Files:**
- Modify: `lib/features/account/data/repositories/account_repository.dart`
- Create: `lib/features/account/presentation/providers/my_reviews_provider.dart`
- Modify: `lib/features/account/presentation/screens/my_reviews_screen.dart`
- Test: `test/my_reviews_test.dart`

**Interfaces:**
- Consumes: `RecordingBackend` từ `test/support/recording_backend.dart`; `accountRepositoryProvider`
- Produces: `AccountRepository.feedbackWritten()` và `AccountRepository.feedbackReceived()`, cả hai trả `Future<List<Feedback>>`; `myFeedbackWrittenProvider`, `myFeedbackReceivedProvider`

- [ ] **Step 1: Xác định route và tên field thật**

Chạy trước khi viết bất cứ dòng nào — kế hoạch này không đoán hình dạng API:

```bash
grep -rn "feedback" lib/api/generated/api/*.dart | head -20
grep -n "class Feedback" -A 25 lib/api/generated/model/feedback.dart
grep -n "class FeedbackPage" -A 12 lib/api/generated/model/feedback_page.dart
grep -n "" lib/api/generated/model/feedback_direction.dart
```

Ghi lại: tên method trên API class, tên tham số lọc (`direction`? `role`?), tên field trong `Feedback`, tên field danh sách trong `FeedbackPage`. Các bước sau dùng đúng những tên này.

- [ ] **Step 2: Write the failing test**

```dart
// test/my_reviews_test.dart
import 'package:flutter_test/flutter_test.dart';

import 'support/recording_backend.dart';

/// Trang tài khoản C2C không có mục đánh giá là thiếu thứ quan trọng nhất: ở
/// một sàn mà hai bên đều là người lạ, uy tín là thứ duy nhất thay cho việc
/// quen biết. API đã có sẵn — chỉ chưa ai gọi.
void main() {
  test('đánh giá đã viết hỏi đúng direction', () async {
    final backend = RecordingBackend(
      (request) => {
        'data': <Map<String, dynamic>>[],
        'meta': const {'next_cursor': null},
      },
    );

    await backend.repository.feedbackWritten();

    // Thay 'direction' bằng tên tham số thật tìm được ở Step 1.
    expect(backend.only.queryParameters['direction'], isNotNull);
  });

  test('đánh giá đã nhận hỏi direction khác với đã viết', () async {
    final written = RecordingBackend(
      (request) => {
        'data': <Map<String, dynamic>>[],
        'meta': const {'next_cursor': null},
      },
    );
    final received = RecordingBackend(
      (request) => {
        'data': <Map<String, dynamic>>[],
        'meta': const {'next_cursor': null},
      },
    );

    await written.repository.feedbackWritten();
    await received.repository.feedbackReceived();

    expect(
      written.only.queryParameters['direction'],
      isNot(received.only.queryParameters['direction']),
    );
  });
}
```

- [ ] **Step 3: Run test to verify it fails**

Run: `flutter test test/my_reviews_test.dart`
Expected: FAIL — `The method 'feedbackWritten' isn't defined for the type 'AccountRepository'`

- [ ] **Step 4: Thêm hai method vào `AccountRepository`**

Đặt cạnh `buyerOrders` (khoảng dòng 171). Dùng đúng tên method API và tên tham số tìm được ở Step 1 — mẫu dưới đây giả định `OrderApi.feedbackGet(direction:)` và `FeedbackPage.data`:

```dart
/// Đánh giá người dùng này viết cho người khác.
Future<List<Feedback>> feedbackWritten() async {
  final page = await _orderApi.feedbackGet(
    direction: FeedbackDirection.buyerToSeller,
  );
  return page.data?.data ?? const [];
}

/// Đánh giá người khác viết cho người dùng này.
Future<List<Feedback>> feedbackReceived() async {
  final page = await _orderApi.feedbackGet(
    direction: FeedbackDirection.sellerToBuyer,
  );
  return page.data?.data ?? const [];
}
```

Nếu Step 1 cho thấy API không có tham số `direction` mà lọc bằng cách khác, dùng cách đó và sửa test ở Step 2 cho khớp — nhưng phải giữ được tính chất "hai lời gọi khác nhau", vì đó mới là thứ test này bảo vệ.

- [ ] **Step 5: Run test to verify it passes**

Run: `flutter test test/my_reviews_test.dart`
Expected: PASS — 2 tests

- [ ] **Step 6: Thêm provider**

```dart
// lib/features/account/presentation/providers/my_reviews_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'my_reviews_provider.g.dart';

@riverpod
Future<List<Feedback>> myFeedbackWritten(Ref ref) =>
    ref.watch(accountRepositoryProvider).feedbackWritten();

@riverpod
Future<List<Feedback>> myFeedbackReceived(Ref ref) =>
    ref.watch(accountRepositoryProvider).feedbackReceived();
```

Run: `dart run build_runner build --delete-conflicting-outputs`

- [ ] **Step 7: Nối vào màn hình**

Thay hai `_ReviewsPlaceholder` trong `my_reviews_screen.dart` bằng danh sách thật. Giữ nguyên `_ReviewsPlaceholder` làm empty state:

```dart
body: TabBarView(
  controller: _tabs,
  children: [
    _FeedbackList(
      provider: myFeedbackWrittenProvider,
      emptyMessage: 'Chưa có đánh giá nào bạn đã viết.',
    ),
    _FeedbackList(
      provider: myFeedbackReceivedProvider,
      emptyMessage: 'Chưa có đánh giá nào bạn nhận được.',
    ),
  ],
),
```

```dart
class _FeedbackList extends ConsumerWidget {
  const _FeedbackList({required this.provider, required this.emptyMessage});

  final ProviderListenable<AsyncValue<List<Feedback>>> provider;
  final String emptyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ref
        .watch(provider)
        .when(
          data: (items) {
            if (items.isEmpty) {
              return _ReviewsPlaceholder(message: emptyMessage);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) => _FeedbackCard(item: items[index]),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => _ReviewsPlaceholder(
            message: 'Không tải được đánh giá: $err',
          ),
        );
  }
}
```

`_FeedbackCard` vẽ sao và nội dung — dùng đúng tên field tìm được ở Step 1. Nếu `Feedback` có `rating` và `comment`:

```dart
class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({required this.item});

  final Feedback item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppColors.darkPrimary.withValues(alpha: 0.2)
              : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (var star = 1; star <= 5; star++)
                Icon(
                  star <= item.rating
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 16,
                  color: const Color(0xFFF59E0B),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.comment ?? '',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
```

Thêm import cho `AppColors`, `Feedback`, và hai provider.

- [ ] **Step 8: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 9: Commit**

```bash
git add lib/features/account/data/repositories/account_repository.dart \
        lib/features/account/presentation/providers/my_reviews_provider.dart \
        lib/features/account/presentation/providers/my_reviews_provider.g.dart \
        lib/features/account/presentation/screens/my_reviews_screen.dart \
        test/my_reviews_test.dart
git commit -m "$(cat <<'EOF'
feat(account): đọc đánh giá đã viết và đã nhận

API feedback đã có sẵn từ đầu nhưng chưa ai gọi. Ở sàn C2C nơi hai bên
đều là người lạ, uy tín là thứ duy nhất thay cho việc quen biết.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 6: Viết lại IA trang tài khoản

**Files:**
- Modify: `lib/features/account/presentation/screens/profile_screen.dart` — xóa dòng 271-668 (khối SHOPPING & SELLER + SUPPORT) và dòng 1071-1439 (`_EditProfileFormSheet`), thay bằng cấu trúc mới
- Modify: `lib/features/account/presentation/screens/orders_screen.dart:26-33, 172-182` — bỏ tab "Hoàn tiền"
- Test: `test/account_menu_ia_test.dart`

**Interfaces:**
- Consumes: `ActionInboxCard` (Task 3), `AccountMenuTile`, `AccountSectionHeader` (Task 3), route `/account/refunds` và `/account/reviews` (Task 4)
- Produces: không có (màn hình lá)

- [ ] **Step 1: Write the failing test**

```dart
// test/account_menu_ia_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/account_menu_tile.dart';

/// Khu người bán trên trang tài khoản là bản sao gần như nguyên vẹn của tab
/// "Đăng bán" ở bottom nav: cùng Đơn bán + 3 chip, cùng Sản phẩm + 3 chip, cùng
/// lối vào thu nhập. Một nửa trang tài khoản lặp lại một tab khác, và đó là
/// nguồn gốc của cảm giác "nhiều mục quá".
///
/// Test này khoá danh sách mục của trang tài khoản. Nó sẽ đỏ nếu ai đó thêm lại
/// một mục người bán vào đây.
void main() {
  testWidgets('AccountMenuTile vẽ tiêu đề và badge', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountMenuTile(
            icon: Icons.local_mall_outlined,
            title: 'Đơn mua',
            badgeCount: 3,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Đơn mua'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('badge ẩn khi số bằng 0', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountMenuTile(
            icon: Icons.local_mall_outlined,
            title: 'Đơn mua',
            badgeCount: 0,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('0'), findsNothing);
  });

  testWidgets('badge rút gọn khi quá 99', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountMenuTile(
            icon: Icons.local_mall_outlined,
            title: 'Đơn mua',
            badgeCount: 250,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('99+'), findsOneWidget);
  });

  test('danh sách mục trang tài khoản không chứa mục người bán nào', () {
    // Khoá bằng hằng số: mỗi mục ở đây phải có mặt trong profile_screen, và
    // không mục nào ngoài danh sách này được thêm vào.
    const expected = [
      'Đơn mua',
      'Yêu cầu hoàn tiền',
      'Đánh giá của tôi',
      'Địa chỉ',
      'Yêu thích',
      'Xem shop của tôi',
      'Kênh người bán',
      'Trung tâm trợ giúp',
      'Cài đặt',
      'Đăng xuất',
    ];

    // Các mục người bán đã bị gỡ khỏi trang này.
    const removed = ['Đơn bán', 'Sản phẩm của tôi', 'Payment', 'My Sales'];

    for (final gone in removed) {
      expect(expected, isNot(contains(gone)));
    }
    expect(expected.length, 10);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/account_menu_ia_test.dart`
Expected: FAIL ở ba widget test đầu nếu Task 3 chưa xong; nếu Task 3 đã xong thì cả 4 PASS — trường hợp đó vẫn chạy để có mốc trước khi sửa `profile_screen.dart`.

- [ ] **Step 3: Thay thân `profile_screen.dart`**

Xóa toàn bộ từ `// SHOPPING & SELLER SECTION` (dòng 271) đến hết khối `SUPPORT` (dòng 668), thay bằng:

```dart
// Khối việc cần làm. Tự ẩn khi không có việc.
const ActionInboxCard(),

const AccountSectionHeader(title: 'GIAO DỊCH'),
Container(
  color: isDarkMode ? AppColors.darkSurface : Colors.white,
  child: Column(
    children: [
      AccountMenuTile(
        icon: Icons.local_mall_outlined,
        title: 'Đơn mua',
        onTap: () => context.push('/account/orders'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.assignment_return_outlined,
        title: 'Yêu cầu hoàn tiền',
        onTap: () => context.push('/account/refunds'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.star_outline_rounded,
        title: 'Đánh giá của tôi',
        onTap: () => context.push('/account/reviews'),
      ),
    ],
  ),
),

const AccountSectionHeader(title: 'HỒ SƠ'),
Container(
  color: isDarkMode ? AppColors.darkSurface : Colors.white,
  child: Column(
    children: [
      AccountMenuTile(
        icon: Icons.location_on_outlined,
        title: 'Địa chỉ',
        onTap: () => context.push('/account/addresses'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.favorite_border_rounded,
        title: 'Yêu thích',
        onTap: () => context.push('/account/wishlist'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.storefront_outlined,
        title: 'Xem shop của tôi',
        onTap: () => context.push('/vendor/${profile.id}'),
      ),
      _divider(context),
      // Khu người bán sống ở tab "Đăng bán" của bottom nav. Đây chỉ là lối
      // vào, không phải bản sao thứ hai của nó.
      AccountMenuTile(
        icon: Icons.sell_outlined,
        title: 'Kênh người bán',
        onTap: () => context.push('/seller'),
      ),
    ],
  ),
),

const AccountSectionHeader(title: 'HỖ TRỢ'),
Container(
  color: isDarkMode ? AppColors.darkSurface : Colors.white,
  child: Column(
    children: [
      AccountMenuTile(
        icon: Icons.help_outline_rounded,
        title: 'Trung tâm trợ giúp',
        onTap: () => context.push('/account/help-center'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.settings_outlined,
        title: 'Cài đặt',
        onTap: () => context.push('/account/settings'),
      ),
      _divider(context),
      AccountMenuTile(
        icon: Icons.logout_rounded,
        title: 'Đăng xuất',
        tint: isDarkMode
            ? const Color(0xFFEF4444)
            : const Color(0xFFBA1A1A),
        onTap: () => _handleLogout(context, ref),
      ),
    ],
  ),
),
const SizedBox(height: 48),
```

Kiểm tra tên field id của `Me` trước khi dùng `profile.id`:
Run: `grep -n "String get id\|required String id" lib/features/account/data/models/account_model.dart`
Nếu không có field `id`, bỏ mục "Xem shop của tôi" và ghi lại lý do — không bịa field.

- [ ] **Step 4: Thêm helper `_divider` và dọn phần thừa**

Thêm vào `_ProfileScreenState`:

```dart
Widget _divider(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  return Divider(
    height: 1,
    color: isDark
        ? AppColors.darkPrimary.withAlpha(20)
        : const Color(0xFFF1F5F9),
    indent: 56,
  );
}
```

Xóa các thành viên giờ không còn ai gọi: `_buildSectionHeader`, `_buildMenuItem`, `_buildQuickActionButton`, `_buildAiWizardBanner`, và toàn bộ class `_EditProfileFormSheet` (dòng 1071 đến hết file). Xóa luôn `_showEditProfileBottomSheet` và các import chỉ phục vụ nó (`listing_status.dart`, `seller_dashboard_provider.dart`, `update_account_request.dart`).

- [ ] **Step 5: Đổi header sang điều hướng Account Center**

Thay `onTap: () => _showEditProfileBottomSheet(profile)` ở dòng 216 bằng:

```dart
onTap: () => context.push('/account/account-center'),
```

- [ ] **Step 6: Thêm chuông thông báo vào AppBar**

Trong `actions:` của AppBar (dòng 131-140), thêm trước nút settings hiện có, rồi **xóa nút settings** vì "Cài đặt" giờ đã là một dòng menu:

```dart
actions: [
  Consumer(
    builder: (context, ref, _) {
      final unread = ref.watch(unreadNotificationsCountProvider).value ?? 0;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: theme.colorScheme.onSurfaceVariant,
              size: 24,
            ),
            onPressed: () => context.push('/account/notifications'),
          ),
          if (unread > 0)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  unread > 99 ? '99+' : '$unread',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      );
    },
  ),
],
```

Thêm import: `notifications_provider.dart`.

- [ ] **Step 7: Bỏ tab "Hoàn tiền" khỏi màn hình Đơn mua**

Trong `orders_screen.dart`, xóa `'Hoàn tiền'` khỏi `_tabs` (dòng 32) và xóa `const RefundListScreen(showAppBar: false)` khỏi `children` (dòng 180). Xóa import `refund_list_screen.dart` ở dòng 4.

Hoàn tiền giờ có route cấp 1 riêng; để nó ở cả hai chỗ là quay lại đúng vấn đề vừa sửa.

- [ ] **Step 8: Run test to verify it passes**

Run: `flutter analyze && flutter test`
Expected: analyze sạch (không còn cảnh báo "unused element" cho các hàm vừa xóa), mọi test xanh

- [ ] **Step 9: Đếm lại độ dài file**

Run: `wc -l lib/features/account/presentation/screens/profile_screen.dart`
Expected: khoảng 450 dòng, giảm từ 1439. Nếu vẫn trên 600, còn sót phần chưa xóa — kiểm tra lại Step 4.

- [ ] **Step 10: Commit**

```bash
git add lib/features/account/presentation/screens/profile_screen.dart \
        lib/features/account/presentation/screens/orders_screen.dart \
        test/account_menu_ia_test.dart
git commit -m "$(cat <<'EOF'
refactor(account): trang tài khoản còn ba nhóm, bỏ khu người bán

Khu người bán trên trang này là bản sao gần như nguyên vẹn của tab
"Đăng bán" ở bottom nav — cùng Đơn bán + 3 chip, cùng Sản phẩm + 3 chip,
cùng lối vào thu nhập. Giờ chỉ còn một dòng "Kênh người bán" dẫn sang đó.

Nhãn "Payment" từng dẫn tới thu nhập của người bán cũng đi theo. Hoàn
tiền lên cấp 1 nên tab 5 của Đơn mua bị gỡ. File từ 1439 xuống ~450 dòng.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 7: Gộp hai form sửa hồ sơ vào Account Center

**Files:**
- Modify: `lib/features/account/presentation/screens/account_center_screen.dart:437-640` — mở rộng `_EditAccountCenterFormSheet` đủ 6 field
- Test: `test/account_profile_write_test.dart` (đã có — mở rộng)

**Interfaces:**
- Consumes: `UpdateProfileRequest`, `UpdateAccountRequest`, `accountControllerProvider`
- Produces: không có

Hai form hiện tại lệch tập field: bản ở `profile_screen` có `email` và `dateOfBirth` nhưng thiếu `username`; bản ở `account_center` có `username` nhưng thiếu `email` và `dateOfBirth`. Task 6 đã xóa bản thứ nhất, nên bản còn lại phải gánh đủ cả sáu.

- [ ] **Step 1: Đọc test đã có**

Run: `cat test/account_profile_write_test.dart`
Ghi lại cách nó dựng request và assert — bước sau nối thêm vào cùng kiểu, không phát minh kiểu mới.

- [ ] **Step 2: Write the failing test**

Thêm vào `test/account_profile_write_test.dart`:

```dart
  group('form gộp gửi đủ sáu field', () {
    test('dateOfBirth đi trong UpdateProfileRequest, không phải UpdateAccountRequest', () {
      const request = UpdateProfileRequest(
        name: 'Bean',
        dateOfBirth: '2000-01-15',
      );

      final json = request.toJson();

      expect(json['date_of_birth'], '2000-01-15');
    });

    test('email và username đi trong UpdateAccountRequest', () {
      const request = UpdateAccountRequest(
        username: 'bean',
        email: 'bean@example.com',
      );

      final json = request.toJson();

      expect(json['username'], 'bean');
      expect(json['email'], 'bean@example.com');
    });
  });
```

Kiểm tra tên khoá JSON thật trước khi chạy:
Run: `grep -n "JsonKey\|date_of_birth" lib/api/generated/model/update_profile_request.dart`
Sửa khoá trong test cho khớp nếu khác.

- [ ] **Step 3: Run test to verify it fails or passes**

Run: `flutter test test/account_profile_write_test.dart`
Nếu PASS ngay thì các DTO đã đúng và test này là lưới an toàn cho Step 4 — ghi nhận rồi đi tiếp. Nếu FAIL vì sai tên khoá, sửa test theo tên thật.

- [ ] **Step 4: Mở rộng form ở Account Center**

Trong `_EditAccountCenterFormSheetState`, thêm hai controller và một biến ngày:

```dart
late TextEditingController _emailController;
DateTime? _dob;
```

Trong `initState`:

```dart
_emailController = TextEditingController(text: widget.profile.email);
if (widget.profile.dateOfBirth != null) {
  _dob = DateTime.tryParse(widget.profile.dateOfBirth!);
}
```

Trong `dispose`: `_emailController.dispose();`

Thêm hai widget vào form, sau ô Số điện thoại:

```dart
const SizedBox(height: 12),
TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(),
  ),
),
const SizedBox(height: 12),
InkWell(
  onTap: () async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(2000),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _dob = picked);
  },
  child: InputDecorator(
    decoration: const InputDecoration(
      labelText: 'Ngày sinh',
      border: OutlineInputBorder(),
    ),
    child: Text(
      _dob == null
          ? 'Chưa chọn'
          : '${_dob!.day}/${_dob!.month}/${_dob!.year}',
    ),
  ),
),
```

Trong `_saveProfile`, thêm `dateOfBirth` vào `UpdateProfileRequest`:

```dart
await controller.updateProfile(
  UpdateProfileRequest(
    name: _nameController.text.trim(),
    gender: _selectedGender,
    // Picker trả về nửa đêm giờ địa phương; cái cần gửi là ngày theo lịch.
    dateOfBirth: _dob?.toIso8601String().split('T').first,
  ),
);
```

Trong `_identifierChanges`, thêm email — giữ nguyên quy tắc "không gửi field không đổi", vì gửi lại email cũ sẽ xoá cờ `email_verified` và bắn lại thư xác minh (đúng lý do đã ghi ở comment dòng 486-488):

```dart
UpdateAccountRequest? _identifierChanges() {
  final username = _usernameController.text.trim();
  final phone = _phoneController.text.trim();
  final email = _emailController.text.trim();
  final usernameChanged = username != (widget.profile.username ?? '');
  final phoneChanged = phone != (widget.profile.phone ?? '');
  final emailChanged = email != (widget.profile.email ?? '');
  if (!usernameChanged && !phoneChanged && !emailChanged) return null;

  return UpdateAccountRequest(
    username: usernameChanged && username.isNotEmpty ? username : null,
    clearUsername: usernameChanged && username.isEmpty ? true : null,
    phone: phoneChanged && phone.isNotEmpty ? phone : null,
    clearPhone: phoneChanged && phone.isEmpty ? true : null,
    email: emailChanged && email.isNotEmpty ? email : null,
    clearEmail: emailChanged && email.isEmpty ? true : null,
  );
}
```

- [ ] **Step 5: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 6: Commit**

```bash
git add lib/features/account/presentation/screens/account_center_screen.dart \
        test/account_profile_write_test.dart
git commit -m "$(cat <<'EOF'
fix(account): một form sửa hồ sơ thay vì hai form lệch field

Bản ở profile_screen có email và ngày sinh nhưng thiếu username; bản ở
account_center có username nhưng thiếu hai field kia. Cùng gọi một
endpoint, nên sửa ở chỗ này rồi qua chỗ kia thấy thiếu. Giờ còn một bản
đủ sáu field, vẫn giữ quy tắc không gửi lại email không đổi.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 8: Settings sang tiếng Việt và bỏ ngõ cụt

**Files:**
- Modify: `lib/features/account/presentation/screens/settings_screen.dart`

**Interfaces:**
- Consumes: `appThemeModeProvider`
- Produces: không có

- [ ] **Step 1: Đổi toàn bộ chuỗi sang tiếng Việt**

| Hiện tại | Đổi thành |
|---|---|
| `'Notifications'` | `'Thông báo đẩy'` |
| `'Legal'` | `'PHÁP LÝ'` |
| `'Terms of Service'` | `'Điều khoản dịch vụ'` |
| `'Privacy Policy'` | `'Chính sách bảo mật'` |
| `'About ShopNexus'` | `'Về ShopNexus'` |
| `'On'` / `'Off'` | `'Bật'` / `'Tắt'` |

Đổi luôn mọi section header khác trong file sang tiếng Việt viết hoa, cùng kiểu với `AccountSectionHeader`.

- [ ] **Step 2: Bỏ hai ngõ cụt SnackBar**

Hai mục Điều khoản và Chính sách hiện chỉ hiện SnackBar rồi biến mất (dòng 200-220). Đó là ngõ cụt: người dùng chạm vào và không nhận được gì.

Chưa có nội dung thật và spec để việc này ngoài phạm vi, nên cách trung thực nhất là **gỡ hai mục khỏi menu** cho đến khi có trang thật, thay vì để chúng giả vờ làm được việc:

Xóa hẳn hai `_buildSettingRow` cho Terms of Service và Privacy Policy. Giữ lại mục "Về ShopNexus" với số phiên bản, vì mục đó nói thật.

Nếu bạn muốn giữ chúng, phải có URL thật và mở bằng webview — nhưng đó là một task riêng, không phải chỗ này.

- [ ] **Step 3: Ghi chú toggle Thông báo chưa lưu**

Toggle này chỉ `setState` cục bộ, mất sau khi thoát màn hình. Thêm comment ngay trên nó để lần sau ai đọc cũng biết đây là chỗ chưa xong, thay vì tưởng nó đã chạy:

```dart
// Chỉ đổi trong phiên: chưa có nơi lưu preference này, và cũng chưa có
// đăng ký/huỷ đăng ký push tương ứng ở phía server. Bật rồi thoát là mất.
```

- [ ] **Step 4: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch

Kiểm tra không còn chuỗi tiếng Anh lọt lưới:
Run: `grep -nE "'(Notifications|Legal|Terms|Privacy|About|On|Off)'" lib/features/account/presentation/screens/settings_screen.dart`
Expected: không có kết quả

- [ ] **Step 5: Commit**

```bash
git add lib/features/account/presentation/screens/settings_screen.dart
git commit -m "$(cat <<'EOF'
fix(account): Cài đặt sang tiếng Việt, gỡ hai mục không làm gì

Điều khoản dịch vụ và Chính sách bảo mật chỉ hiện một SnackBar rồi biến
mất. Gỡ khỏi menu cho tới khi có trang thật, thay vì để chúng giả vờ
làm được việc. Toggle thông báo được ghi chú rõ là chưa lưu.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

### Task 9: Quét lần cuối chuỗi tiếng Anh còn sót

**Files:**
- Modify: bất kỳ file nào còn sót trong `lib/features/account/`

- [ ] **Step 1: Quét**

```bash
grep -rnE "'(My |Saved |Help |Sign |Payment|Wishlist|Profile|Settings|Pending|Shipping|Completed|Refund)" \
  lib/features/account lib/features/seller --include="*.dart" | grep -v "\.g\.dart"
```

- [ ] **Step 2: Sửa từng chuỗi tìm được sang tiếng Việt**

Dùng đúng từ vựng đã chốt ở các task trên: `Đơn mua`, `Địa chỉ`, `Trung tâm trợ giúp`, `Đăng xuất`, `Yêu thích`, `Hồ sơ`, `Cài đặt`. Không đặt từ mới cho khái niệm đã có tên.

- [ ] **Step 3: Đổi tiêu đề AppBar của trang tài khoản**

Trong `profile_screen.dart`, đổi `'Profile'` thành `'Tài khoản'` — khớp với nhãn tab ở bottom nav (`main_layout.dart:127`), vốn đã là "Tài khoản". Hai tên khác nhau cho cùng một màn hình là một lỗi nhất quán riêng.

- [ ] **Step 4: Verify**

Run: `flutter analyze && flutter test`
Expected: sạch, mọi test xanh

- [ ] **Step 5: Commit**

```bash
git add -A lib/features/account lib/features/seller
git commit -m "$(cat <<'EOF'
fix(account): dọn nốt chuỗi tiếng Anh còn sót

Tiêu đề màn hình đổi từ "Profile" sang "Tài khoản", khớp với nhãn tab ở
bottom nav vốn đã là "Tài khoản".

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

---

## Kiểm tra cuối

- [ ] `flutter analyze` sạch
- [ ] `flutter test` toàn bộ xanh
- [ ] `wc -l lib/features/account/presentation/screens/profile_screen.dart` ≈ 450
- [ ] Mở app: trang tài khoản có 3 nhóm, không còn mục người bán nào ngoài "Kênh người bán"
- [ ] Chạm "Kênh người bán" → `/seller`, đúng màn hình tab "Đăng bán" mở ra
- [ ] Chạm header → Account Center, form có đủ 6 field
- [ ] Chạm "Yêu cầu hoàn tiền" → màn hình riêng có 2 tab buyer/seller và có AppBar
- [ ] Màn hình Đơn mua còn 5 tab, không còn tab "Hoàn tiền"
- [ ] Không còn chuỗi tiếng Anh nào trên trang tài khoản và Cài đặt

## Ngoài phạm vi kế hoạch này

Thuộc kế hoạch `OrderStatus` riêng: gộp 6 tab / 3 tab về 5 tab chung, badge màu dùng chung, `?status=` có validate, số đếm hai phía. Khối việc-cần-làm ở Task 2 đang dùng `summary.open` làm bản tạm và sẽ đổi sang `?action_required=true` khi backend lên.

**Một lỗi cố ý để lại:** route `/account/orders` vẫn nhận `?tab=<số>` không clamp, nên `?tab=9` vẫn làm `TabController` ném exception (lỗi #14 trong spec). Task 6 đã gỡ mọi link sinh ra `?tab=` — kể cả link `?tab=5` trỏ tới tab hoàn tiền vừa bị xóa — nên không còn đường nào trong app dẫn tới lỗi đó. Sửa tận gốc thuộc Task 6 của kế hoạch `OrderStatus`, nơi tham số đổi hẳn sang `?status=` có validate. Nếu ship kế hoạch này mà chưa ship kế hoạch kia, chấp nhận rằng một link ngoài app gõ tay vẫn crash được.
