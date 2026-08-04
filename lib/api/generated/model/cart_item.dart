//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CartItem {
  /// Returns a new [CartItem] instance.
  CartItem({

    required  this.createdAt,

    required  this.id,

    required  this.listingId,

    required  this.quantity,

    required  this.variantId,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'listing_id',
    required: true,
    includeIfNull: false,
  )


  final String listingId;



          // minimum: 1
  @JsonKey(
    
    name: r'quantity',
    required: true,
    includeIfNull: false,
  )


  final int quantity;



  @JsonKey(
    
    name: r'variant_id',
    required: true,
    includeIfNull: false,
  )


  final String variantId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CartItem &&
      other.createdAt == createdAt &&
      other.id == id &&
      other.listingId == listingId &&
      other.quantity == quantity &&
      other.variantId == variantId;

    @override
    int get hashCode =>
        createdAt.hashCode +
        id.hashCode +
        listingId.hashCode +
        quantity.hashCode +
        variantId.hashCode;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

