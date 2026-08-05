//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// How a sale on this listing starts, and it is the only thing that differs between the two.  `fixed` is bought straight from the listing page: the buyer checks out, pays the item plus the shipping quote, and the order and its shipment exist as soon as the money lands. The seller confirms nothing.  `negotiable` adds a second way to buy without removing the first: the asking price is still a price a buyer can take outright, and the listing page asks which they want. If they haggle, the negotiation is a thread in chat where either side revises the terms, and agreeing freezes them for the same checkout. Either way the seller never approves an order — the only thing they can refuse is a price.
enum PriceMode {
  /// How a sale on this listing starts, and it is the only thing that differs between the two.  `fixed` is bought straight from the listing page: the buyer checks out, pays the item plus the shipping quote, and the order and its shipment exist as soon as the money lands. The seller confirms nothing.  `negotiable` adds a second way to buy without removing the first: the asking price is still a price a buyer can take outright, and the listing page asks which they want. If they haggle, the negotiation is a thread in chat where either side revises the terms, and agreeing freezes them for the same checkout. Either way the seller never approves an order — the only thing they can refuse is a price.
  @JsonValue(r'fixed')
  fixed(r'fixed'),

  /// How a sale on this listing starts, and it is the only thing that differs between the two.  `fixed` is bought straight from the listing page: the buyer checks out, pays the item plus the shipping quote, and the order and its shipment exist as soon as the money lands. The seller confirms nothing.  `negotiable` adds a second way to buy without removing the first: the asking price is still a price a buyer can take outright, and the listing page asks which they want. If they haggle, the negotiation is a thread in chat where either side revises the terms, and agreeing freezes them for the same checkout. Either way the seller never approves an order — the only thing they can refuse is a price.
  @JsonValue(r'negotiable')
  negotiable(r'negotiable');

  const PriceMode(this.value);

  final String value;

  @override
  String toString() => value;
}
