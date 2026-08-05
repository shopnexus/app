//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/auth_result.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_post200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginPost200Response {
  /// Returns a new [LoginPost200Response] instance.
  LoginPost200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final AuthResult data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginPost200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory LoginPost200Response.fromJson(Map<String, dynamic> json) =>
      _$LoginPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
