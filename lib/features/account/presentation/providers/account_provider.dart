import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';

part 'account_provider.g.dart';

@riverpod
Future<AccountProfile> profile(Ref ref) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getProfile();
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

  Future<void> updateProfileCountry(String country) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.updateProfileCountry(country);
      ref.invalidate(profileProvider);
    });
  }
}
