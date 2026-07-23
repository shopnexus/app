import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../data_sources/account_api_service.dart';
import '../models/account_model.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;

  AccountRepository(this._apiService);

  // --- Profile Features ---
  Future<AccountProfile> getProfile() async {
    if (AppConfig.useMockData) {
      return const AccountProfile(
        id: 'user_mock_01',
        dateCreated: '2026-01-01T00:00:00Z',
        dateUpdated: '2026-07-01T00:00:00Z',
        status: 'active',
        role: 'buyer',
        email: 'user@shopnexus.com',
        username: 'nguyenvana',
        name: 'Nguyễn Văn A',
        phone: '0901234567',
        emailVerified: true,
        phoneVerified: true,
        avatarUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
        country: 'VN',
        currency: 'VND',
        internalBalance: 500000,
        defaultContactId: 'contact_01',
      );
    }
    final response = await _apiService.getProfile();
    return response.data;
  }

  Future<AccountProfile> updateProfile(UpdateProfileRequest request) async {
    if (AppConfig.useMockData) {
      return AccountProfile(
        id: 'user_mock_01',
        dateCreated: '2026-01-01T00:00:00Z',
        dateUpdated: '2026-07-23T00:00:00Z',
        status: 'active',
        role: 'buyer',
        email: request.email ?? 'user@shopnexus.com',
        username: request.username ?? 'nguyenvana',
        name: request.name ?? 'Nguyễn Văn A',
        phone: request.phone ?? '0901234567',
        emailVerified: true,
        phoneVerified: true,
        avatarUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
        country: 'VN',
        currency: 'VND',
        internalBalance: 500000,
        defaultContactId: request.defaultContactId ?? 'contact_01',
      );
    }
    final response = await _apiService.updateProfile(request);
    return response.data;
  }

  Future<UpdateCountryResponse> updateProfileCountry(String country) async {
    if (AppConfig.useMockData) {
      return UpdateCountryResponse(country: country, inferredCurrency: 'VND');
    }
    final response = await _apiService.updateProfileCountry(
      UpdateCountryRequest(country: country),
    );
    return response.data;
  }

  Future<AccountProfile> getAccountById(String accountId) async {
    if (AppConfig.useMockData) {
      return const AccountProfile(
        id: 'vendor_mock_01',
        dateCreated: '2025-06-01T00:00:00Z',
        dateUpdated: '2026-07-01T00:00:00Z',
        status: 'active',
        role: 'seller',
        email: 'store@craftwood.com',
        username: 'CraftWoodStudio',
        name: 'Craft & Wood Studio',
        description:
            'Chuyên cung cấp đồ gỗ sồi, gốm sứ thủ công và sản phẩm lifestyle cao cấp phong cách Minimalism.',
        phone: '0988776655',
        emailVerified: true,
        phoneVerified: true,
        avatarUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
        country: 'VN',
        currency: 'VND',
        internalBalance: 18500000,
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
        accountId: 'user_mock_01',
        fullName: request.fullName,
        phone: request.phone,
        phoneVerified: true,
        address: request.address,
        addressDetail: request.addressDetail,
        addressType: request.addressType,
        latitude: request.latitude,
        longitude: request.longitude,
        dateCreated: '2026-07-23T00:00:00Z',
      );
      _mockContacts.add(newContact);
      return newContact;
    }
    final response = await _apiService.createContact(request);
    return response.data;
  }

  Future<Contact> updateContact(UpdateContactRequest request) async {
    if (AppConfig.useMockData) {
      final updated = Contact(
        id: request.contactId,
        accountId: 'user_mock_01',
        fullName: request.fullName ?? 'Nguyễn Văn A',
        phone: request.phone ?? '0901234567',
        phoneVerified: true,
        address: request.address ?? '123 Nguyễn Huệ',
        addressDetail: request.addressDetail,
        addressType: request.addressType ?? 'Home',
        latitude: request.latitude ?? 0.0,
        longitude: request.longitude ?? 0.0,
        dateCreated: '2026-07-23T00:00:00Z',
      );
      final idx = _mockContacts.indexWhere((c) => c.id == request.contactId);
      if (idx != -1) {
        _mockContacts[idx] = updated;
      }
      return updated;
    }
    final response = await _apiService.updateContact(request);
    return response.data;
  }

  Future<String> deleteContact(String contactId) async {
    if (AppConfig.useMockData) {
      _mockContacts.removeWhere((c) => c.id == contactId);
      return 'Xóa địa chỉ thành công';
    }
    final response = await _apiService.deleteContact({
      'contact_id': contactId,
    });
    return response.data.message;
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
    if (AppConfig.useMockData) {
      return _mockFavorites;
    }
    final response = await _apiService.getFavorites(page, limit);
    return response.data;
  }

  Future<AccountFavorite> addFavorite(String spuId) async {
    if (AppConfig.useMockData) {
      final fav = AccountFavorite(
        id: DateTime.now().millisecondsSinceEpoch,
        spuId: spuId,
        accountId: 'user_mock_01',
        dateCreated: '2026-07-23T00:00:00Z',
      );
      if (!_mockFavorites.any((f) => f.spuId == spuId)) {
        _mockFavorites.add(fav);
      }
      return fav;
    }
    final response = await _apiService.addFavorite(spuId);
    return response.data;
  }

  Future<String> removeFavorite(String spuId) async {
    if (AppConfig.useMockData) {
      _mockFavorites.removeWhere((f) => f.spuId == spuId);
      return 'Đã xóa khỏi danh sách yêu thích';
    }
    final response = await _apiService.removeFavorite(spuId);
    return response.data.message;
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
          _mockNotifications[i] = _mockNotifications[i].copyWith(isRead: true);
        }
      }
      return 'Đã đánh dấu là đã đọc';
    }
    final response = await _apiService.markAsRead(
      ReadNotificationsRequest(ids: ids),
    );
    return response.data.message;
  }

  Future<String> markAllNotificationsAsRead() async {
    if (AppConfig.useMockData) {
      for (var i = 0; i < _mockNotifications.length; i++) {
        _mockNotifications[i] = _mockNotifications[i].copyWith(isRead: true);
      }
      return 'Đã đánh dấu tất cả là đã đọc';
    }
    final response = await _apiService.markAllAsRead();
    return response.data.message;
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
  static final List<Contact> _mockContacts = [
    const Contact(
      id: 'contact_01',
      accountId: 'user_mock_01',
      fullName: 'Nguyễn Văn A',
      phone: '0901234567',
      phoneVerified: true,
      address: '123 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1',
      addressDetail: 'Tầng 12, Tòa nhà Sunwah',
      addressType: 'Home',
      latitude: 10.7769,
      longitude: 106.7009,
      dateCreated: '2026-01-01T00:00:00Z',
    ),
    const Contact(
      id: 'contact_02',
      accountId: 'user_mock_01',
      fullName: 'Nguyễn Văn A (Cty)',
      phone: '0901234567',
      phoneVerified: true,
      address: '2 Hải Triều, Phường Bến Nghé, Quận 1',
      addressDetail: 'Tầng 25 Bitexco Financial Tower',
      addressType: 'Office',
      latitude: 10.7716,
      longitude: 106.7044,
      dateCreated: '2026-02-01T00:00:00Z',
    ),
    const Contact(
      id: 'contact_03',
      accountId: 'user_mock_01',
      fullName: 'Bà Nguyễn Thị B (Mẹ)',
      phone: '0987654321',
      phoneVerified: true,
      address: '456 Đường Lê Lợi, Phường 4, Quận 3',
      addressDetail: 'Nhà riêng',
      addressType: 'Other',
      latitude: 10.7780,
      longitude: 106.6900,
      dateCreated: '2026-03-01T00:00:00Z',
    ),
  ];

  static final List<AccountFavorite> _mockFavorites = [
    const AccountFavorite(
      id: 1,
      spuId: 'spu_1',
      accountId: 'user_mock_01',
      dateCreated: '2026-07-01T00:00:00Z',
    ),
    const AccountFavorite(
      id: 2,
      spuId: 'spu_2',
      accountId: 'user_mock_01',
      dateCreated: '2026-07-02T00:00:00Z',
    ),
    const AccountFavorite(
      id: 3,
      spuId: 'spu_3',
      accountId: 'user_mock_01',
      dateCreated: '2026-07-03T00:00:00Z',
    ),
    const AccountFavorite(
      id: 4,
      spuId: 'spu_4',
      accountId: 'user_mock_01',
      dateCreated: '2026-07-04T00:00:00Z',
    ),
  ];

  static final List<Notification> _mockNotifications = [
    const Notification(
      id: 101,
      accountId: 'user_mock_01',
      type: 'order',
      channel: 'push',
      title: 'Đơn hàng #DH8470 đã được giao thành công',
      content:
          'Giao hàng hoàn tất lúc 14:30. Cảm ơn bạn đã mua sắm tại ShopNexus!',
      isRead: false,
      dateCreated: '2026-07-23T14:30:00Z',
    ),
    const Notification(
      id: 102,
      accountId: 'user_mock_01',
      type: 'order',
      channel: 'push',
      title: 'Shop @ClassicLeather đã nhận đơn gom hàng',
      content:
          'Sản phẩm Cốc gốm thủ công đã được shop xác nhận và đang đóng gói.',
      isRead: false,
      dateCreated: '2026-07-23T10:15:00Z',
    ),
    const Notification(
      id: 103,
      accountId: 'user_mock_01',
      type: 'promo',
      channel: 'push',
      title: 'Khuyến mãi thành viên Stitch Premium',
      content: 'Tặng bạn voucher giảm 20% tối đa 100k cho đơn hàng tiếp theo!',
      isRead: true,
      dateCreated: '2026-07-22T08:00:00Z',
    ),
    const Notification(
      id: 104,
      accountId: 'user_mock_01',
      type: 'refund',
      channel: 'push',
      title: 'Hoàn tiền đơn hàng #DH8102 thành công',
      content: 'Số tiền 350.000đ đã được hoàn về Ví của bạn.',
      isRead: true,
      dateCreated: '2026-07-21T16:45:00Z',
    ),
    const Notification(
      id: 105,
      accountId: 'user_mock_01',
      type: 'system',
      channel: 'push',
      title: 'Xác nhận địa chỉ giao hàng mới',
      content: 'Bạn vừa thêm thành công địa chỉ nhận hàng Office.',
      isRead: true,
      dateCreated: '2026-07-20T09:20:00Z',
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
    const BuyerOrderItem(
      id: 1002,
      skuId: 'sku_3_1',
      spuId: 'spu_3',
      skuName: 'Set Tinh dầu thiên nhiên Relax Organics - Combo 3 chai 10ml',
      quantity: 2,
      subtotalAmount: 350000,
      totalAmount: 700000,
      slug: 'set-tinh-dau-thien-nhien-relax',
      imageUrl:
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
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

  static final List<BuyerOrder> _mockBuyerCancelledOrders = [
    const BuyerOrder(
      id: 'DH8102',
      buyerId: 'user_mock_01',
      sellerId: 'vendor_mock_01',
      address: '2 Hải Triều, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh',
      dateCreated: '2026-07-18T09:15:00Z',
      totalAmount: 350000,
      items: [
        BuyerOrderItem(
          id: 1004,
          skuId: 'sku_v_1',
          spuId: 'spu_5',
          skuName: 'Áo sơ mi Linen cúc thô Vintage - Trắng M',
          quantity: 1,
          subtotalAmount: 350000,
          totalAmount: 350000,
          slug: 'ao-so-mi-linen-cuc-tho-vintage',
          imageUrl:
              'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400',
        ),
      ],
      transport: BuyerOrderTransport(
        id: 503,
        status: 'Đã hủy',
        option: 'Giao hàng tiêu chuẩn',
      ),
    ),
  ];

  static final List<BuyerOrderItem> _mockBuyerCancelledItems = [
    const BuyerOrderItem(
      id: 1005,
      skuId: 'sku_6_1',
      spuId: 'spu_6',
      skuName: 'Cốc gốm thủ công tráng men xanh - 350ml',
      quantity: 1,
      subtotalAmount: 150000,
      totalAmount: 150000,
      slug: 'coc-gom-thu-cong-trang-men-xanh',
      imageUrl:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400',
    ),
  ];
}

@riverpod
AccountRepository accountRepository(Ref ref) {
  final apiService = ref.watch(accountApiServiceProvider);
  return AccountRepository(apiService);
}
