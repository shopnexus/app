//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote_review_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoteReviewRequest {
  /// Returns a new [VoteReviewRequest] instance.
  VoteReviewRequest({required this.vote});

  /// Helpful or not. There is no neutral value — withdrawing a vote is a delete.
  @JsonKey(name: r'vote', required: true, includeIfNull: false)
  final VoteReviewRequestVoteEnum vote;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteReviewRequest && other.vote == vote;

  @override
  int get hashCode => vote.hashCode;

  factory VoteReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$VoteReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VoteReviewRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Helpful or not. There is no neutral value — withdrawing a vote is a delete.
enum VoteReviewRequestVoteEnum {
  /// Helpful or not. There is no neutral value — withdrawing a vote is a delete.
  @JsonValue(-1)
  numberNegative1('-1'),

  /// Helpful or not. There is no neutral value — withdrawing a vote is a delete.
  @JsonValue(1)
  number1('1');

  const VoteReviewRequestVoteEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
