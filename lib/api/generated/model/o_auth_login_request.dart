//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'o_auth_login_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OAuthLoginRequest {
  /// Returns a new [OAuthLoginRequest] instance.
  OAuthLoginRequest({
    this.country,

    required this.credential,

    this.locale,

    required this.provider,

    this.timezone,
  });

  @JsonKey(name: r'country', required: false, includeIfNull: false)
  final String? country;

  /// The provider's authorization code or id token.
  @JsonKey(name: r'credential', required: true, includeIfNull: false)
  final String credential;

  @JsonKey(name: r'locale', required: false, includeIfNull: false)
  final String? locale;

  @JsonKey(name: r'provider', required: true, includeIfNull: false)
  final String provider;

  @JsonKey(name: r'timezone', required: false, includeIfNull: false)
  final String? timezone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuthLoginRequest &&
          other.country == country &&
          other.credential == credential &&
          other.locale == locale &&
          other.provider == provider &&
          other.timezone == timezone;

  @override
  int get hashCode =>
      country.hashCode +
      credential.hashCode +
      locale.hashCode +
      provider.hashCode +
      timezone.hashCode;

  factory OAuthLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthLoginRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
