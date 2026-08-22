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

  /// A resource already on the case is ignored rather than refused, and so is one named twice here. A client topping up has not necessarily re-read the case, so resubmitting is not an error — it just leaves the case as it was. The ten is counted over the whole case, not over this batch: a top-up is not a way around the limit a submission is held to. A batch that would take the case past ten is refused whole, and one that only repeats what is already there is accepted however full the case is, because it adds nothing.
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
