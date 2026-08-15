import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/add_cart_item_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_cart_item_request.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';

part 'cart_repository.g.dart';

class CartRepository {
  final OrderApi _orderApi;
  final HiveService _hiveService;

  CartRepository(this._orderApi, this._hiveService);

  /// Lấy giỏ hàng từ remote server
  Future<List<CartItem>> getCart() async {
    final response = await _orderApi.cartItemsGet();
    return response.data?.data ?? const [];
  }

  /// Thêm sản phẩm vào giỏ hàng
  Future<CartItem> addCartItem(AddCartItemRequest request) async {
    final response = await _orderApi.cartItemsPost(addCartItemRequest: request);
    return _row(response.data?.data);
  }

  /// Cập nhật số lượng của 1 cart item row
  Future<CartItem> updateCartItem(
    String id,
    UpdateCartItemRequest request,
  ) async {
    final response = await _orderApi.cartItemsIdPatch(
      id: id,
      updateCartItemRequest: request,
    );
    return _row(response.data?.data);
  }

  /// Xóa 1 cart item row theo id
  Future<void> deleteCartItem(String id) => _orderApi.cartItemsIdDelete(id: id);

  /// Xóa sạch giỏ hàng
  Future<void> clearCart() async {
    for (final item in await getCart()) {
      await deleteCartItem(item.id);
    }
    await cacheCart([]);
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

  /// Xóa giỏ hàng cached trong Hive
  Future<void> clearCachedCart() async {
    try {
      final box = _hiveService.cartBox;
      await box.delete('cart_items');
    } catch (_) {}
  }

  CartItem _row(CartItem? data) {
    if (data == null) throw StateError('empty cart item');
    return data;
  }
}

@riverpod
CartRepository cartRepository(Ref ref) =>
    CartRepository(ref.watch(orderApiProvider), ref.watch(hiveServiceProvider));
