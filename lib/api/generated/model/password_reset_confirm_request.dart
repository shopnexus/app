//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_reset_confirm_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PasswordResetConfirmRequest {
  /// Returns a new [PasswordResetConfirmRequest] instance.
  PasswordResetConfirmRequest({required this.newPassword, required this.token});

  @JsonKey(name: r'new_password', required: true, includeIfNull: false)
  final String newPassword;

  @JsonKey(name: r'token', required: true, includeIfNull: false)
  final String token;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordResetConfirmRequest &&
          other.newPassword == newPassword &&
          other.token == token;

  @override
  int get hashCode => newPassword.hashCode + token.hashCode;

  factory PasswordResetConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetConfirmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetConfirmRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
