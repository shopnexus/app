//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TaxCodeType {
      @JsonValue(r'individual')
      individual(r'individual'),
      @JsonValue(r'business')
      business(r'business'),
      @JsonValue(r'household')
      household(r'household');

  const TaxCodeType(this.value);

  final String value;

  @override
  String toString() => value;
}
