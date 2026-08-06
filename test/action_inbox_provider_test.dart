import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_dashboard_provider.dart';

/// Bốn nguồn số độc lập nhau. Gộp chúng bằng một `Future.wait` trần có nghĩa là
/// hộp thư chat hỏng thì người bán mất luôn cảnh báo hoàn tiền chờ duyệt — đúng
/// kiểu hỏng đã phải sửa một lần ở profile_screen, nơi một lần đọc summary hỏng
/// từng làm biến mất toàn bộ lối vào khu người bán.
///
/// Các test ở đây dựng provider thật với repository giả, nên chúng đỏ nếu ai đó
/// thay `countOrZero` bằng một `Future.wait` trần — thứ mà một test chỉ gọi
/// `countOrZero` trực tiếp sẽ không bắt được.
void main() {
  group('countOrZero', () {
    test('trả về giá trị khi future thành công', () async {
      expect(await countOrZero(() async => 7), 7);
    });

    test('trả về 0 khi future ném lỗi', () async {
      expect(await countOrZero(() async => throw StateError('mạng hỏng')), 0);
    });
  });

  group('actionInboxProvider', () {
    /// `null` cho [openOrders] hoặc [unread] nghĩa là nguồn đó ném lỗi.
    ProviderContainer containerWith({
      required Map<RefundRole, List<_Page>> refunds,
      int? openOrders,
      int? unread,
    }) => ProviderContainer(
      overrides: [
        refundRepositoryProvider.overrideWithValue(
          _FakeRefundRepository(refunds),
        ),
        chatRepositoryProvider.overrideWithValue(_FakeChatRepository(unread)),
        sellerDashboardProvider.overrideWith(
          () => _FakeDashboardNotifier(openOrders),
        ),
      ],
    );

    test('đếm hoàn tiền tách theo vai, không gộp', () async {
      final container = containerWith(
        refunds: {
          RefundRole.seller: [
            _Page(count: 3, nextCursor: null),
          ],
          RefundRole.buyer: [
            _Page(count: 1, nextCursor: null),
          ],
        },
        openOrders: 7,
        unread: 5,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.ordersToShip, 7);
      expect(inbox.refundsAsSeller, 3);
      expect(inbox.unreadMessages, 5);
    });

    test('một nguồn hỏng chỉ về 0, ba nguồn kia vẫn tới', () async {
      // Dashboard hỏng (không có mạng) và chat hỏng; hoàn tiền vẫn phải đếm.
      final container = containerWith(
        refunds: {
          RefundRole.seller: [
            _Page(count: 2, nextCursor: null),
          ],
          RefundRole.buyer: [
            _Page(count: 0, nextCursor: null),
          ],
        },
        openOrders: null, // null = ném lỗi
        unread: null,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.ordersToShip, 0, reason: 'dashboard hỏng');
      expect(inbox.unreadMessages, 0, reason: 'chat hỏng');
      expect(inbox.refundsAsSeller, 2, reason: 'nguồn lành vẫn phải tới');
      expect(inbox.isEmpty, isFalse);
    });

    test('đếm hết các trang chứ không chỉ trang đầu', () async {
      // Người bán vừa đóng nhiều vụ: trang đầu đầy, việc thật nằm ở trang sau.
      final container = containerWith(
        refunds: {
          RefundRole.seller: [
            _Page(count: 20, nextCursor: 'p2'),
            _Page(count: 20, nextCursor: 'p3'),
            _Page(count: 4, nextCursor: null),
          ],
          RefundRole.buyer: [
            _Page(count: 0, nextCursor: null),
          ],
        },
        openOrders: 0,
        unread: 0,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.refundsAsSeller, 44);
    });

    test('lọc trạng thái phía server chứ không lọc ở client', () async {
      final repository = _FakeRefundRepository({
        RefundRole.seller: [
          _Page(count: 1, nextCursor: null),
        ],
        RefundRole.buyer: [
          _Page(count: 1, nextCursor: null),
        ],
      });
      final container = ProviderContainer(
        overrides: [
          refundRepositoryProvider.overrideWithValue(repository),
          chatRepositoryProvider.overrideWithValue(_FakeChatRepository(0)),
          sellerDashboardProvider.overrideWith(() => _FakeDashboardNotifier(0)),
        ],
      );
      addTearDown(container.dispose);

      await container.read(actionInboxProvider.future);

      expect(
        repository.statusAsked[RefundRole.seller],
        RefundStatus.awaitingSellerReview,
      );
      // Không hỏi gì ở vai người mua: người bán không được từ chối hoàn tiền, nên
      // không có trạng thái nào chờ người mua phản hồi.
      expect(repository.statusAsked.containsKey(RefundRole.buyer), isFalse);
    });

    test('không có việc nào thì hộp rỗng', () async {
      final container = containerWith(
        refunds: {
          RefundRole.seller: [
            _Page(count: 0, nextCursor: null),
          ],
          RefundRole.buyer: [
            _Page(count: 0, nextCursor: null),
          ],
        },
        openOrders: 0,
        unread: 0,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.isEmpty, isTrue);
      expect(inbox.entries, isEmpty);
    });
  });
}

class _Page {
  _Page({required this.count, required this.nextCursor});

  final int count;
  final String? nextCursor;
}

class _FakeRefundRepository extends RefundRepository {
  _FakeRefundRepository(this.pages) : super(OrderApi(Dio()));

  final Map<RefundRole, List<_Page>> pages;
  final Map<RefundRole, RefundStatus?> statusAsked = {};
  final Map<RefundRole, int> _served = {};

  @override
  Future<RefundPageResult> list({
    required RefundRole role,
    RefundStatus? status,
    String? cursor,
  }) async {
    statusAsked[role] = status;
    final index = _served[role] ?? 0;
    _served[role] = index + 1;

    final list = pages[role] ?? const [];
    if (index >= list.length) {
      return const RefundPageResult(refunds: [], nextCursor: null);
    }
    final page = list[index];
    return RefundPageResult(
      refunds: List<Refund>.filled(page.count, _stubRefund, growable: false),
      nextCursor: page.nextCursor,
    );
  }
}

class _FakeChatRepository extends ChatRepository {
  _FakeChatRepository(this.unread) : super(ChatApi(Dio()), OrderApi(Dio()));

  /// Null nghĩa là lời gọi ném lỗi.
  final int? unread;

  @override
  Future<ChatUnreadCount> unreadCount() async {
    final value = unread;
    if (value == null) throw StateError('chat hỏng');
    return ChatUnreadCount(conversations: 1, unread: value);
  }
}

/// Chỉ số lượng phần tử là thứ được đếm, nên nội dung không quan trọng.
final _stubRefund = Refund(
  attachments: const [],
  buyerId: 'acc_1',
  createdAt: DateTime.utc(2026),
  id: 'ref_1',
  orderId: 'ord_1',
  reason: 'stub',
  status: RefundStatus.awaitingSellerReview,
);

class _FakeDashboardNotifier extends SellerDashboardNotifier {
  _FakeDashboardNotifier(this.open);

  /// Null nghĩa là lời gọi ném lỗi.
  final int? open;

  @override
  Future<SellerDashboard> build() async {
    final value = open;
    if (value == null) throw StateError('dashboard hỏng');
    return SellerDashboard(
      summary: OrderSummary(
        cancelled: 0,
        completed: 0,
        daily: const [],
        from: DateTime.utc(2026),
        open: value,
        to: DateTime.utc(2026, 2),
        totals: const [],
      ),
      listings: const {},
    );
  }
}
