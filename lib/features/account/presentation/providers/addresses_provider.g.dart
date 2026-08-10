// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyerContactsHash() => r'40863f4e9a54616a93002544d796a363b890efc1';

/// See also [buyerContacts].
@ProviderFor(buyerContacts)
final buyerContactsProvider = AutoDisposeFutureProvider<List<Contact>>.internal(
  buyerContacts,
  name: r'buyerContactsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$buyerContactsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BuyerContactsRef = AutoDisposeFutureProviderRef<List<Contact>>;
String _$addressesControllerHash() =>
    r'9c901d09ef1f93bb35bd0d0c499a7b0d172f2e58';

/// See also [AddressesController].
@ProviderFor(AddressesController)
final addressesControllerProvider =
    AutoDisposeAsyncNotifierProvider<AddressesController, void>.internal(
      AddressesController.new,
      name: r'addressesControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addressesControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddressesController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
