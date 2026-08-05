//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
enum NotificationCategory {
  /// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
  @JsonValue(r'order')
  order(r'order'),

  /// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
  @JsonValue(r'promotion')
  promotion(r'promotion'),

  /// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
  @JsonValue(r'system')
  system(r'system'),

  /// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
  @JsonValue(r'chat')
  chat(r'chat'),

  /// Also the preference key, which is why it is an enum — a typo would read as no preference and quietly send anyway.
  @JsonValue(r'social')
  social(r'social');

  const NotificationCategory(this.value);

  final String value;

  @override
  String toString() => value;
}
