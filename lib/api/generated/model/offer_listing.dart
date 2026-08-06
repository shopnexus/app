//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_listing.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OfferListing {
  /// Returns a new [OfferListing] instance.
  OfferListing({required this.cover, required this.name});

  /// Null on a listing with no photo.
  @JsonKey(name: r'cover', required: true, includeIfNull: true)
  final Resource? cover;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferListing && other.cover == cover && other.name == name;

  @override
  int get hashCode => (cover == null ? 0 : cover.hashCode) + name.hashCode;

  factory OfferListing.fromJson(Map<String, dynamic> json) =>
      _$OfferListingFromJson(json);

  Map<String, dynamic> toJson() => _$OfferListingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
