import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/cart_model.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET(ApiEndpoints.cart)
  Future<List<CartItem>> getCart();

  @POST(ApiEndpoints.cart)
  Future<CartItem> addCartItem(@Body() AddCartItemRequest request);

  @PATCH(ApiEndpoints.cartItemDetailTemplate)
  Future<CartItem> updateCartItem(
    @Path('id') String id,
    @Body() UpdateCartItemRequest request,
  );

  @DELETE(ApiEndpoints.cartItemDetailTemplate)
  Future<void> deleteCartItem(@Path('id') String id);
}

@riverpod
CartApiService cartApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CartApiService(dioInstance);
}
