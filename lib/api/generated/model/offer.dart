//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/offer_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Offer {
  /// Returns a new [Offer] instance.
  Offer({
    required this.authorId,

    required this.buyerId,

    required this.counterparty,

    required this.createdAt,

    required this.currency,

    required this.expiresAt,

    required this.id,

    required this.listing,

    required this.listingId,

    required this.quantity,

    required this.reason,

    required this.sellerId,

    required this.status,

    required this.total,

    required this.variantId,
  });

  @JsonKey(name: r'author_id', required: true, includeIfNull: false)
  final String authorId;

  @JsonKey(name: r'buyer_id', required: true, includeIfNull: false)
  final String buyerId;

  /// The other side of the negotiation, whichever that is for the caller. This route only ever answers a party to the row, so the viewer is one of `buyer_id`/`seller_id` and this is the one they need named.
  @JsonKey(name: r'counterparty', required: true, includeIfNull: false)
  final AccountSummary counterparty;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @JsonKey(name: r'expires_at', required: true, includeIfNull: false)
  final DateTime expiresAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'listing', required: true, includeIfNull: false)
  final OfferListing listing;

  /// The listing whose card the offer is shown on.
  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  // minimum: 1
  @JsonKey(name: r'quantity', required: true, includeIfNull: false)
  final int quantity;

  /// Shown on the offer card beside the proposed price
  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  @JsonKey(name: r'seller_id', required: true, includeIfNull: false)
  final String sellerId;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final OfferStatus status;

  /// Currently proposed total, smallest currency unit
  // minimum: 1
  @JsonKey(name: r'total', required: true, includeIfNull: false)
  final int total;

  @JsonKey(name: r'variant_id', required: true, includeIfNull: false)
  final String variantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Offer &&
          other.authorId == authorId &&
          other.buyerId == buyerId &&
          other.counterparty == counterparty &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.expiresAt == expiresAt &&
          other.id == id &&
          other.listing == listing &&
          other.listingId == listingId &&
          other.quantity == quantity &&
          other.reason == reason &&
          other.sellerId == sellerId &&
          other.status == status &&
          other.total == total &&
          other.variantId == variantId;

  @override
  int get hashCode =>
      authorId.hashCode +
      buyerId.hashCode +
      counterparty.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      expiresAt.hashCode +
      id.hashCode +
      listing.hashCode +
      listingId.hashCode +
      quantity.hashCode +
      reason.hashCode +
      sellerId.hashCode +
      status.hashCode +
      total.hashCode +
      variantId.hashCode;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
