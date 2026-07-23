// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_earnings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SellerEarningsNotifier)
const sellerEarningsProvider = SellerEarningsNotifierProvider._();

final class SellerEarningsNotifierProvider
    extends $NotifierProvider<SellerEarningsNotifier, SellerEarningsState> {
  const SellerEarningsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerEarningsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerEarningsNotifierHash();

  @$internal
  @override
  SellerEarningsNotifier create() => SellerEarningsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerEarningsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerEarningsState>(value),
    );
  }
}

String _$sellerEarningsNotifierHash() =>
    r'dcb68250408e98a626f7f6ac4b1cbb0c273a8340';

abstract class _$SellerEarningsNotifier extends $Notifier<SellerEarningsState> {
  SellerEarningsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SellerEarningsState, SellerEarningsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerEarningsState, SellerEarningsState>,
              SellerEarningsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
