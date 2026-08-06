//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_suggestion.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingSuggestion {
  /// Returns a new [ListingSuggestion] instance.
  ListingSuggestion({
    required this.categoryId,

    required this.condition,

    required this.description,

    required this.name,

    required this.price,

    required this.specifications,

    required this.tags,

    required this.transcript,

    required this.weightG,
  });

  /// Resolved against this marketplace's own tree, so it is always a category that exists. Null when nothing in the tree fits what it saw.
  @JsonKey(name: r'category_id', required: true, includeIfNull: true)
  final String? categoryId;

  /// Empty when it could not tell.
  @JsonKey(name: r'condition', required: true, includeIfNull: false)
  final ListingSuggestionConditionEnum condition;

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  /// Only what the seller said out loud, in the smallest currency unit. Null when they did not say — this never estimates a price.
  // minimum: 1
  @JsonKey(name: r'price', required: true, includeIfNull: true)
  final int? price;

  /// Attributes it could read off the photos, as plain strings.
  @JsonKey(name: r'specifications', required: true, includeIfNull: false)
  final Map<String, Object> specifications;

  /// Already slugified, at most four. Empty rather than guessed.
  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  /// What the voice note was heard as, echoed so the seller can see why a field is wrong rather than guess. Empty when they sent no recording.
  @JsonKey(name: r'transcript', required: true, includeIfNull: false)
  final String transcript;

  /// Estimated parcel weight, which is what a shipping quote needs.
  // minimum: 1
  @JsonKey(name: r'weight_g', required: true, includeIfNull: true)
  final int? weightG;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingSuggestion &&
          other.categoryId == categoryId &&
          other.condition == condition &&
          other.description == description &&
          other.name == name &&
          other.price == price &&
          other.specifications == specifications &&
          other.tags == tags &&
          other.transcript == transcript &&
          other.weightG == weightG;

  @override
  int get hashCode =>
      (categoryId == null ? 0 : categoryId.hashCode) +
      condition.hashCode +
      description.hashCode +
      name.hashCode +
      (price == null ? 0 : price.hashCode) +
      specifications.hashCode +
      tags.hashCode +
      transcript.hashCode +
      (weightG == null ? 0 : weightG.hashCode);

  factory ListingSuggestion.fromJson(Map<String, dynamic> json) =>
      _$ListingSuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$ListingSuggestionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Empty when it could not tell.
enum ListingSuggestionConditionEnum {
  /// Empty when it could not tell.
  @JsonValue(r'new')
  new_(r'new'),

  /// Empty when it could not tell.
  @JsonValue(r'used')
  used(r'used'),

  /// Empty when it could not tell.
  @JsonValue(r'damaged')
  damaged(r'damaged'),

  /// Empty when it could not tell.
  @JsonValue(r'')
  empty(r'');

  const ListingSuggestionConditionEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
