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
final sellerListingCountsProvider = SellerListingCountsProvider._();

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
  SellerListingCountsProvider._()
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

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.

@ProviderFor(listingTakedownReason)
final listingTakedownReasonProvider = ListingTakedownReasonFamily._();

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.

final class ListingTakedownReasonProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  /// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
  /// detail reads at all.
  ListingTakedownReasonProvider._({
    required ListingTakedownReasonFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'listingTakedownReasonProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listingTakedownReasonHash();

  @override
  String toString() {
    return r'listingTakedownReasonProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return listingTakedownReason(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ListingTakedownReasonProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listingTakedownReasonHash() =>
    r'2d30ef2230971dad766322d5639cfdd20ac12441';

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.

final class ListingTakedownReasonFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  ListingTakedownReasonFamily._()
    : super(
        retry: null,
        name: r'listingTakedownReasonProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
  /// detail reads at all.

  ListingTakedownReasonProvider call(String listingId) =>
      ListingTakedownReasonProvider._(argument: listingId, from: this);

  @override
  String toString() => r'listingTakedownReasonProvider';
}

@ProviderFor(SellerProductsNotifier)
final sellerProductsProvider = SellerProductsNotifierProvider._();

final class SellerProductsNotifierProvider
    extends $NotifierProvider<SellerProductsNotifier, SellerProductsState> {
  SellerProductsNotifierProvider._()
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
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SellerProductsState, SellerProductsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerProductsState, SellerProductsState>,
              SellerProductsState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
