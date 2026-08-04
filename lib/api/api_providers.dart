import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/network/dio_client.dart';
import 'generated/api/account_api.dart';
import 'generated/api/catalog_api.dart';
import 'generated/api/chat_api.dart';
import 'generated/api/finance_api.dart';
import 'generated/api/order_api.dart';
import 'generated/api/trust_api.dart';

part 'api_providers.g.dart';

/// The generated endpoint groups, each built on the app's own [dioProvider] so
/// every call goes through the auth header, the 401 refresh and the logging
/// interceptor. `ShopnexusApi` from the generated barrel is deliberately unused:
/// it would build a second Dio with none of that.
///
/// `AdminApi` has no provider — this app has no staff surface.

@riverpod
AccountApi accountApi(Ref ref) => AccountApi(ref.watch(dioProvider));

@riverpod
CatalogApi catalogApi(Ref ref) => CatalogApi(ref.watch(dioProvider));

@riverpod
ChatApi chatApi(Ref ref) => ChatApi(ref.watch(dioProvider));

@riverpod
FinanceApi financeApi(Ref ref) => FinanceApi(ref.watch(dioProvider));

@riverpod
OrderApi orderApi(Ref ref) => OrderApi(ref.watch(dioProvider));

@riverpod
TrustApi trustApi(Ref ref) => TrustApi(ref.watch(dioProvider));
