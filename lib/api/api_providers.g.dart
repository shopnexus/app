// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountApiHash() => r'6a88a7694ec8c415b62e00a97e21b1b33dccc3e4';

/// The generated endpoint groups, each built on the app's own [dioProvider] so
/// every call goes through the auth header, the 401 refresh and the logging
/// interceptor. `ShopnexusApi` from the generated barrel is deliberately unused:
/// it would build a second Dio with none of that.
///
/// `AdminApi` has no provider — this app has no staff surface.
///
/// Copied from [accountApi].
@ProviderFor(accountApi)
final accountApiProvider = AutoDisposeProvider<AccountApi>.internal(
  accountApi,
  name: r'accountApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AccountApiRef = AutoDisposeProviderRef<AccountApi>;
String _$catalogApiHash() => r'32c800e9ff4823801461dfbfa53f6b653152fd36';

/// See also [catalogApi].
@ProviderFor(catalogApi)
final catalogApiProvider = AutoDisposeProvider<CatalogApi>.internal(
  catalogApi,
  name: r'catalogApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$catalogApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CatalogApiRef = AutoDisposeProviderRef<CatalogApi>;
String _$chatApiHash() => r'5cb98140944bbcbc38f3578bdb75410a652054e5';

/// See also [chatApi].
@ProviderFor(chatApi)
final chatApiProvider = AutoDisposeProvider<ChatApi>.internal(
  chatApi,
  name: r'chatApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatApiRef = AutoDisposeProviderRef<ChatApi>;
String _$commonApiHash() => r'8f21f95ff4166dee0d58a25f39550f1aaa5340b5';

/// The registry every module's pluggable choices are read through — the payment rails and
/// the carriers. Its own group because the endpoint belongs to no single module.
///
/// Copied from [commonApi].
@ProviderFor(commonApi)
final commonApiProvider = AutoDisposeProvider<CommonApi>.internal(
  commonApi,
  name: r'commonApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$commonApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CommonApiRef = AutoDisposeProviderRef<CommonApi>;
String _$financeApiHash() => r'e93bbdc19c1651833c22a437f01c25d5bb7f510b';

/// See also [financeApi].
@ProviderFor(financeApi)
final financeApiProvider = AutoDisposeProvider<FinanceApi>.internal(
  financeApi,
  name: r'financeApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$financeApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FinanceApiRef = AutoDisposeProviderRef<FinanceApi>;
String _$orderApiHash() => r'a9ae52c081dba9da7eb0869186fee133b27b0cf8';

/// See also [orderApi].
@ProviderFor(orderApi)
final orderApiProvider = AutoDisposeProvider<OrderApi>.internal(
  orderApi,
  name: r'orderApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderApiRef = AutoDisposeProviderRef<OrderApi>;
String _$trustApiHash() => r'ffbc21f0316988be634d78e61a82f23b3d2d3a28';

/// See also [trustApi].
@ProviderFor(trustApi)
final trustApiProvider = AutoDisposeProvider<TrustApi>.internal(
  trustApi,
  name: r'trustApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trustApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrustApiRef = AutoDisposeProviderRef<TrustApi>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
