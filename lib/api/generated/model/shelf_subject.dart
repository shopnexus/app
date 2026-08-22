//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shelf_subject.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShelfSubject {
  /// Returns a new [ShelfSubject] instance.
  ShelfSubject({required this.id, required this.kind, required this.name});

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Fixes what `id` is.
  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final ShelfSubjectKindEnum kind;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfSubject &&
          other.id == id &&
          other.kind == kind &&
          other.name == name;

  @override
  int get hashCode => id.hashCode + kind.hashCode + name.hashCode;

  factory ShelfSubject.fromJson(Map<String, dynamic> json) =>
      _$ShelfSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$ShelfSubjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Fixes what `id` is.
enum ShelfSubjectKindEnum {
  /// Fixes what `id` is.
  @JsonValue(r'listing')
  listing(r'listing'),

  /// Fixes what `id` is.
  @JsonValue(r'category')
  category(r'category');

  const ShelfSubjectKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
