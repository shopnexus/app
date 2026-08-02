import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/checkout_api_service.dart';
import '../models/checkout_model.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  final CheckoutApiService _apiService;

  CheckoutRepository(this._apiService);

  /// Tạo một purchase session (DraftOrder) cho 1 listing
  Future<DraftOrder> createDraft(CreateDraftRequest request) async {
    try {
      return await _apiService.createDraft(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Lấy thông tin draft order theo id
  Future<DraftOrder> getDraft(String id) async {
    try {
      return await _apiService.getDraft(id);
    } catch (e) {
      rethrow;
    }
  }

  /// Hủy purchase session draft
  Future<void> cancelDraft(String id) async {
    try {
      await _apiService.cancelDraft(id);
    } catch (e) {
      rethrow;
    }
  }

  /// Thực hiện checkout cho draft order
  Future<CheckoutResult> checkoutDraft(
    String draftId,
    CheckoutRequest request,
  ) async {
    try {
      return await _apiService.checkoutDraft(draftId, request);
    } catch (e) {
      rethrow;
    }
  }

  /// Thực hiện checkout cho thương lượng (offer) đã được chấp nhận
  Future<CheckoutResult> checkoutOffer(
    String offerId,
    CheckoutOfferRequest request,
  ) async {
    try {
      return await _apiService.checkoutOffer(offerId, request);
    } catch (e) {
      rethrow;
    }
  }

  /// Khởi tạo thông tin thanh toán qua cổng thanh toán
  Future<Transaction> startPayment(
    String sessionId,
    StartPaymentRequest request,
  ) async {
    try {
      return await _apiService.startPayment(sessionId, request);
    } catch (e) {
      rethrow;
    }
  }

  /// Lấy báo giá phí vận chuyển từ server
  Future<ShippingQuotes> getShippingQuotes(
    ShippingQuotesRequest request,
  ) async {
    try {
      return await _apiService.getShippingQuotes(request);
    } catch (e) {
      rethrow;
    }
  }

  // --- Support methods ---

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
