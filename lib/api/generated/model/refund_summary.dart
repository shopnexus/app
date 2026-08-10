//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refund_summary.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RefundSummary {
  /// Returns a new [RefundSummary] instance.
  RefundSummary({
    required this.createdAt,

    required this.id,

    required this.settled,

    required this.status,
  });

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Whether the case has ended. False is what stops another being raised, so this is the question a \"request a refund\" control has to ask — the blocking statuses are an index's, not a list for each client to re-derive.
  @JsonKey(name: r'settled', required: true, includeIfNull: false)
  final bool settled;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final RefundStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefundSummary &&
          other.createdAt == createdAt &&
          other.id == id &&
          other.settled == settled &&
          other.status == status;

  @override
  int get hashCode =>
      createdAt.hashCode + id.hashCode + settled.hashCode + status.hashCode;

  factory RefundSummary.fromJson(Map<String, dynamic> json) =>
      _$RefundSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$RefundSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
