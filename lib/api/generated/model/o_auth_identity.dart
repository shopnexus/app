//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'o_auth_identity.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OAuthIdentity {
  /// Returns a new [OAuthIdentity] instance.
  OAuthIdentity({required this.createdAt, required this.provider});

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'provider', required: true, includeIfNull: false)
  final String provider;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuthIdentity &&
          other.createdAt == createdAt &&
          other.provider == provider;

  @override
  int get hashCode => createdAt.hashCode + provider.hashCode;

  factory OAuthIdentity.fromJson(Map<String, dynamic> json) =>
      _$OAuthIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthIdentityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
