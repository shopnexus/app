//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `reviewing` is claimed by a moderator; `resolved` carries `action_taken`, which is where a turn-down lives as the value `none`.
enum TicketStatus {
  /// `reviewing` is claimed by a moderator; `resolved` carries `action_taken`, which is where a turn-down lives as the value `none`.
  @JsonValue(r'open')
  open(r'open'),

  /// `reviewing` is claimed by a moderator; `resolved` carries `action_taken`, which is where a turn-down lives as the value `none`.
  @JsonValue(r'reviewing')
  reviewing(r'reviewing'),

  /// `reviewing` is claimed by a moderator; `resolved` carries `action_taken`, which is where a turn-down lives as the value `none`.
  @JsonValue(r'resolved')
  resolved(r'resolved');

  const TicketStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
