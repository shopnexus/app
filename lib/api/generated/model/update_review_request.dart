//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_review_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateReviewRequest {
  /// Returns a new [UpdateReviewRequest] instance.
  UpdateReviewRequest({this.attachments, this.body, this.rating});

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'body', required: false, includeIfNull: false)
  final String? body;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: false, includeIfNull: false)
  final int? rating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateReviewRequest &&
          other.attachments == attachments &&
          other.body == body &&
          other.rating == rating;

  @override
  int get hashCode => attachments.hashCode + body.hashCode + rating.hashCode;

  factory UpdateReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateReviewRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
