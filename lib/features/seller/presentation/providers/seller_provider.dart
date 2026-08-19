import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';

part 'seller_provider.g.dart';

/// What a shop's public page lists. `seller_id` narrows the ordinary feed, so a
/// visitor sees exactly what is public — there is no shop-scoped route and no
/// `mine=true` here, which is what would be needed to see a draft.
@riverpod
Future<List<Listing>> sellerProducts(Ref ref, String vendorId) async {
  final page = await ref
      .watch(catalogRepositoryProvider)
      .listings(vendorId: vendorId);
  return page.listings;
}
