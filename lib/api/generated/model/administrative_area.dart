//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'administrative_area.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdministrativeArea {
  /// Returns a new [AdministrativeArea] instance.
  AdministrativeArea({
    required this.code,

    required this.kind,

    required this.name,
  });

  /// What an address stores — two digits for a province, five for a ward.
  @JsonKey(name: r'code', required: true, includeIfNull: false)
  final String code;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final AdministrativeAreaKindEnum kind;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdministrativeArea &&
          other.code == code &&
          other.kind == kind &&
          other.name == name;

  @override
  int get hashCode => code.hashCode + kind.hashCode + name.hashCode;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaFromJson(json);

  Map<String, dynamic> toJson() => _$AdministrativeAreaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum AdministrativeAreaKindEnum {
  @JsonValue(r'province')
  province(r'province'),
  @JsonValue(r'ward')
  ward(r'ward');

  const AdministrativeAreaKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
