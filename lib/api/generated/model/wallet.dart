//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Wallet {
  /// Returns a new [Wallet] instance.
  Wallet({
    required this.accountId,

    required this.availableBalance,

    required this.createdAt,

    required this.currency,

    required this.heldBalance,
  });

  @JsonKey(name: r'account_id', required: true, includeIfNull: false)
  final String accountId;

  /// Spendable and withdrawable
  // minimum: 0
  @JsonKey(name: r'available_balance', required: true, includeIfNull: false)
  final int availableBalance;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Locked in escrow; not the owner's to draw yet
  // minimum: 0
  @JsonKey(name: r'held_balance', required: true, includeIfNull: false)
  final int heldBalance;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wallet &&
          other.accountId == accountId &&
          other.availableBalance == availableBalance &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.heldBalance == heldBalance;

  @override
  int get hashCode =>
      accountId.hashCode +
      availableBalance.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      heldBalance.hashCode;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
