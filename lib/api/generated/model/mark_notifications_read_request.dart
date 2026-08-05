//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mark_notifications_read_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MarkNotificationsReadRequest {
  /// Returns a new [MarkNotificationsReadRequest] instance.
  MarkNotificationsReadRequest({this.before});

  /// Mark everything created at or before this instant read. Omit to mark the whole feed read.
  @JsonKey(name: r'before', required: false, includeIfNull: false)
  final DateTime? before;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkNotificationsReadRequest && other.before == before;

  @override
  int get hashCode => before.hashCode;

  factory MarkNotificationsReadRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationsReadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationsReadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
