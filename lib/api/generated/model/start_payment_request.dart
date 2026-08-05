//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_payment_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StartPaymentRequest {
  /// Returns a new [StartPaymentRequest] instance.
  StartPaymentRequest({
    this.amount,

    required this.paymentOption,

    this.returnUrl,
  });

  /// Omit to tender the whole outstanding balance. Pass it to split the session across rails.
  // minimum: 1
  @JsonKey(name: r'amount', required: false, includeIfNull: false)
  final int? amount;

  /// A payment option slug from the common module.
  @JsonKey(name: r'payment_option', required: true, includeIfNull: false)
  final String paymentOption;

  /// Where the gateway sends the payer back. Checked against the platform's own allowlist of hosts and rejected otherwise — a URL that reaches a redirect unvalidated is an open redirect wearing a payment flow.
  @JsonKey(name: r'return_url', required: false, includeIfNull: false)
  final String? returnUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StartPaymentRequest &&
          other.amount == amount &&
          other.paymentOption == paymentOption &&
          other.returnUrl == returnUrl;

  @override
  int get hashCode =>
      amount.hashCode + paymentOption.hashCode + returnUrl.hashCode;

  factory StartPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$StartPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StartPaymentRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
