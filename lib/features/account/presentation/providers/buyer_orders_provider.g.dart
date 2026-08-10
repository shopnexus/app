// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyerOrderDetailHash() => r'dfee0a4d5e60d9ddec915e03be7aa2f83f52eb02';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
///
/// Copied from [buyerOrderDetail].
@ProviderFor(buyerOrderDetail)
const buyerOrderDetailProvider = BuyerOrderDetailFamily();

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
///
/// Copied from [buyerOrderDetail].
class BuyerOrderDetailFamily extends Family<AsyncValue<OrderView>> {
  /// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
  /// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
  /// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
  /// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
  ///
  /// Copied from [buyerOrderDetail].
  const BuyerOrderDetailFamily();

  /// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
  /// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
  /// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
  /// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
  ///
  /// Copied from [buyerOrderDetail].
  BuyerOrderDetailProvider call(String orderId) {
    return BuyerOrderDetailProvider(orderId);
  }

  @override
  BuyerOrderDetailProvider getProviderOverride(
    covariant BuyerOrderDetailProvider provider,
  ) {
    return call(provider.orderId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'buyerOrderDetailProvider';
}

/// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
/// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
/// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
/// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
///
/// Copied from [buyerOrderDetail].
class BuyerOrderDetailProvider extends AutoDisposeFutureProvider<OrderView> {
  /// Bốn provider lọc theo tab từng ở đây — `buyerOpenOrders`, `buyerCompletedOrders`,
  /// `buyerCancelledOrders`, `buyerCancelledItems` — đã đi cùng chín cái tab: một lượt
  /// đọc `/orders?role=X` trả về cả bốn trạng thái và màn hình chia nhóm lấy. Chi tiết
  /// một đơn thì vẫn là một lượt đọc riêng, vì nó là một route riêng.
  ///
  /// Copied from [buyerOrderDetail].
  BuyerOrderDetailProvider(String orderId)
    : this._internal(
        (ref) => buyerOrderDetail(ref as BuyerOrderDetailRef, orderId),
        from: buyerOrderDetailProvider,
        name: r'buyerOrderDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$buyerOrderDetailHash,
        dependencies: BuyerOrderDetailFamily._dependencies,
        allTransitiveDependencies:
            BuyerOrderDetailFamily._allTransitiveDependencies,
        orderId: orderId,
      );

  BuyerOrderDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<OrderView> Function(BuyerOrderDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BuyerOrderDetailProvider._internal(
        (ref) => create(ref as BuyerOrderDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderView> createElement() {
    return _BuyerOrderDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyerOrderDetailProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BuyerOrderDetailRef on AutoDisposeFutureProviderRef<OrderView> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _BuyerOrderDetailProviderElement
    extends AutoDisposeFutureProviderElement<OrderView>
    with BuyerOrderDetailRef {
  _BuyerOrderDetailProviderElement(super.provider);

  @override
  String get orderId => (origin as BuyerOrderDetailProvider).orderId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
