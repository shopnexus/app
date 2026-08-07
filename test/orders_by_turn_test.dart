import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Đơn hàng xếp theo **lượt**, không theo vai.
///
/// Segment "Tôi mua | Tôi bán" đã bỏ, và những bài dưới đây là lý do nó không được
/// quay lại: nó tồn tại vì `/orders` từng bắt buộc có `role` — nên UI phải bắt
/// người dùng chọn vai trước khi hỏi được server — chứ không vì ai cần chọn. Cái
/// người ta thật sự hỏi là "cái gì đang chờ tôi", và câu đó vắt qua cả hai vai:
/// một người bán chưa xác nhận đơn và một người mua chưa xác nhận đã nhận hàng đều
/// đang giữ tiền của người khác, và trước đây chúng nằm ở hai tab.
void main() {
  /// Hai id của `orderJson`. Vai giờ là thuộc tính của **dòng** — đọc bằng
  /// `order.seller.id == me` — nên cùng một payload dựng được cả hai phía chỉ bằng
  /// việc đổi xem mình là ai.
  const buyerID = 'acc_88sxn2txxspd4';
  const sellerID = 'acc_48gmxxfhd8ta3';

  // `Me` của app (`data/models/account_model.dart`), không của client sinh ra:
  // `profileProvider` trả về cái này.
  Me meWith(String id) => Me.fromJson({...meJson, 'id': id});

  /// Không ảnh bìa: `Image.network` không tải được gì trong test, và những bài này
  /// nói về câu chữ với nút bấm.
  final listingNoCover = {...listingJson, 'cover': null};

  RecordingBackend serving(List<Map<String, dynamic>> orders) =>
      RecordingBackend(
        (request) => switch (request.path) {
          '/orders' => {
            'data': orders,
            'meta': const {'next_cursor': null},
          },
          '/items' => {
            'data': const [],
            'meta': const {'next_cursor': null},
          },
          _ => {
            'data': [listingNoCover],
            'meta': {'page': 1, 'limit': 20, 'total_count': 1},
          },
        },
      );

  Widget app({
    required RecordingBackend backend,
    required String me,
    String at = '/orders',
  }) {
    final router = GoRouter(
      initialLocation: at,
      routes: [
        ShellRoute(
          builder: (context, state, child) => child,
          routes: [
            GoRoute(path: '/orders', builder: (_, _) => const OrdersScreen()),
            GoRoute(
              path: '/seller',
              builder: (_, _) => const Text('seller'),
              routes: [GoRoute(path: 'orders', redirect: (_, _) => '/orders')],
            ),
          ],
        ),
      ],
    );

    return ProviderScope(
      overrides: [
        accountRepositoryProvider.overrideWithValue(backend.repository),
        profileProvider.overrideWith((ref) => meWith(me)),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }

  Map<String, dynamic> order({
    required String state,
    String? transportStatus = 'pending',
    String? receivedAt,
  }) {
    final row = {...orderJson, 'state': state, 'received_at': receivedAt};
    if (transportStatus == null) {
      row.remove('transport');
    } else {
      row['transport'] = {
        ...(orderJson['transport']! as Map<String, dynamic>),
        'status': transportStatus,
      };
    }
    return row;
  }

  group('một lượt đọc, không vai', () {
    testWidgets('không gửi role, và không có segment nào để chạm', (
      tester,
    ) async {
      final backend = serving([]);
      await tester.pumpWidget(app(backend: backend, me: buyerID));
      await tester.pumpAndSettle();

      final roles = [
        for (final call in backend.calls)
          if (call.path == '/orders') call.queryParameters['role'],
      ];
      // Một lượt gọi, không tham số vai. Hai lượt gọi là quay lại hai cursor phải
      // trộn tay, mà đó chính là lý do cái segment từng tồn tại.
      expect(roles, [null]);
      expect(find.text('Tôi mua'), findsNothing);
      expect(find.text('Tôi bán'), findsNothing);
    });
  });

  group('cùng một đơn, hai phía đọc ra hai việc', () {
    testWidgets('bên bán: vào CẦN BẠN, có Xác nhận và Từ chối', (tester) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'awaiting-confirmation')]),
          me: sellerID,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('CẦN BẠN'), findsOneWidget);
      expect(find.textContaining('Cần bạn xác nhận'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Xác nhận'), findsOneWidget);
      expect(find.widgetWithText(TextButton, 'Từ chối'), findsOneWidget);
    });

    testWidgets('bên mua: vào ĐANG CHỜ, và nói ai đang giữ tiền', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'awaiting-confirmation')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      // Cùng payload, cùng màn hình, không có gì để bấm — và câu chữ nói đúng
      // chuyện đang xảy ra với tiền của họ.
      expect(find.text('ĐANG CHỜ'), findsOneWidget);
      expect(find.text('CẦN BẠN'), findsNothing);
      expect(find.textContaining('ShopNexus đang giữ'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Xác nhận'), findsNothing);
    });
  });

  group('hai cái đồng hồ, một danh sách', () {
    testWidgets('kiện đã tới mà chưa xác nhận nhận hàng thì cần người mua', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          backend: serving([
            order(state: 'open', transportStatus: 'delivered'),
          ]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      // Đây là cái đồng hồ đắt nhất trên sàn và nó chỉ vào người mua: tới khi họ
      // chạm thì tiền người bán vẫn nằm trong escrow.
      expect(find.text('CẦN BẠN'), findsOneWidget);
      expect(
        find.widgetWithText(ElevatedButton, 'Đã nhận hàng'),
        findsOneWidget,
      );
    });

    testWidgets('đơn tôi bán và đơn tôi mua nằm chung, chia theo lượt', (
      tester,
    ) async {
      // Cùng một người, hai đơn: một đơn họ bán đang chờ chính họ xác nhận, một
      // đơn họ mua đang trên đường. Trước đây hai dòng này ở hai tab khác nhau,
      // nên cái gấp có thể hoàn toàn không được nhìn thấy.
      final mineToConfirm = {
        ...order(state: 'awaiting-confirmation'),
        'id': 'ord_selling1',
        'seller': {'id': buyerID, 'name': 'Tôi', 'avatar': null},
        'buyer': {'id': sellerID, 'name': 'Minh', 'avatar': null},
      };
      final mineInTransit = {
        ...order(state: 'open', transportStatus: 'in-transit'),
        'id': 'ord_buying1',
      };

      await tester.pumpWidget(
        app(backend: serving([mineToConfirm, mineInTransit]), me: buyerID),
      );
      await tester.pumpAndSettle();

      expect(find.text('CẦN BẠN'), findsOneWidget);
      expect(find.text('ĐANG CHỜ'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Xác nhận'), findsOneWidget);
    });
  });

  group('không mất chức năng nào của màn Đơn bán cũ', () {
    Widget sellerAt(String state, {String? transportStatus = 'pending'}) => app(
      backend: serving([order(state: state, transportStatus: transportStatus)]),
      me: sellerID,
    );

    testWidgets('đơn đang đi chỉ còn câu giải thích, không nút nào', (
      tester,
    ) async {
      await tester.pumpWidget(sellerAt('open', transportStatus: 'in-transit'));
      await tester.pumpAndSettle();

      // "Cập nhật vận chuyển" đã bỏ từ trước: vị trí kiện hàng là báo cáo của đơn
      // vị giao hàng. "Báo vấn đề" và "Hành trình" cũng đã bỏ khỏi danh sách —
      // chúng sống trong màn chi tiết, nơi có đủ thông tin để viết một yêu cầu.
      expect(find.text('Báo vấn đề'), findsNothing);
      expect(find.text('Hành trình'), findsNothing);
      expect(
        find.textContaining('do đơn vị giao hàng cập nhật'),
        findsOneWidget,
      );
    });

    testWidgets('hủy được khi kiện hàng chưa rời pending', (tester) async {
      await tester.pumpWidget(sellerAt('open'));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(OutlinedButton, 'Hủy đơn'), findsOneWidget);
    });

    testWidgets('kiện hàng đã đi rồi thì không mời hủy nữa', (tester) async {
      await tester.pumpWidget(sellerAt('open', transportStatus: 'in-transit'));
      await tester.pumpAndSettle();

      // Route trả 409 sau khi hàng đã được lấy; đường về là một yêu cầu hoàn tiền.
      expect(find.widgetWithText(TextButton, 'Hủy đơn'), findsNothing);
    });

    testWidgets('đơn đã xong nằm ở XONG và không mời làm gì nữa', (
      tester,
    ) async {
      await tester.pumpWidget(sellerAt('completed'));
      await tester.pumpAndSettle();

      expect(find.textContaining('XONG'), findsOneWidget);
      expect(find.text('Xác nhận'), findsNothing);
      expect(find.text('Từ chối'), findsNothing);
      expect(find.text('Hủy đơn'), findsNothing);
      // Người bán không được mời đánh giá: đánh giá sản phẩm là việc người mua.
      expect(find.text('Đánh giá'), findsNothing);
    });
  });

  group('bảng nút: cái gì hiện lúc nào', () {
    testWidgets('chờ xác nhận + kiện ghi "đã giao" vẫn KHÔNG mời nhận hàng', (
      tester,
    ) async {
      // Dữ liệu có thật: đơn còn `awaiting-confirmation` mà transport đã ghi
      // `delivered`, còn lại từ trước khi có bước xác nhận. Điều kiện cũ chỉ đọc
      // kiện hàng, nên nó mời người mua bấm "Đã nhận hàng" cho một đơn người bán
      // còn chưa nhận — tức là thả escrow cho một sale chưa ai đồng ý.
      await tester.pumpWidget(
        app(
          backend: serving([
            order(state: 'awaiting-confirmation', transportStatus: 'delivered'),
          ]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Đã nhận hàng'), findsNothing);
    });

    testWidgets('người mua hủy được khi người bán chưa xác nhận', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'awaiting-confirmation')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      // Server cho bất kỳ bên nào hủy khi hàng chưa đi, và lúc này tiền về đủ cả
      // phí giao hàng. Người mua trước đây không có nút nào ở trạng thái này.
      expect(find.widgetWithText(OutlinedButton, 'Hủy đơn'), findsOneWidget);
    });

    testWidgets('đơn hoàn thành mời người mua đánh giá', (tester) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'completed')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.widgetWithText(OutlinedButton, 'Đánh giá'), findsOneWidget);
    });

    testWidgets('người bán không được mời đánh giá đơn của mình', (
      tester,
    ) async {
      // Bài riêng chứ không pump lần hai trong cùng một bài: Flutter dùng lại
      // element cũ, nên override `profileProvider` của lần sau không có tác dụng
      // và bài test đọc ra kết quả của lần trước.
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'completed')]),
          me: sellerID,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Đánh giá'), findsNothing);
    });

    testWidgets('đơn đã hủy không mời làm gì cả', (tester) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'cancelled')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Hủy đơn'), findsNothing);
      expect(find.text('Đã nhận hàng'), findsNothing);
      expect(find.text('Xác nhận'), findsNothing);
    });
  });

  testWidgets('/seller/orders vẫn mở được', (tester) async {
    await tester.pumpWidget(
      app(backend: serving([]), me: sellerID, at: '/seller/orders'),
    );
    await tester.pumpAndSettle();

    // `context.push` là một string: xoá path này đi thì analyze vẫn xanh và chỉ
    // người dùng chạm vào mới biết.
    expect(tester.takeException(), isNull);
    expect(find.text('Đơn hàng'), findsOneWidget);
  });
}
