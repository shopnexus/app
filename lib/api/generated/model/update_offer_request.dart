//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_offer_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateOfferRequest {
  /// Returns a new [UpdateOfferRequest] instance.
  UpdateOfferRequest({

    required  this.quantity,

     this.reason,

    required  this.total,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateOfferRequest &&
      other.quantity == quantity &&
      other.reason == reason &&
      other.total == total;

    @override
    int get hashCode =>
        quantity.hashCode +
        reason.hashCode +
        total.hashCode;

  factory UpdateOfferRequest.fromJson(Map<String, dynamic> json) => _$UpdateOfferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOfferRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

