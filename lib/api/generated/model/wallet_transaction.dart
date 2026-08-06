//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_kind.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_transaction.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WalletTransaction {
  /// Returns a new [WalletTransaction] instance.
  WalletTransaction({
    required this.availableAfter,

    required this.availableDelta,

    required this.createdAt,

    required this.currency,

    this.groupId,

    required this.heldAfter,

    required this.heldDelta,

    required this.kind,

    required this.note,

    required this.refId,

    required this.refType,

    required this.seq,
  });

  // minimum: 0
  @JsonKey(name: r'available_after', required: true, includeIfNull: false)
  final int availableAfter;

  /// Signed change to the available balance
  @JsonKey(name: r'available_delta', required: true, includeIfNull: false)
  final int availableDelta;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  /// Shared by every leg of one logical movement — a checkout is a debit plus an escrow hold plus a fee. An opaque token for grouping rows in a response, not an address: nothing accepts it as input and no endpoint resolves it.
  @JsonKey(name: r'group_id', required: false, includeIfNull: false)
  final String? groupId;

  // minimum: 0
  @JsonKey(name: r'held_after', required: true, includeIfNull: false)
  final int heldAfter;

  /// Signed change to the held balance
  @JsonKey(name: r'held_delta', required: true, includeIfNull: false)
  final int heldDelta;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final WalletTransactionKind kind;

  @JsonKey(name: r'note', required: true, includeIfNull: false)
  final String note;

  /// Opaque id of the referenced entity, its prefix given by `ref_type`. Empty when `ref_type` is.
  @JsonKey(name: r'ref_id', required: true, includeIfNull: false)
  final String refId;

  /// What this movement was for. Empty on an adjustment, which references nothing.
  @JsonKey(name: r'ref_type', required: true, includeIfNull: false)
  final WalletTransactionRefTypeEnum refType;

  /// Position in this wallet's ledger, from 1. Identifies the row and orders it; a gap means a missing movement. Per wallet, so each currency counts from 1 again.
  // minimum: 1
  @JsonKey(name: r'seq', required: true, includeIfNull: false)
  final int seq;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletTransaction &&
          other.availableAfter == availableAfter &&
          other.availableDelta == availableDelta &&
          other.createdAt == createdAt &&
          other.currency == currency &&
          other.groupId == groupId &&
          other.heldAfter == heldAfter &&
          other.heldDelta == heldDelta &&
          other.kind == kind &&
          other.note == note &&
          other.refId == refId &&
          other.refType == refType &&
          other.seq == seq;

  @override
  int get hashCode =>
      availableAfter.hashCode +
      availableDelta.hashCode +
      createdAt.hashCode +
      currency.hashCode +
      (groupId == null ? 0 : groupId.hashCode) +
      heldAfter.hashCode +
      heldDelta.hashCode +
      kind.hashCode +
      note.hashCode +
      refId.hashCode +
      refType.hashCode +
      seq.hashCode;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$WalletTransactionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// What this movement was for. Empty on an adjustment, which references nothing.
enum WalletTransactionRefTypeEnum {
  /// What this movement was for. Empty on an adjustment, which references nothing.
  @JsonValue(r'')
  empty(r''),

  /// What this movement was for. Empty on an adjustment, which references nothing.
  @JsonValue(r'order')
  order(r'order'),

  /// What this movement was for. Empty on an adjustment, which references nothing.
  @JsonValue(r'payment-session')
  paymentSession(r'payment-session');

  const WalletTransactionRefTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
