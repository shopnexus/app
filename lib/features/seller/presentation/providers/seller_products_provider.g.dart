// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'a2e0b9592bc572ef6a913994f47c55191ae002a7';

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
