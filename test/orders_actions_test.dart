import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_actions_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// Ba câu trả lời của người bán, sau khi chúng được tách ra khỏi provider giữ
/// danh sách.
///
/// Đây là chỗ mất chức năng mà không ai thấy: xoá màn hình cũ đi thì `Notifier`
/// giữ cả danh sách *lẫn* các hành động cũng đi theo, và một màn mới không có nút
/// nào vẫn compile, vẫn chạy, vẫn trông như đang hoạt động.
void main() {
  OrdersActions actionsOn(RecordingBackend backend) {
    final container = ProviderContainer(
      overrides: [sellerRepositoryProvider.overrideWithValue(backend.seller)],
    );
    addTearDown(container.dispose);
    return container.read(ordersActionsProvider.notifier);
  }

  group('xác nhận đơn', () {
    test('là POST vào sub-resource confirmation', () async {
      final backend = RecordingBackend((_) => {'data': orderJson});

      final ok = await actionsOn(backend).confirmOrder('ord_2ybcv39246zn7');

      expect(ok, isTrue);
      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'orders/ord_2ybcv39246zn7/confirmation');
    });
  });

  group('từ chối đơn', () {
    test('mang theo lý do, vì người mua được hoàn đủ', () async {
      final backend = RecordingBackend((_) => {'data': orderJson});

      final ok = await actionsOn(
        backend,
      ).declineOrder('ord_2ybcv39246zn7', 'hết hàng');

      expect(ok, isTrue);
      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'orders/ord_2ybcv39246zn7/decline');
      expect(backend.bodyOf(0)['reason'], 'hết hàng');
    });
  });

  group('hủy đơn', () {
    test('là POST và không có gì để ghi lý do', () async {
      final backend = RecordingBackend((_) => {'data': orderJson});

      final ok = await actionsOn(backend).cancelOrder('ord_2ybcv39246zn7');

      expect(ok, isTrue);
      expect(backend.paths.single, 'orders/ord_2ybcv39246zn7/cancellation');
      expect(backend.only.data, isNull);
    });
  });

  group('một hành động hỏng', () {
    test('trả về false và giữ lại lời giải thích', () async {
      final backend = RecordingBackend((request) {
        throw DioException(requestOptions: request, message: '409');
      });
      final container = ProviderContainer(
        overrides: [sellerRepositoryProvider.overrideWithValue(backend.seller)],
      );
      addTearDown(container.dispose);

      final ok = await container
          .read(ordersActionsProvider.notifier)
          .confirmOrder('ord_2ybcv39246zn7');

      // Bộ nút cũ báo thành công bất kể server trả gì.
      expect(ok, isFalse);
      expect(container.read(ordersActionsProvider).errorMessage, isNotNull);
      expect(container.read(ordersActionsProvider).isLoading, isFalse);
    });
  });
}
