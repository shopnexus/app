//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_offer_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateOfferRequest {
  /// Returns a new [CreateOfferRequest] instance.
  CreateOfferRequest({

    required  this.quantity,

     this.reason,

    required  this.total,

    required  this.variantId,
  });

          // minimum: 1
  @JsonKey(
    
    name: r'quantity',
    required: true,
    includeIfNull: false,
  )


  final int quantity;



  @JsonKey(
    
    name: r'reason',
    required: false,
    includeIfNull: false,
  )


  final String? reason;



          // minimum: 1
  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;



  @JsonKey(
    
    name: r'variant_id',
    required: true,
    includeIfNull: false,
  )


  final String variantId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateOfferRequest &&
      other.quantity == quantity &&
      other.reason == reason &&
      other.total == total &&
      other.variantId == variantId;

    @override
    int get hashCode =>
        quantity.hashCode +
        reason.hashCode +
        total.hashCode +
        variantId.hashCode;

  factory CreateOfferRequest.fromJson(Map<String, dynamic> json) => _$CreateOfferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOfferRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

