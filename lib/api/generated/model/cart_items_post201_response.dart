//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_items_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CartItemsPost201Response {
  /// Returns a new [CartItemsPost201Response] instance.
  CartItemsPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final CartItem data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemsPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory CartItemsPost201Response.fromJson(Map<String, dynamic> json) =>
      _$CartItemsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
