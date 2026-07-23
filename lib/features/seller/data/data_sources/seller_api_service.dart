import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../../../account/data/models/account_model.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../models/seller_model.dart';

part 'seller_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class SellerApiService {
  factory SellerApiService(Dio dio, {String baseUrl}) = _SellerApiService;

  // --- Analytic & Dashboard ---
  @GET(ApiEndpoints.sellerDashboard)
  Future<DataResponse<SellerStats>> getSellerDashboard({
    @Query('period') String? period,
  });

  // --- AI Video & Voice Wizards ---
  @POST(ApiEndpoints.videoToProduct)
  @MultiPart()
  Future<DataResponse<VideoToProductResponse>> uploadVideoToProduct(
    @Part(name: 'video') MultipartFile video,
  );

  @POST(ApiEndpoints.audioToProduct)
  @MultiPart()
  Future<DataResponse<AudioToDescriptionResponse>> uploadAudioToProduct(
    @Part(name: 'audio') MultipartFile audio,
  );

  @POST(ApiEndpoints.refineDescription)
  Future<DataResponse<RefineDescriptionResponse>> refineDescription(
    @Body() RefineDescriptionRequest request,
  );

  // --- Product SPU Management ---
  @GET(ApiEndpoints.productSpu)
  Future<DataResponse<List<TProductDetail>>> getSpuList({
    @Query('vendor_id') String? vendorId,
    @Query('status') String? status,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiEndpoints.productSpu)
  Future<DataResponse<TProductDetail>> createSpu(
    @Body() ProductSpuRequest request,
  );

  @GET(ApiEndpoints.productSpuDetailTemplate)
  Future<DataResponse<TProductDetail>> getSpuDetail(@Path('id') String id);

  @PATCH(ApiEndpoints.productSpuDetailTemplate)
  Future<DataResponse<TProductDetail>> updateSpu(
    @Path('id') String id,
    @Body() ProductSpuRequest request,
  );

  // --- Product SKU Management ---
  @GET(ApiEndpoints.productSku)
  Future<DataResponse<List<ProductSku>>> getSkuList({
    @Query('spu_id') String? spuId,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiEndpoints.productSku)
  Future<DataResponse<ProductSku>> createSku(@Body() ProductSkuRequest request);

  @PATCH('${ApiEndpoints.productSku}/{id}')
  Future<DataResponse<ProductSku>> updateSku(
    @Path('id') String id,
    @Body() ProductSkuRequest request,
  );

  @DELETE('${ApiEndpoints.productSku}/{id}')
  Future<DataResponse<MessageResponse>> deleteSku(@Path('id') String id);

  // --- Seller Orders & Pending Items ---
  @GET(ApiEndpoints.sellerPendingItems)
  Future<DataResponse<List<SellerPendingItem>>> getSellerPendingItems({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiEndpoints.sellerConfirmPending)
  Future<DataResponse<SellerConfirmResponse>> confirmPendingItems(
    @Body() ConfirmSellerPendingRequest request,
  );

  @POST(ApiEndpoints.sellerCancelConfirmTemplate)
  Future<DataResponse<MessageResponse>> cancelConfirmPendingSession(
    @Path('sessionID') String sessionId,
  );

  @POST(ApiEndpoints.sellerEnsureConfirmPaymentUrlTemplate)
  Future<DataResponse<SellerConfirmResponse>> getConfirmPaymentUrl(
    @Path('sessionID') String sessionId,
  );

  @POST(ApiEndpoints.sellerRejectPending)
  Future<DataResponse<MessageResponse>> rejectPendingItem(
    @Body() RejectSellerPendingRequest request,
  );

  @GET(ApiEndpoints.sellerConfirmedOrders)
  Future<DataResponse<List<SellerOrder>>> getSellerConfirmedOrders({
    @Query('status') String? status,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiEndpoints.sellerOrderDetailTemplate)
  Future<DataResponse<SellerOrder>> getSellerOrderDetail(@Path('id') String id);
}

@riverpod
SellerApiService sellerApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return SellerApiService(dioInstance);
}
