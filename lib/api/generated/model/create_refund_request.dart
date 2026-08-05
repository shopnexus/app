//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_refund_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateRefundRequest {
  /// Returns a new [CreateRefundRequest] instance.
  CreateRefundRequest({this.attachments, required this.reason});

  /// Evidence, and it can be topped up until the case closes.
  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateRefundRequest &&
          other.attachments == attachments &&
          other.reason == reason;

  @override
  int get hashCode => attachments.hashCode + reason.hashCode;

  factory CreateRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRefundRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRefundRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
