import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../data/repositories/seller_repository.dart';

part 'seller_products_provider.freezed.dart';

part 'seller_products_provider.g.dart';

@freezed
abstract class SellerProductsState with _$SellerProductsState {
  const factory SellerProductsState({
    String?
    selectedStatus, // null: Tất cả, 'active': Đang bán, 'inactive': Hết hàng/Tạm ẩn, 'violated': Vi phạm/Chờ duyệt
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
    _loadProducts();
    return const SellerProductsState();
  }

  Future<void> _loadProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repository = ref.read(sellerRepositoryProvider);
      final list = await repository.getSpuList(status: state.selectedStatus);

      // Fallback demo product list matching Stitch design if API list is empty
      final finalList = list.isNotEmpty
          ? list
          : const [
              TProductDetail(
                id: 'spu_1',
                name: 'Ví da bò sáp thủ công Classic',
                slug: 'vi-da-bo-sap-thu-cong-classic',
                description:
                    'Ví da thật 100% may thủ công tinh tế, bề mặt mài xước patina thời thượng.',
                price: 850000,
                originalPrice: 1200000,
                soldCount: 120,
                skus: [
                  ProductSku(
                    id: 'sku_1_1',
                    name: 'Nâu Dark Brown',
                    price: 850000,
                    stock: 45,
                  ),
                ],
              ),
              TProductDetail(
                id: 'spu_2',
                name: 'Bình giữ nhiệt Titan 750ml Matte Black',
                slug: 'binh-giu-nhiet-titan-750ml',
                description:
                    'Lõi inox 316 giữ nhiệt 24h, lớp phủ sơn tĩnh điện nhám cao cấp.',
                price: 420000,
                originalPrice: 550000,
                soldCount: 89,
                skus: [
                  ProductSku(
                    id: 'sku_2_1',
                    name: 'Đen Nhám 750ml',
                    price: 420000,
                    stock: 0, // Hết hàng
                  ),
                ],
              ),
              TProductDetail(
                id: 'spu_3',
                name: 'Set Tinh dầu thiên nhiên Relax Organics',
                slug: 'set-tinh-dau-thien-nhien-relax',
                description:
                    'Chiết xuất 100% thảo mộc hữu cơ kèm khay gỗ sồi bài trí sang trọng.',
                price: 350000,
                originalPrice: 450000,
                soldCount: 45,
                skus: [
                  ProductSku(
                    id: 'sku_3_1',
                    name: 'Combo 3 chai 10ml',
                    price: 350000,
                    stock: 120,
                  ),
                ],
              ),
            ];

      state = state.copyWith(isLoading: false, spuList: finalList);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Không thể tải danh sách sản phẩm: $e',
      );
    }
  }

  void setStatusFilter(String? status) {
    state = state.copyWith(selectedStatus: status);
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
}
