//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_variant_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateVariantRequest {
  /// Returns a new [CreateVariantRequest] instance.
  CreateVariantRequest({
    this.attachments,

    required this.attributes,

    required this.packageDetails,

    required this.price,

    this.quantity = 0,
  });

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'attributes', required: true, includeIfNull: false)
  final Map<String, Object> attributes;

  @JsonKey(name: r'package_details', required: true, includeIfNull: false)
  final Map<String, Object> packageDetails;

  // minimum: 1
  @JsonKey(name: r'price', required: true, includeIfNull: false)
  final int price;

  /// Units on hand at creation.
  // minimum: 0
  @JsonKey(
    defaultValue: 0,
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )
  final int? quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateVariantRequest &&
          other.attachments == attachments &&
          other.attributes == attributes &&
          other.packageDetails == packageDetails &&
          other.price == price &&
          other.quantity == quantity;

  @override
  int get hashCode =>
      attachments.hashCode +
      attributes.hashCode +
      packageDetails.hashCode +
      price.hashCode +
      quantity.hashCode;

  factory CreateVariantRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVariantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVariantRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
