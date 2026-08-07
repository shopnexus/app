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
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_earnings_provider.dart';

/// Trang Tài khoản sau khi "Kênh người bán" nổ ra thành hai dòng.
///
/// Một cái cửa dẫn tới một trang toàn số liệu là một lần chạm thêm để tới đúng
/// hai thứ người bán vào xem — và trang số liệu đó cần sáu request thành công mới
/// vẽ nổi, nên một lỗi là mất luôn cả lối vào ví.
void main() {
  final me = Me(
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

  testWidgets('chín dòng, và "Kênh người bán" không còn', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    for (final row in [
      'Đơn hàng',
      'Tin của tôi',
      'Số dư',
      'Yêu cầu hoàn tiền',
      'Đã lưu',
      'Địa chỉ',
      'Trung tâm trợ giúp',
      'Cài đặt',
      'Đăng xuất',
    ]) {
      expect(find.text(row), findsOneWidget, reason: 'thiếu dòng "$row"');
    }

    // Cửa cũ đi rồi: hai dòng trên đã là chính hai thứ nó dẫn tới.
    expect(find.text('Kênh người bán'), findsNothing);
    // Thương lượng sống trong thread hai người đang nói với nhau, không phải một
    // màn riêng — thẻ đề nghị trong chat đã mang đủ đồng hồ, ảnh và mọi hành động.
    expect(find.text('Thương lượng'), findsNothing);
    // Và "Đơn mua" đổi tên, vì dòng đó giờ mở cả hai vai.
    expect(find.text('Đơn mua'), findsNothing);
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

    expect(find.text('Số dư'), findsOneWidget);
    expect(find.textContaining('Khả dụng'), findsNothing);
  });

  testWidgets('ví chưa có dòng nào thì dòng menu vẫn vào được', (tester) async {
    await tester.pumpWidget(app());
    await tester.pumpAndSettle();

    // Một dòng ví được tạo bởi lần chuyển tiền đầu tiên, không bởi việc đăng ký.
    expect(find.text('Số dư'), findsOneWidget);
  });
}
