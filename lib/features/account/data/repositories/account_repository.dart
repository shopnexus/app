import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart'
    as generated;
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_preference.dart';
import 'package:shopnexus_flutter_app/api/generated/model/o_auth_identity.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_notification_preferences_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_notification_preferences_request_items_inner.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/verify_contact_phone_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/confirm_receipt_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/device.dart';
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
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/core/network/resource_upload.dart';

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

    await putToSlot(reserved, bytes);

    await _api.meUploadsIdConfirmationPost(id: reserved.resourceId);
    return reserved.resourceId;
  }

  /// Ảnh mở hộp, cho lúc xác nhận đã nhận hàng. Cùng ba bước như mọi upload khác:
  /// giữ chỗ, PUT qua [putToSlot], rồi xác nhận — trước khi xác nhận thì resource không
  /// resolve ra gì cả, nên một upload dở dang không bao giờ đính được vào đâu.
  Future<String> uploadOrderEvidence({
    required List<int> bytes,
    required String filename,
    required String mime,
  }) async {
    final reserved = (await _orderApi.ordersUploadsPost(
      createUploadRequest: CreateUploadRequest(
        filename: filename,
        mime: mime,
        size: bytes.length,
      ),
    )).data?.data;
    if (reserved == null) throw StateError('empty upload slot');

    await putToSlot(reserved, bytes);

    await _orderApi.ordersUploadsIdConfirmationPost(id: reserved.resourceId);
    return reserved.resourceId;
  }

  /// Người mua nói hàng đã tới. Đây là thứ khởi động đồng hồ trả tiền cho người
  /// bán — `received_at` là điều kiện trong câu truy vấn payout, nên khi màn hình
  /// này chưa tồn tại thì mọi đơn giao xong đều giam tiền người bán trong escrow
  /// vĩnh viễn.
  ///
  /// Ảnh là bắt buộc, không phải trang trí: một yêu cầu hoàn tiền về sau được xét
  /// trên đúng những gì người mua chụp lúc mở hộp, và server từ chối danh sách rỗng.
  Future<void> confirmReceipt(String orderId, List<String> attachments) =>
      _orderApi.ordersIdReceiptPost(
        id: orderId,
        confirmReceiptRequest: ConfirmReceiptRequest(attachments: attachments),
      );

  // --- Profile Features ---
  Future<Me> getProfile() async {
    final response = await _apiService.getProfile();
    return response.data;
  }

  /// The public half of the account: name, description, gender, birth date,
  /// avatar, locale. Identifiers are [updateAccount]'s.
  Future<void> updateProfile(UpdateProfileRequest request) =>
      _apiService.updateProfile(request.toJson());

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
  Future<List<Contact>> getContacts() async =>
      (await _api.contactsGet()).data?.data ?? const [];

  Future<void> createContact(CreateContactRequest request) =>
      _api.contactsPost(createContactRequest: request);

  /// The id is the path — it was never a body field, which is why every edit used
  /// to be refused outright.
  Future<void> updateContact(String contactId, UpdateContactRequest request) =>
      _api.contactsIdPatch(id: contactId, updateContactRequest: request);

  /// Gửi mã tới số của một địa chỉ. Mã sống trong Redis với TTL, không phải một
  /// hàng trong bảng — nó được đọc một lần rồi phải biến mất.
  Future<void> requestPhoneCode(String contactId) =>
      _api.contactsIdPhoneVerificationRequestsPost(id: contactId);

  /// Nhập mã. Server đối chiếu rồi bật `phone_verified` trên chính địa chỉ đó —
  /// xác thực gắn với *số của địa chỉ này*, không phải với account, vì đó là số
  /// mà đơn vị giao hàng sẽ gọi.
  Future<void> verifyPhone(String contactId, String code) =>
      _api.contactsIdPhoneVerificationsPost(
        id: contactId,
        verifyContactPhoneRequest: VerifyContactPhoneRequest(code: code),
      );

  Future<void> deleteContact(String contactId) =>
      _api.contactsIdDelete(id: contactId);

  // --- Wishlist ---
  /// Theo dõi một người, không một shop: `follows` gắn với account, và ở C2C thì
  /// "tôi muốn thấy người này đăng gì nữa" là câu hỏi thật.
  /// Loại thông báo nào được vào hộp thư. Không phải cài đặt push — app cố ý không
  /// có push — mà là cái quyết định thứ gì xuất hiện trong tab Thông báo.
  Future<List<NotificationPreference>> notificationPreferences() async =>
      (await _api.notificationPreferencesGet()).data?.data ?? const [];

  /// Gửi cả bộ, không gửi từng cái: route nhận một danh sách, và một lần lưu là
  /// một lần người dùng bấm xong — không phải mỗi công tắc một request.
  Future<void> saveNotificationPreferences(
    List<NotificationPreference> preferences,
  ) => _api.notificationPreferencesPut(
    updateNotificationPreferencesRequest: UpdateNotificationPreferencesRequest(
      items: [
        for (final preference in preferences)
          UpdateNotificationPreferencesRequestItemsInner(
            category: preference.category,
            channel: preference.channel,
            isEnabled: preference.isEnabled,
          ),
      ],
    ),
  );

  /// Những cài đặt đang đăng ký nhận thông báo đẩy của tài khoản này. Server chỉ
  /// trả đuôi token — cả token là một khoá gửi tin, không bao giờ đi ngược ra —
  /// nên đây là thứ duy nhất để nhận ra "cái này là máy tôi".
  Future<List<Device>> devices() async =>
      (await _api.meDevicesGet()).data?.data ?? const [];

  /// Gỡ một cài đặt khỏi tài khoản: máy đó ngừng nhận thông báo, phiên đăng nhập
  /// trên đó không đổi.
  Future<void> unregisterDevice(String deviceId) =>
      _api.devicesIdDelete(id: deviceId);

  /// Google/Apple đã liên kết. Server giữ luật "ít nhất một cách để đăng nhập",
  /// nên bỏ liên kết cuối cùng khi không có mật khẩu sẽ bị từ chối ở đó.
  Future<List<OAuthIdentity>> oauthIdentities() async =>
      (await _api.meOauthIdentitiesGet()).data?.data ?? const [];

  Future<void> unlinkOauth(String provider) =>
      _api.meOauthIdentitiesProviderDelete(provider: provider);

  Future<void> follow(String accountId) =>
      _api.followsAccountIDPut(accountID: accountId);

  Future<void> unfollow(String accountId) =>
      _api.followsAccountIDDelete(accountID: accountId);

  /// Những người tôi theo dõi. Cursor-less: route này phân trang bằng page/limit.
  Future<List<AccountSummary>> following({
    int page = 1,
    int limit = 20,
  }) async =>
      (await _api.meFollowingGet(page: page, limit: limit)).data?.data ??
      const [];

  /// Người theo dõi một account — đọc được bởi bất kỳ ai, như chính trang đó.
  Future<List<AccountSummary>> followers(
    String accountId, {
    int page = 1,
    int limit = 20,
  }) async =>
      (await _api.accountsIdFollowersGet(
        id: accountId,
        page: page,
        limit: limit,
      )).data?.data ??
      const [];

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

  /// Đơn của **cả hai chiều** khi [role] để trống, không lọc trạng thái: màn Đơn
  /// hàng chia nhóm ở client, nên một lượt đọc phục vụ cả "cần bạn", "đang chờ" và
  /// "xong". Trả cursor ra ngoài — `/orders` phân trang bằng cursor, và một danh
  /// sách bỏ cursor đi là một danh sách dừng ở đơn thứ 20 mà không nói gì.
  Future<OrderPageResult> orders({
    OrderRole? role,
    String? cursor,
    int limit = 20,
  }) async {
    final page = (await _orderApi.ordersGet(
      role: role?.value,
      cursor: cursor,
      limit: limit,
    )).data;
    final orders = page?.data ?? const <Order>[];
    final listings = await _listingsById(orders.expand((order) => order.items));
    return OrderPageResult(
      orders: [for (final order in orders) _view(order, listings)],
      nextCursor: page?.meta.nextCursor,
    );
  }

  Future<List<OrderView>> buyerOrders({
    OrderState? state,
    int limit = 20,
  }) async {
    final page = (await _orderApi.ordersGet(
      role: OrderRole.buyer.value,
      state: state,
      limit: limit,
    )).data;
    final orders = page?.data ?? const <Order>[];
    final listings = await _listingsById(orders.expand((order) => order.items));
    return [for (final order in orders) _view(order, listings)];
  }

  Future<OrderView> buyerOrder(String id) async {
    final order = (await _orderApi.ordersIdGet(id: id)).data?.data;
    if (order == null) throw StateError('empty order');
    return _view(order, await _listingsById(order.items));
  }

  /// [pending] is the contract's own filter: lines the money has not produced an
  /// order for. Everything else is one list, so "cancelled" is a read of
  /// `cancelled_at` rather than a filter the route does not have.
  ///
  /// [role] để trống là cả hai chiều. Bên mua còn hủy được dòng chưa gom, bên bán
  /// thì không có gì phải làm với nó — nên cái quyết định là dòng thuộc về ai, đọc
  /// trên từng dòng chứ không chọn trước cho cả danh sách.
  Future<List<OrderLineView>> items({
    OrderRole? role,
    required bool pending,
    int limit = 50,
  }) async {
    final page = (await _orderApi.itemsGet(
      role: role?.value,
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
      OrderView(order: order, lines: _lines(order.items, listings));

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

    final map = <String, Listing>{};
    try {
      final page = (await _catalogApi.listingsGet(
        ids: ids,
        limit: ids.length.clamp(1, 100),
      )).data;
      for (final listing in page?.data ?? const <Listing>[]) {
        map[listing.id] = listing;
      }
    } catch (e) {
      debugPrint('Lỗi tải danh sách sản phẩm batch: $e');
    }

    final missingIds = ids.where((id) => !map.containsKey(id)).toList();
    if (missingIds.isNotEmpty) {
      final fallbackListings = await Future.wait(
        missingIds.map((id) async {
          try {
            final res = await _catalogApi.listingsIdGet(id: id);
            final detail = res.data?.data;
            if (detail != null) {
              return Listing(
                id: detail.id,
                categoryId: detail.category.id,
                condition: detail.condition,
                cover: detail.images.isNotEmpty ? detail.images.first : null,
                createdAt: detail.createdAt,
                currency: detail.currency,
                deletedAt: detail.deletedAt,
                favorited: detail.favorited,
                location: detail.location,
                name: detail.name,
                price: detail.variants.isNotEmpty ? detail.variants.first.price : 0,
                priceMode: detail.priceMode,
                rating: detail.rating,
                reviewCount: detail.reviewCount,
                score: null,
                seller: detail.seller,
                slug: detail.slug,
                sold: detail.sold,
                status: detail.status,
                tags: detail.tags,
                takenDownAt: detail.takenDownAt,
              );
            }
          } catch (e) {
            debugPrint('Lỗi tải thông tin sản phẩm đơn lẻ $id: $e');
          }
          return null;
        }),
      );
      for (final listing in fallbackListings) {
        if (listing != null) {
          map[listing.id] = listing;
        }
      }
    }

    return map;
  }
}

/// Bên nào của đơn. `oneof=buyer seller`, và route từ chối request thiếu nó.
enum OrderRole {
  buyer('buyer'),
  seller('seller');

  const OrderRole(this.value);

  final String value;
}

class OrderPageResult {
  const OrderPageResult({required this.orders, this.nextCursor});

  final List<OrderView> orders;
  final String? nextCursor;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

@riverpod
AccountRepository accountRepository(Ref ref) => AccountRepository(
  ref.watch(accountApiServiceProvider),
  ref.watch(accountApiProvider),
  ref.watch(orderApiProvider),
  ref.watch(catalogApiProvider),
);
