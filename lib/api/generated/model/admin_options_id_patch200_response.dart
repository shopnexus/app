//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_options_id_patch200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminOptionsIdPatch200Response {
  /// Returns a new [AdminOptionsIdPatch200Response] instance.
  AdminOptionsIdPatch200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Option data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminOptionsIdPatch200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory AdminOptionsIdPatch200Response.fromJson(Map<String, dynamic> json) =>
      _$AdminOptionsIdPatch200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminOptionsIdPatch200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
