import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/addresses_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/addresses_screen.dart';

/// Checkout không còn dựng lại thẻ địa chỉ của riêng nó: nó mở lại chính màn
/// hình sổ địa chỉ ở chế độ chọn. Điều đó chỉ an toàn khi chế độ chọn không cho
/// sửa hay xóa — một người mua xóa địa chỉ rồi pop về checkout sẽ trả về một
/// `Contact` đã chết, và checkout đặt hàng bằng đúng id đó.
void main() {
  Contact contactAt({
    required String id,
    required String name,
    ContactAddressType type = ContactAddressType.home,
  }) => Contact(
    address: 'Số 1 đường Nào Đó, phường Bến Nghé',
    addressDetail: 'Tầng 3',
    addressType: type,
    country: 'VN',
    createdAt: DateTime.utc(2026),
    districtCode: null,
    districtName: null,
    fullName: name,
    id: id,
    isDefaultDelivery: false,
    isDefaultPickup: false,
    latitude: null,
    longitude: null,
    phone: '0900000000',
    phoneVerified: true,
    postalCode: null,
    providerCodes: const {},
    provinceCode: '79',
    provinceName: 'TP. Hồ Chí Minh',
    wardCode: '26734',
    wardName: 'Phường Bến Nghé',
  );

  /// Màn hình sổ địa chỉ được đẩy lên trên một trang trống, nên `context.pop`
  /// có chỗ để quay về và giá trị pop là thứ test đọc.
  Widget app({required bool selectMode, required List<Contact> contacts}) {
    final router = GoRouter(
      initialLocation: '/from',
      routes: [
        GoRoute(
          path: '/from',
          builder: (context, state) => Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => TextButton(
                  onPressed: () async {
                    final picked = await context.push<Contact>('/picker');
                    _lastPicked = picked;
                  },
                  child: const Text('mở sổ địa chỉ'),
                ),
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/picker',
          builder: (context, state) => AddressesScreen(selectMode: selectMode),
        ),
      ],
    );

    return ProviderScope(
      overrides: [buyerContactsProvider.overrideWith((ref) async => contacts)],
      child: MaterialApp.router(
        routerConfig: router,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(0.5)),
          child: child!,
        ),
      ),
    );
  }

  Future<void> openPicker(WidgetTester tester) async {
    await tester.tap(find.text('mở sổ địa chỉ'));
    await tester.pumpAndSettle();
  }

  setUp(() => _lastPicked = null);

  testWidgets('chế độ chọn trả địa chỉ được chạm về cho màn hình gọi', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(
        selectMode: true,
        contacts: [
          contactAt(id: 'ctc_1', name: 'Nguyễn Văn A'),
          contactAt(id: 'ctc_2', name: 'Trần Thị B'),
        ],
      ),
    );
    await openPicker(tester);

    await tester.tap(find.text('Trần Thị B'));
    await tester.pumpAndSettle();

    expect(_lastPicked?.id, 'ctc_2');
    expect(find.text('mở sổ địa chỉ'), findsOneWidget);
  });

  testWidgets('chế độ chọn không có nút sửa, xóa hay đặt mặc định', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(
        selectMode: true,
        contacts: [contactAt(id: 'ctc_1', name: 'Nguyễn Văn A')],
      ),
    );
    await openPicker(tester);

    expect(find.byIcon(Icons.delete_outline_rounded), findsNothing);
    expect(find.byIcon(Icons.edit_outlined), findsNothing);
    expect(find.text('Set as Default'), findsNothing);
  });

  testWidgets('mặc định tắt: sổ địa chỉ giữ nguyên các hành động cũ', (
    tester,
  ) async {
    await tester.pumpWidget(
      app(
        selectMode: false,
        contacts: [contactAt(id: 'ctc_1', name: 'Nguyễn Văn A')],
      ),
    );
    await openPicker(tester);

    expect(find.byIcon(Icons.delete_outline_rounded), findsOneWidget);
    expect(find.byIcon(Icons.edit_outlined), findsOneWidget);
    expect(find.text('Set as Default'), findsOneWidget);

    // Và chạm vào thẻ không pop gì cả — nó không phải một nút chọn.
    await tester.tap(find.text('Nguyễn Văn A'));
    await tester.pumpAndSettle();
    expect(find.text('Địa chỉ'), findsOneWidget);
    expect(_lastPicked, isNull);
  });
}

Contact? _lastPicked;
