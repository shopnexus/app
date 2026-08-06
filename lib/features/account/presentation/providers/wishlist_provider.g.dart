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
final wishlistProductsProvider = WishlistProductsProvider._();

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
  WishlistProductsProvider._()
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

String _$wishlistProductsHash() => r'2ed77c7a3d39e28708fcabe13ec8fd36d315b06a';

@ProviderFor(WishlistController)
final wishlistControllerProvider = WishlistControllerProvider._();

final class WishlistControllerProvider
    extends $AsyncNotifierProvider<WishlistController, void> {
  WishlistControllerProvider._()
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
    r'df4a111923891b8f517cf18a1c73c47fcb88e888';

abstract class _$WishlistController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
