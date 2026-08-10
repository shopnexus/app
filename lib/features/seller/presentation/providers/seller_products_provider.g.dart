// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellerListingCountsHash() =>
    r'025870ceac45254a9437b9d46d745aff8ca3308b';

/// One total per status, off each page's `meta.total_count`. The filter chips and
/// the dashboard tiles are the same four numbers, so they are read once.
///
/// Copied from [sellerListingCounts].
@ProviderFor(sellerListingCounts)
final sellerListingCountsProvider =
    AutoDisposeFutureProvider<Map<ListingStatus, int>>.internal(
      sellerListingCounts,
      name: r'sellerListingCountsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellerListingCountsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SellerListingCountsRef =
    AutoDisposeFutureProviderRef<Map<ListingStatus, int>>;
String _$listingTakedownReasonHash() =>
    r'2d30ef2230971dad766322d5639cfdd20ac12441';

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

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.
///
/// Copied from [listingTakedownReason].
@ProviderFor(listingTakedownReason)
const listingTakedownReasonProvider = ListingTakedownReasonFamily();

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.
///
/// Copied from [listingTakedownReason].
class ListingTakedownReasonFamily extends Family<AsyncValue<String?>> {
  /// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
  /// detail reads at all.
  ///
  /// Copied from [listingTakedownReason].
  const ListingTakedownReasonFamily();

  /// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
  /// detail reads at all.
  ///
  /// Copied from [listingTakedownReason].
  ListingTakedownReasonProvider call(String listingId) {
    return ListingTakedownReasonProvider(listingId);
  }

  @override
  ListingTakedownReasonProvider getProviderOverride(
    covariant ListingTakedownReasonProvider provider,
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
  String? get name => r'listingTakedownReasonProvider';
}

/// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
/// detail reads at all.
///
/// Copied from [listingTakedownReason].
class ListingTakedownReasonProvider extends AutoDisposeFutureProvider<String?> {
  /// Watched only by a card whose `taken_down_at` is set, so a healthy shop makes no
  /// detail reads at all.
  ///
  /// Copied from [listingTakedownReason].
  ListingTakedownReasonProvider(String listingId)
    : this._internal(
        (ref) =>
            listingTakedownReason(ref as ListingTakedownReasonRef, listingId),
        from: listingTakedownReasonProvider,
        name: r'listingTakedownReasonProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$listingTakedownReasonHash,
        dependencies: ListingTakedownReasonFamily._dependencies,
        allTransitiveDependencies:
            ListingTakedownReasonFamily._allTransitiveDependencies,
        listingId: listingId,
      );

  ListingTakedownReasonProvider._internal(
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
  Override overrideWith(
    FutureOr<String?> Function(ListingTakedownReasonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListingTakedownReasonProvider._internal(
        (ref) => create(ref as ListingTakedownReasonRef),
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
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _ListingTakedownReasonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListingTakedownReasonProvider &&
        other.listingId == listingId;
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
mixin ListingTakedownReasonRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `listingId` of this provider.
  String get listingId;
}

class _ListingTakedownReasonProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with ListingTakedownReasonRef {
  _ListingTakedownReasonProviderElement(super.provider);

  @override
  String get listingId => (origin as ListingTakedownReasonProvider).listingId;
}

String _$sellerProductsNotifierHash() =>
    r'd2f7780c2e08be98b38bfa2ea8c873c4b0524cae';

/// See also [SellerProductsNotifier].
@ProviderFor(SellerProductsNotifier)
final sellerProductsNotifierProvider =
    AutoDisposeNotifierProvider<
      SellerProductsNotifier,
      SellerProductsState
    >.internal(
      SellerProductsNotifier.new,
      name: r'sellerProductsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellerProductsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SellerProductsNotifier = AutoDisposeNotifier<SellerProductsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
