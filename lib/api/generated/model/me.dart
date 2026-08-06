//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/profile.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_role.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Me {
  /// Returns a new [Me] instance.
  Me({
    required this.createdAt,

    required this.email,

    required this.emailVerified,

    required this.hasPassword,

    required this.id,

    required this.identityVerified,

    required this.phone,

    required this.profile,

    required this.role,

    required this.status,

    required this.username,
  });

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'email', required: true, includeIfNull: true)
  final String? email;

  @JsonKey(name: r'email_verified', required: true, includeIfNull: false)
  final bool emailVerified;

  /// False on a provider-only account. Unlinking the last provider is refused when this is false.
  @JsonKey(name: r'has_password', required: true, includeIfNull: false)
  final bool hasPassword;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Whether a live verified identity document exists. The payout gate reads this.
  @JsonKey(name: r'identity_verified', required: true, includeIfNull: false)
  final bool identityVerified;

  @JsonKey(name: r'phone', required: true, includeIfNull: true)
  final String? phone;

  @JsonKey(name: r'profile', required: true, includeIfNull: false)
  final Profile profile;

  @JsonKey(name: r'role', required: true, includeIfNull: false)
  final AccountRole role;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final AccountStatus status;

  @JsonKey(name: r'username', required: true, includeIfNull: true)
  final String? username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Me &&
          other.createdAt == createdAt &&
          other.email == email &&
          other.emailVerified == emailVerified &&
          other.hasPassword == hasPassword &&
          other.id == id &&
          other.identityVerified == identityVerified &&
          other.phone == phone &&
          other.profile == profile &&
          other.role == role &&
          other.status == status &&
          other.username == username;

  @override
  int get hashCode =>
      createdAt.hashCode +
      (email == null ? 0 : email.hashCode) +
      emailVerified.hashCode +
      hasPassword.hashCode +
      id.hashCode +
      identityVerified.hashCode +
      (phone == null ? 0 : phone.hashCode) +
      profile.hashCode +
      role.hashCode +
      status.hashCode +
      (username == null ? 0 : username.hashCode);

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
