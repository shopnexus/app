//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_message_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateMessageRequest {
  /// Returns a new [UpdateMessageRequest] instance.
  UpdateMessageRequest({required this.body});

  @JsonKey(name: r'body', required: true, includeIfNull: false)
  final String body;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateMessageRequest && other.body == body;

  @override
  int get hashCode => body.hashCode;

  factory UpdateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
