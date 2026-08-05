//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// The kind of choice. `payment` is the rails a payment session may be tendered on, `transport` the carriers a parcel may be sent with. Both are user-visible; a category added later may be staff-only, and answers 404 to anyone else.
enum OptionCategoryName {
  /// The kind of choice. `payment` is the rails a payment session may be tendered on, `transport` the carriers a parcel may be sent with. Both are user-visible; a category added later may be staff-only, and answers 404 to anyone else.
  @JsonValue(r'payment')
  payment(r'payment'),

  /// The kind of choice. `payment` is the rails a payment session may be tendered on, `transport` the carriers a parcel may be sent with. Both are user-visible; a category added later may be staff-only, and answers 404 to anyone else.
  @JsonValue(r'transport')
  transport(r'transport');

  const OptionCategoryName(this.value);

  final String value;

  @override
  String toString() => value;
}
