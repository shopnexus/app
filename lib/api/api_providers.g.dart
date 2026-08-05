// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The generated endpoint groups, each built on the app's own [dioProvider] so
/// every call goes through the auth header, the 401 refresh and the logging
/// interceptor. `ShopnexusApi` from the generated barrel is deliberately unused:
/// it would build a second Dio with none of that.
///
/// `AdminApi` has no provider — this app has no staff surface.

@ProviderFor(accountApi)
const accountApiProvider = AccountApiProvider._();

/// The generated endpoint groups, each built on the app's own [dioProvider] so
/// every call goes through the auth header, the 401 refresh and the logging
/// interceptor. `ShopnexusApi` from the generated barrel is deliberately unused:
/// it would build a second Dio with none of that.
///
/// `AdminApi` has no provider — this app has no staff surface.

final class AccountApiProvider
    extends $FunctionalProvider<AccountApi, AccountApi, AccountApi>
    with $Provider<AccountApi> {
  /// The generated endpoint groups, each built on the app's own [dioProvider] so
  /// every call goes through the auth header, the 401 refresh and the logging
  /// interceptor. `ShopnexusApi` from the generated barrel is deliberately unused:
  /// it would build a second Dio with none of that.
  ///
  /// `AdminApi` has no provider — this app has no staff surface.
  const AccountApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountApiHash();

  @$internal
  @override
  $ProviderElement<AccountApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AccountApi create(Ref ref) {
    return accountApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountApi>(value),
    );
  }
}

String _$accountApiHash() => r'6a88a7694ec8c415b62e00a97e21b1b33dccc3e4';

@ProviderFor(catalogApi)
const catalogApiProvider = CatalogApiProvider._();

final class CatalogApiProvider
    extends $FunctionalProvider<CatalogApi, CatalogApi, CatalogApi>
    with $Provider<CatalogApi> {
  const CatalogApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogApiHash();

  @$internal
  @override
  $ProviderElement<CatalogApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CatalogApi create(Ref ref) {
    return catalogApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogApi>(value),
    );
  }
}

String _$catalogApiHash() => r'32c800e9ff4823801461dfbfa53f6b653152fd36';

@ProviderFor(chatApi)
const chatApiProvider = ChatApiProvider._();

final class ChatApiProvider
    extends $FunctionalProvider<ChatApi, ChatApi, ChatApi>
    with $Provider<ChatApi> {
  const ChatApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatApiHash();

  @$internal
  @override
  $ProviderElement<ChatApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatApi create(Ref ref) {
    return chatApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatApi>(value),
    );
  }
}

String _$chatApiHash() => r'5cb98140944bbcbc38f3578bdb75410a652054e5';

@ProviderFor(financeApi)
const financeApiProvider = FinanceApiProvider._();

final class FinanceApiProvider
    extends $FunctionalProvider<FinanceApi, FinanceApi, FinanceApi>
    with $Provider<FinanceApi> {
  const FinanceApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'financeApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$financeApiHash();

  @$internal
  @override
  $ProviderElement<FinanceApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FinanceApi create(Ref ref) {
    return financeApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FinanceApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FinanceApi>(value),
    );
  }
}

String _$financeApiHash() => r'e93bbdc19c1651833c22a437f01c25d5bb7f510b';

@ProviderFor(orderApi)
const orderApiProvider = OrderApiProvider._();

final class OrderApiProvider
    extends $FunctionalProvider<OrderApi, OrderApi, OrderApi>
    with $Provider<OrderApi> {
  const OrderApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderApiHash();

  @$internal
  @override
  $ProviderElement<OrderApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrderApi create(Ref ref) {
    return orderApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderApi>(value),
    );
  }
}

String _$orderApiHash() => r'a9ae52c081dba9da7eb0869186fee133b27b0cf8';

@ProviderFor(trustApi)
const trustApiProvider = TrustApiProvider._();

final class TrustApiProvider
    extends $FunctionalProvider<TrustApi, TrustApi, TrustApi>
    with $Provider<TrustApi> {
  const TrustApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trustApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trustApiHash();

  @$internal
  @override
  $ProviderElement<TrustApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TrustApi create(Ref ref) {
    return trustApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrustApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrustApi>(value),
    );
  }
}

String _$trustApiHash() => r'ffbc21f0316988be634d78e61a82f23b3d2d3a28';
