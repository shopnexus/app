import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/models/checkout_model.dart';
import 'package:shopnexus_flutter_app/features/checkout/data/repositories/checkout_repository.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/providers/checkout_provider.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Màn thanh toán được nạp **trước khi** nó được mở.
///
/// Giỏ hàng và trang tin đăng đều gọi `ref.read(checkoutProvider.notifier).initialize(...)`
/// rồi mới `context.push('/checkout')`, nên có một khoảng không widget nào watch
/// provider. Ở chế độ autoDispose khoảng đó đủ để nó bị bỏ đi giữa chừng — state
/// quay về mặc định và `ref.mounted` thành false, nên mọi bước còn lại của
/// `initialize` lặng lẽ return.
///
/// Triệu chứng khi đó là ba thứ trông như ba lỗi khác nhau: ô "đang mua" trống,
/// không có phương thức thanh toán, và "chưa có báo giá vận chuyển cho địa chỉ
/// này". Bài test này giữ cái nguyên nhân chung đó — và giữ luôn cho bộ lọc tìm
/// kiếm, chỗ thứ hai trong app có đúng hình dạng ấy.
void main() {
  RecordingBackend backend() => RecordingBackend(
    (request) => switch (request.path) {
      '/options' => {
        'data': {
          'options': [
            {
              'id': 'sepay-bank-transfer',
              'name': 'Chuyển khoản ngân hàng (SePay)',
              'description': '',
              'provider': '',
              'is_enabled': null,
              'priority': null,
            },
          ],
          'providers': <String>[],
        },
      },
      '/contacts' => {
        'data': [contactJson],
        'meta': const {'page': 1, 'limit': 20, 'total_count': 1},
      },
      '/drafts' => {
        'data': {
          'id': 'drf_1',
          'listing_id': 'lst_1',
          'seller_id': 'acc_1',
          'name': 'Kệ ống đựng đũa',
          'currency': 'VND',
          'price_mode': 'fixed',
          'variants': const [],
          'created_at': '2026-08-07T00:00:00Z',
          'valid_until': '2026-08-07T00:15:00Z',
          'cancelled_at': null,
        },
      },
      '/shipping-quotes' => {
        'data': {
          'contact_id': 'ctc_1',
          'currency': 'VND',
          'options': const [
            {'option': 'mock-standard', 'name': 'Mock: standard', 'fee': 15000},
          ],
        },
      },
      _ => {
        'data': const [],
        'meta': const {'page': 1, 'limit': 20, 'total_count': 0},
      },
    },
  );

  test('state sống sót qua khoảng chưa ai watch', () async {
    final recording = backend();
    final container = ProviderContainer(
      overrides: [
        checkoutRepositoryProvider.overrideWithValue(recording.checkout),
        accountRepositoryProvider.overrideWithValue(recording.repository),
      ],
    );
    addTearDown(container.dispose);

    // Không `listen`, không `watch` — đúng như lúc trang gọi rồi điều hướng.
    await container
        .read(checkoutProvider.notifier)
        .initialize(
          lines: [
            const PurchaseLine(
              listingId: 'lst_1',
              variantId: 'vrn_1',
              quantity: 2,
            ),
          ],
        );

    final state = container.read(checkoutProvider);
    expect(state.lines, hasLength(1), reason: 'ô "đang mua" trống');
    expect(
      state.paymentOptions,
      isNotEmpty,
      reason: 'không có phương thức nào',
    );
  });

  test('báo giá vận chuyển nêu đúng một nguồn, và đó là draft', () async {
    final recording = backend();
    final container = ProviderContainer(
      overrides: [
        checkoutRepositoryProvider.overrideWithValue(recording.checkout),
        accountRepositoryProvider.overrideWithValue(recording.repository),
      ],
    );
    addTearDown(container.dispose);

    await container
        .read(checkoutProvider.notifier)
        .initialize(
          lines: [
            const PurchaseLine(
              listingId: 'lst_1',
              variantId: 'vrn_1',
              quantity: 2,
            ),
          ],
        );

    final quote = recording.calls.firstWhere(
      (c) => c.path == '/shipping-quotes',
    );
    // Dio gửi body đã encode thành chuỗi JSON.
    final body = jsonDecode(quote.data as String) as Map<String, dynamic>;
    // `POST /shipping-quotes` từ chối 400 `quote_source_invalid` nếu không có đúng
    // một nguồn. Trang này từng chỉ gửi `lines` + `contact_id`, nên nó **chưa bao
    // giờ** lấy được báo giá — và màn hình đọc danh sách rỗng ra thành "chưa có
    // báo giá vận chuyển cho địa chỉ này", một câu đổ lỗi cho địa chỉ.
    expect(body['draft_id'], 'drf_1');
    expect(container.read(checkoutProvider).shippingOptions, hasLength(1));
  });

  test('bộ lọc danh mục sống sót qua cùng khoảng đó', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Trang Danh mục: đặt bộ lọc rồi mới push('/search').
    container.read(activeSearchFiltersProvider.notifier).reset();
    container.read(activeSearchFiltersProvider.notifier).setCategory('cat_1');
    await Future<void>.delayed(const Duration(milliseconds: 30));

    // Mất cái này thì chạm vào một danh mục cho ra *toàn bộ* sàn — một lỗi không
    // báo gì cả, chỉ ra sai kết quả.
    expect(container.read(activeSearchFiltersProvider).categoryId, 'cat_1');
  });
}
