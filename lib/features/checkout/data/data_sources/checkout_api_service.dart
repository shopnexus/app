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

  @POST(ApiEndpoints.quoteTransport)
  Future<DataResponse<QuoteTransportResponse>> quoteTransport(
    @Body() QuoteTransportRequest request,
  );

  @POST(ApiEndpoints.checkout)
  Future<DataResponse<CheckoutResponse>> checkout(
    @Body() CheckoutRequest request,
  );

  @POST(ApiEndpoints.cancelCheckoutTemplate)
  Future<void> cancelCheckout(@Path('sessionID') String sessionID);

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
