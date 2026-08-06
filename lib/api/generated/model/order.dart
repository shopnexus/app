//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_address_snapshot.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Order {
  /// Returns a new [Order] instance.
  Order({
    required this.address,

    required this.buyer,

    required this.cancelledAt,

    required this.completedAt,

    required this.confirmationDeadlineAt,

    required this.confirmedAt,

    required this.createdAt,

    required this.currency,

    required this.declineReason,

    required this.draftId,

    required this.id,

    required this.items,

    required this.offerId,

    required this.payoutDeadlineAt,

    required this.payoutReleasedAt,

    required this.pickupAddress,

    required this.receiptAttachments,

    required this.receivedAt,

    required this.seller,

    required this.state,

    required this.total,

    required this.transport,
  });

  @JsonKey(name: r'address', required: true, includeIfNull: false)
  final OrderAddressSnapshot address;

  @JsonKey(name: r'buyer', required: true, includeIfNull: false)
  final AccountSummary buyer;

  @JsonKey(name: r'cancelled_at', required: true, includeIfNull: true)
  final DateTime? cancelledAt;

  /// Set when the payout is claimed
  @JsonKey(name: r'completed_at', required: true, includeIfNull: true)
  final DateTime? completedAt;

  /// `created_at` + 48h, computed rather than stored. Staff are asked to chase the seller past this point; the sale is not voided, because neither the money nor the goods are the platform's to dispose of. Null once the seller has accepted.
  @JsonKey(
    name: r'confirmation_deadline_at',
    required: true,
    includeIfNull: true,
  )
  final DateTime? confirmationDeadlineAt;

  /// When the seller accepted the sale. Null means the parcel has not been booked and will not be — a buyer reading this knows what they are waiting on.
  @JsonKey(name: r'confirmed_at', required: true, includeIfNull: true)
  final DateTime? confirmedAt;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Why the seller refused, set only on an order they refused outright. A refusal is a cancellation that says who ended the sale, where `cancelled_at` alone says only that it did not happen.
  @JsonKey(name: r'decline_reason', required: true, includeIfNull: true)
  final String? declineReason;

  /// The checkout this came from. Exactly one of `draft_id` and `offer_id` is set: a fixed-price sale is checked out from a draft, a negotiated one from the offer both sides accepted.
  @JsonKey(name: r'draft_id', required: true, includeIfNull: true)
  final String? draftId;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'items', required: true, includeIfNull: false)
  final List<OrderItem> items;

  /// The accepted negotiation this came from. Null on a fixed-price sale.
  @JsonKey(name: r'offer_id', required: true, includeIfNull: true)
  final String? offerId;

  /// `received_at` + 72h, computed rather than stored. The seller is paid out at this point unless a refund still has a claim on the escrow.
  @JsonKey(name: r'payout_deadline_at', required: true, includeIfNull: true)
  final DateTime? payoutDeadlineAt;

  /// When the escrow reached the seller. Null on a completed order means the release has not landed yet — the platform owes the seller and knows it, and a retry pass keeps trying until it does.
  @JsonKey(name: r'payout_released_at', required: true, includeIfNull: true)
  final DateTime? payoutReleasedAt;

  @JsonKey(name: r'pickup_address', required: true, includeIfNull: false)
  final OrderAddressSnapshot pickupAddress;

  /// Unboxing evidence, captured with the receipt confirmation and never added to afterwards — a refund is judged on what the buyer showed at the moment of unboxing.
  @JsonKey(name: r'receipt_attachments', required: true, includeIfNull: false)
  final List<Resource> receiptAttachments;

  /// When the buyer confirmed receipt. Null means the payout clock has not started.
  @JsonKey(name: r'received_at', required: true, includeIfNull: true)
  final DateTime? receivedAt;

  @JsonKey(name: r'seller', required: true, includeIfNull: false)
  final AccountSummary seller;

  @JsonKey(name: r'state', required: true, includeIfNull: false)
  final OrderState state;

  /// Summed from the live lines rather than stored: the lines are the record of what was paid, and a column would be a second answer to the same question.
  // minimum: 0
  @JsonKey(name: r'total', required: true, includeIfNull: false)
  final int total;

  /// The shipment, carried in full rather than as an id: it has no read of its own outside the order it belongs to.
  @JsonKey(name: r'transport', required: true, includeIfNull: true)
  final Transport? transport;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          other.address == address &&
          other.buyer == buyer &&
          other.cancelledAt == cancelledAt &&
          other.completedAt == completedAt &&
          other.confirmationDeadlineAt == confirmationDeadlineAt &&
          other.confirmedAt == confirmedAt &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.declineReason == declineReason &&
          other.draftId == draftId &&
          other.id == id &&
          other.items == items &&
          other.offerId == offerId &&
          other.payoutDeadlineAt == payoutDeadlineAt &&
          other.payoutReleasedAt == payoutReleasedAt &&
          other.pickupAddress == pickupAddress &&
          other.receiptAttachments == receiptAttachments &&
          other.receivedAt == receivedAt &&
          other.seller == seller &&
          other.state == state &&
          other.total == total &&
          other.transport == transport;

  @override
  int get hashCode =>
      address.hashCode +
      buyer.hashCode +
      (cancelledAt == null ? 0 : cancelledAt.hashCode) +
      (completedAt == null ? 0 : completedAt.hashCode) +
      (confirmationDeadlineAt == null ? 0 : confirmationDeadlineAt.hashCode) +
      (confirmedAt == null ? 0 : confirmedAt.hashCode) +
      createdAt.hashCode +
      currency.hashCode +
      (declineReason == null ? 0 : declineReason.hashCode) +
      (draftId == null ? 0 : draftId.hashCode) +
      id.hashCode +
      items.hashCode +
      (offerId == null ? 0 : offerId.hashCode) +
      (payoutDeadlineAt == null ? 0 : payoutDeadlineAt.hashCode) +
      (payoutReleasedAt == null ? 0 : payoutReleasedAt.hashCode) +
      pickupAddress.hashCode +
      receiptAttachments.hashCode +
      (receivedAt == null ? 0 : receivedAt.hashCode) +
      seller.hashCode +
      state.hashCode +
      total.hashCode +
      (transport == null ? 0 : transport.hashCode);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
