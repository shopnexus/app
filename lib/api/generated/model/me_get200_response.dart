//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/me.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeGet200Response {
  /// Returns a new [MeGet200Response] instance.
  MeGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Me data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MeGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory MeGet200Response.fromJson(Map<String, dynamic> json) =>
      _$MeGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
