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
        isAutoDispose: false,
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

String _$accountApiHash() => r'a65caff1819ce07bc6dff4af157308821acb5c6e';

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
        isAutoDispose: false,
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

String _$catalogApiHash() => r'8053425e4fa84b80aad730ece737d7f709f44e78';

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
        isAutoDispose: false,
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

String _$chatApiHash() => r'3afec20a063ca69689bda65ca568ef578da31219';

/// The registry every module's pluggable choices are read through — the payment rails and
/// the carriers. Its own group because the endpoint belongs to no single module.

@ProviderFor(commonApi)
const commonApiProvider = CommonApiProvider._();

/// The registry every module's pluggable choices are read through — the payment rails and
/// the carriers. Its own group because the endpoint belongs to no single module.

final class CommonApiProvider
    extends $FunctionalProvider<CommonApi, CommonApi, CommonApi>
    with $Provider<CommonApi> {
  /// The registry every module's pluggable choices are read through — the payment rails and
  /// the carriers. Its own group because the endpoint belongs to no single module.
  const CommonApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commonApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commonApiHash();

  @$internal
  @override
  $ProviderElement<CommonApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommonApi create(Ref ref) {
    return commonApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommonApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommonApi>(value),
    );
  }
}

String _$commonApiHash() => r'99880e966d44d00d80b2c388ecb7d6a948328932';

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
        isAutoDispose: false,
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

String _$financeApiHash() => r'add03c9b94da5f67588b1c1f4a02ac0a6d8aebe8';

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
        isAutoDispose: false,
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

String _$orderApiHash() => r'41fcb1797cfa64051c094fc781ce8ffc04bd7763';

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
        isAutoDispose: false,
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

String _$trustApiHash() => r'be49087b1cb955ba2c7823b3dea7c62fcb26cfa5';
