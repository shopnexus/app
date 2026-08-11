import 'package:dio/dio.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/chat_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';

/// A [ResourceUploader] over one client — the five endpoint groups it needs are
/// an implementation detail of "upload", and a test that builds a repository
/// should not have to know them.
///
/// The default client goes nowhere: most repositories take an uploader because
/// the constructor asks for one, not because the test uploads anything.
ResourceUploader uploaderOn([Dio? dio]) {
  final client = dio ?? Dio();
  return ResourceUploader(
    account: AccountApi(client),
    catalog: CatalogApi(client),
    chat: ChatApi(client),
    order: OrderApi(client),
    trust: TrustApi(client),
    // Bước PUT cũng đi qua chính client này, nên nó được ghi lại như hai bước
    // kia thay vì lặng lẽ đi ra mạng thật.
    storeClient: client,
  );
}
