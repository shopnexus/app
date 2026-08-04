//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `active` — a proposal waiting for the other side. `accepted` — agreed, the price frozen for a short window while the buyer creates the order. `checked-out` — the buyer's payment session is open, so these terms are off the table. `cancelled` — withdrawn or lapsed. 
enum OfferStatus {
          /// `active` — a proposal waiting for the other side. `accepted` — agreed, the price frozen for a short window while the buyer creates the order. `checked-out` — the buyer's payment session is open, so these terms are off the table. `cancelled` — withdrawn or lapsed. 
      @JsonValue(r'active')
      active(r'active'),
          /// `active` — a proposal waiting for the other side. `accepted` — agreed, the price frozen for a short window while the buyer creates the order. `checked-out` — the buyer's payment session is open, so these terms are off the table. `cancelled` — withdrawn or lapsed. 
      @JsonValue(r'accepted')
      accepted(r'accepted'),
          /// `active` — a proposal waiting for the other side. `accepted` — agreed, the price frozen for a short window while the buyer creates the order. `checked-out` — the buyer's payment session is open, so these terms are off the table. `cancelled` — withdrawn or lapsed. 
      @JsonValue(r'checked-out')
      checkedOut(r'checked-out'),
          /// `active` — a proposal waiting for the other side. `accepted` — agreed, the price frozen for a short window while the buyer creates the order. `checked-out` — the buyer's payment session is open, so these terms are off the table. `cancelled` — withdrawn or lapsed. 
      @JsonValue(r'cancelled')
      cancelled(r'cancelled');

  const OfferStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
