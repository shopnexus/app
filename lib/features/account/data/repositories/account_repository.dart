import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart'
    as generated;
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/mark_notifications_read_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/features/account/data/data_sources/account_api_service.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/buyer_order_view.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;
  final generated.AccountApi _api;
  final OrderApi _orderApi;
  final CatalogApi _catalogApi;

  AccountRepository(
    this._apiService,
    this._api,
    this._orderApi,
    this._catalogApi,
  );

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

  /// Cursor-paged: `created_at` identifies a row together with the feed order,
  /// and a `page` would simply be ignored.
  Future<NotificationPage> notifications({
    String? cursor,
    int limit = 20,
  }) async {
    final page = (await _api.notificationsGet(
      cursor: cursor,
      limit: limit,
    )).data;
    if (page == null) throw StateError('empty notification page');
    return page;
  }

  Future<int> getUnreadNotificationsCount() async {
    final count = (await _api.notificationsUnreadCountGet()).data?.data;
    return count?.unread ?? 0;
  }

  /// Marks everything created at or before [before] read; omitting it marks the
  /// whole feed. The route has no per-row id, so a single row is marked by its
  /// own timestamp — not by "now", which used to swallow the whole feed on one
  /// tap. Answers the unread count that is left.
  Future<int> markNotificationsRead({DateTime? before}) async {
    final count = (await _api.notificationsReadPost(
      markNotificationsReadRequest: MarkNotificationsReadRequest(
        before: before,
      ),
    )).data?.data;
    return count?.unread ?? 0;
  }

  // --- Buyer Orders & Checkout Lines ---

  /// `role` is required and `state` is what tells the tabs apart — without it
  /// every tab asked for the same list.
  Future<List<OrderView>> buyerOrders({
    OrderState? state,
    int limit = 20,
  }) async {
    final page = (await _orderApi.ordersGet(
      role: orderRoleBuyer,
      state: state,
      limit: limit,
    )).data;
    final orders = page?.data ?? const <Order>[];
    final listings = await _listingsById(
      orders.expand((order) => order.items ?? const <OrderItem>[]),
    );
    return [for (final order in orders) _view(order, listings)];
  }

  Future<OrderView> buyerOrder(String id) async {
    final order = (await _orderApi.ordersIdGet(id: id)).data?.data;
    if (order == null) throw StateError('empty order');
    return _view(order, await _listingsById(order.items ?? const []));
  }

  /// [pending] is the contract's own filter: lines the money has not produced an
  /// order for. Everything else is one list, so "cancelled" is a read of
  /// `cancelled_at` rather than a filter the route does not have.
  Future<List<OrderLineView>> buyerItems({
    required bool pending,
    int limit = 50,
  }) async {
    final page = (await _orderApi.itemsGet(
      role: orderRoleBuyer,
      pending: pending,
      limit: limit,
    )).data;
    final items = page?.data ?? const <OrderItem>[];
    return _lines(items, await _listingsById(items));
  }

  /// A POST: cancelling is a state transition on a sub-resource, and the old
  /// DELETE was simply not a route (405). A paid line is refused with 409 —
  /// a refund is how a paid sale is undone.
  Future<void> cancelItem(String itemId) =>
      _orderApi.itemsIdCancellationPost(id: itemId);

  OrderView _view(Order order, Map<String, Listing> listings) =>
      OrderView(order: order, lines: _lines(order.items ?? const [], listings));

  List<OrderLineView> _lines(
    Iterable<OrderItem> items,
    Map<String, Listing> listings,
  ) => [
    for (final item in items)
      OrderLineView(item: item, listing: listings[item.listingId]),
  ];

  /// One lookup for a whole page. An `ids` read answers even for a listing the
  /// seller has hidden or deleted, which is the reason the line denormalizes it.
  Future<Map<String, Listing>> _listingsById(Iterable<OrderItem> items) async {
    final ids = {for (final item in items) item.listingId}.toList();
    if (ids.isEmpty) return const {};
    final page = (await _catalogApi.listingsGet(
      ids: ids,
      limit: ids.length.clamp(1, 100),
    )).data;
    return {
      for (final listing in page?.data ?? const <Listing>[])
        listing.id: listing,
    };
  }
}

/// `oneof=buyer seller`, and the route refuses a request without it.
const orderRoleBuyer = 'buyer';

@riverpod
AccountRepository accountRepository(Ref ref) => AccountRepository(
  ref.watch(accountApiServiceProvider),
  ref.watch(accountApiProvider),
  ref.watch(orderApiProvider),
  ref.watch(catalogApiProvider),
);
