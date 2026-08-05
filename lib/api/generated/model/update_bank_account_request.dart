//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_bank_account_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateBankAccountRequest {
  /// Returns a new [UpdateBankAccountRequest] instance.
  UpdateBankAccountRequest({required this.isDefault});

  /// The only mutable field
  @JsonKey(name: r'is_default', required: true, includeIfNull: false)
  final bool isDefault;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateBankAccountRequest && other.isDefault == isDefault;

  @override
  int get hashCode => isDefault.hashCode;

  factory UpdateBankAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBankAccountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
