// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sellerProducts)
const sellerProductsProvider = SellerProductsFamily._();

final class SellerProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TProductCard>>,
          List<TProductCard>,
          FutureOr<List<TProductCard>>
        >
    with
        $FutureModifier<List<TProductCard>>,
        $FutureProvider<List<TProductCard>> {
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
  $FutureProviderElement<List<TProductCard>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TProductCard>> create(Ref ref) {
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

String _$sellerProductsHash() => r'61ee816687bdd97af25a8f478ee235e7b444a24f';

final class SellerProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TProductCard>>, String> {
  const SellerProductsFamily._()
    : super(
        retry: null,
        name: r'sellerProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SellerProductsProvider call(String vendorId) =>
      SellerProductsProvider._(argument: vendorId, from: this);

  @override
  String toString() => r'sellerProductsProvider';
}
