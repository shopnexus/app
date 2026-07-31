import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../data_sources/checkout_api_service.dart';
import '../models/checkout_model.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  final CheckoutApiService _apiService;

  CheckoutRepository(this._apiService);

  Future<QuoteTransportResponse> quoteTransport(
    QuoteTransportRequest request,
  ) async {
    if (AppConfig.useMockData) {
      final results = request.items.map((item) {
        final isExpress =
            item.transportOption.toLowerCase().contains('express') ||
            item.transportOption.toLowerCase().contains('hỏa tốc');
        return QuoteTransportResult(
          skuId: item.skuId,
          transportOption: item.transportOption,
          cost: isExpress ? 50000 : 30000,
          currency: 'VND',
        );
      }).toList();
      return QuoteTransportResponse(items: results);
    }
    try {
      final response = await _apiService.quoteTransport(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckoutResponse> checkout(CheckoutRequest request) async {
    if (AppConfig.useMockData) {
      return CheckoutResponse(
        checkoutSessionId:
            'session_mock_${DateTime.now().millisecondsSinceEpoch}',
        paymentUrl: 'https://payment.shopnexus.com/checkout',
      );
    }
    try {
      final response = await _apiService.checkout(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelCheckout(String sessionID) async {
    if (AppConfig.useMockData) {
      return;
    }
    try {
      await _apiService.cancelCheckout(sessionID);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentUrlResponse> getPaymentUrl(String sessionID) async {
    if (AppConfig.useMockData) {
      return const PaymentUrlResponse(
        paymentUrl: 'https://payment.shopnexus.com/checkout',
      );
    }
    try {
      final response = await _apiService.getPaymentUrl(sessionID);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckoutSummary> getCheckoutSummary(String txID) async {
    if (AppConfig.useMockData) {
      return CheckoutSummary(
        session: CheckoutSession(
          id: 8474,
          kind: 'cart_checkout',
          status: 'SUCCESS',
          currency: 'VND',
          totalAmount: 1200000,
          dateCreated: '2026-07-30T17:00:00Z',
          datePaid: '2026-07-30T17:01:00Z',
        ),
        items: const [
          CheckoutSummaryItem(
            id: 1,
            skuId: 'sku_1_1',
            spuId: 'spu_1',
            slug: 'vi-da-bo-sap-thu-cong-classic',
            skuName: 'Ví da bò sáp thủ công Classic - Nâu Dark Brown',
            quantity: 1,
            totalAmount: 850000,
            currency: 'VND',
            imageUrl:
                'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
          ),
          CheckoutSummaryItem(
            id: 2,
            skuId: 'sku_3_1',
            spuId: 'spu_3',
            slug: 'set-tinh-dau-thien-nhien-relax',
            skuName: 'Set Tinh dầu thiên nhiên Relax Organics',
            quantity: 1,
            totalAmount: 350000,
            currency: 'VND',
            imageUrl:
                'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
          ),
        ],
      );
    }
    try {
      final response = await _apiService.getCheckoutSummary(txID);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
CheckoutRepository checkoutRepository(Ref ref) {
  final apiService = ref.watch(checkoutApiServiceProvider);
  return CheckoutRepository(apiService);
}
