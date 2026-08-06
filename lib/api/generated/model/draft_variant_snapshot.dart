//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'draft_variant_snapshot.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DraftVariantSnapshot {
  /// Returns a new [DraftVariantSnapshot] instance.
  DraftVariantSnapshot({
    required this.attributes,

    required this.price,

    required this.variantId,
  });

  @JsonKey(name: r'attributes', required: true, includeIfNull: false)
  final Map<String, Object> attributes;

  /// Smallest currency unit
  // minimum: 1
  @JsonKey(name: r'price', required: true, includeIfNull: false)
  final int price;

  @JsonKey(name: r'variant_id', required: true, includeIfNull: false)
  final String variantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DraftVariantSnapshot &&
          other.attributes == attributes &&
          other.price == price &&
          other.variantId == variantId;

  @override
  int get hashCode => attributes.hashCode + price.hashCode + variantId.hashCode;

  factory DraftVariantSnapshot.fromJson(Map<String, dynamic> json) =>
      _$DraftVariantSnapshotFromJson(json);

  Map<String, dynamic> toJson() => _$DraftVariantSnapshotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
