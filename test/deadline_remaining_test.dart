import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/core/utils/deadline_utils.dart';

/// `confirmation_deadline_at` có trong hợp đồng từ đầu và được dùng 0 lần: người
/// mua chỉ biết "đang chờ", không biết chờ đến bao giờ, và người bán không thấy
/// cái hạn mà quá nó thì mod vào việc.
void main() {
  final now = DateTime.utc(2026, 8, 6, 12);

  group('DeadlineUtils.remaining', () {
    test('giờ khi còn hơn một giờ', () {
      expect(
        DeadlineUtils.remaining(now.add(const Duration(hours: 31)), now: now),
        'còn 31 giờ',
      );
    });

    /// Làm tròn *xuống*: hứa ít hơn thật thì người bán vẫn kịp, hứa nhiều hơn
    /// thật thì họ mất đơn.
    test('làm tròn xuống, không lên', () {
      expect(
        DeadlineUtils.remaining(
          now.add(const Duration(hours: 31, minutes: 59)),
          now: now,
        ),
        'còn 31 giờ',
      );
    });

    /// "còn 0 giờ" là câu không ai đọc được, nên dưới một giờ phải xuống phút.
    test('xuống phút khi giờ đã thành 0', () {
      expect(
        DeadlineUtils.remaining(now.add(const Duration(minutes: 45)), now: now),
        'còn 45 phút',
      );
      expect(
        DeadlineUtils.remaining(now.add(const Duration(seconds: 30)), now: now),
        'còn dưới 1 phút',
      );
    });

    /// Quá hạn *không* huỷ đơn — hệ thống mở ticket cho mod — nên ẩn dòng này đi
    /// là làm người mua tưởng mọi thứ vẫn đúng lịch.
    test('hạn đã qua vẫn nói ra', () {
      expect(
        DeadlineUtils.remaining(now.subtract(const Duration(hours: 3)), now: now),
        'đã quá hạn',
      );
      expect(DeadlineUtils.isPast(now.subtract(const Duration(minutes: 1)), now: now), isTrue);
    });

    /// Không có hạn là một sự thật, không phải dữ liệu thiếu: server bỏ hạn ngay
    /// khi người bán đã xác nhận.
    test('không có hạn thì không có dòng nào', () {
      expect(DeadlineUtils.remaining(null, now: now), isNull);
      expect(DeadlineUtils.isPast(null, now: now), isFalse);
    });
  });
}
