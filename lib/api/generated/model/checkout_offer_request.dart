//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_offer_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutOfferRequest {
  /// Returns a new [CheckoutOfferRequest] instance.
  CheckoutOfferRequest({

    required  this.contactId,

     this.note,

    required  this.transportOption,
  });

  @JsonKey(
    
    name: r'contact_id',
    required: true,
    includeIfNull: false,
  )


  final String contactId;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



      /// A carrier slug from `POST /shipping-quotes`; one nobody enabled is refused with 422.
  @JsonKey(
    
    name: r'transport_option',
    required: true,
    includeIfNull: false,
  )


  final String transportOption;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CheckoutOfferRequest &&
      other.contactId == contactId &&
      other.note == note &&
      other.transportOption == transportOption;

    @override
    int get hashCode =>
        contactId.hashCode +
        note.hashCode +
        transportOption.hashCode;

  factory CheckoutOfferRequest.fromJson(Map<String, dynamic> json) => _$CheckoutOfferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutOfferRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

