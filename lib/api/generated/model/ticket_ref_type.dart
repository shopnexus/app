//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
enum TicketRefType {
  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'listing')
  listing(r'listing'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'account')
  account(r'account'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'message')
  message(r'message'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'review')
  review(r'review'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'review-reply')
  reviewReply(r'review-reply'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'order')
  order(r'order'),

  /// What kind of thing `ref_id` names. Follows from `kind`, never sent by a client.
  @JsonValue(r'refund')
  refund(r'refund');

  const TicketRefType(this.value);

  final String value;

  @override
  String toString() => value;
}
