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

  @GET(ApiEndpoints.productCards)
  Future<DataResponse<List<TProductCard>>> getProductCards({
    @Query('keyword') String? keyword,
    @Query('search') String? search,
    @Query('category_id') String? categoryId,
    @Query('vendor_id') String? vendorId,
    @Query('seller_id') String? sellerId,
    @Query('price_min') int? priceMin,
    @Query('price_max') int? priceMax,
    @Query('tags') List<String>? tags,
    @Query('sort') String? sort,
    @Query('location') String? location,
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('limit') int? limit,
  });

  @GET(ApiEndpoints.productCardDetailTemplate)
  Future<DataResponse<TProductCard>> getProductCardDetail(
    @Path('id') String id,
  );

  @GET(ApiEndpoints.productDetail)
  Future<DataResponse<TProductDetail>> getProductDetail({
    @Query('id') String? id,
    @Query('slug') String? slug,
  });

  @GET(ApiEndpoints.categories)
  Future<DataResponse<List<Category>>> getCategories();

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
