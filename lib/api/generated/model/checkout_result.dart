//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutResult {
  /// Returns a new [CheckoutResult] instance.
  CheckoutResult({

    required  this.currency,

    required  this.goodsTotal,

    required  this.items,

    required  this.paymentSessionId,

    required  this.shippingFee,

    required  this.total,
  });

      /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one. 
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



      /// The items alone, smallest currency unit.
          // minimum: 0
  @JsonKey(
    
    name: r'goods_total',
    required: true,
    includeIfNull: false,
  )


  final int goodsTotal;



  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<OrderItem> items;



  @JsonKey(
    
    name: r'payment_session_id',
    required: true,
    includeIfNull: false,
  )


  final String paymentSessionId;



      /// What the chosen carrier quoted for this parcel to this address. The buyer pays it on a fixed-price sale and a negotiated one alike, and it is quoted here rather than sent, so a client cannot decide what delivery costs. 
          // minimum: 0
  @JsonKey(
    
    name: r'shipping_fee',
    required: true,
    includeIfNull: false,
  )


  final int shippingFee;



      /// What the session asks for: goods plus delivery
          // minimum: 0
  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CheckoutResult &&
      other.currency == currency &&
      other.goodsTotal == goodsTotal &&
      other.items == items &&
      other.paymentSessionId == paymentSessionId &&
      other.shippingFee == shippingFee &&
      other.total == total;

    @override
    int get hashCode =>
        currency.hashCode +
        goodsTotal.hashCode +
        items.hashCode +
        paymentSessionId.hashCode +
        shippingFee.hashCode +
        total.hashCode;

  factory CheckoutResult.fromJson(Map<String, dynamic> json) => _$CheckoutResultFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

