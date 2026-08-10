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
        isAutoDispose: false,
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
    r'097aa3e83f5a3e2173060c3e4b2839c072dabeb0';

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

@ProviderFor(sellerAllOrders)
const sellerAllOrdersProvider = SellerAllOrdersProvider._();

final class SellerAllOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderView>>,
          List<OrderView>,
          FutureOr<List<OrderView>>
        >
    with $FutureModifier<List<OrderView>>, $FutureProvider<List<OrderView>> {
  const SellerAllOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerAllOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerAllOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderView>> create(Ref ref) {
    return sellerAllOrders(ref);
  }
}

String _$sellerAllOrdersHash() => r'45bb9a9154bf7c53d78fe53c19157f7a0dd6b86f';
