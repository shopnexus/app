//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pending_edit.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PendingEdit {
  /// Returns a new [PendingEdit] instance.
  PendingEdit({
    required this.attachments,

    required this.categoryId,

    required this.condition,

    required this.description,

    required this.name,

    required this.priceMode,

    required this.specifications,

    required this.tags,
  });

  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final List<String> attachments;

  @JsonKey(name: r'category_id', required: true, includeIfNull: true)
  final String? categoryId;

  @JsonKey(name: r'condition', required: true, includeIfNull: true)
  final ListingCondition? condition;

  @JsonKey(name: r'description', required: true, includeIfNull: true)
  final String? description;

  @JsonKey(name: r'name', required: true, includeIfNull: true)
  final String? name;

  @JsonKey(name: r'price_mode', required: true, includeIfNull: true)
  final PriceMode? priceMode;

  @JsonKey(name: r'specifications', required: true, includeIfNull: false)
  final Map<String, Object> specifications;

  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingEdit &&
          other.attachments == attachments &&
          other.categoryId == categoryId &&
          other.condition == condition &&
          other.description == description &&
          other.name == name &&
          other.priceMode == priceMode &&
          other.specifications == specifications &&
          other.tags == tags;

  @override
  int get hashCode =>
      attachments.hashCode +
      (categoryId == null ? 0 : categoryId.hashCode) +
      (condition == null ? 0 : condition.hashCode) +
      (description == null ? 0 : description.hashCode) +
      (name == null ? 0 : name.hashCode) +
      (priceMode == null ? 0 : priceMode.hashCode) +
      specifications.hashCode +
      tags.hashCode;

  factory PendingEdit.fromJson(Map<String, dynamic> json) =>
      _$PendingEditFromJson(json);

  Map<String, dynamic> toJson() => _$PendingEditToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
