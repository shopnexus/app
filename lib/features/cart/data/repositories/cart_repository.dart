import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../shared/models/resource_model.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../data_sources/cart_api_service.dart';
import '../models/cart_model.dart';

part 'cart_repository.g.dart';

class CartRepository {
  final CartApiService _apiService;
  final HiveService _hiveService;

  CartRepository(this._apiService, this._hiveService);

  /// Lấy giỏ hàng từ remote server hoặc mock data
  Future<List<CartItem>> getCart() async {
    if (AppConfig.useMockData) {
      final cached = getCachedCart();
      if (cached.isNotEmpty) {
        return cached;
      }
      // Seed default mock items if empty
      await cacheCart(_defaultMockCartItems);
      return _defaultMockCartItems;
    }
    try {
      final response = await _apiService.getCart();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Cập nhật giỏ hàng lên remote server hoặc mock cache
  Future<void> updateCart(UpdateCartRequest request) async {
    if (AppConfig.useMockData) {
      final currentItems = List<CartItem>.from(getCachedCart());
      final index = currentItems.indexWhere((i) => i.sku.id == request.skuId);

      if (request.quantity != null && request.quantity! <= 0) {
        if (index != -1) {
          currentItems.removeAt(index);
        }
      } else if (request.quantity != null) {
        if (index != -1) {
          currentItems[index] = currentItems[index].copyWith(
            quantity: request.quantity!,
          );
        }
      } else if (request.deltaQuantity != null) {
        if (index != -1) {
          final newQty = currentItems[index].quantity + request.deltaQuantity!;
          if (newQty <= 0) {
            currentItems.removeAt(index);
          } else {
            currentItems[index] = currentItems[index].copyWith(
              quantity: newQty,
            );
          }
        } else {
          // If not in cart, search default mock item to add
          final template = _mockTemplates.firstWhere(
            (i) => i.sku.id == request.skuId,
            orElse: () => _defaultMockCartItems.first,
          );
          currentItems.add(
            template.copyWith(
              sku: template.sku.copyWith(id: request.skuId),
              quantity: request.deltaQuantity! > 0 ? request.deltaQuantity! : 1,
            ),
          );
        }
      }
      await cacheCart(currentItems);
      return;
    }
    try {
      await _apiService.updateCart(request);
    } catch (e) {
      rethrow;
    }
  }

  /// Xóa sạch giỏ hàng
  Future<void> clearCart() async {
    if (AppConfig.useMockData) {
      await cacheCart([]);
      return;
    }
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

  // --- Static Default Mock Cart Items ---
  static final List<CartItem> _defaultMockCartItems = [
    const CartItem(
      spuId: 'spu_1',
      sku: CartSku(
        id: 'sku_1_1',
        spuId: 'spu_1',
        name: 'Ví da bò sáp thủ công Classic - Nâu Dark Brown',
        price: 850000,
        stock: 45,
        attributes: [SkuAttribute(key: 'Màu sắc', value: 'Nâu Dark Brown')],
      ),
      quantity: 1,
      currency: 'VND',
      resource: ResourceModel(
        id: 'res_cart_1',
        url:
            'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
      ),
    ),
    const CartItem(
      spuId: 'spu_3',
      sku: CartSku(
        id: 'sku_3_1',
        spuId: 'spu_3',
        name: 'Set Tinh dầu thiên nhiên Relax Organics - Combo 3 chai 10ml',
        price: 350000,
        stock: 120,
        attributes: [SkuAttribute(key: 'Quy cách', value: 'Combo 3 chai')],
      ),
      quantity: 2,
      currency: 'VND',
      resource: ResourceModel(
        id: 'res_cart_2',
        url:
            'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
      ),
    ),
  ];

  static final List<CartItem> _mockTemplates = [
    ..._defaultMockCartItems,
    const CartItem(
      spuId: 'spu_2',
      sku: CartSku(
        id: 'sku_2_1',
        spuId: 'spu_2',
        name: 'Bình giữ nhiệt Titan 750ml Matte Black - Đen Nhám',
        price: 420000,
        stock: 30,
      ),
      quantity: 1,
      currency: 'VND',
      resource: ResourceModel(
        id: 'res_cart_3',
        url:
            'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400',
      ),
    ),
  ];
}

@riverpod
CartRepository cartRepository(Ref ref) {
  final apiService = ref.watch(cartApiServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return CartRepository(apiService, hiveService);
}
