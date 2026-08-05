//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderItem {
  /// Returns a new [OrderItem] instance.
  OrderItem({
    this.cancelledAt,

    required this.createdAt,

    required this.currency,

    required this.id,

    required this.listingId,

    this.note,

    this.orderId,

    required this.paymentSessionId,

    required this.quantity,

    required this.sellerId,

    required this.totalAmount,

    required this.transportOption,

    required this.variantId,
  });

  @JsonKey(name: r'cancelled_at', required: false, includeIfNull: false)
  final DateTime? cancelledAt;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// The listing the variant belongs to, denormalized the same way `seller_id` is, so order history can resolve it through `GET /listings?ids=` — which answers for a listing the seller has since hidden or deleted.
  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  /// Buyer note, per checkout
  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  /// Null until the payment session completes and the webhook writes the order. Nobody confirms it — a seller can refuse a price, never a sale.
  @JsonKey(name: r'order_id', required: false, includeIfNull: false)
  final String? orderId;

  /// The single session covering every line of this checkout.
  @JsonKey(name: r'payment_session_id', required: true, includeIfNull: false)
  final String paymentSessionId;

  // minimum: 1
  @JsonKey(name: r'quantity', required: true, includeIfNull: false)
  final int quantity;

  @JsonKey(name: r'seller_id', required: true, includeIfNull: false)
  final String sellerId;

  /// Paid amount in the smallest unit of `currency`
  // minimum: 0
  @JsonKey(name: r'total_amount', required: true, includeIfNull: false)
  final int totalAmount;

  /// An enabled transport option's slug
  @JsonKey(name: r'transport_option', required: true, includeIfNull: false)
  final String transportOption;

  @JsonKey(name: r'variant_id', required: true, includeIfNull: false)
  final String variantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItem &&
          other.cancelledAt == cancelledAt &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.id == id &&
          other.listingId == listingId &&
          other.note == note &&
          other.orderId == orderId &&
          other.paymentSessionId == paymentSessionId &&
          other.quantity == quantity &&
          other.sellerId == sellerId &&
          other.totalAmount == totalAmount &&
          other.transportOption == transportOption &&
          other.variantId == variantId;

  @override
  int get hashCode =>
      (cancelledAt == null ? 0 : cancelledAt.hashCode) +
      createdAt.hashCode +
      currency.hashCode +
      id.hashCode +
      listingId.hashCode +
      note.hashCode +
      (orderId == null ? 0 : orderId.hashCode) +
      paymentSessionId.hashCode +
      quantity.hashCode +
      sellerId.hashCode +
      totalAmount.hashCode +
      transportOption.hashCode +
      variantId.hashCode;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
