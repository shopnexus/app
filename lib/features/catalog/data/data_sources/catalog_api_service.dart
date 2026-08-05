import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/catalog_model.dart';

part 'catalog_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CatalogApiService {
  factory CatalogApiService(Dio dio, {String baseUrl}) = _CatalogApiService;

  /// Parameter names are the contract's own (`GET /listings`); the query is
  /// narrowed by whatever is non-null.
  @GET(ApiEndpoints.listings)
  Future<DataResponse<List<TProductCard>>> getProductCards({
    @Query('q') String? q,
    @Query('mode') String? mode,
    @Query('mine') bool? mine,
    @Query('favorited') bool? favorited,
    @Query('status') String? status,
    @Query('category_id') String? categoryId,
    @Query('tag') String? tag,
    @Query('seller_id') String? sellerId,
    @Query('condition') String? condition,
    @Query('min_price') int? minPrice,
    @Query('max_price') int? maxPrice,
    @Query('province_code') String? provinceCode,
    @Query('district_code') String? districtCode,
    @Query('ward_code') String? wardCode,
    @Query('lat') double? lat,
    @Query('lon') double? lon,
    @Query('near_contact_id') String? nearContactId,
    @Query('radius_km') double? radiusKm,
    @Query('sort') String? sort,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiEndpoints.listingDetailTemplate)
  Future<DataResponse<TProductDetail>> getListingDetail(@Path('id') String id);

  @GET(ApiEndpoints.listingDetailTemplate)
  Future<DataResponse<TProductCard>> getProductCardDetail(
    @Path('id') String id,
  );

  @GET(ApiEndpoints.categories)
  Future<DataResponse<List<Category>>> getCategories();

  @GET(ApiEndpoints.listingReviewsTemplate)
  Future<DataResponse<List<ProductComment>>> getListingReviews(
    @Path('listingID') String listingId, {
    @Query('page') int? page,
    @Query('size') int? size,
  });

  @GET(ApiEndpoints.comments)
  Future<DataResponse<List<ProductComment>>> getComments({
    @Query('ref_type') required String refType,
    @Query('ref_id') required String refId,
    @Query('page') int? page,
    @Query('size') int? size,
  });
}

@riverpod
CatalogApiService catalogApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CatalogApiService(dio);
}
