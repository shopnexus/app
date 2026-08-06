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

    test('total cộng cả ba loại', () {
      const inbox = ActionInbox(
        ordersToShip: 2,
        refundsAsSeller: 3,
        unreadMessages: 5,
      );

      expect(inbox.total, 10);
    });
  });

  group('route của từng mục', () {
    test('mỗi mục mang route để chạm vào là đi đúng chỗ', () {
      const inbox = ActionInbox(
        ordersToShip: 1,
        refundsAsSeller: 1,
        unreadMessages: 1,
      );

      expect(inbox.entries.map((e) => e.route), [
        '/seller/orders',
        '/account/refunds?role=seller',
        '/chat',
      ]);
    });

    /// Chỉ còn một vai hoàn tiền có việc: người bán không được từ chối hoàn tiền,
    /// nên người mua không bao giờ phải phản hồi lại vụ họ đã mở — im lặng của
    /// người bán tự đẩy vụ đó sang ShopNexus.
    test('hoàn tiền chỉ còn dòng của người bán, và nó mở đúng tab', () {
      const inbox = ActionInbox(refundsAsSeller: 2);

      final routes = inbox.entries.map((e) => e.route).toList();

      expect(routes, ['/account/refunds?role=seller']);
    });

    test('chỉ vai có việc mới xuất hiện', () {
      const sellerOnly = ActionInbox(refundsAsSeller: 2);

      expect(sellerOnly.entries.single.route, '/account/refunds?role=seller');
      expect(sellerOnly.entries.single.count, 2);
    });
  });
}
