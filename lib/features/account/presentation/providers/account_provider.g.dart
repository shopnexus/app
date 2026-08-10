// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileHash() => r'5f4ca96096caad1c75abb32ca4013f387cb76fbb';

/// See also [profile].
@ProviderFor(profile)
final profileProvider = AutoDisposeFutureProvider<Me>.internal(
  profile,
  name: r'profileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRef = AutoDisposeFutureProviderRef<Me>;
String _$publicProfileHash() => r'34d64cd73a71c9663e0919fc480853985677a1c2';

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

/// See also [publicProfile].
@ProviderFor(publicProfile)
const publicProfileProvider = PublicProfileFamily();

/// See also [publicProfile].
class PublicProfileFamily extends Family<AsyncValue<PublicAccount>> {
  /// See also [publicProfile].
  const PublicProfileFamily();

  /// See also [publicProfile].
  PublicProfileProvider call(String accountId) {
    return PublicProfileProvider(accountId);
  }

  @override
  PublicProfileProvider getProviderOverride(
    covariant PublicProfileProvider provider,
  ) {
    return call(provider.accountId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'publicProfileProvider';
}

/// See also [publicProfile].
class PublicProfileProvider extends AutoDisposeFutureProvider<PublicAccount> {
  /// See also [publicProfile].
  PublicProfileProvider(String accountId)
    : this._internal(
        (ref) => publicProfile(ref as PublicProfileRef, accountId),
        from: publicProfileProvider,
        name: r'publicProfileProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$publicProfileHash,
        dependencies: PublicProfileFamily._dependencies,
        allTransitiveDependencies:
            PublicProfileFamily._allTransitiveDependencies,
        accountId: accountId,
      );

  PublicProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String accountId;

  @override
  Override overrideWith(
    FutureOr<PublicAccount> Function(PublicProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PublicProfileProvider._internal(
        (ref) => create(ref as PublicProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PublicAccount> createElement() {
    return _PublicProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PublicProfileProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PublicProfileRef on AutoDisposeFutureProviderRef<PublicAccount> {
  /// The parameter `accountId` of this provider.
  String get accountId;
}

class _PublicProfileProviderElement
    extends AutoDisposeFutureProviderElement<PublicAccount>
    with PublicProfileRef {
  _PublicProfileProviderElement(super.provider);

  @override
  String get accountId => (origin as PublicProfileProvider).accountId;
}

String _$accountControllerHash() => r'd2699ef1d93203ac21fa2946d816ea5b9460cf17';

/// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua các
/// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
/// been disposed" trong khi thay đổi *đã* được lưu trên server.
///
/// Copied from [AccountController].
@ProviderFor(AccountController)
final accountControllerProvider =
    AutoDisposeAsyncNotifierProvider<AccountController, void>.internal(
      AccountController.new,
      name: r'accountControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$accountControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AccountController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
