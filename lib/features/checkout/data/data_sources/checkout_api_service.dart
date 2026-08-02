import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/checkout_model.dart';

part 'checkout_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CheckoutApiService {
  factory CheckoutApiService(Dio dio, {String baseUrl}) = _CheckoutApiService;

  @POST(ApiEndpoints.drafts)
  Future<DraftOrder> createDraft(@Body() CreateDraftRequest request);

  @GET(ApiEndpoints.draftDetailTemplate)
  Future<DraftOrder> getDraft(@Path('id') String id);

  @DELETE(ApiEndpoints.draftDetailTemplate)
  Future<void> cancelDraft(@Path('id') String id);

  @POST(ApiEndpoints.draftCheckoutTemplate)
  Future<CheckoutResult> checkoutDraft(
    @Path('id') String id,
    @Body() CheckoutRequest request,
  );

  @POST(ApiEndpoints.offerCheckoutTemplate)
  Future<CheckoutResult> checkoutOffer(
    @Path('id') String id,
    @Body() CheckoutOfferRequest request,
  );

  @POST(ApiEndpoints.startPaymentTemplate)
  Future<Transaction> startPayment(
    @Path('id') String id,
    @Body() StartPaymentRequest request,
  );

  // --- Legacy Endpoints for UI Compatibility ---
  @POST(ApiEndpoints.quoteTransport)
  Future<DataResponse<QuoteTransportResponse>> quoteTransport(
    @Body() QuoteTransportRequest request,
  );

  @POST(ApiEndpoints.paymentUrlTemplate)
  Future<DataResponse<PaymentUrlResponse>> getPaymentUrl(
    @Path('sessionID') String sessionID,
  );

  @GET(ApiEndpoints.checkoutSummaryTemplate)
  Future<DataResponse<CheckoutSummary>> getCheckoutSummary(
    @Path('txID') String txID,
  );
}

@riverpod
CheckoutApiService checkoutApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CheckoutApiService(dioInstance);
}
