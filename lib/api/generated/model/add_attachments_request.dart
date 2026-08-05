//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_attachments_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddAttachmentsRequest {
  /// Returns a new [AddAttachmentsRequest] instance.
  AddAttachmentsRequest({required this.attachments});

  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final List<String> attachments;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddAttachmentsRequest && other.attachments == attachments;

  @override
  int get hashCode => attachments.hashCode;

  factory AddAttachmentsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAttachmentsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddAttachmentsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
