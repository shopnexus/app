//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum NotificationChannel {
      @JsonValue(r'in-app')
      inApp(r'in-app'),
      @JsonValue(r'push')
      push(r'push'),
      @JsonValue(r'email')
      email(r'email'),
      @JsonValue(r'sms')
      sms(r'sms');

  const NotificationChannel(this.value);

  final String value;

  @override
  String toString() => value;
}
