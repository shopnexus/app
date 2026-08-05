//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_bank_account_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateBankAccountRequest {
  /// Returns a new [CreateBankAccountRequest] instance.
  CreateBankAccountRequest({
    required this.accountHolder,

    required this.accountNumber,

    required this.bankCode,

    this.isDefault = false,
  });

  @JsonKey(name: r'account_holder', required: true, includeIfNull: false)
  final String accountHolder;

  @JsonKey(name: r'account_number', required: true, includeIfNull: false)
  final String accountNumber;

  @JsonKey(name: r'bank_code', required: true, includeIfNull: false)
  final String bankCode;

  @JsonKey(
    defaultValue: false,
    name: r'is_default',
    required: false,
    includeIfNull: false,
  )
  final bool? isDefault;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateBankAccountRequest &&
          other.accountHolder == accountHolder &&
          other.accountNumber == accountNumber &&
          other.bankCode == bankCode &&
          other.isDefault == isDefault;

  @override
  int get hashCode =>
      accountHolder.hashCode +
      accountNumber.hashCode +
      bankCode.hashCode +
      isDefault.hashCode;

  factory CreateBankAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBankAccountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
