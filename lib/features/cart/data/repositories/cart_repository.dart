import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/cart/data/data_sources/cart_api_service.dart';
import 'package:shopnexus_flutter_app/features/cart/data/models/cart_model.dart';

part 'cart_repository.g.dart';

class CartRepository {
  final CartApiService _apiService;
  final HiveService _hiveService;

  CartRepository(this._apiService, this._hiveService);

  /// Lấy giỏ hàng từ remote server
  Future<List<CartItem>> getCart() async {
    try {
      final response = await _apiService.getCart();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Thêm sản phẩm vào giỏ hàng
  Future<CartItem> addCartItem(AddCartItemRequest request) async {
    try {
      return await _apiService.addCartItem(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Cập nhật số lượng của 1 cart item row
  Future<CartItem> updateCartItem(
    String id,
    UpdateCartItemRequest request,
  ) async {
    try {
      return await _apiService.updateCartItem(id, request);
    } catch (e) {
      rethrow;
    }
  }

  /// Xóa 1 cart item row theo id
  Future<void> deleteCartItem(String id) async {
    try {
      await _apiService.deleteCartItem(id);
    } catch (e) {
      rethrow;
    }
  }

  /// Xóa sạch giỏ hàng
  Future<void> clearCart() async {
    try {
      final items = await getCart();
      for (final item in items) {
        await _apiService.deleteCartItem(item.id);
      }
      await cacheCart([]);
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
