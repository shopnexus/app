import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';

/// One line of a purchase: the variant, how many, and the listing it belongs to.
///
/// A variant has no read of its own in the catalog, so the listing is the only
/// place its price, attributes and photos are published — [listing] is filled in
/// once that read lands, and until then the line has no price to show. Nothing
/// here is a wire field: the cart route sends ids and a quantity only.
class PurchaseLine {
  const PurchaseLine({
    required this.listingId,
    required this.variantId,
    required this.quantity,
    this.cartItemId,
    this.listing,
    this.customUnitPrice,
    this.customTotal,
  });

  final String listingId;
  final String variantId;
  final int quantity;

  /// Null for a line bought straight from a listing page, which has no cart row.
  final String? cartItemId;

  final ListingDetail? listing;

  /// Used when checking out a negotiated offer with an agreed custom price
  final int? customUnitPrice;
  final int? customTotal;

  PurchaseLine withListing(ListingDetail? resolved) => PurchaseLine(
    listingId: listingId,
    variantId: variantId,
    quantity: quantity,
    cartItemId: cartItemId,
    listing: resolved,
    customUnitPrice: customUnitPrice,
    customTotal: customTotal,
  );

  Variant? get variant {
    final detail = listing;
    if (detail == null) return null;
    for (final candidate in detail.variants) {
      if (candidate.id == variantId) return candidate;
    }
    return null;
  }

  int? get unitPrice => customUnitPrice ?? variant?.price;

  int get lineTotal => customTotal ?? ((unitPrice ?? 0) * quantity);

  String? get name => listing?.name;

  String? get currency => listing?.currency;

  /// The variant's own photo when it has one, else the listing's first — the same
  /// order the product page picks in.
  String? get imageUrl {
    final images = [...?variant?.images, ...?listing?.images];
    for (final image in images) {
      if (image.url.isNotEmpty) return image.url;
    }
    return null;
  }

  /// `Màu sắc: Xanh dương`, so a cart with two colours of one listing reads apart.
  String? get attributesLabel {
    final attributes = variant?.attributes;
    if (attributes == null || attributes.isEmpty) return null;
    return attributes.entries
        .map((entry) => '${entry.key}: ${entry.value}')
        .join(' | ');
  }

  @override
  bool operator ==(Object other) =>
      other is PurchaseLine &&
      other.listingId == listingId &&
      other.variantId == variantId &&
      other.quantity == quantity &&
      other.cartItemId == cartItemId &&
      other.listing == listing;

  @override
  int get hashCode =>
      Object.hash(listingId, variantId, quantity, cartItemId, listing);
}
