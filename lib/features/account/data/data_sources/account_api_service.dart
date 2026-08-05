import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/account_model.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String baseUrl}) = _AccountApiService;

  // --- Profile Features ---
  @GET(ApiEndpoints.me)
  Future<DataResponse<Me>> getProfile();

  @PATCH(ApiEndpoints.meProfile)
  Future<DataResponse<Profile>> updateProfile(
    @Body() UpdateProfileRequest request,
  );

  @PATCH(ApiEndpoints.me)
  Future<DataResponse<Me>> updateAccount(@Body() UpdateAccountRequest request);

  @GET(ApiEndpoints.accountDetailTemplate)
  Future<DataResponse<PublicAccount>> getAccountById(@Path('id') String id);

  // --- Contacts Features ---
  @GET(ApiEndpoints.contacts)
  Future<DataResponse<List<Contact>>> getContacts();

  @POST(ApiEndpoints.contacts)
  Future<DataResponse<Contact>> createContact(
    @Body() CreateContactRequest request,
  );

  @PATCH(ApiEndpoints.contactDetailTemplate)
  Future<DataResponse<Contact>> updateContact(
    @Path('id') String contactId,
    @Body() UpdateContactRequest request,
  );

  @DELETE(ApiEndpoints.contactDetailTemplate)
  Future<void> deleteContact(@Path('id') String contactId);

  @GET(ApiEndpoints.contactDetailTemplate)
  Future<DataResponse<Contact>> getContactDetail(@Path('id') String contactId);

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

  // --- Buyer Orders & Pending Items ---
  @GET(ApiEndpoints.buyerPendingItems)
  Future<DataResponse<List<BuyerOrderItem>>> getBuyerPendingItems(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @DELETE(ApiEndpoints.cancelBuyerPendingItemTemplate)
  Future<void> cancelBuyerPendingItem(@Path('id') String id);

  @GET(ApiEndpoints.buyerPendingOrders)
  Future<DataResponse<List<BuyerOrder>>> getBuyerPendingOrders(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.buyerCompletedOrders)
  Future<DataResponse<List<BuyerOrder>>> getBuyerCompletedOrders(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.buyerCancelledOrders)
  Future<DataResponse<List<BuyerOrder>>> getBuyerCancelledOrders(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.buyerCancelledItems)
  Future<DataResponse<List<BuyerOrderItem>>> getBuyerCancelledItems(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.buyerOrderDetailTemplate)
  Future<DataResponse<BuyerOrder>> getBuyerOrderDetail(@Path('id') String id);
}

@riverpod
AccountApiService accountApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return AccountApiService(dioInstance);
}
