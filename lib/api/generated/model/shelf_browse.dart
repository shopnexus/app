//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shelf_browse.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShelfBrowse {
  /// Returns a new [ShelfBrowse] instance.
  ShelfBrowse({
    required this.categoryId,

    required this.similarTo,

    required this.sort,
  });

  @JsonKey(name: r'category_id', required: true, includeIfNull: true)
  final String? categoryId;

  @JsonKey(name: r'similar_to', required: true, includeIfNull: true)
  final String? similarTo;

  /// Empty when the shelf's own ranking is not a `sort` a client can ask for.
  @JsonKey(name: r'sort', required: true, includeIfNull: true)
  final String? sort;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfBrowse &&
          other.categoryId == categoryId &&
          other.similarTo == similarTo &&
          other.sort == sort;

  @override
  int get hashCode =>
      (categoryId == null ? 0 : categoryId.hashCode) +
      (similarTo == null ? 0 : similarTo.hashCode) +
      (sort == null ? 0 : sort.hashCode);

  factory ShelfBrowse.fromJson(Map<String, dynamic> json) =>
      _$ShelfBrowseFromJson(json);

  Map<String, dynamic> toJson() => _$ShelfBrowseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
