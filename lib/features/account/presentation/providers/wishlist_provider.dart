import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'wishlist_provider.g.dart';

/// The wishlist is a catalog query, not a list of its own: `GET /listings` with
/// `favorited=true` answers cards, so the screen gets the price and the cover it
/// draws. Resolving saved ids one detail request at a time gave neither — a
/// `ListingDetail` carries no card price, which is why every row read 0 ₫.
@riverpod
Future<List<Listing>> wishlistProducts(Ref ref) {
  return ref
      .watch(catalogRepositoryProvider)
      .listings(favorited: true, page: 1, size: 100);
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
