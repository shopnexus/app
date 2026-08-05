//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_feedback_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubmitFeedbackRequest {
  /// Returns a new [SubmitFeedbackRequest] instance.
  SubmitFeedbackRequest({this.comment, required this.rating});

  @JsonKey(name: r'comment', required: false, includeIfNull: false)
  final String? comment;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final int rating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmitFeedbackRequest &&
          other.comment == comment &&
          other.rating == rating;

  @override
  int get hashCode => comment.hashCode + rating.hashCode;

  factory SubmitFeedbackRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitFeedbackRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
