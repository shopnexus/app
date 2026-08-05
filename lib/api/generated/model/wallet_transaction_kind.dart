//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum WalletTransactionKind {
  @JsonValue(r'topup')
  topup(r'topup'),
  @JsonValue(r'escrow-hold')
  escrowHold(r'escrow-hold'),
  @JsonValue(r'escrow-release')
  escrowRelease(r'escrow-release'),
  @JsonValue(r'payout')
  payout(r'payout'),
  @JsonValue(r'refund')
  refund(r'refund'),
  @JsonValue(r'withdrawal')
  withdrawal(r'withdrawal'),
  @JsonValue(r'fee')
  fee(r'fee'),
  @JsonValue(r'adjustment')
  adjustment(r'adjustment');

  const WalletTransactionKind(this.value);

  final String value;

  @override
  String toString() => value;
}
