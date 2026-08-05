//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Derived from the two outcome timestamps: `open` means neither is set, which is also the predicate of the partial indexes behind this filter.
enum OrderState {
  /// Derived from the two outcome timestamps: `open` means neither is set, which is also the predicate of the partial indexes behind this filter.
  @JsonValue(r'open')
  open(r'open'),

  /// Derived from the two outcome timestamps: `open` means neither is set, which is also the predicate of the partial indexes behind this filter.
  @JsonValue(r'completed')
  completed(r'completed'),

  /// Derived from the two outcome timestamps: `open` means neither is set, which is also the predicate of the partial indexes behind this filter.
  @JsonValue(r'cancelled')
  cancelled(r'cancelled');

  const OrderState(this.value);

  final String value;

  @override
  String toString() => value;
}
