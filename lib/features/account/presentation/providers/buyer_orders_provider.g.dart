// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buyerPendingItems)
const buyerPendingItemsProvider = BuyerPendingItemsFamily._();

final class BuyerPendingItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BuyerOrderItem>>,
          List<BuyerOrderItem>,
          FutureOr<List<BuyerOrderItem>>
        >
    with
        $FutureModifier<List<BuyerOrderItem>>,
        $FutureProvider<List<BuyerOrderItem>> {
  const BuyerPendingItemsProvider._({
    required BuyerPendingItemsFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'buyerPendingItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerPendingItemsHash();

  @override
  String toString() {
    return r'buyerPendingItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BuyerOrderItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BuyerOrderItem>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return buyerPendingItems(ref, page: argument.page, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerPendingItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerPendingItemsHash() => r'1f64bca822bc3d976f012fbe71ace56be43ebf95';

final class BuyerPendingItemsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BuyerOrderItem>>,
          ({int page, int limit})
        > {
  const BuyerPendingItemsFamily._()
    : super(
        retry: null,
        name: r'buyerPendingItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerPendingItemsProvider call({int page = 1, int limit = 20}) =>
      BuyerPendingItemsProvider._(
        argument: (page: page, limit: limit),
        from: this,
      );

  @override
  String toString() => r'buyerPendingItemsProvider';
}

@ProviderFor(buyerPendingOrders)
const buyerPendingOrdersProvider = BuyerPendingOrdersFamily._();

final class BuyerPendingOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BuyerOrder>>,
          List<BuyerOrder>,
          FutureOr<List<BuyerOrder>>
        >
    with $FutureModifier<List<BuyerOrder>>, $FutureProvider<List<BuyerOrder>> {
  const BuyerPendingOrdersProvider._({
    required BuyerPendingOrdersFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'buyerPendingOrdersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerPendingOrdersHash();

  @override
  String toString() {
    return r'buyerPendingOrdersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BuyerOrder>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BuyerOrder>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return buyerPendingOrders(ref, page: argument.page, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerPendingOrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerPendingOrdersHash() =>
    r'bec68a1116c920ead4e901184a318cc35ea3a3f6';

final class BuyerPendingOrdersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BuyerOrder>>,
          ({int page, int limit})
        > {
  const BuyerPendingOrdersFamily._()
    : super(
        retry: null,
        name: r'buyerPendingOrdersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerPendingOrdersProvider call({int page = 1, int limit = 20}) =>
      BuyerPendingOrdersProvider._(
        argument: (page: page, limit: limit),
        from: this,
      );

  @override
  String toString() => r'buyerPendingOrdersProvider';
}

@ProviderFor(buyerCompletedOrders)
const buyerCompletedOrdersProvider = BuyerCompletedOrdersFamily._();

final class BuyerCompletedOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BuyerOrder>>,
          List<BuyerOrder>,
          FutureOr<List<BuyerOrder>>
        >
    with $FutureModifier<List<BuyerOrder>>, $FutureProvider<List<BuyerOrder>> {
  const BuyerCompletedOrdersProvider._({
    required BuyerCompletedOrdersFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'buyerCompletedOrdersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerCompletedOrdersHash();

  @override
  String toString() {
    return r'buyerCompletedOrdersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BuyerOrder>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BuyerOrder>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return buyerCompletedOrders(
      ref,
      page: argument.page,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerCompletedOrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerCompletedOrdersHash() =>
    r'2e9c457bcf22944e21d172a65940148f944b9be9';

final class BuyerCompletedOrdersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BuyerOrder>>,
          ({int page, int limit})
        > {
  const BuyerCompletedOrdersFamily._()
    : super(
        retry: null,
        name: r'buyerCompletedOrdersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerCompletedOrdersProvider call({int page = 1, int limit = 20}) =>
      BuyerCompletedOrdersProvider._(
        argument: (page: page, limit: limit),
        from: this,
      );

  @override
  String toString() => r'buyerCompletedOrdersProvider';
}

@ProviderFor(buyerCancelledOrders)
const buyerCancelledOrdersProvider = BuyerCancelledOrdersFamily._();

final class BuyerCancelledOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BuyerOrder>>,
          List<BuyerOrder>,
          FutureOr<List<BuyerOrder>>
        >
    with $FutureModifier<List<BuyerOrder>>, $FutureProvider<List<BuyerOrder>> {
  const BuyerCancelledOrdersProvider._({
    required BuyerCancelledOrdersFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'buyerCancelledOrdersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerCancelledOrdersHash();

  @override
  String toString() {
    return r'buyerCancelledOrdersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BuyerOrder>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BuyerOrder>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return buyerCancelledOrders(
      ref,
      page: argument.page,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerCancelledOrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerCancelledOrdersHash() =>
    r'f50d138a0ad4c635e44b985cc42da931ff8492b2';

final class BuyerCancelledOrdersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BuyerOrder>>,
          ({int page, int limit})
        > {
  const BuyerCancelledOrdersFamily._()
    : super(
        retry: null,
        name: r'buyerCancelledOrdersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerCancelledOrdersProvider call({int page = 1, int limit = 20}) =>
      BuyerCancelledOrdersProvider._(
        argument: (page: page, limit: limit),
        from: this,
      );

  @override
  String toString() => r'buyerCancelledOrdersProvider';
}

@ProviderFor(buyerCancelledItems)
const buyerCancelledItemsProvider = BuyerCancelledItemsFamily._();

final class BuyerCancelledItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BuyerOrderItem>>,
          List<BuyerOrderItem>,
          FutureOr<List<BuyerOrderItem>>
        >
    with
        $FutureModifier<List<BuyerOrderItem>>,
        $FutureProvider<List<BuyerOrderItem>> {
  const BuyerCancelledItemsProvider._({
    required BuyerCancelledItemsFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'buyerCancelledItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyerCancelledItemsHash();

  @override
  String toString() {
    return r'buyerCancelledItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BuyerOrderItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BuyerOrderItem>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return buyerCancelledItems(ref, page: argument.page, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerCancelledItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyerCancelledItemsHash() =>
    r'7e8a045d56e006188a3d664129094a9eced7e7d9';

final class BuyerCancelledItemsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BuyerOrderItem>>,
          ({int page, int limit})
        > {
  const BuyerCancelledItemsFamily._()
    : super(
        retry: null,
        name: r'buyerCancelledItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyerCancelledItemsProvider call({int page = 1, int limit = 20}) =>
      BuyerCancelledItemsProvider._(
        argument: (page: page, limit: limit),
        from: this,
      );

  @override
  String toString() => r'buyerCancelledItemsProvider';
}

@ProviderFor(buyerOrderDetail)
const buyerOrderDetailProvider = BuyerOrderDetailFamily._();

final class BuyerOrderDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<BuyerOrder>,
          BuyerOrder,
          FutureOr<BuyerOrder>
        >
    with $FutureModifier<BuyerOrder>, $FutureProvider<BuyerOrder> {
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
  $FutureProviderElement<BuyerOrder> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<BuyerOrder> create(Ref ref) {
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

String _$buyerOrderDetailHash() => r'993c10f6cc4c22312df4828c7109010fa2248fac';

final class BuyerOrderDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BuyerOrder>, String> {
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
    r'4303ed963924a08ba94a00ea20079b85ea7c4d16';

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
