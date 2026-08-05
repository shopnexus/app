//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_account.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublicAccount {
  /// Returns a new [PublicAccount] instance.
  PublicAccount({
    this.avatar,

    required this.createdAt,

    this.description,

    required this.followerCount,

    required this.id,

    required this.identityVerified,

    required this.name,
  });

  @JsonKey(name: r'avatar', required: false, includeIfNull: false)
  final Resource? avatar;

  /// Member since.
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  // minimum: 0
  @JsonKey(name: r'follower_count', required: true, includeIfNull: false)
  final int followerCount;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Shown as a trust signal.
  @JsonKey(name: r'identity_verified', required: true, includeIfNull: false)
  final bool identityVerified;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublicAccount &&
          other.avatar == avatar &&
          other.createdAt == createdAt &&
          other.description == description &&
          other.followerCount == followerCount &&
          other.id == id &&
          other.identityVerified == identityVerified &&
          other.name == name;

  @override
  int get hashCode =>
      (avatar == null ? 0 : avatar.hashCode) +
      createdAt.hashCode +
      (description == null ? 0 : description.hashCode) +
      followerCount.hashCode +
      id.hashCode +
      identityVerified.hashCode +
      name.hashCode;

  factory PublicAccount.fromJson(Map<String, dynamic> json) =>
      _$PublicAccountFromJson(json);

  Map<String, dynamic> toJson() => _$PublicAccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
