//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/rating_bucket.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_summary.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewSummary {
  /// Returns a new [ReviewSummary] instance.
  ReviewSummary({
    required this.breakdown,

    required this.listingId,

    required this.rating,

    required this.reviewCount,

    required this.withMediaCount,
  });

  /// Always five buckets, five stars first, zeros included. A rating with no one-star reviews still has a one-star row: a client that has to invent the missing ones cannot draw the same chart twice.
  @JsonKey(name: r'breakdown', required: true, includeIfNull: false)
  final List<RatingBucket> breakdown;

  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  // minimum: 0
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final double rating;

  // minimum: 0
  @JsonKey(name: r'review_count', required: true, includeIfNull: false)
  final int reviewCount;

  /// How many carry at least one attachment — the count beside the \"with photos\" filter, which the list route takes as `media=true`.
  // minimum: 0
  @JsonKey(name: r'with_media_count', required: true, includeIfNull: false)
  final int withMediaCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewSummary &&
          other.breakdown == breakdown &&
          other.listingId == listingId &&
          other.rating == rating &&
          other.reviewCount == reviewCount &&
          other.withMediaCount == withMediaCount;

  @override
  int get hashCode =>
      breakdown.hashCode +
      listingId.hashCode +
      rating.hashCode +
      reviewCount.hashCode +
      withMediaCount.hashCode;

  factory ReviewSummary.fromJson(Map<String, dynamic> json) =>
      _$ReviewSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
