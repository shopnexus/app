import 'package:flutter_test/flutter_test.dart';
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

    test('mọi vai đi vòng qua query và về nguyên vẹn', () {
      for (final role in RefundRole.values) {
        expect(roleFromQuery(role.value), role);
      }
    });
  });
}
