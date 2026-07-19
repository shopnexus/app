import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/account_api_service.dart';
import '../models/account_model.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;

  AccountRepository(this._apiService);

  // --- Profile Features ---
  Future<AccountProfile> getProfile() async {
    try {
      final response = await _apiService.getProfile();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<AccountProfile> updateProfile(UpdateProfileRequest request) async {
    try {
      final response = await _apiService.updateProfile(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateCountryResponse> updateProfileCountry(String country) async {
    try {
      final response = await _apiService.updateProfileCountry(
        UpdateCountryRequest(country: country),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<AccountProfile> getAccountById(String accountId) async {
    try {
      final response = await _apiService.getAccountById(accountId);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // --- Contacts Features ---
  Future<List<Contact>> getContacts() async {
    try {
      final response = await _apiService.getContacts();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Contact> createContact(CreateContactRequest request) async {
    try {
      final response = await _apiService.createContact(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Contact> updateContact(UpdateContactRequest request) async {
    try {
      final response = await _apiService.updateContact(request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteContact(String contactId) async {
    try {
      final response = await _apiService.deleteContact({
        'contact_id': contactId,
      });
      return response.data.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<Contact> getContactDetail(String contactId) async {
    try {
      final response = await _apiService.getContactDetail(contactId);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // --- Favorites / Wishlist Features ---
  Future<List<AccountFavorite>> getFavorites({int? page, int? limit}) async {
    try {
      final response = await _apiService.getFavorites(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<AccountFavorite> addFavorite(String spuId) async {
    try {
      final response = await _apiService.addFavorite(spuId);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> removeFavorite(String spuId) async {
    try {
      final response = await _apiService.removeFavorite(spuId);
      return response.data.message;
    } catch (e) {
      rethrow;
    }
  }

  // --- Notifications Features ---
  Future<List<Notification>> getNotifications({int? page, int? limit}) async {
    try {
      final response = await _apiService.getNotifications(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getUnreadNotificationsCount() async {
    try {
      final response = await _apiService.getUnreadCount();
      return response.data.count;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> markNotificationsAsRead(List<int> ids) async {
    try {
      final response = await _apiService.markAsRead(
        ReadNotificationsRequest(ids: ids),
      );
      return response.data.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> markAllNotificationsAsRead() async {
    try {
      final response = await _apiService.markAllAsRead();
      return response.data.message;
    } catch (e) {
      rethrow;
    }
  }

  // --- Buyer Orders & Pending Items ---
  Future<List<BuyerOrderItem>> getBuyerPendingItems({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getBuyerPendingItems(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelBuyerPendingItem(String id) async {
    try {
      await _apiService.cancelBuyerPendingItem(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BuyerOrder>> getBuyerPendingOrders({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getBuyerPendingOrders(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BuyerOrder>> getBuyerCompletedOrders({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getBuyerCompletedOrders(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BuyerOrder>> getBuyerCancelledOrders({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getBuyerCancelledOrders(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BuyerOrderItem>> getBuyerCancelledItems({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getBuyerCancelledItems(page, limit);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<BuyerOrder> getBuyerOrderDetail(String id) async {
    try {
      final response = await _apiService.getBuyerOrderDetail(id);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
AccountRepository accountRepository(Ref ref) {
  final apiService = ref.watch(accountApiServiceProvider);
  return AccountRepository(apiService);
}
