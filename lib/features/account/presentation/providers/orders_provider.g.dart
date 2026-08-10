// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unsettledItemsHash() => r'782d3fd2e8fe11e516f38968b63066054955dcef';

/// Dòng đã trả tiền mà chưa thành đơn — cửa sổ duy nhất còn bỏ được.
///
/// Không gộp vào [Orders]: đây là `/items?pending=true`, một endpoint khác trả về
/// dòng chứ không phải đơn, và một trong hai hỏng thì không được làm mất bên kia.
///
/// Copied from [unsettledItems].
@ProviderFor(unsettledItems)
final unsettledItemsProvider =
    AutoDisposeFutureProvider<List<OrderLineView>>.internal(
      unsettledItems,
      name: r'unsettledItemsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unsettledItemsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnsettledItemsRef = AutoDisposeFutureProviderRef<List<OrderLineView>>;
String _$ordersHash() => r'6d834304dd4d39d6ab1a959597b18cff3c509d4e';

/// Notifier quản lý đơn hàng của phía Người mua (buyer).
///
/// Copied from [Orders].
@ProviderFor(Orders)
final ordersProvider =
    AutoDisposeAsyncNotifierProvider<Orders, OrdersFeed>.internal(
      Orders.new,
      name: r'ordersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ordersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Orders = AutoDisposeAsyncNotifier<OrdersFeed>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
