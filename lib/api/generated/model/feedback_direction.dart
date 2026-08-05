//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum FeedbackDirection {
  @JsonValue(r'buyer-to-seller')
  buyerToSeller(r'buyer-to-seller'),
  @JsonValue(r'seller-to-buyer')
  sellerToBuyer(r'seller-to-buyer');

  const FeedbackDirection(this.value);

  final String value;

  @override
  String toString() => value;
}
