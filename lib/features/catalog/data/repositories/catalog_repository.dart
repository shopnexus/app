import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../data_sources/catalog_api_service.dart';
import '../models/catalog_model.dart';

part 'catalog_repository.g.dart';

class CatalogRepository {
  final CatalogApiService _apiService;
  final HiveService _hiveService;

  CatalogRepository(this._apiService, this._hiveService);

  /// `province_code`/`district_code`/`ward_code` filter on the listing's own
  /// snapshot of the seller's pickup address; `nearContactId` (or `lat`+`lon`)
  /// is where the buyer is measuring from, which is what makes every card carry
  /// `location.distance_km`.
  Future<List<TProductCard>> getProductCards({
    String? keyword,
    String? mode,
    bool? mine,
    bool? favorited,
    String? status,
    String? categoryId,
    String? vendorId,
    String? tag,
    String? condition,
    int? priceMin,
    int? priceMax,
    String? provinceCode,
    String? districtCode,
    String? wardCode,
    double? lat,
    double? lon,
    String? nearContactId,
    double? radiusKm,
    String? sort,
    int? page,
    int? size,
  }) async {
    // Combinations the API answers 400 to. Dropping the half that cannot stand
    // beats sending a request that has no answer, and it is one place rather
    // than one per screen.
    final hasPosition = nearContactId != null || (lat != null && lon != null);
    final hasQuery = keyword != null && keyword.trim().isNotEmpty;
    final isMine = mine ?? false;
    final isFavorited = favorited ?? false;

    var effectiveSort = sort;
    if (effectiveSort == ListingSort.distance && !hasPosition) {
      effectiveSort = null;
    }
    if (effectiveSort == ListingSort.relevance && !hasQuery) {
      effectiveSort = null;
    }
    if (effectiveSort == ListingSort.recommended && (isMine || isFavorited)) {
      effectiveSort = null;
    }

    final response = await _apiService.getProductCards(
      q: hasQuery ? keyword.trim() : null,
      mode: hasQuery ? mode : null,
      mine: isMine ? true : null,
      favorited: isFavorited ? true : null,
      // Only honoured together with mine=true, and refused without it.
      status: isMine ? status : null,
      categoryId: categoryId,
      tag: tag,
      sellerId: vendorId,
      condition: condition,
      minPrice: priceMin,
      maxPrice: priceMax,
      provinceCode: provinceCode,
      districtCode: districtCode,
      wardCode: wardCode,
      lat: nearContactId == null ? lat : null,
      lon: nearContactId == null ? lon : null,
      nearContactId: nearContactId,
      radiusKm: hasPosition ? radiusKm : null,
      sort: effectiveSort,
      page: page,
      limit: size,
    );
    return response.data;
  }

  Future<TProductCard> getProductCardDetail(String id) async {
    final response = await _apiService.getProductCardDetail(id);
    return response.data;
  }

  /// Lấy chi tiết sản phẩm và tự động lưu vào danh sách sản phẩm vừa xem (recentBox)
  ///
  /// A listing has one route, `GET /listings/{id}`: the id goes in the path. It
  /// used to be sent as a query on the unsubstituted template, so every request
  /// asked for the literal `listings/{id}`.
  Future<TProductDetail> getProductDetail({String? id, String? slug}) async {
    final response = await _apiService.getListingDetail(id ?? slug ?? '');
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
      reviewCount: productDetail.reviewCount,
      sold: productDetail.sold,
      vendorId: productDetail.effectiveVendorId,
      vendorName: productDetail.effectiveVendorName,
      isNegotiable: productDetail.effectiveIsNegotiable,
    );

    // Lưu sản phẩm vào Hive recentBox
    await addToRecentlyViewed(productCard);

    return productDetail;
  }

  Future<List<Category>> getCategories() async {
    final response = await _apiService.getCategories();
    return response.data;
  }

  Future<List<ProductComment>> getComments({
    String? spuId,
    int? page,
    int? size,
  }) async {
    if (spuId != null && spuId.isNotEmpty) {
      final response = await _apiService.getListingReviews(
        spuId,
        page: page,
        size: size,
      );
      return response.data;
    }
    final response = await _apiService.getComments(
      refType: 'listing',
      refId: spuId ?? '',
      page: page,
      size: size,
    );
    return response.data;
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
