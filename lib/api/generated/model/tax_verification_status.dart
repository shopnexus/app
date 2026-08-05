//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum TaxVerificationStatus {
  @JsonValue(r'pending')
  pending(r'pending'),
  @JsonValue(r'verified')
  verified(r'verified'),
  @JsonValue(r'rejected')
  rejected(r'rejected');

  const TaxVerificationStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
