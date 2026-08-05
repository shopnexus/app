//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_listing_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateListingRequest {
  /// Returns a new [UpdateListingRequest] instance.
  UpdateListingRequest({
    this.attachments,

    this.categoryId,

    this.clearFeaturedVariantId,

    this.condition,

    this.description,

    this.featuredVariantId,

    this.name,

    this.priceMode,

    this.specifications,

    this.tags,
  });

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'category_id', required: false, includeIfNull: false)
  final String? categoryId;

  /// Leaves the listing with no featured variant; the card then shows the cheapest one.
  @JsonKey(
    name: r'clear_featured_variant_id',
    required: false,
    includeIfNull: false,
  )
  final bool? clearFeaturedVariantId;

  @JsonKey(name: r'condition', required: false, includeIfNull: false)
  final ListingCondition? condition;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @JsonKey(name: r'featured_variant_id', required: false, includeIfNull: false)
  final String? featuredVariantId;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'price_mode', required: false, includeIfNull: false)
  final PriceMode? priceMode;

  @JsonKey(name: r'specifications', required: false, includeIfNull: false)
  final Map<String, Object>? specifications;

  @JsonKey(name: r'tags', required: false, includeIfNull: false)
  final List<String>? tags;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateListingRequest &&
          other.attachments == attachments &&
          other.categoryId == categoryId &&
          other.clearFeaturedVariantId == clearFeaturedVariantId &&
          other.condition == condition &&
          other.description == description &&
          other.featuredVariantId == featuredVariantId &&
          other.name == name &&
          other.priceMode == priceMode &&
          other.specifications == specifications &&
          other.tags == tags;

  @override
  int get hashCode =>
      attachments.hashCode +
      categoryId.hashCode +
      clearFeaturedVariantId.hashCode +
      condition.hashCode +
      description.hashCode +
      featuredVariantId.hashCode +
      name.hashCode +
      priceMode.hashCode +
      specifications.hashCode +
      tags.hashCode;

  factory UpdateListingRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateListingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateListingRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
