import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../../catalog/data/repositories/catalog_repository.dart';
import '../../data/repositories/account_repository.dart';

part 'wishlist_provider.g.dart';

@riverpod
Future<List<TProductCard>> wishlistProducts(Ref ref) async {
  if (AppConfig.useMockData) {
    return _mockWishlistProducts;
  }

  final accountRepo = ref.watch(accountRepositoryProvider);
  final catalogRepo = ref.watch(catalogRepositoryProvider);

  final favorites = await accountRepo.getFavorites(page: 1, limit: 100);
  if (favorites.isEmpty) return [];

  final futures = favorites.map(
    (fav) => catalogRepo.getProductCardDetail(fav.spuId),
  );
  return Future.wait(futures);
}

const List<TProductCard> _mockWishlistProducts = [
  TProductCard(
    id: 'spu_1',
    name: 'Ví da bò sáp thủ công Classic',
    slug: 'vi-da-bo-sap-thu-cong-classic',
    price: 850000,
    thumbnail:
        'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
    vendorName: 'ClassicLeather',
  ),
  TProductCard(
    id: 'spu_2',
    name: 'Bình giữ nhiệt Titan 750ml Matte Black',
    slug: 'binh-giu-nhiet-titan-750ml',
    price: 420000,
    thumbnail:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400',
    vendorName: 'TitanGear',
  ),
  TProductCard(
    id: 'spu_3',
    name: 'Set Tinh dầu thiên nhiên Relax Organics',
    slug: 'set-tinh-dau-thien-nhien-relax',
    price: 350000,
    thumbnail:
        'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
    vendorName: 'OrganicRelax',
  ),
  TProductCard(
    id: 'spu_4',
    name: 'Tai nghe Wireless Studio Pro Slate',
    slug: 'tai-nghe-wireless-studio-pro',
    price: 2450000,
    thumbnail:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
    vendorName: 'AudioCraft',
  ),
];

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
