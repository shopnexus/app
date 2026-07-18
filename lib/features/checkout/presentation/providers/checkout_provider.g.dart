// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckoutNotifier)
const checkoutProvider = CheckoutNotifierProvider._();

final class CheckoutNotifierProvider
    extends $NotifierProvider<CheckoutNotifier, CheckoutState> {
  const CheckoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutNotifierHash();

  @$internal
  @override
  CheckoutNotifier create() => CheckoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutState>(value),
    );
  }
}

String _$checkoutNotifierHash() => r'01d8dc313dd420f70832365f66bf014f32df3d65';

abstract class _$CheckoutNotifier extends $Notifier<CheckoutState> {
  CheckoutState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CheckoutState, CheckoutState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CheckoutState, CheckoutState>,
              CheckoutState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
