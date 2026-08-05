//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/feedback_direction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Feedback {
  /// Returns a new [Feedback] instance.
  Feedback({
    required this.comment,

    required this.createdAt,

    required this.direction,

    required this.id,

    required this.orderId,

    this.publishedAt,

    required this.rateeId,

    required this.rater,

    required this.rating,
  });

  @JsonKey(name: r'comment', required: true, includeIfNull: false)
  final String comment;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'direction', required: true, includeIfNull: false)
  final FeedbackDirection direction;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'order_id', required: true, includeIfNull: false)
  final String orderId;

  /// Null while the rating is still blind. Only published feedback is visible to anyone but its author and counted towards reputation.
  @JsonKey(name: r'published_at', required: false, includeIfNull: false)
  final DateTime? publishedAt;

  @JsonKey(name: r'ratee_id', required: true, includeIfNull: false)
  final String rateeId;

  @JsonKey(name: r'rater', required: true, includeIfNull: false)
  final AccountSummary rater;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final int rating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feedback &&
          other.comment == comment &&
          other.createdAt == createdAt &&
          other.direction == direction &&
          other.id == id &&
          other.orderId == orderId &&
          other.publishedAt == publishedAt &&
          other.rateeId == rateeId &&
          other.rater == rater &&
          other.rating == rating;

  @override
  int get hashCode =>
      comment.hashCode +
      createdAt.hashCode +
      direction.hashCode +
      id.hashCode +
      orderId.hashCode +
      (publishedAt == null ? 0 : publishedAt.hashCode) +
      rateeId.hashCode +
      rater.hashCode +
      rating.hashCode;

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
