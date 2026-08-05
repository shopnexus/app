// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolve_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResolveTicketRequest _$ResolveTicketRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResolveTicketRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['action_taken']);
  final val = ResolveTicketRequest(
    actionTaken: $checkedConvert(
      'action_taken',
      (v) => $enumDecode(_$TicketResolutionActionEnumMap, v),
    ),
    note: $checkedConvert('note', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'actionTaken': 'action_taken'});

Map<String, dynamic> _$ResolveTicketRequestToJson(
  ResolveTicketRequest instance,
) => <String, dynamic>{
  'action_taken': _$TicketResolutionActionEnumMap[instance.actionTaken]!,
  'note': ?instance.note,
};

const _$TicketResolutionActionEnumMap = {
  TicketResolutionAction.none: 'none',
  TicketResolutionAction.listingRemoved: 'listing-removed',
  TicketResolutionAction.messageRemoved: 'message-removed',
  TicketResolutionAction.accountSuspended: 'account-suspended',
  TicketResolutionAction.warning: 'warning',
};
