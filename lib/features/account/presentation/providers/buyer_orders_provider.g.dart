// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.

@ProviderFor(buyerOrderDetail)
const buyerOrderDetailProvider = BuyerOrderDetailFamily._();

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.

final class BuyerOrderDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderView>,
          OrderView,
          FutureOr<OrderView>
        >
    with $FutureModifier<OrderView>, $FutureProvider<OrderView> {
  /// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
  /// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
  /// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
  /// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
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

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.

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

  /// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
  /// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
  /// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
  /// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.

  BuyerOrderDetailProvider call(String orderId) =>
      BuyerOrderDetailProvider._(argument: orderId, from: this);

  @override
  String toString() => r'buyerOrderDetailProvider';
}
