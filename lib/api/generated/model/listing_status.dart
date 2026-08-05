//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Lifecycle and moderation in one column. `hidden` is a live listing the seller took down for now; deletion is a separate flag entirely.
enum ListingStatus {
  /// Lifecycle and moderation in one column. `hidden` is a live listing the seller took down for now; deletion is a separate flag entirely.
  @JsonValue(r'draft')
  draft(r'draft'),

  /// Lifecycle and moderation in one column. `hidden` is a live listing the seller took down for now; deletion is a separate flag entirely.
  @JsonValue(r'pending')
  pending(r'pending'),

  /// Lifecycle and moderation in one column. `hidden` is a live listing the seller took down for now; deletion is a separate flag entirely.
  @JsonValue(r'active')
  active(r'active'),

  /// Lifecycle and moderation in one column. `hidden` is a live listing the seller took down for now; deletion is a separate flag entirely.
  @JsonValue(r'hidden')
  hidden(r'hidden');

  const ListingStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
