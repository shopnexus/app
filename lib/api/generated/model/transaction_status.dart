//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// A leg goes pending → success or failed, and success is terminal. Deliberately narrower than a session's status.
enum TransactionStatus {
  /// A leg goes pending → success or failed, and success is terminal. Deliberately narrower than a session's status.
  @JsonValue(r'pending')
  pending(r'pending'),

  /// A leg goes pending → success or failed, and success is terminal. Deliberately narrower than a session's status.
  @JsonValue(r'success')
  success(r'success'),

  /// A leg goes pending → success or failed, and success is terminal. Deliberately narrower than a session's status.
  @JsonValue(r'failed')
  failed(r'failed');

  const TransactionStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
