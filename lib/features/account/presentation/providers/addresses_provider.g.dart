// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buyerContacts)
const buyerContactsProvider = BuyerContactsProvider._();

final class BuyerContactsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Contact>>,
          List<Contact>,
          FutureOr<List<Contact>>
        >
    with $FutureModifier<List<Contact>>, $FutureProvider<List<Contact>> {
  const BuyerContactsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerContactsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerContactsHash();

  @$internal
  @override
  $FutureProviderElement<List<Contact>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Contact>> create(Ref ref) {
    return buyerContacts(ref);
  }
}

String _$buyerContactsHash() => r'40863f4e9a54616a93002544d796a363b890efc1';

@ProviderFor(AddressesController)
const addressesControllerProvider = AddressesControllerProvider._();

final class AddressesControllerProvider
    extends $AsyncNotifierProvider<AddressesController, void> {
  const AddressesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressesControllerHash();

  @$internal
  @override
  AddressesController create() => AddressesController();
}

String _$addressesControllerHash() =>
    r'840d3ab17013f6a0a0c4ff4a9e25fb09084ad6c2';

abstract class _$AddressesController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(searchGeocode)
const searchGeocodeProvider = SearchGeocodeFamily._();

final class SearchGeocodeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GeocodeSuggestion>>,
          List<GeocodeSuggestion>,
          FutureOr<List<GeocodeSuggestion>>
        >
    with
        $FutureModifier<List<GeocodeSuggestion>>,
        $FutureProvider<List<GeocodeSuggestion>> {
  const SearchGeocodeProvider._({
    required SearchGeocodeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchGeocodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchGeocodeHash();

  @override
  String toString() {
    return r'searchGeocodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<GeocodeSuggestion>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GeocodeSuggestion>> create(Ref ref) {
    final argument = this.argument as String;
    return searchGeocode(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchGeocodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchGeocodeHash() => r'3dde836d92b062c3a22d115530626f00da18c45b';

final class SearchGeocodeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<GeocodeSuggestion>>, String> {
  const SearchGeocodeFamily._()
    : super(
        retry: null,
        name: r'searchGeocodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchGeocodeProvider call(String query) =>
      SearchGeocodeProvider._(argument: query, from: this);

  @override
  String toString() => r'searchGeocodeProvider';
}

@ProviderFor(reverseGeocode)
const reverseGeocodeProvider = ReverseGeocodeFamily._();

final class ReverseGeocodeProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const ReverseGeocodeProvider._({
    required ReverseGeocodeFamily super.from,
    required (double, double) super.argument,
  }) : super(
         retry: null,
         name: r'reverseGeocodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reverseGeocodeHash();

  @override
  String toString() {
    return r'reverseGeocodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as (double, double);
    return reverseGeocode(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ReverseGeocodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reverseGeocodeHash() => r'94001fb503972177f35465feeec5aa8faf049f15';

final class ReverseGeocodeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, (double, double)> {
  const ReverseGeocodeFamily._()
    : super(
        retry: null,
        name: r'reverseGeocodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReverseGeocodeProvider call(double latitude, double longitude) =>
      ReverseGeocodeProvider._(argument: (latitude, longitude), from: this);

  @override
  String toString() => r'reverseGeocodeProvider';
}
