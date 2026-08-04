//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// A `system` message is produced by the backend — an offer was accepted, an order shipped — and belongs to no participant, which is why it has no sender. 
enum MessageType {
          /// A `system` message is produced by the backend — an offer was accepted, an order shipped — and belongs to no participant, which is why it has no sender. 
      @JsonValue(r'user')
      user(r'user'),
          /// A `system` message is produced by the backend — an offer was accepted, an order shipped — and belongs to no participant, which is why it has no sender. 
      @JsonValue(r'system')
      system(r'system');

  const MessageType(this.value);

  final String value;

  @override
  String toString() => value;
}
