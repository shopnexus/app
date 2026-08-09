//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_session.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentSession {
  /// Returns a new [PaymentSession] instance.
  PaymentSession({
    required this.checkoutUrl,

    required this.createdAt,

    required this.currency,

    required this.expiredAt,

    required this.id,

    required this.kind,

    required this.note,

    required this.outstanding,

    required this.paidAt,

    required this.status,

    required this.totalAmount,
  });

  /// The gateway page an unfinished payment attempt is still waiting at — send the payer straight back to it. Empty when there is nothing to return to: no attempt yet, a rail that redirects nowhere, or a session past its deadline. A client that finds it empty has to ask for a rail first, through `POST /payment-sessions/{id}/payments`.
  @JsonKey(name: r'checkout_url', required: true, includeIfNull: false)
  final String checkoutUrl;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// A session still unsettled past this point is voided by a job.
  @JsonKey(name: r'expired_at', required: true, includeIfNull: false)
  final DateTime expiredAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final PaymentSessionKind kind;

  @JsonKey(name: r'note', required: true, includeIfNull: false)
  final String note;

  /// The total less what has already settled on a rail: what a further payment may still tender. Computed, because a stored copy would be a second fact to keep in step with every leg.
  // minimum: 0
  @JsonKey(name: r'outstanding', required: true, includeIfNull: false)
  final int outstanding;

  @JsonKey(name: r'paid_at', required: true, includeIfNull: true)
  final DateTime? paidAt;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final PaymentSessionStatus status;

  /// Amount owed, smallest unit of `currency`
  // minimum: 0
  @JsonKey(name: r'total_amount', required: true, includeIfNull: false)
  final int totalAmount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentSession &&
          other.checkoutUrl == checkoutUrl &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.expiredAt == expiredAt &&
          other.id == id &&
          other.kind == kind &&
          other.note == note &&
          other.outstanding == outstanding &&
          other.paidAt == paidAt &&
          other.status == status &&
          other.totalAmount == totalAmount;

  @override
  int get hashCode =>
      checkoutUrl.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      expiredAt.hashCode +
      id.hashCode +
      kind.hashCode +
      note.hashCode +
      outstanding.hashCode +
      (paidAt == null ? 0 : paidAt.hashCode) +
      status.hashCode +
      totalAmount.hashCode;

  factory PaymentSession.fromJson(Map<String, dynamic> json) =>
      _$PaymentSessionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
