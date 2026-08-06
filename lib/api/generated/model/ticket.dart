//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_reason.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_ref_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_action.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Ticket {
  /// Returns a new [Ticket] instance.
  Ticket({
    required this.actionTaken,

    required this.conversationId,

    required this.createdAt,

    required this.id,

    required this.kind,

    required this.reason,

    required this.refId,

    required this.refType,

    required this.resolutionNote,

    required this.resolvedAt,

    required this.status,

    required this.subject,
  });

  /// Null until the ticket is resolved.
  @JsonKey(name: r'action_taken', required: true, includeIfNull: true)
  final TicketAction? actionTaken;

  /// The thread this ticket is discussed in — where the requester's own words went and where support answers. Null only between the row being written and the thread being opened; reading the ticket repairs it.
  @JsonKey(name: r'conversation_id', required: true, includeIfNull: true)
  final String? conversationId;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final TicketKind kind;

  @JsonKey(name: r'reason', required: true, includeIfNull: true)
  final TicketReason? reason;

  /// Opaque id of what the ticket is about, kinded by `ref_type`. Null on a ticket about nothing in particular.
  @JsonKey(name: r'ref_id', required: true, includeIfNull: true)
  final String? refId;

  @JsonKey(name: r'ref_type', required: true, includeIfNull: true)
  final TicketRefType? refType;

  @JsonKey(name: r'resolution_note', required: true, includeIfNull: true)
  final String? resolutionNote;

  @JsonKey(name: r'resolved_at', required: true, includeIfNull: true)
  final DateTime? resolvedAt;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final TicketStatus status;

  @JsonKey(name: r'subject', required: true, includeIfNull: false)
  final String subject;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ticket &&
          other.actionTaken == actionTaken &&
          other.conversationId == conversationId &&
          other.createdAt == createdAt &&
          other.id == id &&
          other.kind == kind &&
          other.reason == reason &&
          other.refId == refId &&
          other.refType == refType &&
          other.resolutionNote == resolutionNote &&
          other.resolvedAt == resolvedAt &&
          other.status == status &&
          other.subject == subject;

  @override
  int get hashCode =>
      (actionTaken == null ? 0 : actionTaken.hashCode) +
      (conversationId == null ? 0 : conversationId.hashCode) +
      createdAt.hashCode +
      id.hashCode +
      kind.hashCode +
      (reason == null ? 0 : reason.hashCode) +
      (refId == null ? 0 : refId.hashCode) +
      (refType == null ? 0 : refType.hashCode) +
      (resolutionNote == null ? 0 : resolutionNote.hashCode) +
      (resolvedAt == null ? 0 : resolvedAt.hashCode) +
      status.hashCode +
      subject.hashCode;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
