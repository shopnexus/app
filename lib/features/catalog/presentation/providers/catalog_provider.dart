import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/catalog_model.dart';
import '../../data/repositories/catalog_repository.dart';

part 'catalog_provider.freezed.dart';

part 'catalog_provider.g.dart';

@freezed
abstract class CatalogSearchFilters with _$CatalogSearchFilters {
  const factory CatalogSearchFilters({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    List<String>? tags,
    String? sort,
    String? location,
    @Default(1) int page,
    @Default(20) int size,
  }) = _CatalogSearchFilters;
}

@freezed
abstract class CatalogProductsState with _$CatalogProductsState {
  const factory CatalogProductsState({
    required List<TProductCard> products,
    required bool hasMore,
    required bool isLoadingMore,
    required CatalogSearchFilters filters,
  }) = _CatalogProductsState;
}

@riverpod
Future<List<Category>> categories(Ref ref) {
  return ref.watch(catalogRepositoryProvider).getCategories();
}

@riverpod
class CatalogProducts extends _$CatalogProducts {
  @override
  FutureOr<CatalogProductsState> build(
    CatalogSearchFilters initialFilters,
  ) async {
    final repo = ref.watch(catalogRepositoryProvider);
    final products = await repo.getProductCards(
      keyword: initialFilters.keyword,
      categoryId: initialFilters.categoryId,
      priceMin: initialFilters.priceMin,
      priceMax: initialFilters.priceMax,
      tags: initialFilters.tags,
      sort: initialFilters.sort,
      location: initialFilters.location,
      page: initialFilters.page,
      size: initialFilters.size,
    );
    return CatalogProductsState(
      products: products,
      hasMore: products.length >= initialFilters.size,
      isLoadingMore: false,
      filters: initialFilters,
    );
  }

  /// Tải trang tiếp theo (Cuộn vô hạn)
  Future<void> loadNextPage() async {
    final currentState = state.asData?.value;
    if (currentState == null ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    final repo = ref.watch(catalogRepositoryProvider);
    final nextFilters = currentState.filters.copyWith(
      page: currentState.filters.page + 1,
    );

    try {
      final newProducts = await repo.getProductCards(
        keyword: nextFilters.keyword,
        categoryId: nextFilters.categoryId,
        priceMin: nextFilters.priceMin,
        priceMax: nextFilters.priceMax,
        tags: nextFilters.tags,
        sort: nextFilters.sort,
        page: nextFilters.page,
        size: nextFilters.size,
      );

      state = AsyncValue.data(
        currentState.copyWith(
          products: [...currentState.products, ...newProducts],
          hasMore:
              newProducts.isNotEmpty && newProducts.length >= nextFilters.size,
          isLoadingMore: false,
          filters: nextFilters,
        ),
      );
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Cập nhật bộ lọc và làm mới lại danh sách từ trang 1
  Future<void> updateFilters(CatalogSearchFilters newFilters) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.watch(catalogRepositoryProvider);
      final products = await repo.getProductCards(
        keyword: newFilters.keyword,
        categoryId: newFilters.categoryId,
        priceMin: newFilters.priceMin,
        priceMax: newFilters.priceMax,
        tags: newFilters.tags,
        sort: newFilters.sort,
        location: newFilters.location,
        page: newFilters.page,
        size: newFilters.size,
      );
      return CatalogProductsState(
        products: products,
        hasMore: products.length >= newFilters.size,
        isLoadingMore: false,
        filters: newFilters,
      );
    });
  }
}

@riverpod
class ActiveSearchFilters extends _$ActiveSearchFilters {
  @override
  CatalogSearchFilters build() {
    return const CatalogSearchFilters();
  }

  void setKeyword(String? keyword) {
    state = state.copyWith(keyword: keyword, page: 1);
  }

  void setCategory(String? categoryId) {
    state = state.copyWith(categoryId: categoryId, page: 1);
  }

  void setPriceRange(int? min, int? max) {
    state = state.copyWith(priceMin: min, priceMax: max, page: 1);
  }

  void setSort(String? sort) {
    state = state.copyWith(sort: sort, page: 1);
  }

  void setLocation(String? location) {
    state = state.copyWith(location: location, page: 1);
  }

  void reset() {
    state = const CatalogSearchFilters();
  }
}
