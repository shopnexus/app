//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
enum TicketAction {
  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'none')
  none(r'none'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'listing-removed')
  listingRemoved(r'listing-removed'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'message-removed')
  messageRemoved(r'message-removed'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'account-suspended')
  accountSuspended(r'account-suspended'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'warning')
  warning(r'warning'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'refund-granted')
  refundGranted(r'refund-granted'),

  /// What was done about it. `none` is a ticket read and answered with nothing done — the turn-down, which is why it is a value here and not a second status. The two `refund-*` ones are written by order's verdict route and are not in the set `POST /admin/tickets/{id}/resolution` accepts — see `TicketResolutionAction`.
  @JsonValue(r'refund-refused')
  refundRefused(r'refund-refused');

  const TicketAction(this.value);

  final String value;

  @override
  String toString() => value;
}
