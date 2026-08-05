//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_variant_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateVariantRequest {
  /// Returns a new [UpdateVariantRequest] instance.
  UpdateVariantRequest({
    this.attachments,

    this.attributes,

    this.isFeatured,

    this.packageDetails,

    this.price,

    this.quantity,
  });

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'attributes', required: false, includeIfNull: false)
  final Map<String, Object>? attributes;

  /// True moves the card's variant to this one. False is ignored: which variant is featured is cleared through `clear_featured_variant_id` on the listing, so there is one way to spell it.
  @JsonKey(name: r'is_featured', required: false, includeIfNull: false)
  final bool? isFeatured;

  @JsonKey(name: r'package_details', required: false, includeIfNull: false)
  final Map<String, Object>? packageDetails;

  // minimum: 1
  @JsonKey(name: r'price', required: false, includeIfNull: false)
  final int? price;

  /// The new total on hand. Refused below `reserved + sold`.
  // minimum: 0
  @JsonKey(name: r'quantity', required: false, includeIfNull: false)
  final int? quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateVariantRequest &&
          other.attachments == attachments &&
          other.attributes == attributes &&
          other.isFeatured == isFeatured &&
          other.packageDetails == packageDetails &&
          other.price == price &&
          other.quantity == quantity;

  @override
  int get hashCode =>
      attachments.hashCode +
      attributes.hashCode +
      isFeatured.hashCode +
      packageDetails.hashCode +
      price.hashCode +
      quantity.hashCode;

  factory UpdateVariantRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateVariantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateVariantRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
