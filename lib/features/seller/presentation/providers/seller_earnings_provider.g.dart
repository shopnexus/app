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
    extends
        $AsyncNotifierProvider<SellerEarningsNotifier, SellerEarningsState> {
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
}

String _$sellerEarningsNotifierHash() =>
    r'bf0d2b58f42f3cc3ad4cc21e2e25dd2f83d21d32';

abstract class _$SellerEarningsNotifier
    extends $AsyncNotifier<SellerEarningsState> {
  FutureOr<SellerEarningsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SellerEarningsState>, SellerEarningsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SellerEarningsState>, SellerEarningsState>,
              AsyncValue<SellerEarningsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
