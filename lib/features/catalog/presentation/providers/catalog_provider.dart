import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/catalog_model.dart';
import '../../data/repositories/catalog_repository.dart';

part 'catalog_provider.freezed.dart';

part 'catalog_provider.g.dart';

@freezed
abstract class CatalogSearchFilters with _$CatalogSearchFilters {
  const CatalogSearchFilters._();

  const factory CatalogSearchFilters({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    String? tag,
    String? sort,

    // Where to look: the listing's own snapshot of the seller's pickup address.
    // Send the narrowest level meant — a ward is already inside its province.
    // There is no district: Vietnam goes province to ward, so a listing's
    // snapshot has no district code for one to be matched against.
    String? provinceCode,
    String? wardCode,
    // Codes carry no name, so the chip needs the label the user picked.
    String? areaLabel,

    // Where the buyer is. A saved contact is the usual answer; lat/lon is
    // supported all the way down to the request but no screen sets it, since
    // the app has no geolocation plugin.
    String? nearContactId,
    String? nearLabel,
    double? lat,
    double? lon,
    double? radiusKm,
    @Default(1) int page,
    @Default(20) int size,
  }) = _CatalogSearchFilters;

  bool get hasPosition => nearContactId != null || (lat != null && lon != null);

  bool get hasArea => provinceCode != null || wardCode != null;
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
  Future<List<TProductCard>> _fetch(
    CatalogRepository repo,
    CatalogSearchFilters filters,
  ) {
    return repo.getProductCards(
      keyword: filters.keyword,
      categoryId: filters.categoryId,
      priceMin: filters.priceMin,
      priceMax: filters.priceMax,
      tag: filters.tag,
      sort: filters.sort,
      provinceCode: filters.provinceCode,
      wardCode: filters.wardCode,
      nearContactId: filters.nearContactId,
      lat: filters.lat,
      lon: filters.lon,
      radiusKm: filters.radiusKm,
      page: filters.page,
      size: filters.size,
    );
  }

  @override
  FutureOr<CatalogProductsState> build(
    CatalogSearchFilters initialFilters,
  ) async {
    final repo = ref.watch(catalogRepositoryProvider);
    final products = await _fetch(repo, initialFilters);
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

    final repo = ref.read(catalogRepositoryProvider);
    final nextFilters = currentState.filters.copyWith(
      page: currentState.filters.page + 1,
    );

    try {
      final newProducts = await _fetch(repo, nextFilters);

      state = AsyncValue.data(
        currentState.copyWith(
          products: [...currentState.products, ...newProducts],
          hasMore:
              newProducts.isNotEmpty && newProducts.length >= nextFilters.size,
          isLoadingMore: false,
          filters: nextFilters,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        currentState.copyWith(isLoadingMore: false, hasMore: false),
      );
    }
  }

  /// Cập nhật bộ lọc và làm mới lại danh sách từ trang 1
  Future<void> updateFilters(CatalogSearchFilters newFilters) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(catalogRepositoryProvider);
      final products = await _fetch(repo, newFilters);
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

  /// The administrative area to look in. Pass the narrowest level meant — a ward
  /// is already inside its province — and nothing to clear both.
  void setArea({String? provinceCode, String? wardCode, String? label}) {
    state = state.copyWith(
      provinceCode: provinceCode,
      wardCode: wardCode,
      areaLabel: label,
      page: 1,
    );
  }

  /// Where to measure from. Clearing it also drops a distance sort and the
  /// radius, which the API refuses without a position.
  void setNearby({
    String? contactId,
    String? label,
    double? lat,
    double? lon,
    double? radiusKm,
  }) {
    final hasPosition = contactId != null || (lat != null && lon != null);
    state = state.copyWith(
      nearContactId: contactId,
      nearLabel: label,
      lat: lat,
      lon: lon,
      radiusKm: hasPosition ? radiusKm : null,
      sort: !hasPosition && state.sort == ListingSort.distance
          ? null
          : state.sort,
      page: 1,
    );
  }

  /// Applies a whole draft at once, which is what a filter sheet edits.
  void apply(CatalogSearchFilters filters) {
    state = filters.copyWith(page: 1);
  }

  void reset() {
    state = const CatalogSearchFilters();
  }
}

@riverpod
Future<TProductDetail> productDetail(Ref ref, {required String id}) async {
  final detail = await ref
      .watch(catalogRepositoryProvider)
      .getProductDetail(id: id);
  ref.invalidate(recentlyViewedProductsProvider);
  return detail;
}

@riverpod
Future<List<ProductComment>> productComments(Ref ref, {required String spuId}) {
  return ref
      .watch(catalogRepositoryProvider)
      .getComments(spuId: spuId, page: 1, size: 50);
}

@riverpod
Future<List<TProductCard>> recentlyViewedProducts(Ref ref) {
  return ref.watch(catalogRepositoryProvider).getRecentlyViewed();
}
