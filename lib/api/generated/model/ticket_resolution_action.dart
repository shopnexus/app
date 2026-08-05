//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
enum TicketResolutionAction {
  /// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
  @JsonValue(r'none')
  none(r'none'),

  /// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
  @JsonValue(r'listing-removed')
  listingRemoved(r'listing-removed'),

  /// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
  @JsonValue(r'message-removed')
  messageRemoved(r'message-removed'),

  /// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
  @JsonValue(r'account-suspended')
  accountSuspended(r'account-suspended'),

  /// What a moderator may record by hand. Narrower than the ticket's own `action_taken`, which also has the two `refund-*` values: those are written by order's verdict route, because that is where the money moves. Sending one here is a 400 on the field.
  @JsonValue(r'warning')
  warning(r'warning');

  const TicketResolutionAction(this.value);

  final String value;

  @override
  String toString() => value;
}
