//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/device.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices_put200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DevicesPut200Response {
  /// Returns a new [DevicesPut200Response] instance.
  DevicesPut200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Device data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevicesPut200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory DevicesPut200Response.fromJson(Map<String, dynamic> json) =>
      _$DevicesPut200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesPut200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
