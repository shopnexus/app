//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Category {
  /// Returns a new [Category] instance.
  Category({
    required this.description,

    required this.id,

    required this.name,

    this.parentId,

    this.score,
  });

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  /// Null for a root category.
  @JsonKey(name: r'parent_id', required: false, includeIfNull: false)
  final String? parentId;

  /// Relevance, always oriented so that higher is closer — for a vector ranking that is `1 - (a <=> b)`, the cosine similarity, because the operator itself returns a distance. Null unless the request asked for a ranking.
  // minimum: -1
  // maximum: 1
  @JsonKey(name: r'score', required: false, includeIfNull: false)
  final double? score;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          other.description == description &&
          other.id == id &&
          other.name == name &&
          other.parentId == parentId &&
          other.score == score;

  @override
  int get hashCode =>
      description.hashCode +
      id.hashCode +
      name.hashCode +
      (parentId == null ? 0 : parentId.hashCode) +
      (score == null ? 0 : score.hashCode);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
