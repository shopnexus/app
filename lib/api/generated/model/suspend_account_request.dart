//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suspend_account_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuspendAccountRequest {
  /// Returns a new [SuspendAccountRequest] instance.
  SuspendAccountRequest({required this.reason, this.until});

  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  /// Omit for a permanent suspension.
  @JsonKey(name: r'until', required: false, includeIfNull: false)
  final DateTime? until;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuspendAccountRequest &&
          other.reason == reason &&
          other.until == until;

  @override
  int get hashCode => reason.hashCode + until.hashCode;

  factory SuspendAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$SuspendAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SuspendAccountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
