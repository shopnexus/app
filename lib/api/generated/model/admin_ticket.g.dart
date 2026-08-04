// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTicket _$AdminTicketFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AdminTicket',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'open_tickets_against_target',
        'requester',
        'ticket',
      ],
    );
    final val = AdminTicket(
      assignee: $checkedConvert(
        'assignee',
        (v) => v == null
            ? null
            : AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      openTicketsAgainstTarget: $checkedConvert(
        'open_tickets_against_target',
        (v) => (v as num).toInt(),
      ),
      requester: $checkedConvert(
        'requester',
        (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      resolvedBy: $checkedConvert(
        'resolved_by',
        (v) => v == null
            ? null
            : AccountSummary.fromJson(v as Map<String, dynamic>),
      ),
      target: $checkedConvert(
        'target',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      ticket: $checkedConvert(
        'ticket',
        (v) => Ticket.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'openTicketsAgainstTarget': 'open_tickets_against_target',
    'resolvedBy': 'resolved_by',
  },
);

Map<String, dynamic> _$AdminTicketToJson(AdminTicket instance) =>
    <String, dynamic>{
      'assignee': ?instance.assignee?.toJson(),
      'open_tickets_against_target': instance.openTicketsAgainstTarget,
      'requester': instance.requester.toJson(),
      'resolved_by': ?instance.resolvedBy?.toJson(),
      'target': ?instance.target,
      'ticket': instance.ticket.toJson(),
    };
