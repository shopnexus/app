// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buyerContacts)
final buyerContactsProvider = BuyerContactsProvider._();

final class BuyerContactsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Contact>>,
          List<Contact>,
          FutureOr<List<Contact>>
        >
    with $FutureModifier<List<Contact>>, $FutureProvider<List<Contact>> {
  BuyerContactsProvider._()
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
final addressesControllerProvider = AddressesControllerProvider._();

final class AddressesControllerProvider
    extends $AsyncNotifierProvider<AddressesController, void> {
  AddressesControllerProvider._()
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
    r'0f80c7823c9545a53f79378ace90cd53a19b3236';

abstract class _$AddressesController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
