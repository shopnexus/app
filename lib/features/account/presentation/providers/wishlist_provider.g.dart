// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wishlistProducts)
const wishlistProductsProvider = WishlistProductsProvider._();

final class WishlistProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TProductCard>>,
          List<TProductCard>,
          FutureOr<List<TProductCard>>
        >
    with
        $FutureModifier<List<TProductCard>>,
        $FutureProvider<List<TProductCard>> {
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
  $FutureProviderElement<List<TProductCard>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TProductCard>> create(Ref ref) {
    return wishlistProducts(ref);
  }
}

String _$wishlistProductsHash() => r'3bd6a5c984dc7ad1c7721d1f5183b57f69889bd2';

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
    r'df4a111923891b8f517cf18a1c73c47fcb88e888';

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
