//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/page_meta.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_page.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingPage {
  /// Returns a new [ListingPage] instance.
  ListingPage({required this.data, required this.meta});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Listing> data;

  @JsonKey(name: r'meta', required: true, includeIfNull: false)
  final PageMeta meta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingPage && other.data == data && other.meta == meta;

  @override
  int get hashCode => data.hashCode + meta.hashCode;

  factory ListingPage.fromJson(Map<String, dynamic> json) =>
      _$ListingPageFromJson(json);

  Map<String, dynamic> toJson() => _$ListingPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
