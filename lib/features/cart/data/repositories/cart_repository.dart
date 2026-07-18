import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../data_sources/cart_api_service.dart';
import '../models/cart_model.dart';

part 'cart_repository.g.dart';

class CartRepository {
  final CartApiService _apiService;
  final HiveService _hiveService;

  CartRepository(this._apiService, this._hiveService);

  /// Lấy giỏ hàng từ remote server
  Future<List<CartItem>> getCart() async {
    try {
      final response = await _apiService.getCart();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Cập nhật giỏ hàng lên remote server
  Future<void> updateCart(UpdateCartRequest request) async {
    try {
      await _apiService.updateCart(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Xóa sạch giỏ hàng trên remote server
  Future<void> clearCart() async {
    try {
      await _apiService.clearCart();
    } catch (e) {
      rethrow;
    }
  }

  /// Cache giỏ hàng xuống Hive
  Future<void> cacheCart(List<CartItem> items) async {
    try {
      final box = _hiveService.cartBox;
      final list = items.map((item) => item.toJson()).toList();
      await box.put('cart_items', list);
    } catch (e) {
      // Bỏ qua lỗi để không gây crash UI
    }
  }

  /// Lấy giỏ hàng cached từ Hive
  List<CartItem> getCachedCart() {
    try {
      final box = _hiveService.cartBox;
      final rawList = box.get('cart_items') as List?;
      if (rawList == null) return [];
      return rawList
          .map((e) => CartItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (e) {
      return [];
    }
  }
}

@riverpod
CartRepository cartRepository(Ref ref) {
  final apiService = ref.watch(cartApiServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return CartRepository(apiService, hiveService);
}
