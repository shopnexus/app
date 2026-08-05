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

  // --- Contacts Features ---
  // The list only; every write is the generated client's, which has the tri-state
  // clear flags this hand-written model never had.
  @GET(ApiEndpoints.contacts)
  Future<DataResponse<List<Contact>>> getContacts();

  // --- Favorites / Wishlist Features (FE Mock/Legacy) ---
  @GET(ApiEndpoints.favorites)
  Future<DataResponse<List<AccountFavorite>>> getFavorites(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @PUT(ApiEndpoints.favoriteListingTemplate)
  Future<void> addFavorite(@Path('listingID') String listingId);

  @DELETE(ApiEndpoints.favoriteListingTemplate)
  Future<void> removeFavorite(@Path('listingID') String listingId);

  // --- Notifications Features ---
  @GET(ApiEndpoints.notifications)
  Future<DataResponse<List<Notification>>> getNotifications(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.notificationsUnreadCount)
  Future<DataResponse<UnreadCountResponse>> getUnreadCount();

  @POST(ApiEndpoints.notificationsRead)
  Future<DataResponse<UnreadCountResponse>> markAsRead(
    @Body() MarkNotificationsReadRequest request,
  );

  // Buyer orders and checkout lines are the generated `OrderApi`'s: `role` is
  // required on `GET /orders` and `state` is what tells the four tabs apart.
}

@riverpod
AccountApiService accountApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return AccountApiService(dioInstance);
}
