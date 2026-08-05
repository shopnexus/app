//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_account_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateAccountRequest {
  /// Returns a new [UpdateAccountRequest] instance.
  UpdateAccountRequest({
    this.clearEmail,

    this.clearPhone,

    this.clearUsername,

    this.email,

    this.phone,

    this.username,
  });

  @JsonKey(name: r'clear_email', required: false, includeIfNull: false)
  final bool? clearEmail;

  @JsonKey(name: r'clear_phone', required: false, includeIfNull: false)
  final bool? clearPhone;

  @JsonKey(name: r'clear_username', required: false, includeIfNull: false)
  final bool? clearUsername;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'phone', required: false, includeIfNull: false)
  final String? phone;

  @JsonKey(name: r'username', required: false, includeIfNull: false)
  final String? username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateAccountRequest &&
          other.clearEmail == clearEmail &&
          other.clearPhone == clearPhone &&
          other.clearUsername == clearUsername &&
          other.email == email &&
          other.phone == phone &&
          other.username == username;

  @override
  int get hashCode =>
      clearEmail.hashCode +
      clearPhone.hashCode +
      clearUsername.hashCode +
      email.hashCode +
      phone.hashCode +
      username.hashCode;

  factory UpdateAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAccountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
