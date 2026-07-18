import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/constants/api_endpoints.dart';
import '../../core/network/dio_client.dart';
import '../models/currency_model.dart';
import '../models/data_response.dart';

part 'common_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CommonApiService {
  factory CommonApiService(Dio dio, {String baseUrl}) = _CommonApiService;

  @GET(ApiEndpoints.exchangeRates)
  Future<DataResponse<ExchangeRatesResponse>> getExchangeRates();
}

@riverpod
CommonApiService commonApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return CommonApiService(dioInstance);
}
