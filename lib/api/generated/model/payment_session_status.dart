//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum PaymentSessionStatus {
      @JsonValue(r'pending')
      pending(r'pending'),
      @JsonValue(r'processing')
      processing(r'processing'),
      @JsonValue(r'success')
      success(r'success'),
      @JsonValue(r'cancelled')
      cancelled(r'cancelled'),
      @JsonValue(r'failed')
      failed(r'failed');

  const PaymentSessionStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
