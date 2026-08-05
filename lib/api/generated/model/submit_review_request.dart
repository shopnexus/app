//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_review_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubmitReviewRequest {
  /// Returns a new [SubmitReviewRequest] instance.
  SubmitReviewRequest({
    this.attachments,

    this.body,

    required this.orderId,

    required this.rating,
  });

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'body', required: false, includeIfNull: false)
  final String? body;

  @JsonKey(name: r'order_id', required: true, includeIfNull: false)
  final String orderId;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final int rating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmitReviewRequest &&
          other.attachments == attachments &&
          other.body == body &&
          other.orderId == orderId &&
          other.rating == rating;

  @override
  int get hashCode =>
      attachments.hashCode + body.hashCode + orderId.hashCode + rating.hashCode;

  factory SubmitReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitReviewRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
