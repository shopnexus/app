import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/constants/api_endpoints.dart';
import 'package:shopnexus_flutter_app/core/network/dio_client.dart';
import 'package:shopnexus_flutter_app/shared/models/data_response.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String baseUrl}) = _AccountApiService;

  // --- Profile Features ---
  @GET(ApiEndpoints.me)
  Future<DataResponse<Me>> getProfile();

  /// The body is the generated `UpdateProfileRequest`'s own JSON, so it can only
  /// ever carry contract keys — see `AccountRepository.updateProfile` for the one
  /// field its codec cannot spell.
  @PATCH(ApiEndpoints.meProfile)
  Future<void> updateProfile(@Body() Map<String, dynamic> body);

  @GET(ApiEndpoints.accountDetailTemplate)
  Future<DataResponse<PublicAccount>> getAccountById(@Path('id') String id);

  // Contacts are the generated `AccountApi`'s, reads included: its `Contact`
  // types `address_type` as the enum the column actually holds.

  // --- Wishlist ---
  // The list itself is catalog's `GET /listings?favorited=true`; `GET /favorites`
  // is not a route at all (404). These two are, and they are what the heart does.
  @PUT(ApiEndpoints.favoriteListingTemplate)
  Future<void> addFavorite(@Path('listingID') String listingId);

  @DELETE(ApiEndpoints.favoriteListingTemplate)
  Future<void> removeFavorite(@Path('listingID') String listingId);

  // The notification feed is the generated `AccountApi`'s: it is cursor-paged,
  // and there is no per-row id to mark read by.

  // Buyer orders and checkout lines are the generated `OrderApi`'s: `role` is
  // required on `GET /orders` and `state` is what tells the four tabs apart.
}

@riverpod
AccountApiService accountApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return AccountApiService(dioInstance);
}
