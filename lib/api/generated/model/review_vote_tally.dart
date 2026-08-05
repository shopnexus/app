//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_vote_tally.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewVoteTally {
  /// Returns a new [ReviewVoteTally] instance.
  ReviewVoteTally({
    required this.helpful,

    this.myVote,

    required this.notHelpful,
  });

  // minimum: 0
  @JsonKey(name: r'helpful', required: true, includeIfNull: false)
  final int helpful;

  /// The caller's own vote. Null when they have not voted.
  @JsonKey(name: r'my_vote', required: false, includeIfNull: false)
  final ReviewVoteTallyMyVoteEnum? myVote;

  // minimum: 0
  @JsonKey(name: r'not_helpful', required: true, includeIfNull: false)
  final int notHelpful;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewVoteTally &&
          other.helpful == helpful &&
          other.myVote == myVote &&
          other.notHelpful == notHelpful;

  @override
  int get hashCode =>
      helpful.hashCode +
      (myVote == null ? 0 : myVote.hashCode) +
      notHelpful.hashCode;

  factory ReviewVoteTally.fromJson(Map<String, dynamic> json) =>
      _$ReviewVoteTallyFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewVoteTallyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// The caller's own vote. Null when they have not voted.
enum ReviewVoteTallyMyVoteEnum {
  /// The caller's own vote. Null when they have not voted.
  @JsonValue(-1)
  numberNegative1('-1'),

  /// The caller's own vote. Null when they have not voted.
  @JsonValue(1)
  number1('1');

  const ReviewVoteTallyMyVoteEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
