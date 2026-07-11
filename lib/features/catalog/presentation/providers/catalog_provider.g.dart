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
