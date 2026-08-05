import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart'
    as generated;
import 'package:shopnexus_flutter_app/api/generated/model/account_create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/features/account/data/data_sources/account_api_service.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;
  final generated.AccountApi _api;

  AccountRepository(this._apiService, this._api);

  /// Reserve a slot, PUT the bytes to the signed URL, confirm — the bytes never
  /// pass through this API, and until the confirmation lands the resource
  /// resolves to nothing, so a profile can never show an avatar that never
  /// arrived. Returns the resource id for
  /// `UpdateProfileRequest.avatarResourceId`.
  Future<String> uploadAvatar({
    required List<int> bytes,
    required String filename,
    required String mime,
  }) async {
    final reserved = (await _api.meUploadsPost(
      accountCreateUploadRequest: AccountCreateUploadRequest(
        filename: filename,
        kind: AccountCreateUploadRequestKindEnum.avatar,
        mime: mime,
        size: bytes.length,
      ),
    )).data?.data;
    if (reserved == null) throw StateError('empty upload slot');

    // A bare Dio: the signed URL is the storage provider's origin and must not
    // be sent this platform's bearer token.
    await Dio().put<void>(
      reserved.url,
      data: Stream.fromIterable([bytes]),
      options: Options(
        headers: {
          ...?reserved.headers,
          Headers.contentLengthHeader: bytes.length,
        },
        contentType: mime,
      ),
    );

    await _api.meUploadsIdConfirmationPost(id: reserved.resourceId);
    return reserved.resourceId;
  }

  // --- Profile Features ---
  Future<Me> getProfile() async {
    final response = await _apiService.getProfile();
    return response.data;
  }

  /// The public half of the account: name, description, gender, birth date,
  /// avatar, locale. Identifiers are [updateAccount]'s.
  Future<void> updateProfile(UpdateProfileRequest request) {
    final body = request.toJson();
    // `date_of_birth` is `format: date`, which the generator turns into a
    // `DateTime` and json_serializable then writes as a full instant — the route
    // answers 400 `rule: date`. The day is the whole fact, so trim it back.
    final dateOfBirth = request.dateOfBirth;
    if (dateOfBirth != null) {
      body['date_of_birth'] = dateOfBirth.toIso8601String().split('T').first;
    }
    return _apiService.updateProfile(body);
  }

  /// Email, phone and username. Changing the email clears `email_verified` and
  /// sends a fresh verification, and the last identifier cannot be removed.
  Future<void> updateAccount(UpdateAccountRequest request) =>
      _api.mePatch(updateAccountRequest: request);

  Future<PublicAccount> getAccountById(String accountId) async {
    final response = await _apiService.getAccountById(accountId);
    return response.data;
  }

  // --- Administrative Areas ---

  /// Two tiers: no [parent] answers the 63 provinces, a province code answers its
  /// wards. A code stays the zero-padded string it arrived as all the way back to
  /// the server — parsed as an int, `'01'` matches nothing.
  Future<List<AdministrativeArea>> getAdministrativeAreas({
    String? parent,
  }) async {
    final response = await _api.administrativeAreasGet(parent: parent);
    return response.data?.data ?? const [];
  }

  // --- Contacts Features ---
  Future<List<Contact>> getContacts() async {
    final response = await _apiService.getContacts();
    return response.data;
  }

  Future<void> createContact(CreateContactRequest request) =>
      _api.contactsPost(createContactRequest: request);

  /// The id is the path — it was never a body field, which is why every edit used
  /// to be refused outright.
  Future<void> updateContact(String contactId, UpdateContactRequest request) =>
      _api.contactsIdPatch(id: contactId, updateContactRequest: request);

  Future<void> deleteContact(String contactId) =>
      _api.contactsIdDelete(id: contactId);

  // --- Favorites / Wishlist Features ---
  Future<List<AccountFavorite>> getFavorites({int? page, int? limit}) async {
    final response = await _apiService.getFavorites(page, limit);
    return response.data;
  }

  Future<void> addFavorite(String listingId) =>
      _apiService.addFavorite(listingId);

  Future<void> removeFavorite(String listingId) =>
      _apiService.removeFavorite(listingId);

  // --- Notifications Features ---
  Future<List<Notification>> getNotifications({int? page, int? limit}) async {
    final response = await _apiService.getNotifications(page, limit);
    return response.data;
  }

  Future<int> getUnreadNotificationsCount() async {
    final response = await _apiService.getUnreadCount();
    return response.data.count;
  }

  Future<void> markNotificationsAsRead(List<int> ids) => _apiService.markAsRead(
    MarkNotificationsReadRequest(before: DateTime.now().toIso8601String()),
  );

  Future<void> markAllNotificationsAsRead() => _apiService.markAsRead(
    MarkNotificationsReadRequest(before: DateTime.now().toIso8601String()),
  );

  // --- Buyer Orders & Pending Items ---
  Future<List<BuyerOrderItem>> getBuyerPendingItems({
    int? page,
    int? limit,
  }) async {
    final response = await _apiService.getBuyerPendingItems(page, limit);
    return response.data;
  }

  Future<void> cancelBuyerPendingItem(String id) =>
      _apiService.cancelBuyerPendingItem(id);

  Future<List<BuyerOrder>> getBuyerPendingOrders({
    int? page,
    int? limit,
  }) async {
    final response = await _apiService.getBuyerPendingOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrder>> getBuyerCompletedOrders({
    int? page,
    int? limit,
  }) async {
    final response = await _apiService.getBuyerCompletedOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrder>> getBuyerCancelledOrders({
    int? page,
    int? limit,
  }) async {
    final response = await _apiService.getBuyerCancelledOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrderItem>> getBuyerCancelledItems({
    int? page,
    int? limit,
  }) async {
    final response = await _apiService.getBuyerCancelledItems(page, limit);
    return response.data;
  }

  Future<BuyerOrder> getBuyerOrderDetail(String id) async {
    final response = await _apiService.getBuyerOrderDetail(id);
    return response.data;
  }
}

@riverpod
AccountRepository accountRepository(Ref ref) => AccountRepository(
  ref.watch(accountApiServiceProvider),
  ref.watch(accountApiProvider),
);
