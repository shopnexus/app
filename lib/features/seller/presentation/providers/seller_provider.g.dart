// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.

@ProviderFor(sellerProducts)
const sellerProductsProvider = SellerProductsFamily._();

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.

final class SellerProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Listing>>,
          List<Listing>,
          FutureOr<List<Listing>>
        >
    with $FutureModifier<List<Listing>>, $FutureProvider<List<Listing>> {
  /// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
  /// visitor sees exactly what is public — there is no shop-scoped route and no
  /// `mine=true` here, which is what would be needed to see a draft.
  const SellerProductsProvider._({
    required SellerProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sellerProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sellerProductsHash();

  @override
  String toString() {
    return r'sellerProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Listing>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Listing>> create(Ref ref) {
    final argument = this.argument as String;
    return sellerProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SellerProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sellerProductsHash() => r'b719579b13ef528724735755b8425ed3322ed441';

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.

final class SellerProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Listing>>, String> {
  const SellerProductsFamily._()
    : super(
        retry: null,
        name: r'sellerProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
  /// visitor sees exactly what is public — there is no shop-scoped route and no
  /// `mine=true` here, which is what would be needed to see a draft.

  SellerProductsProvider call(String vendorId) =>
      SellerProductsProvider._(argument: vendorId, from: this);

  @override
  String toString() => r'sellerProductsProvider';
}
