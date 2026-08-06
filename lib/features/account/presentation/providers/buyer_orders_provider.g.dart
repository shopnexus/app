// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One provider per tab, told apart by `state` — the three order tabs used to
/// call the same path with no filter and render the same list three times.
///
/// "Đang xử lý" is both in-flight states, because `open` alone means *confirmed*
/// by the seller: a buyer who had just paid found this tab empty, "Chờ thanh
/// toán" empty too (that tab is lines the money has not settled), and their
/// order only under "Tất cả". Two calls rather than one — `state` takes a value,
/// not a list — and the whole tab fails if either does, since a list quietly
/// missing the newest order is the bug being fixed here.

@ProviderFor(buyerOpenOrders)
const buyerOpenOrdersProvider = BuyerOpenOrdersProvider._();

/// One provider per tab, told apart by `state` — the three order tabs used to
/// call the same path with no filter and render the same list three times.
///
/// "Đang xử lý" is both in-flight states, because `open` alone means *confirmed*
/// by the seller: a buyer who had just paid found this tab empty, "Chờ thanh
/// toán" empty too (that tab is lines the money has not settled), and their
/// order only under "Tất cả". Two calls rather than one — `state` takes a value,
/// not a list — and the whole tab fails if either does, since a list quietly
/// missing the newest order is the bug being fixed here.

final class BuyerOpenOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderView>>,
          List<OrderView>,
          FutureOr<List<OrderView>>
        >
    with $FutureModifier<List<OrderView>>, $FutureProvider<List<OrderView>> {
  /// One provider per tab, told apart by `state` — the three order tabs used to
  /// call the same path with no filter and render the same list three times.
  ///
  /// "Đang xử lý" is both in-flight states, because `open` alone means *confirmed*
  /// by the seller: a buyer who had just paid found this tab empty, "Chờ thanh
  /// toán" empty too (that tab is lines the money has not settled), and their
  /// order only under "Tất cả". Two calls rather than one — `state` takes a value,
  /// not a list — and the whole tab fails if either does, since a list quietly
  /// missing the newest order is the bug being fixed here.
  const BuyerOpenOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerOpenOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerOpenOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderView>> create(Ref ref) {
    return buyerOpenOrders(ref);
  }
}

String _$buyerOpenOrdersHash() => r'd8e3b410ae2ffb9d90c5838114755f36e186fc27';

@ProviderFor(buyerCompletedOrders)
const buyerCompletedOrdersProvider = BuyerCompletedOrdersProvider._();

final class BuyerCompletedOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderView>>,
          List<OrderView>,
          FutureOr<List<OrderView>>
        >
    with $FutureModifier<List<OrderView>>, $FutureProvider<List<OrderView>> {
  const BuyerCompletedOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerCompletedOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerCompletedOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderView>> create(Ref ref) {
    return buyerCompletedOrders(ref);
  }
}

String _$buyerCompletedOrdersHash() =>
    r'df3b66f793964ee84bfdf54745a70344708359d3';

@ProviderFor(buyerCancelledOrders)
const buyerCancelledOrdersProvider = BuyerCancelledOrdersProvider._();

final class BuyerCancelledOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderView>>,
          List<OrderView>,
          FutureOr<List<OrderView>>
        >
    with $FutureModifier<List<OrderView>>, $FutureProvider<List<OrderView>> {
  const BuyerCancelledOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerCancelledOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerCancelledOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderView>> create(Ref ref) {
    return buyerCancelledOrders(ref);
  }
}

String _$buyerCancelledOrdersHash() =>
    r'c702014a87d857d04fb7505e8234b034cada0748';

@ProviderFor(buyerOrderDetail)
const buyerOrderDetailProvider = BuyerOrderDetailFamily._();

final class BuyerOrderDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderView>,
          OrderView,
          FutureOr<OrderView>
        >
    with $FutureModifier<OrderView>, $FutureProvider<OrderView> {
  const BuyerOrderDetailProvider._({
    required BuyerOrderDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'buyerOrderDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerOrderDetailHash();

  @override
  String toString() {
    return r'buyerOrderDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<OrderView> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<OrderView> create(Ref ref) {
    final argument = this.argument as String;
    return buyerOrderDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerOrderDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerOrderDetailHash() => r'dfee0a4d5e60d9ddec915e03be7aa2f83f52eb02';

final class BuyerOrderDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<OrderView>, String> {
  const BuyerOrderDetailFamily._()
    : super(
        retry: null,
        name: r'buyerOrderDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerOrderDetailProvider call(String orderId) =>
      BuyerOrderDetailProvider._(argument: orderId, from: this);

  @override
  String toString() => r'buyerOrderDetailProvider';
}

/// Lines the money has not produced an order for: the only ones either side can
/// still drop.

@ProviderFor(buyerUnsettledItems)
const buyerUnsettledItemsProvider = BuyerUnsettledItemsProvider._();

/// Lines the money has not produced an order for: the only ones either side can
/// still drop.

final class BuyerUnsettledItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderLineView>>,
          List<OrderLineView>,
          FutureOr<List<OrderLineView>>
        >
    with
        $FutureModifier<List<OrderLineView>>,
        $FutureProvider<List<OrderLineView>> {
  /// Lines the money has not produced an order for: the only ones either side can
  /// still drop.
  const BuyerUnsettledItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerUnsettledItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerUnsettledItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderLineView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderLineView>> create(Ref ref) {
    return buyerUnsettledItems(ref);
  }
}

String _$buyerUnsettledItemsHash() =>
    r'8c10b6aa7bcf21a8c130c37bc3b33fb581db053f';

/// `/items` has no cancelled filter, so this reads `cancelled_at` off the one
/// list the route serves.

@ProviderFor(buyerCancelledItems)
const buyerCancelledItemsProvider = BuyerCancelledItemsProvider._();

/// `/items` has no cancelled filter, so this reads `cancelled_at` off the one
/// list the route serves.

final class BuyerCancelledItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderLineView>>,
          List<OrderLineView>,
          FutureOr<List<OrderLineView>>
        >
    with
        $FutureModifier<List<OrderLineView>>,
        $FutureProvider<List<OrderLineView>> {
  /// `/items` has no cancelled filter, so this reads `cancelled_at` off the one
  /// list the route serves.
  const BuyerCancelledItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerCancelledItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerCancelledItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderLineView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderLineView>> create(Ref ref) {
    return buyerCancelledItems(ref);
  }
}

String _$buyerCancelledItemsHash() =>
    r'4c600894b10e5040cd7a39bc2c0b484fdb2629a4';

@ProviderFor(BuyerOrderController)
const buyerOrderControllerProvider = BuyerOrderControllerProvider._();

final class BuyerOrderControllerProvider
    extends $AsyncNotifierProvider<BuyerOrderController, void> {
  const BuyerOrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerOrderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerOrderControllerHash();

  @$internal
  @override
  BuyerOrderController create() => BuyerOrderController();
}

String _$buyerOrderControllerHash() =>
    r'a32dacae216cf5f30cb45a7e9a5489ed2662bd1a';

abstract class _$BuyerOrderController extends $AsyncNotifier<void> {
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
