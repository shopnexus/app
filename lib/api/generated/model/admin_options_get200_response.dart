//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/option_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_options_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminOptionsGet200Response {
  /// Returns a new [AdminOptionsGet200Response] instance.
  AdminOptionsGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final OptionList data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminOptionsGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory AdminOptionsGet200Response.fromJson(Map<String, dynamic> json) =>
      _$AdminOptionsGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminOptionsGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
