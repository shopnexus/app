import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Màn "Đơn hàng của tôi" là **đơn tôi mua**, chia theo sáu trạng thái.
///
/// Đơn tôi bán sống ở `/seller/orders`, một màn riêng với một lượt đọc riêng —
/// nên màn này gửi `role=buyer` và một dòng mà tôi là người bán không được lọt
/// vào đây kể cả khi server có trả về.
///
/// Sáu tab là sáu câu lọc trên cùng một lượt đọc, không phải sáu lượt gọi: cursor
/// của `/orders` chỉ có một, và sáu provider theo tab là sáu cursor phải trộn tay.
void main() {
  const buyerID = 'acc_88sxn2txxspd4';
  const sellerID = 'acc_48gmxxfhd8ta3';

  Me meWith(String id) => Me.fromJson({...meJson, 'id': id});

  /// Không ảnh bìa: `Image.network` không tải được gì trong test, và những bài
  /// này nói về câu chữ với nút bấm.
  final listingNoCover = {...listingJson, 'cover': null};

  RecordingBackend serving(List<Map<String, dynamic>> orders) =>
      RecordingBackend(
        (request) => switch (request.path) {
          '/orders' => {
            'data': orders,
            'meta': const {'next_cursor': null},
          },
          '/items' || '/refunds' => {
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
        // Tab "Hoàn tiền" đọc nguồn này, và nó đi qua repository riêng của refund
        // chứ không qua [backend] — không chặn thì bài test đi ra mạng thật.
        refundListProvider.overrideWith((ref) => const <Refund>[]),
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

  /// Mở tab theo nhãn của nó. Bảy tab nằm trong một `TabBar` cuộn ngang, nên
  /// nhãn xa phải được kéo tới trước khi chạm được.
  /// Tìm trong `TabBar`, không tìm cả cây: "Đã hủy" cũng là nhãn trạng thái trên
  /// chính cái thẻ đơn, nên `find.text` trần khớp hai chỗ.
  Finder tab(String label) =>
      find.descendant(of: find.byType(TabBar), matching: find.text(label));

  Future<void> openTab(WidgetTester tester, String label) async {
    await tester.ensureVisible(tab(label));
    await tester.tap(tab(label));
    await tester.pumpAndSettle();
  }

  group('một lượt đọc, vai người mua', () {
    testWidgets('gửi role=buyer, đúng một lần cho cả bảy tab', (tester) async {
      final backend = serving([]);
      await tester.pumpWidget(app(backend: backend, me: buyerID));
      await tester.pumpAndSettle();

      final roles = [
        for (final call in backend.calls)
          if (call.path == '/orders') call.queryParameters['role'],
      ];
      expect(roles, ['buyer']);
      // Segment vai đã bỏ: vai là chuyện của route, không phải một câu hỏi đặt
      // cho người dùng trước khi họ thấy được đơn nào.
      expect(find.text('Tôi mua'), findsNothing);
      expect(find.text('Tôi bán'), findsNothing);
    });

    testWidgets('bảy tab, và tab đầu là Tất cả', (tester) async {
      await tester.pumpWidget(app(backend: serving([]), me: buyerID));
      await tester.pumpAndSettle();

      for (final title in const [
        'Tất cả',
        'Chờ thanh toán',
        'Chờ xác nhận',
        'Đang xử lý',
        'Hoàn thành',
        'Hoàn tiền',
        'Đã hủy',
      ]) {
        await tester.ensureVisible(tab(title));
        expect(tab(title), findsOneWidget, reason: 'thiếu tab "$title"');
      }
    });

    testWidgets('đơn tôi bán không lọt vào màn đơn tôi mua', (tester) async {
      // Server đã lọc bằng `role=buyer`; đây là cái chốt thứ hai, cho lúc một
      // lượt đọc cũ hoặc một bản server cũ vẫn trả về cả hai chiều.
      final mySale = {
        ...order(state: 'awaiting-confirmation'),
        'id': 'ord_selling1',
        'seller': {'id': buyerID, 'name': 'Tôi', 'avatar': null},
        'buyer': {'id': sellerID, 'name': 'Minh', 'avatar': null},
      };

      await tester.pumpWidget(app(backend: serving([mySale]), me: buyerID));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ElevatedButton, 'Xác nhận'), findsNothing);
      expect(find.text('Từ chối'), findsNothing);
    });
  });

  group('tab nào chứa đơn nào', () {
    testWidgets('chờ người bán xác nhận thì nằm ở "Chờ xác nhận"', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'awaiting-confirmation')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      await openTab(tester, 'Chờ xác nhận');
      expect(find.textContaining('ShopNexus đang giữ'), findsOneWidget);

      // Và không nằm ở "Đang xử lý": người bán còn chưa nhận đơn, nên chưa có
      // gì được giao cho đơn vị vận chuyển.
      await openTab(tester, 'Đang xử lý');
      expect(find.textContaining('ShopNexus đang giữ'), findsNothing);
    });

    testWidgets('kiện đã tới mà chưa xác nhận thì vẫn ở "Đang xử lý"', (
      tester,
    ) async {
      // Kiện hàng không quyết được đơn đã xong: `state` là kết cục, và một đơn
      // `open` mà kiện ghi `delivered` là đơn *đang chờ đúng cú chạm này* — tiền
      // của người bán vẫn nằm trong escrow tới lúc người mua bấm. Xếp nó vào
      // "Hoàn thành" là nói với người mua rằng xong rồi, ngay chỗ họ vẫn còn
      // việc phải làm.
      await tester.pumpWidget(
        app(
          backend: serving([
            order(state: 'open', transportStatus: 'delivered'),
          ]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      await openTab(tester, 'Đang xử lý');
      expect(
        find.widgetWithText(ElevatedButton, 'Đã nhận hàng'),
        findsOneWidget,
      );

      await openTab(tester, 'Hoàn thành');
      expect(find.widgetWithText(ElevatedButton, 'Đã nhận hàng'), findsNothing);
    });

    testWidgets('đơn đã hủy chỉ nằm ở "Đã hủy", và không mời làm gì', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'cancelled')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      await openTab(tester, 'Đã hủy');
      expect(find.text('Hủy đơn'), findsNothing);
      expect(find.text('Đã nhận hàng'), findsNothing);
      expect(find.text('Xác nhận'), findsNothing);
    });
  });

  group('bảng nút của người mua', () {
    testWidgets('hủy được khi kiện hàng chưa rời pending', (tester) async {
      await tester.pumpWidget(
        app(
          backend: serving([order(state: 'awaiting-confirmation')]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      // Server cho bất kỳ bên nào hủy khi hàng chưa đi, và lúc đó tiền về đủ cả
      // phí giao hàng.
      expect(find.widgetWithText(OutlinedButton, 'Hủy đơn'), findsOneWidget);
    });

    testWidgets('kiện hàng đã đi rồi thì không mời hủy nữa', (tester) async {
      await tester.pumpWidget(
        app(
          backend: serving([
            order(state: 'open', transportStatus: 'in-transit'),
          ]),
          me: buyerID,
        ),
      );
      await tester.pumpAndSettle();

      // Route trả 409 sau khi hàng đã được lấy; đường về là một yêu cầu hoàn tiền.
      expect(find.text('Hủy đơn'), findsNothing);
    });

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
  });

  testWidgets('/seller/orders vẫn mở được', (tester) async {
    await tester.pumpWidget(
      app(backend: serving([]), me: sellerID, at: '/seller/orders'),
    );
    await tester.pumpAndSettle();

    // `context.push` là một string: xoá path này đi thì analyze vẫn xanh và chỉ
    // người dùng chạm vào mới biết.
    expect(tester.takeException(), isNull);
    expect(find.text('Đơn hàng của tôi'), findsOneWidget);
  });
}
