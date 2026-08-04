//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_items_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CartItemsGet200Response {
  /// Returns a new [CartItemsGet200Response] instance.
  CartItemsGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<CartItem> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CartItemsGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory CartItemsGet200Response.fromJson(Map<String, dynamic> json) => _$CartItemsGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

