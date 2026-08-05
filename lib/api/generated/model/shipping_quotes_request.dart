//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/checkout_line.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_quotes_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShippingQuotesRequest {
  /// Returns a new [ShippingQuotesRequest] instance.
  ShippingQuotesRequest({
    this.contactId,

    this.draftId,

    this.lines,

    this.offerId,

    this.quantity,

    this.variantId,
  });

  /// Where the parcel goes. Omit it and the caller's default delivery address is used, which is what lets a listing page quote with no form; 422 when they have none on file.
  @JsonKey(name: r'contact_id', required: false, includeIfNull: false)
  final String? contactId;

  @JsonKey(name: r'draft_id', required: false, includeIfNull: false)
  final String? draftId;

  /// The draft's variants and quantities, as a checkout would send them. Ignored for an offer, whose quantity was negotiated.
  @JsonKey(name: r'lines', required: false, includeIfNull: false)
  final List<CheckoutLine>? lines;

  @JsonKey(name: r'offer_id', required: false, includeIfNull: false)
  final String? offerId;

  /// How many of `variant_id`. Omitted means one, since a listing page quotes the single unit in front of the buyer. Ignored by the other two sources, which carry their own.
  // minimum: 1
  @JsonKey(name: r'quantity', required: false, includeIfNull: false)
  final int? quantity;

  /// The variant being looked at. Delivery is priced from the *variant's* package details, not the listing's: one listing can hold an 80 g charger and a 2 kg one.
  @JsonKey(name: r'variant_id', required: false, includeIfNull: false)
  final String? variantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingQuotesRequest &&
          other.contactId == contactId &&
          other.draftId == draftId &&
          other.lines == lines &&
          other.offerId == offerId &&
          other.quantity == quantity &&
          other.variantId == variantId;

  @override
  int get hashCode =>
      contactId.hashCode +
      draftId.hashCode +
      lines.hashCode +
      offerId.hashCode +
      quantity.hashCode +
      variantId.hashCode;

  factory ShippingQuotesRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuotesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQuotesRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
