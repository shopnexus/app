//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EmailVerificationRequest {
  /// Returns a new [EmailVerificationRequest] instance.
  EmailVerificationRequest({required this.token});

  @JsonKey(name: r'token', required: true, includeIfNull: false)
  final String token;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailVerificationRequest && other.token == token;

  @override
  int get hashCode => token.hashCode;

  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmailVerificationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
