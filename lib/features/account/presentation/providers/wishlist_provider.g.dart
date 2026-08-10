// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wishlistProductsHash() => r'2ed77c7a3d39e28708fcabe13ec8fd36d315b06a';

/// The wishlist is a catalog query, not a list of its own: `GET /listings` with
/// `favorited=true` answers cards, so the screen gets the price and the cover it
/// draws. Resolving saved ids one detail request at a time gave neither — a
/// `ListingDetail` carries no card price, which is why every row read 0 ₫.
///
/// Copied from [wishlistProducts].
@ProviderFor(wishlistProducts)
final wishlistProductsProvider =
    AutoDisposeFutureProvider<List<Listing>>.internal(
      wishlistProducts,
      name: r'wishlistProductsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$wishlistProductsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WishlistProductsRef = AutoDisposeFutureProviderRef<List<Listing>>;
String _$wishlistControllerHash() =>
    r'72106fa0429854c706ce4a706cdeeb8ba1e87182';

/// See also [WishlistController].
@ProviderFor(WishlistController)
final wishlistControllerProvider =
    AutoDisposeAsyncNotifierProvider<WishlistController, void>.internal(
      WishlistController.new,
      name: r'wishlistControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$wishlistControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WishlistController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
