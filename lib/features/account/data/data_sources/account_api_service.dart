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
  @GET(ApiEndpoints.profile)
  Future<DataResponse<AccountProfile>> getProfile();

  @PATCH(ApiEndpoints.profile)
  Future<DataResponse<AccountProfile>> updateProfile(
    @Body() UpdateProfileRequest request,
  );

  @PATCH(ApiEndpoints.profileCountry)
  Future<DataResponse<UpdateCountryResponse>> updateProfileCountry(
    @Body() UpdateCountryRequest request,
  );

  @GET(ApiEndpoints.getAccountById)
  Future<DataResponse<AccountProfile>> getAccountById(
    @Query('account_id') String accountId,
  );

  // --- Contacts Features ---
  @GET(ApiEndpoints.contacts)
  Future<DataResponse<List<Contact>>> getContacts();

  @POST(ApiEndpoints.contacts)
  Future<DataResponse<Contact>> createContact(
    @Body() CreateContactRequest request,
  );

  @PATCH(ApiEndpoints.contacts)
  Future<DataResponse<Contact>> updateContact(
    @Body() UpdateContactRequest request,
  );

  @DELETE(ApiEndpoints.contacts)
  Future<DataResponse<MessageResponse>> deleteContact(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.contactDetailTemplate)
  Future<DataResponse<Contact>> getContactDetail(@Path('id') String contactId);

  // --- Favorites / Wishlist Features ---
  @GET(ApiEndpoints.favorites)
  Future<DataResponse<List<AccountFavorite>>> getFavorites(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @POST(ApiEndpoints.favoriteSpuTemplate)
  Future<DataResponse<AccountFavorite>> addFavorite(
    @Path('spuId') String spuId,
  );

  @DELETE(ApiEndpoints.favoriteSpuTemplate)
  Future<DataResponse<MessageResponse>> removeFavorite(
    @Path('spuId') String spuId,
  );

  // --- Notifications Features ---
  @GET(ApiEndpoints.notifications)
  Future<DataResponse<List<Notification>>> getNotifications(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  @GET(ApiEndpoints.notificationsUnreadCount)
  Future<DataResponse<UnreadCountResponse>> getUnreadCount();

  @POST(ApiEndpoints.notificationsRead)
  Future<DataResponse<MessageResponse>> markAsRead(
    @Body() ReadNotificationsRequest request,
  );

  @POST(ApiEndpoints.notificationsReadAll)
  Future<DataResponse<MessageResponse>> markAllAsRead();

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
