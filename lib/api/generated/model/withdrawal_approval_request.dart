//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_approval_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WithdrawalApprovalRequest {
  /// Returns a new [WithdrawalApprovalRequest] instance.
  WithdrawalApprovalRequest({this.providerRef, this.reason});

  /// The bank's or gateway's reference for the outbound transfer
  @JsonKey(name: r'provider_ref', required: false, includeIfNull: false)
  final String? providerRef;

  /// A note for the payee, recorded on the request.
  @JsonKey(name: r'reason', required: false, includeIfNull: false)
  final String? reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WithdrawalApprovalRequest &&
          other.providerRef == providerRef &&
          other.reason == reason;

  @override
  int get hashCode => providerRef.hashCode + reason.hashCode;

  factory WithdrawalApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalApprovalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalApprovalRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
