//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_line.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutLine {
  /// Returns a new [CheckoutLine] instance.
  CheckoutLine({required this.quantity, required this.variantId});

  // minimum: 1
  @JsonKey(name: r'quantity', required: true, includeIfNull: false)
  final int quantity;

  @JsonKey(name: r'variant_id', required: true, includeIfNull: false)
  final String variantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutLine &&
          other.quantity == quantity &&
          other.variantId == variantId;

  @override
  int get hashCode => quantity.hashCode + variantId.hashCode;

  factory CheckoutLine.fromJson(Map<String, dynamic> json) =>
      _$CheckoutLineFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutLineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
