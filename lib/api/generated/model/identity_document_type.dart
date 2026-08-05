//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum IdentityDocumentType {
  @JsonValue(r'national-id')
  nationalId(r'national-id'),
  @JsonValue(r'passport')
  passport(r'passport'),
  @JsonValue(r'driver-license')
  driverLicense(r'driver-license');

  const IdentityDocumentType(this.value);

  final String value;

  @override
  String toString() => value;
}
