// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One total per status, off each page's `meta.total_count`. The filter chips and
/// the dashboard tiles are the same four numbers, so they are read once.

@ProviderFor(sellerListingCounts)
const sellerListingCountsProvider = SellerListingCountsProvider._();

/// One total per status, off each page's `meta.total_count`. The filter chips and
/// the dashboard tiles are the same four numbers, so they are read once.

final class SellerListingCountsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<ListingStatus, int>>,
          Map<ListingStatus, int>,
          FutureOr<Map<ListingStatus, int>>
        >
    with
        $FutureModifier<Map<ListingStatus, int>>,
        $FutureProvider<Map<ListingStatus, int>> {
  /// One total per status, off each page's `meta.total_count`. The filter chips and
  /// the dashboard tiles are the same four numbers, so they are read once.
  const SellerListingCountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerListingCountsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerListingCountsHash();

  @$internal
  @override
  $FutureProviderElement<Map<ListingStatus, int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<ListingStatus, int>> create(Ref ref) {
    return sellerListingCounts(ref);
  }
}

String _$sellerListingCountsHash() =>
    r'025870ceac45254a9437b9d46d745aff8ca3308b';

@ProviderFor(SellerProductsNotifier)
const sellerProductsProvider = SellerProductsNotifierProvider._();

final class SellerProductsNotifierProvider
    extends $NotifierProvider<SellerProductsNotifier, SellerProductsState> {
  const SellerProductsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerProductsNotifierHash();

  @$internal
  @override
  SellerProductsNotifier create() => SellerProductsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerProductsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerProductsState>(value),
    );
  }
}

String _$sellerProductsNotifierHash() =>
    r'd2f7780c2e08be98b38bfa2ea8c873c4b0524cae';

abstract class _$SellerProductsNotifier extends $Notifier<SellerProductsState> {
  SellerProductsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SellerProductsState, SellerProductsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerProductsState, SellerProductsState>,
              SellerProductsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
