//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_bucket.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RatingBucket {
  /// Returns a new [RatingBucket] instance.
  RatingBucket({required this.count, required this.rating});

  // minimum: 0
  @JsonKey(name: r'count', required: true, includeIfNull: false)
  final int count;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final int rating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingBucket && other.count == count && other.rating == rating;

  @override
  int get hashCode => count.hashCode + rating.hashCode;

  factory RatingBucket.fromJson(Map<String, dynamic> json) =>
      _$RatingBucketFromJson(json);

  Map<String, dynamic> toJson() => _$RatingBucketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
