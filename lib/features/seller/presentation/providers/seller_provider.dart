import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../../catalog/data/repositories/catalog_repository.dart';

part 'seller_provider.g.dart';

@riverpod
Future<List<TProductCard>> sellerProducts(Ref ref, String vendorId) {
  final repository = ref.watch(catalogRepositoryProvider);
  return repository.getProductCards(vendorId: vendorId);
}
