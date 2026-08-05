//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'administrative_area_list.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdministrativeAreaList {
  /// Returns a new [AdministrativeAreaList] instance.
  AdministrativeAreaList({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<AdministrativeArea> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdministrativeAreaList && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory AdministrativeAreaList.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaListFromJson(json);

  Map<String, dynamic> toJson() => _$AdministrativeAreaListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
