// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SellerOrdersNotifier)
const sellerOrdersProvider = SellerOrdersNotifierProvider._();

final class SellerOrdersNotifierProvider
    extends $NotifierProvider<SellerOrdersNotifier, SellerOrdersState> {
  const SellerOrdersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerOrdersNotifierHash();

  @$internal
  @override
  SellerOrdersNotifier create() => SellerOrdersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerOrdersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerOrdersState>(value),
    );
  }
}

String _$sellerOrdersNotifierHash() =>
    r'221572013ba385628dddd99b38ff79750efea1a4';

abstract class _$SellerOrdersNotifier extends $Notifier<SellerOrdersState> {
  SellerOrdersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SellerOrdersState, SellerOrdersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerOrdersState, SellerOrdersState>,
              SellerOrdersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
