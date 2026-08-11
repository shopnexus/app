import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/profile_screen.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/action_inbox.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/providers/refund_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_earnings_provider.dart';

/// Trang Tài khoản: bốn nhóm, và mỗi lối vào phải sống sót qua một nguồn hỏng.
///
/// Điều bài này giữ không phải là danh sách nhãn — nhãn đổi theo lần thiết kế
/// lại — mà là: ví có một dòng riêng, dòng đó **vẫn vào được** khi `GET /wallets`
/// hỏng hoặc khi tài khoản chưa có ví nào, và câu số dư nói cả tiền rút được lẫn
/// tiền escrow đang giữ. Escrow của một đơn đã trả tiền không phải tiền rút
/// được, nên một con số duy nhất trả lời sai câu "tiền của tôi đâu".
void main() {
  const me = Me(
    createdAt: '2026-08-01T00:00:00Z',
    email: 'a@b.c',
    emailVerified: true,
    hasPassword: true,
    id: 'acc_1',
    identityVerified: false,
    role: 'user',
    status: 'active',
    username: 'bao',
  );

  Widget app({Wallet? wallet, bool walletFails = false}) {
    final router = GoRouter(
      initialLocation: '/account',
      routes: [
        GoRoute(path: '/account', builder: (_, _) => const ProfileScreen()),
      ],
    );

    return ProviderScope(
      overrides: [
        profileProvider.overrideWith((ref) => me),
        actionInboxProvider.overrideWith((ref) => const ActionInbox()),
        // Dải "chờ xác nhận / đang xử lý / …" trên đầu trang đọc hai nguồn này.
        // Không chặn thì chúng đi ra mạng thật và bài test đo một trang lỗi.
        ordersProvider.overrideWith(() => _EmptyOrders()),
        refundListProvider.overrideWith((ref) => const <Refund>[]),
        sellerWalletProvider.overrideWith((ref) {
          if (walletFails) {
            throw DioException(
              requestOptions: RequestOptions(path: '/wallets'),
            );
          }
          return wallet;
        }),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }

  testWidgets('mọi lối vào đều có mặt', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    for (final row in [
      'Chuyển sang Kênh Người Bán',
      'Đơn hàng của tôi',
      'Ví & Số dư',
      'Sản phẩm đã lưu',
      'Đang theo dõi',
      'Sổ địa chỉ',
      'Trung tâm trợ giúp',
      'Cài đặt',
      'Đăng xuất',
    ]) {
      expect(find.text(row), findsOneWidget, reason: 'thiếu dòng "$row"');
    }

    // Thương lượng sống trong thread hai người đang nói với nhau, không phải một
    // màn riêng — thẻ đề nghị trong chat đã mang đủ đồng hồ, ảnh và mọi hành động.
    expect(find.text('Thương lượng'), findsNothing);
  });

  testWidgets('Số dư hiện cả khả dụng và đang tạm giữ', (tester) async {
    await tester.pumpWidget(
      app(
        wallet: Wallet(
          accountId: 'acc_1',
          availableBalance: 1200000,
          createdAt: DateTime.utc(2026, 8),
          currency: 'VND',
          heldBalance: 450000,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Escrow của một đơn đã trả tiền không phải tiền rút được, nên một con số
    // duy nhất sẽ trả lời sai câu hỏi "tiền của tôi đâu".
    expect(find.textContaining('Khả dụng'), findsOneWidget);
    expect(find.textContaining('đang giữ'), findsOneWidget);
  });

  testWidgets('không có gì bị giữ thì chỉ nói một con số', (tester) async {
    await tester.pumpWidget(
      app(
        wallet: Wallet(
          accountId: 'acc_1',
          availableBalance: 0,
          createdAt: DateTime.utc(2026, 8),
          currency: 'VND',
          heldBalance: 0,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Khả dụng'), findsOneWidget);
    expect(find.textContaining('đang giữ'), findsNothing);
  });

  testWidgets('ví đọc hỏng thì mất câu phụ, không mất lối vào', (tester) async {
    await tester.pumpWidget(app(walletFails: true));
    await tester.pumpAndSettle();

    expect(find.text('Ví & Số dư'), findsOneWidget);
    expect(find.textContaining('Khả dụng'), findsNothing);
  });

  testWidgets('ví chưa có dòng nào thì dòng menu vẫn vào được', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    // Một dòng ví được tạo bởi lần chuyển tiền đầu tiên, không bởi việc đăng ký.
    expect(find.text('Ví & Số dư'), findsOneWidget);
  });
}

class _EmptyOrders extends Orders {
  @override
  Future<OrdersFeed> build() async => const OrdersFeed();
}
