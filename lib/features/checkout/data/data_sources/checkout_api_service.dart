import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
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

  @POST(ApiEndpoints.shippingQuotes)
  Future<ShippingQuotes> getShippingQuotes(
    @Body() ShippingQuotesRequest request,
  );
}

@riverpod
CheckoutApiService checkoutApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CheckoutApiService(dioInstance);
}
