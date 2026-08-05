import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../api/api_providers.dart';
import '../../../../api/generated/api/account_api.dart' as generated;
import '../../../../api/generated/model/account_create_upload_request.dart';
import '../../../../core/constants/app_config.dart';
import '../data_sources/account_api_service.dart';
import '../models/account_model.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;
  final generated.AccountApi _api;

  AccountRepository(this._apiService, this._api);

  /// Reserve a slot, PUT the bytes to the signed URL, confirm — the bytes never
  /// pass through this API, and until the confirmation lands the resource
  /// resolves to nothing, so a profile can never show an avatar that never
  /// arrived. Returns the resource id for `UpdateProfileRequest.avatarRsId`.
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
    if (AppConfig.useMockData) {
      return _mockMe;
    }
    final response = await _apiService.getProfile();
    return response.data;
  }

  Future<Me> updateProfile(UpdateProfileRequest request) async {
    if (AppConfig.useMockData) {
      final currentProfile = _mockMe.profile;
      final updatedProfile = currentProfile?.copyWith(
        name: request.name ?? currentProfile.name,
        country: request.country ?? currentProfile.country,
        description: request.description ?? currentProfile.description,
        dateOfBirth: request.dateOfBirth ?? currentProfile.dateOfBirth,
      );
      _mockMe = _mockMe.copyWith(
        profile: updatedProfile,
        username: request.username ?? _mockMe.username,
        email: request.email ?? _mockMe.email,
        phone: request.phone ?? _mockMe.phone,
      );
      return _mockMe;
    }
    await _apiService.updateProfile(request);
    final response = await _apiService.getProfile();
    return response.data;
  }

  Future<UpdateCountryResponse> updateProfileCountry(String country) async {
    if (AppConfig.useMockData) {
      return UpdateCountryResponse(country: country, inferredCurrency: 'VND');
    }
    final currentMe = await getProfile();
    await _apiService.updateProfile(
      UpdateProfileRequest(
        country: country,
        name: currentMe.profile?.name,
        locale: currentMe.profile?.locale,
        timezone: currentMe.profile?.timezone,
      ),
    );
    return UpdateCountryResponse(country: country, inferredCurrency: 'VND');
  }

  Future<PublicAccount> getAccountById(String accountId) async {
    if (AppConfig.useMockData) {
      return const PublicAccount(
        id: 'vendor_mock_01',
        name: 'Craft & Wood Studio',
        followerCount: 1250,
        identityVerified: true,
        createdAt: '2025-06-01T00:00:00Z',
        description:
            'Chuyên cung cấp đồ gỗ sồi, gốm sứ thủ công và sản phẩm lifestyle cao cấp phong cách Minimalism.',
        avatar: Resource(
          id: 'res_vendor_01',
          mime: 'image/jpeg',
          objectKey: 'avatars/vendor_mock_01.jpg',
          provider: 's3',
          size: 102400,
          url:
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
        ),
      );
    }
    final response = await _apiService.getAccountById(accountId);
    return response.data;
  }

  // --- Contacts Features ---
  Future<List<Contact>> getContacts() async {
    if (AppConfig.useMockData) {
      return _mockContacts;
    }
    final response = await _apiService.getContacts();
    return response.data;
  }

  Future<Contact> createContact(CreateContactRequest request) async {
    if (AppConfig.useMockData) {
      final newContact = Contact(
        id: 'contact_${DateTime.now().millisecondsSinceEpoch}',
        fullName: request.fullName,
        phone: request.phone,
        phoneVerified: true,
        address: request.address,
        addressDetail: request.addressDetail,
        addressType: request.addressType,
        country: request.country,
        provinceCode: request.provinceCode,
        provinceName: request.provinceName,
        districtCode: request.districtCode,
        districtName: request.districtName,
        wardCode: request.wardCode,
        wardName: request.wardName,
        postalCode: request.postalCode,
        isDefaultDelivery: request.isDefaultDelivery ?? false,
        isDefaultPickup: request.isDefaultPickup ?? false,
        latitude: request.latitude,
        longitude: request.longitude,
        createdAt: DateTime.now().toIso8601String(),
      );
      _mockContacts.add(newContact);
      return newContact;
    }
    final response = await _apiService.createContact(request);
    return response.data;
  }

  Future<Contact> updateContact(UpdateContactRequest request) async {
    final contactId = request.contactId ?? '';
    if (AppConfig.useMockData) {
      final existing = _mockContacts.firstWhere(
        (c) => c.id == contactId,
        orElse: () => _mockContacts.first,
      );
      final updated = existing.copyWith(
        fullName: request.fullName ?? existing.fullName,
        phone: request.phone ?? existing.phone,
        address: request.address ?? existing.address,
        addressDetail: request.addressDetail ?? existing.addressDetail,
        addressType: request.addressType ?? existing.addressType,
        isDefaultDelivery:
            request.isDefaultDelivery ?? existing.isDefaultDelivery,
        isDefaultPickup: request.isDefaultPickup ?? existing.isDefaultPickup,
      );
      final idx = _mockContacts.indexWhere((c) => c.id == contactId);
      if (idx != -1) {
        _mockContacts[idx] = updated;
      }
      return updated;
    }
    final response = await _apiService.updateContact(contactId, request);
    return response.data;
  }

  Future<String> deleteContact(String contactId) async {
    if (AppConfig.useMockData) {
      _mockContacts.removeWhere((c) => c.id == contactId);
      return 'Xóa địa chỉ thành công';
    }
    await _apiService.deleteContact(contactId);
    return 'Xóa địa chỉ thành công';
  }

  Future<Contact> getContactDetail(String contactId) async {
    if (AppConfig.useMockData) {
      return _mockContacts.firstWhere(
        (c) => c.id == contactId,
        orElse: () => _mockContacts.first,
      );
    }
    final response = await _apiService.getContactDetail(contactId);
    return response.data;
  }

  // --- Favorites / Wishlist Features ---
  Future<List<AccountFavorite>> getFavorites({int? page, int? limit}) async {
    final response = await _apiService.getFavorites(page, limit);
    return response.data;
  }

  Future<AccountFavorite> addFavorite(String spuId) async {
    await _apiService.addFavorite(spuId);
    return AccountFavorite(
      id: DateTime.now().millisecondsSinceEpoch,
      spuId: spuId,
      accountId: '',
      dateCreated: DateTime.now().toIso8601String(),
    );
  }

  Future<String> removeFavorite(String spuId) async {
    await _apiService.removeFavorite(spuId);
    return 'Đã xóa khỏi danh sách yêu thích';
  }

  // --- Notifications Features ---
  Future<List<Notification>> getNotifications({int? page, int? limit}) async {
    if (AppConfig.useMockData) {
      return _mockNotifications;
    }
    final response = await _apiService.getNotifications(page, limit);
    return response.data;
  }

  Future<int> getUnreadNotificationsCount() async {
    if (AppConfig.useMockData) {
      return _mockNotifications.where((n) => !n.isRead).length;
    }
    final response = await _apiService.getUnreadCount();
    return response.data.count;
  }

  Future<String> markNotificationsAsRead(List<int> ids) async {
    if (AppConfig.useMockData) {
      for (var i = 0; i < _mockNotifications.length; i++) {
        if (ids.contains(_mockNotifications[i].id)) {
          _mockNotifications[i] = _mockNotifications[i].copyWith(
            readAt: DateTime.now().toIso8601String(),
          );
        }
      }
      return 'Đã đánh dấu là đã đọc';
    }
    await _apiService.markAsRead(
      MarkNotificationsReadRequest(before: DateTime.now().toIso8601String()),
    );
    return 'Đã đánh dấu là đã đọc';
  }

  Future<String> markAllNotificationsAsRead() async {
    if (AppConfig.useMockData) {
      for (var i = 0; i < _mockNotifications.length; i++) {
        _mockNotifications[i] = _mockNotifications[i].copyWith(
          readAt: DateTime.now().toIso8601String(),
        );
      }
      return 'Đã đánh dấu tất cả là đã đọc';
    }
    await _apiService.markAsRead(
      MarkNotificationsReadRequest(before: DateTime.now().toIso8601String()),
    );
    return 'Đã đánh dấu tất cả là đã đọc';
  }

  // --- Buyer Orders & Pending Items ---
  Future<List<BuyerOrderItem>> getBuyerPendingItems({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockBuyerPendingItems;
    }
    final response = await _apiService.getBuyerPendingItems(page, limit);
    return response.data;
  }

  Future<void> cancelBuyerPendingItem(String id) async {
    if (AppConfig.useMockData) {
      final idx = _mockBuyerPendingItems.indexWhere(
        (item) => item.id.toString() == id,
      );
      if (idx != -1) {
        final removed = _mockBuyerPendingItems.removeAt(idx);
        _mockBuyerCancelledItems.add(removed);
      }
      return;
    }
    await _apiService.cancelBuyerPendingItem(id);
  }

  Future<List<BuyerOrder>> getBuyerPendingOrders({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockBuyerPendingOrders;
    }
    final response = await _apiService.getBuyerPendingOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrder>> getBuyerCompletedOrders({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockBuyerCompletedOrders;
    }
    final response = await _apiService.getBuyerCompletedOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrder>> getBuyerCancelledOrders({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockBuyerCancelledOrders;
    }
    final response = await _apiService.getBuyerCancelledOrders(page, limit);
    return response.data;
  }

  Future<List<BuyerOrderItem>> getBuyerCancelledItems({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockBuyerCancelledItems;
    }
    final response = await _apiService.getBuyerCancelledItems(page, limit);
    return response.data;
  }

  Future<BuyerOrder> getBuyerOrderDetail(String id) async {
    if (AppConfig.useMockData) {
      final allOrders = [
        ..._mockBuyerPendingOrders,
        ..._mockBuyerCompletedOrders,
        ..._mockBuyerCancelledOrders,
      ];
      return allOrders.firstWhere(
        (o) => o.id == id,
        orElse: () => _mockBuyerPendingOrders.first,
      );
    }
    final response = await _apiService.getBuyerOrderDetail(id);
    return response.data;
  }

  // --- Static Mock State Storage ---
  static Me _mockMe = const Me(
    id: 'user_mock_01',
    createdAt: '2026-01-01T00:00:00Z',
    status: 'active',
    role: 'user',
    email: 'user@shopnexus.com',
    emailVerified: true,
    hasPassword: true,
    identityVerified: true,
    phone: '0901234567',
    username: 'nguyenvana',
    profile: Profile(
      name: 'Nguyễn Văn A',
      country: 'VN',
      locale: 'vi-VN',
      timezone: 'Asia/Ho_Chi_Minh',
      createdAt: '2026-01-01T00:00:00Z',
      avatar: Resource(
        id: 'res_01',
        mime: 'image/jpeg',
        objectKey: 'avatars/user_mock_01.jpg',
        provider: 's3',
        size: 102400,
        url:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      ),
    ),
  );

  static final List<Contact> _mockContacts = [
    const Contact(
      id: 'contact_01',
      fullName: 'Nguyễn Văn A',
      phone: '0901234567',
      phoneVerified: true,
      address: '123 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1',
      addressDetail: 'Tầng 12, Tòa nhà Sunwah',
      addressType: 'home',
      country: 'VN',
      provinceCode: '79',
      provinceName: 'TP. Hồ Chí Minh',
      districtCode: '760',
      districtName: 'Quận 1',
      wardCode: '26734',
      wardName: 'Phường Bến Nghé',
      postalCode: '700000',
      isDefaultDelivery: true,
      isDefaultPickup: false,
      latitude: 10.7769,
      longitude: 106.7009,
      createdAt: '2026-01-01T00:00:00Z',
    ),
    const Contact(
      id: 'contact_02',
      fullName: 'Nguyễn Văn A (Cty)',
      phone: '0901234567',
      phoneVerified: true,
      address: '2 Hải Triều, Phường Bến Nghé, Quận 1',
      addressDetail: 'Tầng 25 Bitexco Financial Tower',
      addressType: 'work',
      country: 'VN',
      provinceCode: '79',
      provinceName: 'TP. Hồ Chí Minh',
      districtCode: '760',
      districtName: 'Quận 1',
      wardCode: '26734',
      wardName: 'Phường Bến Nghé',
      postalCode: '700000',
      isDefaultDelivery: false,
      isDefaultPickup: false,
      latitude: 10.7716,
      longitude: 106.7044,
      createdAt: '2026-02-01T00:00:00Z',
    ),
  ];

  static final List<Notification> _mockNotifications = [
    const Notification(
      title: 'Đơn hàng #DH8470 đã được giao thành công',
      category: 'order',
      createdAt: '2026-07-23T14:30:00Z',
      payload: {
        'content':
            'Giao hàng hoàn tất lúc 14:30. Cảm ơn bạn đã mua sắm tại ShopNexus!',
      },
      readAt: null,
      legacyId: 101,
    ),
    const Notification(
      title: 'Shop @ClassicLeather đã nhận đơn gom hàng',
      category: 'order',
      createdAt: '2026-07-23T10:15:00Z',
      payload: {
        'content':
            'Sản phẩm Cốc gốm thủ công đã được shop xác nhận và đang đóng gói.',
      },
      readAt: null,
      legacyId: 102,
    ),
    const Notification(
      title: 'Khuyến mãi thành viên Stitch Premium',
      category: 'promotion',
      createdAt: '2026-07-22T08:00:00Z',
      payload: {
        'content':
            'Tặng bạn voucher giảm 20% tối đa 100k cho đơn hàng tiếp theo!',
      },
      readAt: '2026-07-22T09:00:00Z',
      legacyId: 103,
    ),
  ];

  static final List<BuyerOrderItem> _mockBuyerPendingItems = [
    const BuyerOrderItem(
      id: 1001,
      skuId: 'sku_1_1',
      spuId: 'spu_1',
      skuName: 'Ví da bò sáp thủ công Classic - Nâu Dark Brown',
      quantity: 1,
      subtotalAmount: 850000,
      totalAmount: 850000,
      slug: 'vi-da-bo-sap-thu-cong-classic',
      imageUrl:
          'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
    ),
  ];

  static final List<BuyerOrder> _mockBuyerPendingOrders = [
    const BuyerOrder(
      id: 'DH8472',
      buyerId: 'user_mock_01',
      sellerId: 'vendor_mock_01',
      address: '123 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh',
      dateCreated: '2026-07-23T11:00:00Z',
      totalAmount: 880000,
      items: [
        BuyerOrderItem(
          id: 1001,
          skuId: 'sku_1_1',
          spuId: 'spu_1',
          skuName: 'Ví da bò sáp thủ công Classic - Nâu Dark Brown',
          quantity: 1,
          subtotalAmount: 850000,
          totalAmount: 850000,
          slug: 'vi-da-bo-sap-thu-cong-classic',
          imageUrl:
              'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
        ),
      ],
      transport: BuyerOrderTransport(
        id: 501,
        status: 'Đang vận chuyển',
        option: 'Giao hàng hỏa tốc 24h',
      ),
    ),
  ];

  static final List<BuyerOrder> _mockBuyerCompletedOrders = [
    const BuyerOrder(
      id: 'DH8470',
      buyerId: 'user_mock_01',
      sellerId: 'vendor_mock_01',
      address: '123 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh',
      dateCreated: '2026-07-20T15:30:00Z',
      totalAmount: 450000,
      items: [
        BuyerOrderItem(
          id: 1003,
          skuId: 'sku_2_1',
          spuId: 'spu_2',
          skuName: 'Bình giữ nhiệt Titan 750ml Matte Black - Đen Nhám',
          quantity: 1,
          subtotalAmount: 420000,
          totalAmount: 420000,
          slug: 'binh-giu-nhiet-titan-750ml',
          imageUrl:
              'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400',
        ),
      ],
      transport: BuyerOrderTransport(
        id: 502,
        status: 'Đã hoàn thành',
        option: 'Giao hàng tiêu chuẩn',
      ),
    ),
  ];

  static final List<BuyerOrder> _mockBuyerCancelledOrders = [];

  static final List<BuyerOrderItem> _mockBuyerCancelledItems = [];
}

@riverpod
AccountRepository accountRepository(Ref ref) => AccountRepository(
  ref.watch(accountApiServiceProvider),
  ref.watch(accountApiProvider),
);
