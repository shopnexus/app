import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/catalog_api_service.dart';
import '../models/catalog_model.dart';

part 'catalog_repository.g.dart';

class CatalogRepository {
  final CatalogApiService _apiService;

  CatalogRepository(this._apiService);

  Future<List<TProductCard>> getProductCards({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    List<String>? tags,
    String? sort,
    int? page,
    int? size,
  }) async {
    try {
      final response = await _apiService.getProductCards(
        keyword: keyword,
        categoryId: categoryId,
        priceMin: priceMin,
        priceMax: priceMax,
        tags: tags,
        sort: sort,
        page: page,
        size: size,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<TProductCard> getProductCardDetail(String id) async {
    try {
      final response = await _apiService.getProductCardDetail(id);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<TProductDetail> getProductDetail({String? id, String? slug}) async {
    try {
      final response = await _apiService.getProductDetail(id: id, slug: slug);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductComment>> getComments({
    String? spuId,
    int? page,
    int? size,
  }) async {
    try {
      final response = await _apiService.getComments(
        spuId: spuId,
        page: page,
        size: size,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  final apiService = ref.watch(catalogApiServiceProvider);
  return CatalogRepository(apiService);
}
