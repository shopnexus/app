//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_withdrawal_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateWithdrawalRequest {
  /// Returns a new [CreateWithdrawalRequest] instance.
  CreateWithdrawalRequest({
    required this.amount,

    required this.bankAccountId,

    required this.currency,
  });

  // minimum: 1
  @JsonKey(name: r'amount', required: true, includeIfNull: false)
  final int amount;

  @JsonKey(name: r'bank_account_id', required: true, includeIfNull: false)
  final String bankAccountId;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateWithdrawalRequest &&
          other.amount == amount &&
          other.bankAccountId == bankAccountId &&
          other.currency == currency;

  @override
  int get hashCode =>
      amount.hashCode + bankAccountId.hashCode + currency.hashCode;

  factory CreateWithdrawalRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWithdrawalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWithdrawalRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
