//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transaction_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Transaction {
  /// Returns a new [Transaction] instance.
  Transaction({
    required this.amount,

    required this.checkoutUrl,

    required this.createdAt,

    required this.currency,

    required this.error,

    required this.expiredAt,

    required this.id,

    required this.note,

    required this.paymentOption,

    required this.reversesId,

    required this.sessionId,

    required this.settledAt,

    required this.status,
  });

  /// Signed — positive is a charge, negative is a reversal.
  @JsonKey(name: r'amount', required: true, includeIfNull: false)
  final int amount;

  /// Where to send the payer for this leg. Empty once the rail no longer needs it, or for rails that have none.
  @JsonKey(name: r'checkout_url', required: true, includeIfNull: false)
  final String checkoutUrl;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// What the rail actually debits, which split tender may make differ from the session's currency.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Empty unless the rail reported a failure on this leg.
  @JsonKey(name: r'error', required: true, includeIfNull: false)
  final String error;

  /// Gateway URL expiry
  @JsonKey(name: r'expired_at', required: true, includeIfNull: true)
  final DateTime? expiredAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'note', required: true, includeIfNull: false)
  final String note;

  /// A payment option slug owned by the common module
  @JsonKey(name: r'payment_option', required: true, includeIfNull: false)
  final String paymentOption;

  /// The leg this one reverses. Set on reversals, null on originals.
  @JsonKey(name: r'reverses_id', required: true, includeIfNull: true)
  final String? reversesId;

  @JsonKey(name: r'session_id', required: true, includeIfNull: false)
  final String sessionId;

  @JsonKey(name: r'settled_at', required: true, includeIfNull: true)
  final DateTime? settledAt;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final TransactionStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          other.amount == amount &&
          other.checkoutUrl == checkoutUrl &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.error == error &&
          other.expiredAt == expiredAt &&
          other.id == id &&
          other.note == note &&
          other.paymentOption == paymentOption &&
          other.reversesId == reversesId &&
          other.sessionId == sessionId &&
          other.settledAt == settledAt &&
          other.status == status;

  @override
  int get hashCode =>
      amount.hashCode +
      checkoutUrl.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      error.hashCode +
      (expiredAt == null ? 0 : expiredAt.hashCode) +
      id.hashCode +
      note.hashCode +
      paymentOption.hashCode +
      (reversesId == null ? 0 : reversesId.hashCode) +
      sessionId.hashCode +
      (settledAt == null ? 0 : settledAt.hashCode) +
      status.hashCode;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
