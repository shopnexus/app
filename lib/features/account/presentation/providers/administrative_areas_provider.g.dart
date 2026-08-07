// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrative_areas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The area vocabulary the address form writes an address in and the browse
/// filter narrows by. It is public, unauthenticated and changes about once a
/// decade, so each level is held for the session instead of refetched every time
/// a picker opens.

@ProviderFor(provinces)
const provincesProvider = ProvincesProvider._();

/// The area vocabulary the address form writes an address in and the browse
/// filter narrows by. It is public, unauthenticated and changes about once a
/// decade, so each level is held for the session instead of refetched every time
/// a picker opens.

final class ProvincesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AdministrativeArea>>,
          List<AdministrativeArea>,
          FutureOr<List<AdministrativeArea>>
        >
    with
        $FutureModifier<List<AdministrativeArea>>,
        $FutureProvider<List<AdministrativeArea>> {
  /// The area vocabulary the address form writes an address in and the browse
  /// filter narrows by. It is public, unauthenticated and changes about once a
  /// decade, so each level is held for the session instead of refetched every time
  /// a picker opens.
  const ProvincesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'provincesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$provincesHash();

  @$internal
  @override
  $FutureProviderElement<List<AdministrativeArea>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AdministrativeArea>> create(Ref ref) {
    return provinces(ref);
  }
}

String _$provincesHash() => r'16b1ef34563787d7207fe02cb9bb2d4a97327da3';

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.

@ProviderFor(wards)
const wardsProvider = WardsFamily._();

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.

final class WardsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AdministrativeArea>>,
          List<AdministrativeArea>,
          FutureOr<List<AdministrativeArea>>
        >
    with
        $FutureModifier<List<AdministrativeArea>>,
        $FutureProvider<List<AdministrativeArea>> {
  /// A province answers every one of its wards in one response — up to 549 — which
  /// is why the picker searches the list rather than scrolling it.
  const WardsProvider._({
    required WardsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'wardsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wardsHash();

  @override
  String toString() {
    return r'wardsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<AdministrativeArea>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AdministrativeArea>> create(Ref ref) {
    final argument = this.argument as String;
    return wards(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WardsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wardsHash() => r'c51d90dc5ac1fa93bef845684e53709185d254c7';

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.

final class WardsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<AdministrativeArea>>, String> {
  const WardsFamily._()
    : super(
        retry: null,
        name: r'wardsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A province answers every one of its wards in one response — up to 549 — which
  /// is why the picker searches the list rather than scrolling it.

  WardsProvider call(String provinceCode) =>
      WardsProvider._(argument: provinceCode, from: this);

  @override
  String toString() => r'wardsProvider';
}
