import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/account_model.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AccountApiService {
  factory AccountApiService(Dio dio, {String baseUrl}) = _AccountApiService;

  @GET(ApiEndpoints.profile)
  Future<DataResponse<AccountProfile>> getProfile();

  @GET(ApiEndpoints.contacts)
  Future<DataResponse<List<Contact>>> getContacts();
}

@riverpod
AccountApiService accountApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return AccountApiService(dioInstance);
}
