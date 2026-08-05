//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_reason.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_ticket_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OpenTicketRequest {
  /// Returns a new [OpenTicketRequest] instance.
  OpenTicketRequest({
    this.attachments,

    this.body,

    required this.kind,

    this.reason,

    this.refId,

    required this.subject,
  });

  /// Confirmed uploads, posted as the opening message's images.
  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  /// The first message of the thread, not a column on the ticket.
  @JsonKey(name: r'body', required: false, includeIfNull: false)
  final String? body;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final TicketKind kind;

  /// Report kinds only.
  @JsonKey(name: r'reason', required: false, includeIfNull: false)
  final TicketReason? reason;

  /// Required for the kinds that are about something, refused for the others.
  @JsonKey(name: r'ref_id', required: false, includeIfNull: false)
  final String? refId;

  @JsonKey(name: r'subject', required: true, includeIfNull: false)
  final String subject;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpenTicketRequest &&
          other.attachments == attachments &&
          other.body == body &&
          other.kind == kind &&
          other.reason == reason &&
          other.refId == refId &&
          other.subject == subject;

  @override
  int get hashCode =>
      attachments.hashCode +
      body.hashCode +
      kind.hashCode +
      reason.hashCode +
      refId.hashCode +
      subject.hashCode;

  factory OpenTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$OpenTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpenTicketRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
