//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Derived from the timestamps rather than stored. `awaiting-confirmation` is a paid order the seller has not accepted: nothing has been handed to a carrier, and it is where every sale starts. `open` is accepted and in flight. The last two are the outcomes, and they are the predicate of the partial indexes behind this filter.
enum OrderState {
  /// Derived from the timestamps rather than stored. `awaiting-confirmation` is a paid order the seller has not accepted: nothing has been handed to a carrier, and it is where every sale starts. `open` is accepted and in flight. The last two are the outcomes, and they are the predicate of the partial indexes behind this filter.
  @JsonValue(r'awaiting-confirmation')
  awaitingConfirmation(r'awaiting-confirmation'),

  /// Derived from the timestamps rather than stored. `awaiting-confirmation` is a paid order the seller has not accepted: nothing has been handed to a carrier, and it is where every sale starts. `open` is accepted and in flight. The last two are the outcomes, and they are the predicate of the partial indexes behind this filter.
  @JsonValue(r'open')
  open(r'open'),

  /// Derived from the timestamps rather than stored. `awaiting-confirmation` is a paid order the seller has not accepted: nothing has been handed to a carrier, and it is where every sale starts. `open` is accepted and in flight. The last two are the outcomes, and they are the predicate of the partial indexes behind this filter.
  @JsonValue(r'completed')
  completed(r'completed'),

  /// Derived from the timestamps rather than stored. `awaiting-confirmation` is a paid order the seller has not accepted: nothing has been handed to a carrier, and it is where every sale starts. `open` is accepted and in flight. The last two are the outcomes, and they are the predicate of the partial indexes behind this filter.
  @JsonValue(r'cancelled')
  cancelled(r'cancelled');

  const OrderState(this.value);

  final String value;

  @override
  String toString() => value;
}
