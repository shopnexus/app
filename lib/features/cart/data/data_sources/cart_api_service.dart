import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/cart_model.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET(ApiEndpoints.cart)
  Future<DataResponse<List<CartItem>>> getCart();

  @POST(ApiEndpoints.cart)
  Future<void> updateCart(@Body() UpdateCartRequest request);

  @DELETE(ApiEndpoints.cart)
  Future<void> clearCart();
}

@riverpod
CartApiService cartApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CartApiService(dioInstance);
}
