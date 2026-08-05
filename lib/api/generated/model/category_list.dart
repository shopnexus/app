//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_list.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CategoryList {
  /// Returns a new [CategoryList] instance.
  CategoryList({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Category> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CategoryList && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
