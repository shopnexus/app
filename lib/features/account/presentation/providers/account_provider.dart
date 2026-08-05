import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'account_provider.g.dart';

@riverpod
Future<Me> profile(Ref ref) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getProfile();
}

@riverpod
Future<PublicAccount> publicProfile(Ref ref, String accountId) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getAccountById(accountId);
}

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<void> build() {}

  Future<void> updateProfile(UpdateProfileRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.updateProfile(request);
      ref.invalidate(profileProvider);
    });
  }

  /// The identifiers are a second route, so a form that edits both saves twice —
  /// and the profile half must not be lost to a rejected email.
  Future<void> updateAccount(UpdateAccountRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.updateAccount(request);
      ref.invalidate(profileProvider);
    });
  }
}
