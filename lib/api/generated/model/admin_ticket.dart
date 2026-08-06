//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_ticket.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTicket {
  /// Returns a new [AdminTicket] instance.
  AdminTicket({
    required this.assignee,

    required this.openTicketsAgainstTarget,

    required this.requester,

    required this.resolvedBy,

    required this.target,

    required this.ticket,
  });

  /// The moderator working it. Staff-only, and null until it is claimed.
  @JsonKey(name: r'assignee', required: true, includeIfNull: true)
  final AccountSummary? assignee;

  /// How many other unresolved tickets name the same target. A pattern is what a decision rests on rather than a single complaint.
  // minimum: 0
  @JsonKey(
    name: r'open_tickets_against_target',
    required: true,
    includeIfNull: false,
  )
  final int openTicketsAgainstTarget;

  @JsonKey(name: r'requester', required: true, includeIfNull: false)
  final AccountSummary requester;

  @JsonKey(name: r'resolved_by', required: true, includeIfNull: true)
  final AccountSummary? resolvedBy;

  /// What the ticket is about, shaped by `ref_type`. Fetched from the module that owns it, and empty once that module no longer has it — a listing already taken down — as well as on a ticket about nothing in particular.
  @JsonKey(name: r'target', required: true, includeIfNull: false)
  final Map<String, Object> target;

  @JsonKey(name: r'ticket', required: true, includeIfNull: false)
  final Ticket ticket;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminTicket &&
          other.assignee == assignee &&
          other.openTicketsAgainstTarget == openTicketsAgainstTarget &&
          other.requester == requester &&
          other.resolvedBy == resolvedBy &&
          other.target == target &&
          other.ticket == ticket;

  @override
  int get hashCode =>
      (assignee == null ? 0 : assignee.hashCode) +
      openTicketsAgainstTarget.hashCode +
      requester.hashCode +
      (resolvedBy == null ? 0 : resolvedBy.hashCode) +
      target.hashCode +
      ticket.hashCode;

  factory AdminTicket.fromJson(Map<String, dynamic> json) =>
      _$AdminTicketFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
