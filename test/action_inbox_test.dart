import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';

/// Khối "Việc cần làm" chỉ có nghĩa khi nó im lặng lúc không có việc. Một khối
/// luôn hiện với bốn số 0 là nhiễu, và người dùng sẽ học cách bỏ qua nó — kể cả
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
      const inbox = ActionInbox(refundsAsSeller: 1);

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

    test('total cộng cả bốn loại', () {
      const inbox = ActionInbox(
        ordersToShip: 2,
        refundsAsSeller: 3,
        refundsAsBuyer: 4,
        unreadMessages: 5,
      );

      expect(inbox.total, 14);
    });
  });

  group('route của từng mục', () {
    test('mỗi mục mang route để chạm vào là đi đúng chỗ', () {
      const inbox = ActionInbox(
        ordersToShip: 1,
        refundsAsSeller: 1,
        refundsAsBuyer: 1,
        unreadMessages: 1,
      );

      expect(inbox.entries.map((e) => e.route), [
        '/seller/orders',
        '/account/refunds?role=seller',
        '/account/refunds?role=buyer',
        '/chat',
      ]);
    });

    /// Hai vai hoàn tiền phải là hai dòng riêng mang hai route riêng.
    /// `RefundListScreen` mở đúng một trong hai tab, nên một dòng gộp buộc phải
    /// chọn bừa — và người bán có việc chờ duyệt sẽ rơi vào tab "Tôi mua" rỗng.
    test('hai vai hoàn tiền không bao giờ trỏ cùng một chỗ', () {
      const inbox = ActionInbox(refundsAsSeller: 2, refundsAsBuyer: 3);

      final routes = inbox.entries.map((e) => e.route).toList();

      expect(routes, hasLength(2));
      expect(routes.toSet(), hasLength(2));
      expect(routes.every((r) => r.contains('role=')), isTrue);
    });

    test('chỉ vai có việc mới xuất hiện', () {
      const sellerOnly = ActionInbox(refundsAsSeller: 2);

      expect(sellerOnly.entries.single.route, '/account/refunds?role=seller');
      expect(sellerOnly.entries.single.count, 2);
    });
  });
}
