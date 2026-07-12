// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categories)
const categoriesProvider = CategoriesProvider._();

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const CategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return categories(ref);
  }
}

String _$categoriesHash() => r'e9c5882884e3db37316a586913f11731f5a266d0';

@ProviderFor(CatalogProducts)
const catalogProductsProvider = CatalogProductsFamily._();

final class CatalogProductsProvider
    extends $AsyncNotifierProvider<CatalogProducts, CatalogProductsState> {
  const CatalogProductsProvider._({
    required CatalogProductsFamily super.from,
    required CatalogSearchFilters super.argument,
  }) : super(
         retry: null,
         name: r'catalogProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$catalogProductsHash();

  @override
  String toString() {
    return r'catalogProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CatalogProducts create() => CatalogProducts();

  @override
  bool operator ==(Object other) {
    return other is CatalogProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$catalogProductsHash() => r'c9a58b920db90c5c8d20aa8c0a563b9148c42501';

final class CatalogProductsFamily extends $Family
    with
        $ClassFamilyOverride<
          CatalogProducts,
          AsyncValue<CatalogProductsState>,
          CatalogProductsState,
          FutureOr<CatalogProductsState>,
          CatalogSearchFilters
        > {
  const CatalogProductsFamily._()
    : super(
        retry: null,
        name: r'catalogProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CatalogProductsProvider call(CatalogSearchFilters initialFilters) =>
      CatalogProductsProvider._(argument: initialFilters, from: this);

  @override
  String toString() => r'catalogProductsProvider';
}

abstract class _$CatalogProducts extends $AsyncNotifier<CatalogProductsState> {
  late final _$args = ref.$arg as CatalogSearchFilters;
  CatalogSearchFilters get initialFilters => _$args;

  FutureOr<CatalogProductsState> build(CatalogSearchFilters initialFilters);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<CatalogProductsState>, CatalogProductsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CatalogProductsState>,
                CatalogProductsState
              >,
              AsyncValue<CatalogProductsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ActiveSearchFilters)
const activeSearchFiltersProvider = ActiveSearchFiltersProvider._();

final class ActiveSearchFiltersProvider
    extends $NotifierProvider<ActiveSearchFilters, CatalogSearchFilters> {
  const ActiveSearchFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSearchFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSearchFiltersHash();

  @$internal
  @override
  ActiveSearchFilters create() => ActiveSearchFilters();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogSearchFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogSearchFilters>(value),
    );
  }
}

String _$activeSearchFiltersHash() =>
    r'eb41c8181e3b8beeefb8bbc03b1522a083c98ad0';

abstract class _$ActiveSearchFilters extends $Notifier<CatalogSearchFilters> {
  CatalogSearchFilters build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CatalogSearchFilters, CatalogSearchFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CatalogSearchFilters, CatalogSearchFilters>,
              CatalogSearchFilters,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(productDetail)
const productDetailProvider = ProductDetailFamily._();

final class ProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<TProductDetail>,
          TProductDetail,
          FutureOr<TProductDetail>
        >
    with $FutureModifier<TProductDetail>, $FutureProvider<TProductDetail> {
  const ProductDetailProvider._({
    required ProductDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TProductDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TProductDetail> create(Ref ref) {
    final argument = this.argument as String;
    return productDetail(ref, id: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailHash() => r'588a4819ae32b58b9b6f5c1a01f90d1eb9a36eb2';

final class ProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TProductDetail>, String> {
  const ProductDetailFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailProvider call({required String id}) =>
      ProductDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'productDetailProvider';
}

@ProviderFor(productComments)
const productCommentsProvider = ProductCommentsFamily._();

final class ProductCommentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductComment>>,
          List<ProductComment>,
          FutureOr<List<ProductComment>>
        >
    with
        $FutureModifier<List<ProductComment>>,
        $FutureProvider<List<ProductComment>> {
  const ProductCommentsProvider._({
    required ProductCommentsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productCommentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productCommentsHash();

  @override
  String toString() {
    return r'productCommentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductComment>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductComment>> create(Ref ref) {
    final argument = this.argument as String;
    return productComments(ref, spuId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductCommentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productCommentsHash() => r'bf883f754b2b7fb42d3b6d13744eb1e088e4bbf6';

final class ProductCommentsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProductComment>>, String> {
  const ProductCommentsFamily._()
    : super(
        retry: null,
        name: r'productCommentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductCommentsProvider call({required String spuId}) =>
      ProductCommentsProvider._(argument: spuId, from: this);

  @override
  String toString() => r'productCommentsProvider';
}

@ProviderFor(recentlyViewedProducts)
const recentlyViewedProductsProvider = RecentlyViewedProductsProvider._();

final class RecentlyViewedProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TProductCard>>,
          List<TProductCard>,
          FutureOr<List<TProductCard>>
        >
    with
        $FutureModifier<List<TProductCard>>,
        $FutureProvider<List<TProductCard>> {
  const RecentlyViewedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentlyViewedProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentlyViewedProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<TProductCard>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TProductCard>> create(Ref ref) {
    return recentlyViewedProducts(ref);
  }
}

String _$recentlyViewedProductsHash() =>
    r'86d3d90043e0314c91593e46e6d85059d2bb7710';
