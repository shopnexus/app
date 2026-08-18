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
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/pending_edit.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_detail.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingDetail {
  /// Returns a new [ListingDetail] instance.
  ListingDetail({
    required this.category,

    required this.condition,

    required this.createdAt,

    required this.currency,

    required this.deletedAt,

    required this.description,

    required this.favoriteCount,

    required this.favorited,

    required this.featuredVariantId,

    required this.id,

    required this.images,

    required this.location,

    required this.name,

    required this.pendingEdit,

    required this.priceMode,

    required this.rating,

    required this.reviewCount,

    required this.seller,

    required this.slug,

    required this.sold,

    required this.specifications,

    required this.status,

    required this.tags,

    required this.takedownReason,

    required this.takenDownAt,

    required this.variants,
  });

  @JsonKey(name: r'category', required: true, includeIfNull: false)
  final Category category;

  @JsonKey(name: r'condition', required: true, includeIfNull: false)
  final ListingCondition condition;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Set on a listing the seller removed.
  @JsonKey(name: r'deleted_at', required: true, includeIfNull: true)
  final DateTime? deletedAt;

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  /// How many accounts saved it — social proof on the product page. Only here and not on the card: it is a count per listing, cheap for one row and N counts for a page of them.
  // minimum: 0
  @JsonKey(name: r'favorite_count', required: true, includeIfNull: false)
  final int favoriteCount;

  /// Whether the caller has this saved. False for an anonymous request.
  @JsonKey(name: r'favorited', required: true, includeIfNull: false)
  final bool favorited;

  @JsonKey(name: r'featured_variant_id', required: true, includeIfNull: true)
  final String? featuredVariantId;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Ordered. The first is the cover.
  @JsonKey(name: r'images', required: true, includeIfNull: false)
  final List<Resource> images;

  /// Where the goods are. Null on a listing that was never published — the address is taken when the seller publishes, because that is when it becomes something a buyer can find.
  @JsonKey(name: r'location', required: true, includeIfNull: true)
  final ListingLocation? location;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  /// An edit waiting on moderation, null when there is none. Visible to the owner and to staff only; buyers see the published version until it is approved.
  @JsonKey(name: r'pending_edit', required: true, includeIfNull: true)
  final PendingEdit? pendingEdit;

  @JsonKey(name: r'price_mode', required: true, includeIfNull: false)
  final PriceMode priceMode;

  // minimum: 0
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final double rating;

  /// How many reviews the rating averages — see Listing.review_count.
  // minimum: 0
  @JsonKey(name: r'review_count', required: true, includeIfNull: false)
  final int reviewCount;

  @JsonKey(name: r'seller', required: true, includeIfNull: false)
  final AccountSummary seller;

  /// The slug a link carries: the listing's name, slugified and frozen at creation, with the listing's id on the end. The text in front is for the person reading the link and is not matched — renaming a listing does not rewrite links already shared, and a stale one still resolves because the id behind the last hyphen is what addresses the listing.  It never contains an underscore, which is how `GET /listings/{id}` tells it from a `ListingID` and accepts either. A name that slugifies to nothing leaves the id alone.
  @JsonKey(name: r'slug', required: true, includeIfNull: false)
  final String slug;

  /// Completed sales across the variants — see Listing.sold.
  // minimum: 0
  @JsonKey(name: r'sold', required: true, includeIfNull: false)
  final int sold;

  /// Structured attributes specific to the product type.
  @JsonKey(name: r'specifications', required: true, includeIfNull: false)
  final Map<String, Object> specifications;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final ListingStatus status;

  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  /// What the moderator chose to tell the seller, and null when they chose not to (`notify_seller: false` on the takedown). The full reason is in the audit trail either way. Publishing again clears both fields, so they always describe why the listing is down *now* rather than why it once was.
  @JsonKey(name: r'takedown_reason', required: true, includeIfNull: true)
  final String? takedownReason;

  /// When staff removed the listing. Null when it is live, and null when the seller hid it themselves — the two used to be indistinguishable, which left a seller unable to tell that their listing had been removed at all.
  @JsonKey(name: r'taken_down_at', required: true, includeIfNull: true)
  final DateTime? takenDownAt;

  @JsonKey(name: r'variants', required: true, includeIfNull: false)
  final List<Variant> variants;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingDetail &&
          other.category == category &&
          other.condition == condition &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.deletedAt == deletedAt &&
          other.description == description &&
          other.favoriteCount == favoriteCount &&
          other.favorited == favorited &&
          other.featuredVariantId == featuredVariantId &&
          other.id == id &&
          other.images == images &&
          other.location == location &&
          other.name == name &&
          other.pendingEdit == pendingEdit &&
          other.priceMode == priceMode &&
          other.rating == rating &&
          other.reviewCount == reviewCount &&
          other.seller == seller &&
          other.slug == slug &&
          other.sold == sold &&
          other.specifications == specifications &&
          other.status == status &&
          other.tags == tags &&
          other.takedownReason == takedownReason &&
          other.takenDownAt == takenDownAt &&
          other.variants == variants;

  @override
  int get hashCode =>
      category.hashCode +
      condition.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      (deletedAt == null ? 0 : deletedAt.hashCode) +
      description.hashCode +
      favoriteCount.hashCode +
      favorited.hashCode +
      (featuredVariantId == null ? 0 : featuredVariantId.hashCode) +
      id.hashCode +
      images.hashCode +
      (location == null ? 0 : location.hashCode) +
      name.hashCode +
      (pendingEdit == null ? 0 : pendingEdit.hashCode) +
      priceMode.hashCode +
      rating.hashCode +
      reviewCount.hashCode +
      seller.hashCode +
      slug.hashCode +
      sold.hashCode +
      specifications.hashCode +
      status.hashCode +
      tags.hashCode +
      (takedownReason == null ? 0 : takedownReason.hashCode) +
      (takenDownAt == null ? 0 : takenDownAt.hashCode) +
      variants.hashCode;

  factory ListingDetail.fromJson(Map<String, dynamic> json) =>
      _$ListingDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ListingDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
