import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../../catalog/data/repositories/catalog_repository.dart';
import '../../data/repositories/account_repository.dart';

part 'wishlist_provider.g.dart';

@riverpod
Future<List<TProductCard>> wishlistProducts(Ref ref) async {
  final accountRepo = ref.watch(accountRepositoryProvider);
  final catalogRepo = ref.watch(catalogRepositoryProvider);

  final favorites = await accountRepo.getFavorites(page: 1, limit: 100);

  if (favorites.isEmpty) return [];

  // Tải thông tin chi tiết SPU Card bất đồng bộ song song
  final futures = favorites.map(
    (fav) => catalogRepo.getProductCardDetail(fav.spuId),
  );
  final products = await Future.wait(futures);
  return products;
}

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<void> build() {}

  Future<void> removeFavorite(String spuId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final accountRepo = ref.read(accountRepositoryProvider);
      await accountRepo.removeFavorite(spuId);
      ref.invalidate(wishlistProductsProvider);
    });
  }

  Future<void> addFavorite(String spuId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final accountRepo = ref.read(accountRepositoryProvider);
      await accountRepo.addFavorite(spuId);
      ref.invalidate(wishlistProductsProvider);
    });
  }
}
