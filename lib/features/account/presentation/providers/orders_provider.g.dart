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

String _$unsettledItemsHash() => r'782d3fd2e8fe11e516f38968b63066054955dcef';

/// Dòng đã hủy trước khi thành đơn — "lịch sử hủy" của một lượt đặt hàng bỏ dở.
///
/// Đơn chỉ ra đời khi tiền về, nên một lượt đặt hàng bị hủy lúc chưa thanh toán
/// không bao giờ có `Order` để nằm trong `/orders`. Nó cũng rơi khỏi
/// [unsettledItems] ngay lúc bị hủy — `pending=true` là "chưa có đơn **và** chưa
/// bị hủy", server lọc vậy. Không đọc riêng chỗ này thì người mua bấm "Hủy" xong
/// là dòng ấy biến mất khỏi mọi màn hình.
///
/// `pending: false` là lượt đọc không lọc, nên "đã hủy" đọc trên `cancelled_at`
/// còn "chưa thành đơn" đọc trên `order_id` — đúng hai thứ route trả về sẵn.

@ProviderFor(cancelledItems)
const cancelledItemsProvider = CancelledItemsProvider._();

/// Dòng đã hủy trước khi thành đơn — "lịch sử hủy" của một lượt đặt hàng bỏ dở.
///
/// Đơn chỉ ra đời khi tiền về, nên một lượt đặt hàng bị hủy lúc chưa thanh toán
/// không bao giờ có `Order` để nằm trong `/orders`. Nó cũng rơi khỏi
/// [unsettledItems] ngay lúc bị hủy — `pending=true` là "chưa có đơn **và** chưa
/// bị hủy", server lọc vậy. Không đọc riêng chỗ này thì người mua bấm "Hủy" xong
/// là dòng ấy biến mất khỏi mọi màn hình.
///
/// `pending: false` là lượt đọc không lọc, nên "đã hủy" đọc trên `cancelled_at`
/// còn "chưa thành đơn" đọc trên `order_id` — đúng hai thứ route trả về sẵn.

final class CancelledItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderLineView>>,
          List<OrderLineView>,
          FutureOr<List<OrderLineView>>
        >
    with
        $FutureModifier<List<OrderLineView>>,
        $FutureProvider<List<OrderLineView>> {
  /// Dòng đã hủy trước khi thành đơn — "lịch sử hủy" của một lượt đặt hàng bỏ dở.
  ///
  /// Đơn chỉ ra đời khi tiền về, nên một lượt đặt hàng bị hủy lúc chưa thanh toán
  /// không bao giờ có `Order` để nằm trong `/orders`. Nó cũng rơi khỏi
  /// [unsettledItems] ngay lúc bị hủy — `pending=true` là "chưa có đơn **và** chưa
  /// bị hủy", server lọc vậy. Không đọc riêng chỗ này thì người mua bấm "Hủy" xong
  /// là dòng ấy biến mất khỏi mọi màn hình.
  ///
  /// `pending: false` là lượt đọc không lọc, nên "đã hủy" đọc trên `cancelled_at`
  /// còn "chưa thành đơn" đọc trên `order_id` — đúng hai thứ route trả về sẵn.
  const CancelledItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cancelledItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cancelledItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderLineView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderLineView>> create(Ref ref) {
    return cancelledItems(ref);
  }
}

String _$cancelledItemsHash() => r'0bc66811268025a893a28223a630705da22fa528';

/// Notifier quản lý đơn hàng của phía Người mua (buyer).

@ProviderFor(Orders)
const ordersProvider = OrdersProvider._();

/// Notifier quản lý đơn hàng của phía Người mua (buyer).
final class OrdersProvider extends $AsyncNotifierProvider<Orders, OrdersFeed> {
  /// Notifier quản lý đơn hàng của phía Người mua (buyer).
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

String _$ordersHash() => r'6d834304dd4d39d6ab1a959597b18cff3c509d4e';

/// Notifier quản lý đơn hàng của phía Người mua (buyer).

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
