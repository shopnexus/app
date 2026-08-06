//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'decline_order_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeclineOrderRequest {
  /// Returns a new [DeclineOrderRequest] instance.
  DeclineOrderRequest({required this.reason});

  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeclineOrderRequest && other.reason == reason;

  @override
  int get hashCode => reason.hashCode;

  factory DeclineOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$DeclineOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeclineOrderRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
