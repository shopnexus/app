//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_quote.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShippingQuote {
  /// Returns a new [ShippingQuote] instance.
  ShippingQuote({required this.fee, required this.name, required this.option});

  /// What the buyer would pay this carrier. Re-quoted at checkout, so it is an estimate a client renders rather than a price it can hold.
  // minimum: 0
  @JsonKey(name: r'fee', required: true, includeIfNull: false)
  final int fee;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'option', required: true, includeIfNull: false)
  final String option;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingQuote &&
          other.fee == fee &&
          other.name == name &&
          other.option == option;

  @override
  int get hashCode => fee.hashCode + name.hashCode + option.hashCode;

  factory ShippingQuote.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQuoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
