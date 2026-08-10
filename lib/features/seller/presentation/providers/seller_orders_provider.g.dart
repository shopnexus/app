// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellerAllOrdersHash() => r'45bb9a9154bf7c53d78fe53c19157f7a0dd6b86f';

/// See also [sellerAllOrders].
@ProviderFor(sellerAllOrders)
final sellerAllOrdersProvider =
    AutoDisposeFutureProvider<List<OrderView>>.internal(
      sellerAllOrders,
      name: r'sellerAllOrdersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellerAllOrdersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SellerAllOrdersRef = AutoDisposeFutureProviderRef<List<OrderView>>;
String _$sellerOrdersNotifierHash() =>
    r'097aa3e83f5a3e2173060c3e4b2839c072dabeb0';

/// See also [SellerOrdersNotifier].
@ProviderFor(SellerOrdersNotifier)
final sellerOrdersNotifierProvider =
    NotifierProvider<SellerOrdersNotifier, SellerOrdersState>.internal(
      SellerOrdersNotifier.new,
      name: r'sellerOrdersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellerOrdersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SellerOrdersNotifier = Notifier<SellerOrdersState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
