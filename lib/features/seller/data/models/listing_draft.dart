import 'package:shopnexus_flutter_app/api/generated/model/create_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';

/// What the lone variant of a single-item listing calls itself.
///
/// `attributes` is what tells two variants of one listing apart — the size, the
/// colour — and `POST /listings` takes no variant without at least one entry,
/// whatever the OpenAPI document's bare `type: object` suggests. A used item has
/// nothing to choose between, so it gets the one row it is, named rather than
/// left blank: the buyer's product page lists these, and an unnamed row would
/// read as a missing option instead of the only one.
const defaultVariantAttributes = <String, Object>{'Phiên bản': 'Tiêu chuẩn'};

/// How many tags one listing may carry. The route counts them and refuses the
/// whole body over ten, so the form says so before the seller types an eleventh.
const maxListingTags = 10;

/// And how long one slug may be.
const _maxTagLength = 100;

/// Free text as the tag slugs the route accepts: lowercase, hyphenated, no
/// blanks, no repeats, none longer than [_maxTagLength] and no more than
/// [maxListingTags] of them.
///
/// The form keeps the seller under the count, so the cut here is the backstop
/// for what the form did not collect by hand — the AI's answer arrives as a list
/// of its own, and a model in a generous mood should not cost a whole listing.
List<String> listingTags(Iterable<String> raw) {
  final slugs = <String>[];
  for (final tag in raw) {
    final slug = _slugify(tag);
    if (slug.isEmpty || slugs.contains(slug)) continue;
    slugs.add(slug);
    if (slugs.length == maxListingTags) break;
  }
  return slugs;
}

String _slugify(String raw) {
  final slug = raw.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-');
  // Cut first, strip after: a cut that lands on a separator would otherwise
  // leave the hyphen dangling, which is not a slug the route accepts.
  final cut = slug.length <= _maxTagLength
      ? slug
      : slug.substring(0, _maxTagLength);
  return cut.replaceAll(RegExp(r'^-+|-+$'), '');
}

/// The posting form's boxes as the one body `POST /listings` takes. It lives
/// outside the screen so the shape actually sent is something a test can hold:
/// a body the API refuses is a red banner on the last screen of the flow, and
/// the form is not the place to find that out.
CreateListingRequest listingDraftRequest({
  required String name,
  String? description,
  required String categoryId,
  required ListingCondition condition,
  required String currency,
  required PriceMode priceMode,
  required int price,
  required int weightG,
  required int quantity,
  List<String> attachments = const [],
  List<String> tags = const [],
  Map<String, Object> specifications = const {},
}) {
  final slugs = listingTags(tags);

  return CreateListingRequest(
    name: name,
    description: description == null || description.isEmpty
        ? null
        : description,
    categoryId: categoryId,
    condition: condition,
    currency: currency,
    priceMode: priceMode,
    attachments: attachments.isEmpty ? null : attachments,
    tags: slugs.isEmpty ? null : slugs,
    specifications: specifications.isEmpty ? null : specifications,
    variants: [
      // One variant: this is a marketplace for used goods, so a listing is
      // normally the one item in the seller's hands. Price and parcel weight
      // live on the variant, which is why it exists at all.
      CreateVariantRequest(
        price: price,
        quantity: quantity,
        attributes: defaultVariantAttributes,
        packageDetails: <String, Object>{'weight_g': weightG},
      ),
    ],
  );
}
