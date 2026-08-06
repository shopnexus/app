// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categories)
final categoriesProvider = CategoriesProvider._();

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  CategoriesProvider._()
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

String _$categoriesHash() => r'31469ca72056a492cb943427ab921b7eaf6fea87';

@ProviderFor(CatalogProducts)
final catalogProductsProvider = CatalogProductsFamily._();

final class CatalogProductsProvider
    extends $AsyncNotifierProvider<CatalogProducts, CatalogProductsState> {
  CatalogProductsProvider._({
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

String _$catalogProductsHash() => r'c2fa5026c2606e7ed6630be41bd0e8060dc0e354';

final class CatalogProductsFamily extends $Family
    with
        $ClassFamilyOverride<
          CatalogProducts,
          AsyncValue<CatalogProductsState>,
          CatalogProductsState,
          FutureOr<CatalogProductsState>,
          CatalogSearchFilters
        > {
  CatalogProductsFamily._()
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
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ActiveSearchFilters)
final activeSearchFiltersProvider = ActiveSearchFiltersProvider._();

final class ActiveSearchFiltersProvider
    extends $NotifierProvider<ActiveSearchFilters, CatalogSearchFilters> {
  ActiveSearchFiltersProvider._()
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
    r'a2dbc8ef98e2adba6181174b92a30ef61a4823a9';

abstract class _$ActiveSearchFilters extends $Notifier<CatalogSearchFilters> {
  CatalogSearchFilters build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CatalogSearchFilters, CatalogSearchFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CatalogSearchFilters, CatalogSearchFilters>,
              CatalogSearchFilters,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(productDetail)
final productDetailProvider = ProductDetailFamily._();

final class ProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ListingDetail>,
          ListingDetail,
          FutureOr<ListingDetail>
        >
    with $FutureModifier<ListingDetail>, $FutureProvider<ListingDetail> {
  ProductDetailProvider._({
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
  $FutureProviderElement<ListingDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ListingDetail> create(Ref ref) {
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

String _$productDetailHash() => r'3294526819909b4400afac89936d07159019638e';

final class ProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ListingDetail>, String> {
  ProductDetailFamily._()
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

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.

@ProviderFor(ProductReviews)
final productReviewsProvider = ProductReviewsFamily._();

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.
final class ProductReviewsProvider
    extends $AsyncNotifierProvider<ProductReviews, ProductReviewsState> {
  /// Reviews are cursor-paginated, so "show more" carries the cursor the last page
  /// ended on — a page number would re-read rows a new review has already shifted.
  ProductReviewsProvider._({
    required ProductReviewsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productReviewsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productReviewsHash();

  @override
  String toString() {
    return r'productReviewsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductReviews create() => ProductReviews();

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productReviewsHash() => r'9b36bf2046c5141da5c7e7dc62d8417b8fc6a355';

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.

final class ProductReviewsFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductReviews,
          AsyncValue<ProductReviewsState>,
          ProductReviewsState,
          FutureOr<ProductReviewsState>,
          String
        > {
  ProductReviewsFamily._()
    : super(
        retry: null,
        name: r'productReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Reviews are cursor-paginated, so "show more" carries the cursor the last page
  /// ended on — a page number would re-read rows a new review has already shifted.

  ProductReviewsProvider call(String listingId) =>
      ProductReviewsProvider._(argument: listingId, from: this);

  @override
  String toString() => r'productReviewsProvider';
}

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.

abstract class _$ProductReviews extends $AsyncNotifier<ProductReviewsState> {
  late final _$args = ref.$arg as String;
  String get listingId => _$args;

  FutureOr<ProductReviewsState> build(String listingId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProductReviewsState>, ProductReviewsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProductReviewsState>, ProductReviewsState>,
              AsyncValue<ProductReviewsState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(recentlyViewedProducts)
final recentlyViewedProductsProvider = RecentlyViewedProductsProvider._();

final class RecentlyViewedProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecentListing>>,
          List<RecentListing>,
          FutureOr<List<RecentListing>>
        >
    with
        $FutureModifier<List<RecentListing>>,
        $FutureProvider<List<RecentListing>> {
  RecentlyViewedProductsProvider._()
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
  $FutureProviderElement<List<RecentListing>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecentListing>> create(Ref ref) {
    return recentlyViewedProducts(ref);
  }
}

String _$recentlyViewedProductsHash() =>
    r'68c7dc7488a27863e028794280585cd3046ddbdc';
