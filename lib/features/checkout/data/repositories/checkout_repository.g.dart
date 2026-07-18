// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkoutRepository)
const checkoutRepositoryProvider = CheckoutRepositoryProvider._();

final class CheckoutRepositoryProvider
    extends
        $FunctionalProvider<
          CheckoutRepository,
          CheckoutRepository,
          CheckoutRepository
        >
    with $Provider<CheckoutRepository> {
  const CheckoutRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutRepositoryHash();

  @$internal
  @override
  $ProviderElement<CheckoutRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckoutRepository create(Ref ref) {
    return checkoutRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutRepository>(value),
    );
  }
}

String _$checkoutRepositoryHash() =>
    r'a0ff599ffbcae4ba6034bd80262719d238c5a5fa';
