import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../data/repositories/seller_repository.dart';

part 'seller_products_provider.freezed.dart';

part 'seller_products_provider.g.dart';

@freezed
abstract class SellerProductsState with _$SellerProductsState {
  const factory SellerProductsState({
    String?
    selectedStatus, // null: Tất cả, 'active': Đang bán, 'inactive': Đã ẩn, 'violated': Vi phạm/Chờ duyệt
    @Default('') String searchQuery,
    @Default([]) List<TProductDetail> spuList,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _SellerProductsState;
}

@riverpod
class SellerProductsNotifier extends _$SellerProductsNotifier {
  @override
  SellerProductsState build() {
    if (AppConfig.useMockData) {
      final repository = ref.read(sellerRepositoryProvider);
      return SellerProductsState(
        isLoading: false,
        spuList: repository.getSpuListSync(status: null),
      );
    }
    Future.microtask(() => _loadProducts());
    return const SellerProductsState(isLoading: true);
  }

  Future<void> _loadProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      final list = await repository.getSpuList(status: state.selectedStatus);
      state = state.copyWith(isLoading: false, spuList: list);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setStatusFilter(String? status) {
    state = state.copyWith(selectedStatus: status);
    if (AppConfig.useMockData) {
      final repository = ref.read(sellerRepositoryProvider);
      state = state.copyWith(
        isLoading: false,
        spuList: repository.getSpuListSync(status: status),
      );
      return;
    }
    _loadProducts();
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> refresh() async {
    await _loadProducts();
  }

  Future<void> deleteSkuVariant(String skuId) async {
    try {
      final repository = ref.read(sellerRepositoryProvider);
      await repository.deleteSku(skuId);
      await _loadProducts();
    } catch (_) {}
  }

  void toggleProductVisibility(String productId) {
    final updatedList = state.spuList.map((product) {
      if (product.id == productId) {
        final isCurrentlyHidden =
            product.skus != null && product.skus!.every((s) => s.stock == 0);
        final newStock = isCurrentlyHidden ? 45 : 0;
        final updatedSkus =
            product.skus?.map((s) => s.copyWith(stock: newStock)).toList() ??
            [
              ProductSku(
                id: 'sku_${product.id}',
                price: product.price,
                stock: newStock,
              ),
            ];
        return product.copyWith(skus: updatedSkus);
      }
      return product;
    }).toList();

    state = state.copyWith(spuList: updatedList);
  }
}
