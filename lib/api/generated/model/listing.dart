//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_location.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Listing {
  /// Returns a new [Listing] instance.
  Listing({
    required this.categoryId,

    required this.condition,

    this.cover,

    required this.createdAt,

    required this.currency,

    this.deletedAt,

    required this.favorited,

    required this.id,

    this.location,

    required this.name,

    required this.price,

    required this.priceMode,

    required this.rating,

    required this.reviewCount,

    this.score,

    required this.seller,

    required this.slug,

    required this.sold,

    required this.status,

    this.tags,

    this.takenDownAt,
  });

  @JsonKey(name: r'category_id', required: true, includeIfNull: false)
  final String categoryId;

  @JsonKey(name: r'condition', required: true, includeIfNull: false)
  final ListingCondition condition;

  @JsonKey(name: r'cover', required: false, includeIfNull: false)
  final Resource? cover;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Set on a listing the seller removed. Only an `ids` lookup returns one, so that an order or a cart referencing it can still be rendered.
  @JsonKey(name: r'deleted_at', required: false, includeIfNull: false)
  final DateTime? deletedAt;

  /// Whether the caller has this on their wishlist. False for an anonymous request. A plain join, because the wishlist is a catalog table — the client never has to fetch its own saves to know which hearts to fill in.
  @JsonKey(name: r'favorited', required: true, includeIfNull: false)
  final bool favorited;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Where the goods are. Null on a listing that was never published — the address is taken when the seller publishes, because that is when it becomes something a buyer can find.
  @JsonKey(name: r'location', required: false, includeIfNull: false)
  final ListingLocation? location;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  /// The featured variant's price, or the cheapest one when a price sort is in force. Not stored on the listing.
  // minimum: 1
  @JsonKey(name: r'price', required: true, includeIfNull: false)
  final int price;

  @JsonKey(name: r'price_mode', required: true, includeIfNull: false)
  final PriceMode priceMode;

  /// Average review rating from 1 to 5, or 0 when there are none yet. Maintained from review events because reviews live in another schema and cannot be joined.
  // minimum: 0
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final double rating;

  /// How many reviews the rating averages. Beside it rather than derivable from it, because a 5.0 from one review and a 5.0 from two hundred are not the same claim.
  // minimum: 0
  @JsonKey(name: r'review_count', required: true, includeIfNull: false)
  final int reviewCount;

  /// Relevance, always oriented so that higher is closer — for a vector ranking that is `1 - (a <=> b)`, the cosine similarity, because the operator itself returns a distance. Null unless the request asked for a ranking.
  // minimum: -1
  // maximum: 1
  @JsonKey(name: r'score', required: false, includeIfNull: false)
  final double? score;

  @JsonKey(name: r'seller', required: true, includeIfNull: false)
  final AccountSummary seller;

  /// URL-friendly, globally unique and fixed at creation.
  @JsonKey(name: r'slug', required: true, includeIfNull: false)
  final String slug;

  /// Completed sales across the variants. An open checkout does not count and a cancelled one never did, so the number only goes up. Read from `cached_sold` on the listing rather than summed per request: a feed page would otherwise aggregate the stock rows of every card on it.
  // minimum: 0
  @JsonKey(name: r'sold', required: true, includeIfNull: false)
  final int sold;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final ListingStatus status;

  /// The listing's own tags, on the card so chips render without a request per row. Empty when it has none.
  @JsonKey(name: r'tags', required: false, includeIfNull: false)
  final List<String>? tags;

  /// When staff removed this listing — which is the only thing that tells a takedown apart from the seller hiding their own, since both read `hidden`. Null otherwise. The reason is on the detail read, because it is a sentence rather than a badge.
  @JsonKey(name: r'taken_down_at', required: false, includeIfNull: false)
  final DateTime? takenDownAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Listing &&
          other.categoryId == categoryId &&
          other.condition == condition &&
          other.cover == cover &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.deletedAt == deletedAt &&
          other.favorited == favorited &&
          other.id == id &&
          other.location == location &&
          other.name == name &&
          other.price == price &&
          other.priceMode == priceMode &&
          other.rating == rating &&
          other.reviewCount == reviewCount &&
          other.score == score &&
          other.seller == seller &&
          other.slug == slug &&
          other.sold == sold &&
          other.status == status &&
          other.tags == tags &&
          other.takenDownAt == takenDownAt;

  @override
  int get hashCode =>
      categoryId.hashCode +
      condition.hashCode +
      (cover == null ? 0 : cover.hashCode) +
      createdAt.hashCode +
      currency.hashCode +
      (deletedAt == null ? 0 : deletedAt.hashCode) +
      favorited.hashCode +
      id.hashCode +
      (location == null ? 0 : location.hashCode) +
      name.hashCode +
      price.hashCode +
      priceMode.hashCode +
      rating.hashCode +
      reviewCount.hashCode +
      (score == null ? 0 : score.hashCode) +
      seller.hashCode +
      slug.hashCode +
      sold.hashCode +
      status.hashCode +
      tags.hashCode +
      (takenDownAt == null ? 0 : takenDownAt.hashCode);

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  Map<String, dynamic> toJson() => _$ListingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
