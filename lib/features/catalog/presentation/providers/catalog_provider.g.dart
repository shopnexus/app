// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'31469ca72056a492cb943427ab921b7eaf6fea87';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$productDetailHash() => r'3294526819909b4400afac89936d07159019638e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productDetail].
@ProviderFor(productDetail)
const productDetailProvider = ProductDetailFamily();

/// See also [productDetail].
class ProductDetailFamily extends Family<AsyncValue<ListingDetail>> {
  /// See also [productDetail].
  const ProductDetailFamily();

  /// See also [productDetail].
  ProductDetailProvider call({required String id}) {
    return ProductDetailProvider(id: id);
  }

  @override
  ProductDetailProvider getProviderOverride(
    covariant ProductDetailProvider provider,
  ) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailProvider';
}

/// See also [productDetail].
class ProductDetailProvider extends AutoDisposeFutureProvider<ListingDetail> {
  /// See also [productDetail].
  ProductDetailProvider({required String id})
    : this._internal(
        (ref) => productDetail(ref as ProductDetailRef, id: id),
        from: productDetailProvider,
        name: r'productDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productDetailHash,
        dependencies: ProductDetailFamily._dependencies,
        allTransitiveDependencies:
            ProductDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProductDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ListingDetail> Function(ProductDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailProvider._internal(
        (ref) => create(ref as ProductDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ListingDetail> createElement() {
    return _ProductDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductDetailRef on AutoDisposeFutureProviderRef<ListingDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductDetailProviderElement
    extends AutoDisposeFutureProviderElement<ListingDetail>
    with ProductDetailRef {
  _ProductDetailProviderElement(super.provider);

  @override
  String get id => (origin as ProductDetailProvider).id;
}

String _$recentlyViewedProductsHash() =>
    r'68c7dc7488a27863e028794280585cd3046ddbdc';

/// See also [recentlyViewedProducts].
@ProviderFor(recentlyViewedProducts)
final recentlyViewedProductsProvider =
    AutoDisposeFutureProvider<List<RecentListing>>.internal(
      recentlyViewedProducts,
      name: r'recentlyViewedProductsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentlyViewedProductsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentlyViewedProductsRef =
    AutoDisposeFutureProviderRef<List<RecentListing>>;
String _$catalogProductsHash() => r'49701f5618318de28cf53ee6d59eb7bd73752387';

abstract class _$CatalogProducts
    extends BuildlessAutoDisposeAsyncNotifier<CatalogProductsState> {
  late final CatalogSearchFilters initialFilters;

  FutureOr<CatalogProductsState> build(CatalogSearchFilters initialFilters);
}

/// See also [CatalogProducts].
@ProviderFor(CatalogProducts)
const catalogProductsProvider = CatalogProductsFamily();

/// See also [CatalogProducts].
class CatalogProductsFamily extends Family<AsyncValue<CatalogProductsState>> {
  /// See also [CatalogProducts].
  const CatalogProductsFamily();

  /// See also [CatalogProducts].
  CatalogProductsProvider call(CatalogSearchFilters initialFilters) {
    return CatalogProductsProvider(initialFilters);
  }

  @override
  CatalogProductsProvider getProviderOverride(
    covariant CatalogProductsProvider provider,
  ) {
    return call(provider.initialFilters);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'catalogProductsProvider';
}

/// See also [CatalogProducts].
class CatalogProductsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CatalogProducts,
          CatalogProductsState
        > {
  /// See also [CatalogProducts].
  CatalogProductsProvider(CatalogSearchFilters initialFilters)
    : this._internal(
        () => CatalogProducts()..initialFilters = initialFilters,
        from: catalogProductsProvider,
        name: r'catalogProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$catalogProductsHash,
        dependencies: CatalogProductsFamily._dependencies,
        allTransitiveDependencies:
            CatalogProductsFamily._allTransitiveDependencies,
        initialFilters: initialFilters,
      );

  CatalogProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialFilters,
  }) : super.internal();

  final CatalogSearchFilters initialFilters;

  @override
  FutureOr<CatalogProductsState> runNotifierBuild(
    covariant CatalogProducts notifier,
  ) {
    return notifier.build(initialFilters);
  }

  @override
  Override overrideWith(CatalogProducts Function() create) {
    return ProviderOverride(
      origin: this,
      override: CatalogProductsProvider._internal(
        () => create()..initialFilters = initialFilters,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialFilters: initialFilters,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CatalogProducts, CatalogProductsState>
  createElement() {
    return _CatalogProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatalogProductsProvider &&
        other.initialFilters == initialFilters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialFilters.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CatalogProductsRef
    on AutoDisposeAsyncNotifierProviderRef<CatalogProductsState> {
  /// The parameter `initialFilters` of this provider.
  CatalogSearchFilters get initialFilters;
}

class _CatalogProductsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CatalogProducts,
          CatalogProductsState
        >
    with CatalogProductsRef {
  _CatalogProductsProviderElement(super.provider);

  @override
  CatalogSearchFilters get initialFilters =>
      (origin as CatalogProductsProvider).initialFilters;
}

String _$activeSearchFiltersHash() =>
    r'5709d504e5839866bba7bdfa5e39b2e5487f31c8';

/// `keepAlive` vì cùng lý do với `checkoutProvider`: bộ lọc được **đặt ở một màn
/// và đọc ở màn khác**.
///
/// Trang Danh mục gọi `setCategory(id)` rồi `context.push('/search')`. Ở chế độ
/// autoDispose, không widget nào watch provider trong khoảng giữa hai câu đó, nên
/// nó bị bỏ đi và màn tìm kiếm mở ra với `categoryId` null — chạm vào một danh mục
/// cho ra *toàn bộ* sàn.
///
/// Bộ lọc còn lại giữa hai lần vào là chấp nhận được: trang Danh mục luôn gọi
/// `reset()` ngay trước khi đặt, nên đường vào đó luôn sạch, còn người vào thẳng
/// `/search` thường muốn thấy lại lần tìm trước.
///
/// Copied from [ActiveSearchFilters].
@ProviderFor(ActiveSearchFilters)
final activeSearchFiltersProvider =
    NotifierProvider<ActiveSearchFilters, CatalogSearchFilters>.internal(
      ActiveSearchFilters.new,
      name: r'activeSearchFiltersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSearchFiltersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActiveSearchFilters = Notifier<CatalogSearchFilters>;
String _$productReviewsHash() => r'1678606e6adade1ec2e4da8cbbd749035b86acfc';

abstract class _$ProductReviews
    extends BuildlessAutoDisposeAsyncNotifier<ProductReviewsState> {
  late final String listingId;

  FutureOr<ProductReviewsState> build(String listingId);
}

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.
///
/// Copied from [ProductReviews].
@ProviderFor(ProductReviews)
const productReviewsProvider = ProductReviewsFamily();

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.
///
/// Copied from [ProductReviews].
class ProductReviewsFamily extends Family<AsyncValue<ProductReviewsState>> {
  /// Reviews are cursor-paginated, so "show more" carries the cursor the last page
  /// ended on — a page number would re-read rows a new review has already shifted.
  ///
  /// Copied from [ProductReviews].
  const ProductReviewsFamily();

  /// Reviews are cursor-paginated, so "show more" carries the cursor the last page
  /// ended on — a page number would re-read rows a new review has already shifted.
  ///
  /// Copied from [ProductReviews].
  ProductReviewsProvider call(String listingId) {
    return ProductReviewsProvider(listingId);
  }

  @override
  ProductReviewsProvider getProviderOverride(
    covariant ProductReviewsProvider provider,
  ) {
    return call(provider.listingId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productReviewsProvider';
}

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.
///
/// Copied from [ProductReviews].
class ProductReviewsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProductReviews,
          ProductReviewsState
        > {
  /// Reviews are cursor-paginated, so "show more" carries the cursor the last page
  /// ended on — a page number would re-read rows a new review has already shifted.
  ///
  /// Copied from [ProductReviews].
  ProductReviewsProvider(String listingId)
    : this._internal(
        () => ProductReviews()..listingId = listingId,
        from: productReviewsProvider,
        name: r'productReviewsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productReviewsHash,
        dependencies: ProductReviewsFamily._dependencies,
        allTransitiveDependencies:
            ProductReviewsFamily._allTransitiveDependencies,
        listingId: listingId,
      );

  ProductReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listingId,
  }) : super.internal();

  final String listingId;

  @override
  FutureOr<ProductReviewsState> runNotifierBuild(
    covariant ProductReviews notifier,
  ) {
    return notifier.build(listingId);
  }

  @override
  Override overrideWith(ProductReviews Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductReviewsProvider._internal(
        () => create()..listingId = listingId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listingId: listingId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductReviews, ProductReviewsState>
  createElement() {
    return _ProductReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsProvider && other.listingId == listingId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listingId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductReviewsRef
    on AutoDisposeAsyncNotifierProviderRef<ProductReviewsState> {
  /// The parameter `listingId` of this provider.
  String get listingId;
}

class _ProductReviewsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProductReviews,
          ProductReviewsState
        >
    with ProductReviewsRef {
  _ProductReviewsProviderElement(super.provider);

  @override
  String get listingId => (origin as ProductReviewsProvider).listingId;
}

String _$recentSearchesHash() => r'9b8f4aaf5633d5c8ac0b635e6bda1f5898cf7103';

/// See also [RecentSearches].
@ProviderFor(RecentSearches)
final recentSearchesProvider =
    AutoDisposeNotifierProvider<RecentSearches, List<String>>.internal(
      RecentSearches.new,
      name: r'recentSearchesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentSearchesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RecentSearches = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
