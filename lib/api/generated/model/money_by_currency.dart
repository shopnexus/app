//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'money_by_currency.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoneyByCurrency {
  /// Returns a new [MoneyByCurrency] instance.
  MoneyByCurrency({required this.amount, required this.currency});

  // minimum: 0
  @JsonKey(name: r'amount', required: true, includeIfNull: false)
  final int amount;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyByCurrency &&
          other.amount == amount &&
          other.currency == currency;

  @override
  int get hashCode => amount.hashCode + currency.hashCode;

  factory MoneyByCurrency.fromJson(Map<String, dynamic> json) =>
      _$MoneyByCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyByCurrencyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
