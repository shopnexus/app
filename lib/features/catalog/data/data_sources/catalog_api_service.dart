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
    @Query('category_id') String? categoryId,
    @Query('price_min') int? priceMin,
    @Query('price_max') int? priceMax,
    @Query('tags') List<String>? tags,
    @Query('sort') String? sort,
    @Query('location') String? location,
    @Query('page') int? page,
    @Query('size') int? size,
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
    @Query('spu_id') String? spuId,
    @Query('page') int? page,
    @Query('size') int? size,
  });
}

@riverpod
CatalogApiService catalogApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CatalogApiService(dio);
}
