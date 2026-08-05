//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_feedback.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderFeedback {
  /// Returns a new [OrderFeedback] instance.
  OrderFeedback({
    this.mine,

    this.revealAt,

    this.theirs,

    required this.theirsSubmitted,
  });

  @JsonKey(name: r'mine', required: false, includeIfNull: false)
  final Feedback? mine;

  /// When the blind window closes and whatever has been submitted becomes visible, whether or not both sides rated. Null once both are published. Exposed for the same reason the order module exposes its deadlines: a client that cannot count down has to guess.
  @JsonKey(name: r'reveal_at', required: false, includeIfNull: false)
  final DateTime? revealAt;

  /// Present only once published.
  @JsonKey(name: r'theirs', required: false, includeIfNull: false)
  final Feedback? theirs;

  /// Whether the counterparty has rated at all. Shown while their rating is still blind so the caller knows a reveal is coming.
  @JsonKey(name: r'theirs_submitted', required: true, includeIfNull: false)
  final bool theirsSubmitted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderFeedback &&
          other.mine == mine &&
          other.revealAt == revealAt &&
          other.theirs == theirs &&
          other.theirsSubmitted == theirsSubmitted;

  @override
  int get hashCode =>
      (mine == null ? 0 : mine.hashCode) +
      (revealAt == null ? 0 : revealAt.hashCode) +
      (theirs == null ? 0 : theirs.hashCode) +
      theirsSubmitted.hashCode;

  factory OrderFeedback.fromJson(Map<String, dynamic> json) =>
      _$OrderFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$OrderFeedbackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
