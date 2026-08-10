// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrative_areas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$provincesHash() => r'16b1ef34563787d7207fe02cb9bb2d4a97327da3';

/// The area vocabulary the address form writes an address in and the browse
/// filter narrows by. It is public, unauthenticated and changes about once a
/// decade, so each level is held for the session instead of refetched every time
/// a picker opens.
///
/// Copied from [provinces].
@ProviderFor(provinces)
final provincesProvider = FutureProvider<List<AdministrativeArea>>.internal(
  provinces,
  name: r'provincesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$provincesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProvincesRef = FutureProviderRef<List<AdministrativeArea>>;
String _$wardsHash() => r'c51d90dc5ac1fa93bef845684e53709185d254c7';

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

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.
///
/// Copied from [wards].
@ProviderFor(wards)
const wardsProvider = WardsFamily();

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.
///
/// Copied from [wards].
class WardsFamily extends Family<AsyncValue<List<AdministrativeArea>>> {
  /// A province answers every one of its wards in one response — up to 549 — which
  /// is why the picker searches the list rather than scrolling it.
  ///
  /// Copied from [wards].
  const WardsFamily();

  /// A province answers every one of its wards in one response — up to 549 — which
  /// is why the picker searches the list rather than scrolling it.
  ///
  /// Copied from [wards].
  WardsProvider call(String provinceCode) {
    return WardsProvider(provinceCode);
  }

  @override
  WardsProvider getProviderOverride(covariant WardsProvider provider) {
    return call(provider.provinceCode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wardsProvider';
}

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.
///
/// Copied from [wards].
class WardsProvider extends FutureProvider<List<AdministrativeArea>> {
  /// A province answers every one of its wards in one response — up to 549 — which
  /// is why the picker searches the list rather than scrolling it.
  ///
  /// Copied from [wards].
  WardsProvider(String provinceCode)
    : this._internal(
        (ref) => wards(ref as WardsRef, provinceCode),
        from: wardsProvider,
        name: r'wardsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$wardsHash,
        dependencies: WardsFamily._dependencies,
        allTransitiveDependencies: WardsFamily._allTransitiveDependencies,
        provinceCode: provinceCode,
      );

  WardsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.provinceCode,
  }) : super.internal();

  final String provinceCode;

  @override
  Override overrideWith(
    FutureOr<List<AdministrativeArea>> Function(WardsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WardsProvider._internal(
        (ref) => create(ref as WardsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        provinceCode: provinceCode,
      ),
    );
  }

  @override
  FutureProviderElement<List<AdministrativeArea>> createElement() {
    return _WardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WardsProvider && other.provinceCode == provinceCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provinceCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WardsRef on FutureProviderRef<List<AdministrativeArea>> {
  /// The parameter `provinceCode` of this provider.
  String get provinceCode;
}

class _WardsProviderElement
    extends FutureProviderElement<List<AdministrativeArea>>
    with WardsRef {
  _WardsProviderElement(super.provider);

  @override
  String get provinceCode => (origin as WardsProvider).provinceCode;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
