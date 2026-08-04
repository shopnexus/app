//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_listing_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateListingRequest {
  /// Returns a new [CreateListingRequest] instance.
  CreateListingRequest({

     this.attachments,

    required  this.categoryId,

    required  this.condition,

    required  this.currency,

     this.description,

    required  this.name,

    required  this.priceMode,

     this.specifications,

     this.tags,

    required  this.variants,
  });

      /// Ordered. The first becomes the cover.
  @JsonKey(
    
    name: r'attachments',
    required: false,
    includeIfNull: false,
  )


  final List<String>? attachments;



  @JsonKey(
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



  @JsonKey(
    
    name: r'condition',
    required: true,
    includeIfNull: false,
  )


  final ListingCondition condition;



      /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one. 
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'price_mode',
    required: true,
    includeIfNull: false,
  )


  final PriceMode priceMode;



  @JsonKey(
    
    name: r'specifications',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? specifications;



  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? tags;



      /// At least one. Price and shipping weight live on the variant.
  @JsonKey(
    
    name: r'variants',
    required: true,
    includeIfNull: false,
  )


  final List<CreateVariantRequest> variants;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateListingRequest &&
      other.attachments == attachments &&
      other.categoryId == categoryId &&
      other.condition == condition &&
      other.currency == currency &&
      other.description == description &&
      other.name == name &&
      other.priceMode == priceMode &&
      other.specifications == specifications &&
      other.tags == tags &&
      other.variants == variants;

    @override
    int get hashCode =>
        attachments.hashCode +
        categoryId.hashCode +
        condition.hashCode +
        currency.hashCode +
        description.hashCode +
        name.hashCode +
        priceMode.hashCode +
        specifications.hashCode +
        tags.hashCode +
        variants.hashCode;

  factory CreateListingRequest.fromJson(Map<String, dynamic> json) => _$CreateListingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateListingRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

