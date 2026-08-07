import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';

part 'catalog_model.freezed.dart';
part 'catalog_model.g.dart';

/// The `sort` values `GET /listings` accepts. `newest` is also what a null sort
/// means, so the UI keeps sending null for the default.
abstract final class ListingSort {
  static const newest = 'newest';
  static const rating = 'rating';
  static const priceAsc = 'price-asc';
  static const priceDesc = 'price-desc';
  static const bestSelling = 'best-selling';
  static const relevance = 'relevance';
  static const recommended = 'recommended';
  static const distance = 'distance';
}

/// How `GET /listings` matches `q`. Ignored without a query, so the picker is
/// only offered once there is one.
abstract final class SearchMode {
  static const lexical = 'lexical';
  static const semantic = 'semantic';
  static const hybrid = 'hybrid';
}

/// The `sort` values `GET /listings/{id}/reviews` accepts. A cursor belongs to
/// the sort it was issued under, so changing this restarts the traversal.
abstract final class ReviewSort {
  static const newest = 'newest';
  static const helpful = 'helpful';
  static const ratingDesc = 'rating-desc';
  static const ratingAsc = 'rating-asc';
}

/// What the "vừa xem" carousel draws, cached in Hive. Not a wire type: a
/// `ListingDetail` carries no card price, so the featured variant's price is
/// resolved here instead of being stored as if the server had sent one.
@freezed
abstract class RecentListing with _$RecentListing {
  const RecentListing._();

  const factory RecentListing({
    required String id,
    required String name,
    required int price,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'seller_name') String? sellerName,
    @Default(0.0) double rating,
    @Default(false) bool negotiable,
  }) = _RecentListing;

  factory RecentListing.fromJson(Map<String, dynamic> json) =>
      _$RecentListingFromJson(json);

  factory RecentListing.fromDetail(ListingDetail detail) => RecentListing(
    id: detail.id,
    name: detail.name,
    price: featuredPrice(detail),
    coverUrl: detail.images.firstOrNull?.url,
    sellerName: detail.seller.name,
    rating: detail.rating,
    negotiable: detail.priceMode == PriceMode.negotiable,
  );
}

/// The one price a card can show for a listing whose variants may differ: the
/// featured variant's, or the cheapest when none is featured — the same rule
/// `Listing.price` follows on the feed.
int featuredPrice(ListingDetail detail) {
  for (final variant in detail.variants) {
    if (variant.id == detail.featuredVariantId || variant.isFeatured) {
      return variant.price;
    }
  }
  if (detail.variants.isEmpty) return 0;
  return detail.variants.map((v) => v.price).reduce((a, b) => a < b ? a : b);
}

/// Size and colour, in the order the seller entered them. `Variant.attributes` is
/// an open `type: object`, so a value may be any JSON scalar.
String variantLabel(Variant variant) =>
    variant.attributes.values.map((v) => v.toString()).join(' • ');
