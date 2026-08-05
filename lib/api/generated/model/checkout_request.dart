//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/checkout_line.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutRequest {
  /// Returns a new [CheckoutRequest] instance.
  CheckoutRequest({
    required this.contactId,

    required this.currency,

    required this.lines,

    this.note,

    required this.transportOption,
  });

  @JsonKey(name: r'contact_id', required: true, includeIfNull: false)
  final String contactId;

  /// Must match the listing's currency.
  @JsonKey(name: r'currency', required: true, includeIfNull: false)
  final String currency;

  @JsonKey(name: r'lines', required: true, includeIfNull: false)
  final List<CheckoutLine> lines;

  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  /// An enabled transport option's slug. The buyer pays delivery, so the trade-off between price and speed is theirs.
  @JsonKey(name: r'transport_option', required: true, includeIfNull: false)
  final String transportOption;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutRequest &&
          other.contactId == contactId &&
          other.currency == currency &&
          other.lines == lines &&
          other.note == note &&
          other.transportOption == transportOption;

  @override
  int get hashCode =>
      contactId.hashCode +
      currency.hashCode +
      lines.hashCode +
      note.hashCode +
      transportOption.hashCode;

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
