import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

import 'support/uploader.dart';

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
    /// `null` cho một nguồn nghĩa là nguồn đó ném lỗi.
    ProviderContainer containerWith({
      required Map<RefundRole, List<_Page>> refunds,
      Map<OrderState, int?> orders = const {},
      int? unread,
    }) => ProviderContainer(
      overrides: [
        refundRepositoryProvider.overrideWithValue(
          _FakeRefundRepository(refunds),
        ),
        chatRepositoryProvider.overrideWithValue(_FakeChatRepository(unread)),
        sellerRepositoryProvider.overrideWithValue(_FakeSellerRepository(orders)),
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
        orders: {OrderState.awaitingConfirmation: 2, OrderState.open: 7},
        unread: 5,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.ordersToConfirm, 2);
      expect(inbox.ordersToShip, 7);
      expect(inbox.refundsAsSeller, 3);
      expect(inbox.unreadMessages, 5);
    });

    /// Cái lỗi cụ thể đã sửa: nguồn cũ là `summary.open`, mà `open` là đơn đã
    /// được xác nhận — nên việc gấp nhất, đơn đang giữ tiền người mua và có hạn
    /// 48 giờ, đếm ra 0 và không bao giờ lên badge.
    test('đơn chờ xác nhận hỏi đúng state của nó, không đọc từ open', () async {
      final seller = _FakeSellerRepository({
        OrderState.awaitingConfirmation: 3,
        OrderState.open: 0,
      });
      final container = ProviderContainer(
        overrides: [
          refundRepositoryProvider.overrideWithValue(
            _FakeRefundRepository({
              RefundRole.seller: [
                _Page(count: 0, nextCursor: null),
              ],
            }),
          ),
          chatRepositoryProvider.overrideWithValue(_FakeChatRepository(0)),
          sellerRepositoryProvider.overrideWithValue(seller),
        ],
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.ordersToConfirm, 3);
      expect(inbox.ordersToShip, 0);
      expect(seller.statesAsked, contains(OrderState.awaitingConfirmation));
      // Và nó phải đứng đầu danh sách việc: đó là việc duy nhất có đồng hồ chạy.
      expect(inbox.entries.first.label, 'đơn chờ bạn xác nhận');
      expect(inbox.entries.first.count, 3);
    });

    test('một nguồn hỏng chỉ về 0, các nguồn kia vẫn tới', () async {
      // Đơn hàng hỏng (không có mạng) và chat hỏng; hoàn tiền vẫn phải đếm.
      final container = containerWith(
        refunds: {
          RefundRole.seller: [
            _Page(count: 2, nextCursor: null),
          ],
          RefundRole.buyer: [
            _Page(count: 0, nextCursor: null),
          ],
        },
        orders: {
          OrderState.awaitingConfirmation: null, // null = ném lỗi
          OrderState.open: null,
        },
        unread: null,
      );
      addTearDown(container.dispose);

      final inbox = await container.read(actionInboxProvider.future);

      expect(inbox.ordersToConfirm, 0, reason: 'đọc đơn hỏng');
      expect(inbox.ordersToShip, 0, reason: 'đọc đơn hỏng');
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
        orders: {OrderState.awaitingConfirmation: 0, OrderState.open: 0},
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
          sellerRepositoryProvider.overrideWithValue(
            _FakeSellerRepository(const {
              OrderState.awaitingConfirmation: 0,
              OrderState.open: 0,
            }),
          ),
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
        orders: {OrderState.awaitingConfirmation: 0, OrderState.open: 0},
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
    RefundRole? role,
    RefundStatus? status,
    String? cursor,
  }) async {
    // Khối việc-cần-làm vẫn hỏi theo vai: nó đếm riêng "vụ chờ *tôi* trả lời ở vai
    // bán", không đếm mọi vụ. Chỉ màn danh sách là gộp hai chiều.
    role!;
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
  _FakeChatRepository(this.unread)
    : super(ChatApi(Dio()), OrderApi(Dio()), uploaderOn());

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
  deadlineAt: null,
  sellerDecidedAt: null,
  returnedAt: null,
);

class _FakeSellerRepository extends SellerRepository {
  _FakeSellerRepository(this.counts)
    : super(OrderApi(Dio()), CatalogApi(Dio()), FinanceApi(Dio()));

  /// Số đơn mỗi trạng thái; null nghĩa là lời gọi ném lỗi.
  final Map<OrderState, int?> counts;
  final List<OrderState> statesAsked = [];

  /// Hạn gần nhất mà repository thật sẽ tìm ra khi đi hết các trang.
  DateTime? soonestDeadline;

  @override
  Future<OrderStateCount> countOrders({
    required OrderState state,
    int limit = 50,
    int maxPages = 5,
  }) async {
    statesAsked.add(state);
    final value = counts[state];
    if (value == null) throw StateError('đọc đơn hỏng');
    return OrderStateCount(value, soonestDeadline: soonestDeadline);
  }
}
