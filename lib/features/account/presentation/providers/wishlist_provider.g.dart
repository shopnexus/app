// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The wishlist is a catalog query, not a list of its own: `GET /listings` with
/// `favorited=true` answers cards, so the screen gets the price and the cover it
/// draws. Resolving saved ids one detail request at a time gave neither — a
/// `ListingDetail` carries no card price, which is why every row read 0 ₫.

@ProviderFor(wishlistProducts)
const wishlistProductsProvider = WishlistProductsProvider._();

/// The wishlist is a catalog query, not a list of its own: `GET /listings` with
/// `favorited=true` answers cards, so the screen gets the price and the cover it
/// draws. Resolving saved ids one detail request at a time gave neither — a
/// `ListingDetail` carries no card price, which is why every row read 0 ₫.

final class WishlistProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Listing>>,
          List<Listing>,
          FutureOr<List<Listing>>
        >
    with $FutureModifier<List<Listing>>, $FutureProvider<List<Listing>> {
  /// The wishlist is a catalog query, not a list of its own: `GET /listings` with
  /// `favorited=true` answers cards, so the screen gets the price and the cover it
  /// draws. Resolving saved ids one detail request at a time gave neither — a
  /// `ListingDetail` carries no card price, which is why every row read 0 ₫.
  const WishlistProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Listing>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Listing>> create(Ref ref) {
    return wishlistProducts(ref);
  }
}

String _$wishlistProductsHash() => r'5c3c9722c5e80f648744aad4467d8f54f4bdcb32';

@ProviderFor(WishlistController)
const wishlistControllerProvider = WishlistControllerProvider._();

final class WishlistControllerProvider
    extends $AsyncNotifierProvider<WishlistController, void> {
  const WishlistControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistControllerHash();

  @$internal
  @override
  WishlistController create() => WishlistController();
}

String _$wishlistControllerHash() =>
    r'72106fa0429854c706ce4a706cdeeb8ba1e87182';

abstract class _$WishlistController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
