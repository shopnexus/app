// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
///
/// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
/// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.

@ProviderFor(unsettledItems)
const unsettledItemsProvider = UnsettledItemsProvider._();

/// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
///
/// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
/// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.

final class UnsettledItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderLineView>>,
          List<OrderLineView>,
          FutureOr<List<OrderLineView>>
        >
    with
        $FutureModifier<List<OrderLineView>>,
        $FutureProvider<List<OrderLineView>> {
  /// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
  ///
  /// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
  /// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.
  const UnsettledItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unsettledItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unsettledItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderLineView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderLineView>> create(Ref ref) {
    return unsettledItems(ref);
  }
}

String _$unsettledItemsHash() => r'faca7c951210529836df9c145b32d697214904e4';

/// Một provider, không một family theo vai: `/orders` trả cả hai chiều, và hai
/// provider cho hai vai là hai lượt gọi rồi hai cursor phải trộn tay.

@ProviderFor(Orders)
const ordersProvider = OrdersProvider._();

/// Một provider, không một family theo vai: `/orders` trả cả hai chiều, và hai
/// provider cho hai vai là hai lượt gọi rồi hai cursor phải trộn tay.
final class OrdersProvider extends $AsyncNotifierProvider<Orders, OrdersFeed> {
  /// Một provider, không một family theo vai: `/orders` trả cả hai chiều, và hai
  /// provider cho hai vai là hai lượt gọi rồi hai cursor phải trộn tay.
  const OrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersHash();

  @$internal
  @override
  Orders create() => Orders();
}

String _$ordersHash() => r'51ae073ba6d24eccafb4bd331e168deac09c3e2b';

/// Một provider, không một family theo vai: `/orders` trả cả hai chiều, và hai
/// provider cho hai vai là hai lượt gọi rồi hai cursor phải trộn tay.

abstract class _$Orders extends $AsyncNotifier<OrdersFeed> {
  FutureOr<OrdersFeed> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<OrdersFeed>, OrdersFeed>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrdersFeed>, OrdersFeed>,
              AsyncValue<OrdersFeed>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
