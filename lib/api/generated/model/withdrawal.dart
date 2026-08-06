//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal_outcome.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdrawal.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Withdrawal {
  /// Returns a new [Withdrawal] instance.
  Withdrawal({
    required this.amount,

    required this.bankAccount,

    required this.createdAt,

    required this.currency,

    required this.id,

    required this.outcome,

    required this.resolutionNote,

    required this.resolvedAt,

    required this.resolvedById,

    required this.status,
  });

  // minimum: 1
  @JsonKey(name: r'amount', required: true, includeIfNull: false)
  final int amount;

  @JsonKey(name: r'bank_account', required: true, includeIfNull: false)
  final BankAccount bankAccount;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'outcome', required: true, includeIfNull: false)
  final WithdrawalOutcome outcome;

  @JsonKey(name: r'resolution_note', required: true, includeIfNull: true)
  final String? resolutionNote;

  @JsonKey(name: r'resolved_at', required: true, includeIfNull: true)
  final DateTime? resolvedAt;

  /// The admin who decided. Null on one the owner cancelled themselves.
  @JsonKey(name: r'resolved_by_id', required: true, includeIfNull: true)
  final String? resolvedById;

  /// The underlying session status. `outcome` is what a client should render; this is here because a withdrawal is a payment session and hiding that would make its id unexplainable.
  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final PaymentSessionStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Withdrawal &&
          other.amount == amount &&
          other.bankAccount == bankAccount &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.id == id &&
          other.outcome == outcome &&
          other.resolutionNote == resolutionNote &&
          other.resolvedAt == resolvedAt &&
          other.resolvedById == resolvedById &&
          other.status == status;

  @override
  int get hashCode =>
      amount.hashCode +
      bankAccount.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      id.hashCode +
      outcome.hashCode +
      (resolutionNote == null ? 0 : resolutionNote.hashCode) +
      (resolvedAt == null ? 0 : resolvedAt.hashCode) +
      (resolvedById == null ? 0 : resolvedById.hashCode) +
      status.hashCode;

  factory Withdrawal.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
