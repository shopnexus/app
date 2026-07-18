import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/checkout_api_service.dart';
import '../models/checkout_model.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  final CheckoutApiService _apiService;

  CheckoutRepository(this._apiService);

  Future<QuoteTransportResponse> quoteTransport(
    QuoteTransportRequest request,
  ) async {
    try {
      final response = await _apiService.quoteTransport(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckoutResponse> checkout(CheckoutRequest request) async {
    try {
      final response = await _apiService.checkout(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelCheckout(String sessionID) async {
    try {
      await _apiService.cancelCheckout(sessionID);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentUrlResponse> getPaymentUrl(String sessionID) async {
    try {
      final response = await _apiService.getPaymentUrl(sessionID);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckoutSummary> getCheckoutSummary(String txID) async {
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
