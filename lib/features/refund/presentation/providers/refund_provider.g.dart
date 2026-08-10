// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refundListHash() => r'31f634536a5f103d39a28dadb9af30f49b399ecd';

/// Cả hai chiều trong một danh sách — không tham số vai. Xem [RefundListScreen].
///
/// Copied from [refundList].
@ProviderFor(refundList)
final refundListProvider = AutoDisposeFutureProvider<List<Refund>>.internal(
  refundList,
  name: r'refundListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$refundListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RefundListRef = AutoDisposeFutureProviderRef<List<Refund>>;
String _$refundDetailHash() => r'd9dcb750000a2fadecf349d53b556c09891d6d3a';

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

/// See also [refundDetail].
@ProviderFor(refundDetail)
const refundDetailProvider = RefundDetailFamily();

/// See also [refundDetail].
class RefundDetailFamily extends Family<AsyncValue<Refund>> {
  /// See also [refundDetail].
  const RefundDetailFamily();

  /// See also [refundDetail].
  RefundDetailProvider call(String id) {
    return RefundDetailProvider(id);
  }

  @override
  RefundDetailProvider getProviderOverride(
    covariant RefundDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'refundDetailProvider';
}

/// See also [refundDetail].
class RefundDetailProvider extends AutoDisposeFutureProvider<Refund> {
  /// See also [refundDetail].
  RefundDetailProvider(String id)
    : this._internal(
        (ref) => refundDetail(ref as RefundDetailRef, id),
        from: refundDetailProvider,
        name: r'refundDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$refundDetailHash,
        dependencies: RefundDetailFamily._dependencies,
        allTransitiveDependencies:
            RefundDetailFamily._allTransitiveDependencies,
        id: id,
      );

  RefundDetailProvider._internal(
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
    FutureOr<Refund> Function(RefundDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RefundDetailProvider._internal(
        (ref) => create(ref as RefundDetailRef),
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
  AutoDisposeFutureProviderElement<Refund> createElement() {
    return _RefundDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefundDetailProvider && other.id == id;
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
mixin RefundDetailRef on AutoDisposeFutureProviderRef<Refund> {
  /// The parameter `id` of this provider.
  String get id;
}

class _RefundDetailProviderElement
    extends AutoDisposeFutureProviderElement<Refund>
    with RefundDetailRef {
  _RefundDetailProviderElement(super.provider);

  @override
  String get id => (origin as RefundDetailProvider).id;
}

String _$refundActionsHash() => r'e52e69604ed2898b183baca58dfcaa524e38c509';

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.
///
/// Copied from [RefundActions].
@ProviderFor(RefundActions)
final refundActionsProvider =
    AutoDisposeNotifierProvider<RefundActions, void>.internal(
      RefundActions.new,
      name: r'refundActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$refundActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RefundActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
