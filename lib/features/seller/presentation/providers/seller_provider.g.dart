// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellerProductsHash() => r'b719579b13ef528724735755b8425ed3322ed441';

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

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.
///
/// Copied from [sellerProducts].
@ProviderFor(sellerProducts)
const sellerProductsProvider = SellerProductsFamily();

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.
///
/// Copied from [sellerProducts].
class SellerProductsFamily extends Family<AsyncValue<List<Listing>>> {
  /// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
  /// visitor sees exactly what is public — there is no shop-scoped route and no
  /// `mine=true` here, which is what would be needed to see a draft.
  ///
  /// Copied from [sellerProducts].
  const SellerProductsFamily();

  /// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
  /// visitor sees exactly what is public — there is no shop-scoped route and no
  /// `mine=true` here, which is what would be needed to see a draft.
  ///
  /// Copied from [sellerProducts].
  SellerProductsProvider call(String vendorId) {
    return SellerProductsProvider(vendorId);
  }

  @override
  SellerProductsProvider getProviderOverride(
    covariant SellerProductsProvider provider,
  ) {
    return call(provider.vendorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sellerProductsProvider';
}

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.
///
/// Copied from [sellerProducts].
class SellerProductsProvider extends AutoDisposeFutureProvider<List<Listing>> {
  /// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
  /// visitor sees exactly what is public — there is no shop-scoped route and no
  /// `mine=true` here, which is what would be needed to see a draft.
  ///
  /// Copied from [sellerProducts].
  SellerProductsProvider(String vendorId)
    : this._internal(
        (ref) => sellerProducts(ref as SellerProductsRef, vendorId),
        from: sellerProductsProvider,
        name: r'sellerProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sellerProductsHash,
        dependencies: SellerProductsFamily._dependencies,
        allTransitiveDependencies:
            SellerProductsFamily._allTransitiveDependencies,
        vendorId: vendorId,
      );

  SellerProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vendorId,
  }) : super.internal();

  final String vendorId;

  @override
  Override overrideWith(
    FutureOr<List<Listing>> Function(SellerProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SellerProductsProvider._internal(
        (ref) => create(ref as SellerProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vendorId: vendorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Listing>> createElement() {
    return _SellerProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SellerProductsProvider && other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vendorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SellerProductsRef on AutoDisposeFutureProviderRef<List<Listing>> {
  /// The parameter `vendorId` of this provider.
  String get vendorId;
}

class _SellerProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Listing>>
    with SellerProductsRef {
  _SellerProductsProviderElement(super.provider);

  @override
  String get vendorId => (origin as SellerProductsProvider).vendorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
