//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/stock.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Variant {
  /// Returns a new [Variant] instance.
  Variant({

    required  this.attributes,

    required  this.createdAt,

    required  this.id,

    required  this.images,

    required  this.isFeatured,

    required  this.packageDetails,

    required  this.price,

    required  this.stock,
  });

      /// Variant attributes such as size and colour.
  @JsonKey(
    
    name: r'attributes',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> attributes;



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



      /// Empty means fall back to the listing gallery.
  @JsonKey(
    
    name: r'images',
    required: true,
    includeIfNull: false,
  )


  final List<Resource> images;



      /// The variant the card and search results show. At most one per listing.
  @JsonKey(
    
    name: r'is_featured',
    required: true,
    includeIfNull: false,
  )


  final bool isFeatured;



      /// Weight and dimensions. A shipping quote is computed from these.
  @JsonKey(
    
    name: r'package_details',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> packageDetails;



      /// Smallest unit of the listing's currency.
          // minimum: 1
  @JsonKey(
    
    name: r'price',
    required: true,
    includeIfNull: false,
  )


  final int price;



  @JsonKey(
    
    name: r'stock',
    required: true,
    includeIfNull: false,
  )


  final Stock stock;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Variant &&
      other.attributes == attributes &&
      other.createdAt == createdAt &&
      other.id == id &&
      other.images == images &&
      other.isFeatured == isFeatured &&
      other.packageDetails == packageDetails &&
      other.price == price &&
      other.stock == stock;

    @override
    int get hashCode =>
        attributes.hashCode +
        createdAt.hashCode +
        id.hashCode +
        images.hashCode +
        isFeatured.hashCode +
        packageDetails.hashCode +
        price.hashCode +
        stock.hashCode;

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

