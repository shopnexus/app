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
const unsettledItemsProvider = UnsettledItemsFamily._();

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
  const UnsettledItemsProvider._({
    required UnsettledItemsFamily super.from,
    required OrderRole super.argument,
  }) : super(
         retry: null,
         name: r'unsettledItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$unsettledItemsHash();

  @override
  String toString() {
    return r'unsettledItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<OrderLineView>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderLineView>> create(Ref ref) {
    final argument = this.argument as OrderRole;
    return unsettledItems(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UnsettledItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$unsettledItemsHash() => r'89033adf8546c6a32e396c4b0eddc57c6ca5aefd';

/// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
///
/// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
/// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.

final class UnsettledItemsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<OrderLineView>>, OrderRole> {
  const UnsettledItemsFamily._()
    : super(
        retry: null,
        name: r'unsettledItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
  ///
  /// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
  /// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.

  UnsettledItemsProvider call(OrderRole role) =>
      UnsettledItemsProvider._(argument: role, from: this);

  @override
  String toString() => r'unsettledItemsProvider';
}

/// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
/// tồn tại, nên family này có đúng hai thành viên.

@ProviderFor(Orders)
const ordersProvider = OrdersFamily._();

/// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
/// tồn tại, nên family này có đúng hai thành viên.
final class OrdersProvider extends $AsyncNotifierProvider<Orders, OrdersFeed> {
  /// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
  /// tồn tại, nên family này có đúng hai thành viên.
  const OrdersProvider._({
    required OrdersFamily super.from,
    required OrderRole super.argument,
  }) : super(
         retry: null,
         name: r'ordersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ordersHash();

  @override
  String toString() {
    return r'ordersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Orders create() => Orders();

  @override
  bool operator ==(Object other) {
    return other is OrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ordersHash() => r'859d50f0fe209503bcf51c5a73d1850efd1a9699';

/// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
/// tồn tại, nên family này có đúng hai thành viên.

final class OrdersFamily extends $Family
    with
        $ClassFamilyOverride<
          Orders,
          AsyncValue<OrdersFeed>,
          OrdersFeed,
          FutureOr<OrdersFeed>,
          OrderRole
        > {
  const OrdersFamily._()
    : super(
        retry: null,
        name: r'ordersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
  /// tồn tại, nên family này có đúng hai thành viên.

  OrdersProvider call(OrderRole role) =>
      OrdersProvider._(argument: role, from: this);

  @override
  String toString() => r'ordersProvider';
}

/// Một provider cho mỗi vai, thay cho năm provider lọc theo tab. Chỉ hai vai
/// tồn tại, nên family này có đúng hai thành viên.

abstract class _$Orders extends $AsyncNotifier<OrdersFeed> {
  late final _$args = ref.$arg as OrderRole;
  OrderRole get role => _$args;

  FutureOr<OrdersFeed> build(OrderRole role);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
