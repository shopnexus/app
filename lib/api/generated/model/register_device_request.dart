//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/device_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_device_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterDeviceRequest {
  /// Returns a new [RegisterDeviceRequest] instance.
  RegisterDeviceRequest({required this.platform, required this.pushToken});

  @JsonKey(name: r'platform', required: true, includeIfNull: false)
  final DevicePlatform platform;

  @JsonKey(name: r'push_token', required: true, includeIfNull: false)
  final String pushToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterDeviceRequest &&
          other.platform == platform &&
          other.pushToken == pushToken;

  @override
  int get hashCode => platform.hashCode + pushToken.hashCode;

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
