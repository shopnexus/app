import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/constants/api_endpoints.dart';
import '../../core/network/dio_client.dart';
import '../models/currency_model.dart';
import '../models/data_response.dart';
import '../models/geocode_model.dart';

part 'common_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CommonApiService {
  factory CommonApiService(Dio dio, {String baseUrl}) = _CommonApiService;

  @GET(ApiEndpoints.exchangeRates)
  Future<DataResponse<ExchangeRatesResponse>> getExchangeRates();

  @POST(ApiEndpoints.reverseGeocode)
  Future<DataResponse<String>> reverseGeocode(
    @Body() ReverseGeocodeRequest request,
  );

  @POST(ApiEndpoints.forwardGeocode)
  Future<DataResponse<GeocodeLatLng>> forwardGeocode(
    @Body() ForwardGeocodeRequest request,
  );

  @GET(ApiEndpoints.searchGeocode)
  Future<DataResponse<List<GeocodeSuggestion>>> searchGeocode(
    @Query('q') String query,
    @Query('limit') int limit,
  );

  @POST(ApiEndpoints.uploadFile)
  @MultiPart()
  Future<DataResponse<FileUploadResponse>> uploadFile(
    @Part() MultipartFile file,
  );
}

@riverpod
CommonApiService commonApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CommonApiService(dioInstance);
}
