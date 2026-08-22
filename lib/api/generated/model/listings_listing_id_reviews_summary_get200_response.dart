//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_listing_id_reviews_summary_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsListingIDReviewsSummaryGet200Response {
  /// Returns a new [ListingsListingIDReviewsSummaryGet200Response] instance.
  ListingsListingIDReviewsSummaryGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final ReviewSummary data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingsListingIDReviewsSummaryGet200Response &&
          other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ListingsListingIDReviewsSummaryGet200Response.fromJson(
    Map<String, dynamic> json,
  ) => _$ListingsListingIDReviewsSummaryGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListingsListingIDReviewsSummaryGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
