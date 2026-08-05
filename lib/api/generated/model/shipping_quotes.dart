//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quote.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_quotes.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShippingQuotes {
  /// Returns a new [ShippingQuotes] instance.
  ShippingQuotes({
    required this.contactId,

    required this.currency,

    required this.options,
  });

  /// The address these fees are for, echoed because the request may not have named one — a fee with no address beside it is not one a client can render or offer to change.
  @JsonKey(name: r'contact_id', required: true, includeIfNull: false)
  final String contactId;

  /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @JsonKey(name: r'options', required: true, includeIfNull: false)
  final List<ShippingQuote> options;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingQuotes &&
          other.contactId == contactId &&
          other.currency == currency &&
          other.options == options;

  @override
  int get hashCode => contactId.hashCode + currency.hashCode + options.hashCode;

  factory ShippingQuotes.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuotesFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQuotesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
