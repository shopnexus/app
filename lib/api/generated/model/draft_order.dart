//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/draft_variant_snapshot.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'draft_order.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DraftOrder {
  /// Returns a new [DraftOrder] instance.
  DraftOrder({

     this.cancelledAt,

    required  this.createdAt,

    required  this.currency,

    required  this.id,

    required  this.listingId,

    required  this.name,

    required  this.priceMode,

    required  this.sellerId,

    required  this.validUntil,

    required  this.variants,
  });

      /// Set when the buyer closed it, the expiry did, or a checkout spent it — a session is claimed as it is checked out, so exactly one checkout can succeed. 
  @JsonKey(
    
    name: r'cancelled_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? cancelledAt;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



      /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one. 
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



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


  final DraftOrderPriceModeEnum priceMode;



  @JsonKey(
    
    name: r'seller_id',
    required: true,
    includeIfNull: false,
  )


  final String sellerId;



  @JsonKey(
    
    name: r'valid_until',
    required: true,
    includeIfNull: false,
  )


  final DateTime validUntil;



  @JsonKey(
    
    name: r'variants',
    required: true,
    includeIfNull: false,
  )


  final List<DraftVariantSnapshot> variants;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DraftOrder &&
      other.cancelledAt == cancelledAt &&
      other.createdAt == createdAt &&
      other.currency == currency &&
      other.id == id &&
      other.listingId == listingId &&
      other.name == name &&
      other.priceMode == priceMode &&
      other.sellerId == sellerId &&
      other.validUntil == validUntil &&
      other.variants == variants;

    @override
    int get hashCode =>
        (cancelledAt == null ? 0 : cancelledAt.hashCode) +
        createdAt.hashCode +
        currency.hashCode +
        id.hashCode +
        listingId.hashCode +
        name.hashCode +
        priceMode.hashCode +
        sellerId.hashCode +
        validUntil.hashCode +
        variants.hashCode;

  factory DraftOrder.fromJson(Map<String, dynamic> json) => _$DraftOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DraftOrderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DraftOrderPriceModeEnum {
@JsonValue(r'fixed')
fixed(r'fixed'),
@JsonValue(r'negotiable')
negotiable(r'negotiable');

const DraftOrderPriceModeEnum(this.value);

final String value;

@override
String toString() => value;
}


