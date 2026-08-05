//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/reputation_role.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reputation.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Reputation {
  /// Returns a new [Reputation] instance.
  Reputation({
    required this.accountId,

    required this.cancelledOrders,

    required this.completedOrders,

    required this.ratingAverage,

    required this.ratingCount,

    required this.reviewRatingAverage,

    required this.reviewRatingCount,

    required this.role,

    required this.updatedAt,
  });

  @JsonKey(name: r'account_id', required: true, includeIfNull: false)
  final String accountId;

  // minimum: 0
  @JsonKey(name: r'cancelled_orders', required: true, includeIfNull: false)
  final int cancelledOrders;

  // minimum: 0
  @JsonKey(name: r'completed_orders', required: true, includeIfNull: false)
  final int completedOrders;

  /// Average transaction feedback from 1 to 5. Zero when there is none.
  // minimum: 0
  // maximum: 5
  @JsonKey(name: r'rating_average', required: true, includeIfNull: false)
  final double ratingAverage;

  // minimum: 0
  @JsonKey(name: r'rating_count', required: true, includeIfNull: false)
  final int ratingCount;

  /// Average product-review rating. Always zero for the buyer role.
  // minimum: 0
  // maximum: 5
  @JsonKey(name: r'review_rating_average', required: true, includeIfNull: false)
  final double reviewRatingAverage;

  // minimum: 0
  @JsonKey(name: r'review_rating_count', required: true, includeIfNull: false)
  final int reviewRatingCount;

  @JsonKey(name: r'role', required: true, includeIfNull: false)
  final ReputationRole role;

  /// When it was last recomputed.
  @JsonKey(name: r'updated_at', required: true, includeIfNull: false)
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reputation &&
          other.accountId == accountId &&
          other.cancelledOrders == cancelledOrders &&
          other.completedOrders == completedOrders &&
          other.ratingAverage == ratingAverage &&
          other.ratingCount == ratingCount &&
          other.reviewRatingAverage == reviewRatingAverage &&
          other.reviewRatingCount == reviewRatingCount &&
          other.role == role &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      accountId.hashCode +
      cancelledOrders.hashCode +
      completedOrders.hashCode +
      ratingAverage.hashCode +
      ratingCount.hashCode +
      reviewRatingAverage.hashCode +
      reviewRatingCount.hashCode +
      role.hashCode +
      updatedAt.hashCode;

  factory Reputation.fromJson(Map<String, dynamic> json) =>
      _$ReputationFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
