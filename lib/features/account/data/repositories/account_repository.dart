import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_sources/account_api_service.dart';
import '../models/account_model.dart';

part 'account_repository.g.dart';

class AccountRepository {
  final AccountApiService _apiService;

  AccountRepository(this._apiService);

  Future<AccountProfile> getProfile() async {
    try {
      final response = await _apiService.getProfile();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
AccountRepository accountRepository(Ref ref) {
  final apiService = ref.watch(accountApiServiceProvider);
  return AccountRepository(apiService);
}
