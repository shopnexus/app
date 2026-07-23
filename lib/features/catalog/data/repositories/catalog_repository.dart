import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../data_sources/catalog_api_service.dart';
import '../models/catalog_model.dart';

part 'catalog_repository.g.dart';

class CatalogRepository {
  final CatalogApiService _apiService;
  final HiveService _hiveService;

  CatalogRepository(this._apiService, this._hiveService);

  Future<List<TProductCard>> getProductCards({
    String? keyword,
    String? categoryId,
    String? vendorId,
    int? priceMin,
    int? priceMax,
    List<String>? tags,
    String? sort,
    String? location,
    int? page,
    int? size,
  }) async {
    try {
      final response = await _apiService.getProductCards(
        keyword: keyword,
        categoryId: categoryId,
        vendorId: vendorId,
        priceMin: priceMin,
        priceMax: priceMax,
        tags: tags,
        sort: sort,
        location: location,
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

  /// Lấy chi tiết sản phẩm và tự động lưu vào danh sách sản phẩm vừa xem (recentBox)
  Future<TProductDetail> getProductDetail({String? id, String? slug}) async {
    try {
      final response = await _apiService.getProductDetail(id: id, slug: slug);
      final productDetail = response.data;

      // Chuyển đổi thông tin SPU Detail sang dạng SPU Card để lưu cache
      final productCard = TProductCard(
        id: productDetail.id,
        name: productDetail.name,
        slug: productDetail.slug,
        thumbnail: productDetail.images?.firstOrNull?.url,
        price: productDetail.price,
        originalPrice: productDetail.originalPrice,
        rating: productDetail.rating,
        soldCount: productDetail.soldCount,
        vendorId: productDetail.vendorId,
        vendorName: productDetail.vendorName,
      );

      // Lưu sản phẩm vào Hive recentBox
      await addToRecentlyViewed(productCard);

      return productDetail;
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
        refType: 'ProductSpu',
        refId: spuId ?? '',
        page: page,
        size: size,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Thêm sản phẩm vào danh sách vừa xem (tối đa 10 sản phẩm, đẩy lên đầu, xóa trùng lặp)
  Future<void> addToRecentlyViewed(TProductCard product) async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      final list = rawList != null
          ? List<Map<String, dynamic>>.from(
              rawList.map((e) => Map<String, dynamic>.from(e as Map)),
            )
          : <Map<String, dynamic>>[];

      // Xóa sản phẩm nếu đã tồn tại để tránh trùng lặp và cập nhật vị trí mới nhất
      list.removeWhere((item) => item['id'] == product.id);

      // Đưa sản phẩm mới lên đầu danh sách
      list.insert(0, product.toJson());

      // Giới hạn danh sách tối đa 10 sản phẩm
      if (list.length > 10) {
        list.removeRange(10, list.length);
      }

      await box.put('recently_viewed', list);
    } catch (e) {
      // Không ném ngoại lệ để tránh làm crash UI khi truy cập chi tiết sản phẩm nếu Hive bị lỗi
    }
  }

  /// Lấy danh sách sản phẩm xem gần đây từ Hive
  Future<List<TProductCard>> getRecentlyViewed() async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      if (rawList == null) return [];
      return rawList
          .map(
            (e) => TProductCard.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  final apiService = ref.watch(catalogApiServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return CatalogRepository(apiService, hiveService);
}
